import { Pool } from 'pg';
import * as bcrypt from 'bcryptjs';
import * as crypto from 'crypto';
import * as nodemailer from 'nodemailer';

// Configurações do banco de dados PostgreSQL
const pool = new Pool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASS,
  port: Number(process.env.DB_PORT),
});

// Configurações do transporte de email com nodemailer
const transporter = nodemailer.createTransport({
  service: 'Mailgun',
  auth: {
    user: 'postmaster@sandboxb6bab3df5efc4aa48f94c255e94e6ec6.mailgun.org',  // Substitua pelo seu domínio sandbox
    pass: process.env.EMAIL_PASS,
  },
});

// Função para solicitar redefinição de senha
export async function requestPasswordReset(email: string): Promise<void> {
  try {
    // Gerar token único para redefinição de senha
    const token = crypto.randomBytes(20).toString('hex');
    const hashedToken = await bcrypt.hash(token, 10);
    const resetTokenExpiry = new Date(Date.now() + 3600000); // Token expira em 1 hora

    // Salvar token e timestamp de expiração no banco de dados
    await pool.query(
      'UPDATE users SET reset_token = $1, reset_token_expiry = $2 WHERE email = $3',
      [hashedToken, resetTokenExpiry, email]
    );

    // Enviar email com link para redefinir senha
    const resetLink = `https://sua_aplicacao.com/resetar-senha?token=${encodeURIComponent(token)}`;
    await transporter.sendMail({
      from: 'noreplyjeffmarketplace@gmail.com',
      to: email,
      subject: 'Redefinição de senha',
      html: `Você solicitou a redefinição de senha. Clique <a href="${resetLink}">aqui</a> para redefinir sua senha.`,
    });

    console.log('Email enviado para redefinição de senha.');
  } catch (error) {
    console.error('Erro ao solicitar redefinição de senha:', (error as Error).message);
    throw error;
  }
}

// Função para redefinir a senha com o token fornecido
export async function resetPassword(token: string, newPassword: string): Promise<boolean> {
  try {
    // Verificar se o token existe e não expirou
    const hashedToken = await bcrypt.hash(token, 10);
    const result = await pool.query(
      'SELECT * FROM usuarios WHERE reset_token = $1 AND reset_token_expiry > NOW()',
      [hashedToken]
    );

    if (result.rows.length === 0) {
      console.log('Token inválido ou expirado.');
      return false;
    }

    // Hash da nova senha
    const hashedPassword = await bcrypt.hash(newPassword, 10);

    // Atualizar a senha e limpar o token no banco de dados
    await pool.query(
      'UPDATE users SET senha_hash = $1, reset_token = NULL, reset_token_expiry = NULL WHERE id = $2',
      [hashedPassword, result.rows[0].id]
    );

    console.log('Senha atualizada com sucesso.');
    return true;
  } catch (error) {
    console.error('Erro ao redefinir senha:', (error as Error).message);
    throw error;
  }
}
