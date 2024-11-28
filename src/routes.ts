import { Router } from 'express';
import { UserController } from './controllers/UserController';
import { ProductController } from './controllers/ProductController';
import { CartController } from './controllers/CartController'; // Importe o controlador do carrinho
import { authMiddleware } from './middlewares/authMiddleware';
import { requestPasswordReset, resetPassword } from './helpers/forgotPass';

const routes = Router();
const userController = new UserController();
const productController = new ProductController();
const cartController = new CartController(); // Instancie o controlador do carrinho

// Rotas de usuários
routes.post('/register', userController.create);
routes.post('/login', userController.login);
routes.get('/profile', authMiddleware, userController.getProfile);

// Rotas de redefinição de senha
routes.post('/forgot-password', async (req, res) => {
  const { email } = req.body;
  try {
    await requestPasswordReset(email);
    res.status(200).json({ message: 'Um email foi enviado com instruções para redefinir sua senha.' });
  } catch (error) {
    console.error('Erro ao solicitar redefinição de senha: ' + email, (error as Error).message);
    res.status(500).json({ error: 'Ocorreu um erro ao solicitar redefinição de senha.' });
  }
});
routes.post('/reset-password', async (req, res) => {
  const { token, newPassword } = req.body;
  try {
    const success = await resetPassword(token, newPassword);
    if (success) {
      res.status(200).json({ message: 'Senha redefinida com sucesso.' });
    } else {
      res.status(400).json({ error: 'Token inválido ou expirado.' });
    }
  } catch (error) {
    console.error('Erro ao redefinir senha:', (error as Error).message);
    res.status(500).json({ error: 'Ocorreu um erro ao redefinir senha.' });
  }
});

// Rotas de produtos
routes.post('/products', productController.create);
routes.get('/products', productController.list);

// Rotas do carrinho
routes.post('/cart', cartController.addToCart);
routes.delete('/cart', cartController.removeFromCart);
routes.get('/cart', cartController.getCart);
routes.delete('/cart/clear', cartController.clearCart);

export default routes;
