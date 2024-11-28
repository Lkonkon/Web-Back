import { Request, Response } from "express"
import { userRepository } from "../repositories/userReposity"
import { BadRequestError } from "../helpers/api-erros"
import bcrypt from 'bcrypt'
import jwt from 'jsonwebtoken'

export class UserController {
    async create(req: Request, res: Response) {
        const { name, email, password } = req.body

        try {
            console.log(`Tentativa de cadastrar usuário com e-mail: ${email}`);

            const userExists = await userRepository.findOneBy({ email })

            if (userExists) {
                console.log(`Usuário com e-mail ${email} já existe no banco de dados`);
                throw new BadRequestError('E-mail já existe')
            }

            const hashPassword = await bcrypt.hash(password, 10)

            const newUser = userRepository.create({
                name,
                email,
                password: hashPassword,
            })

            await userRepository.save(newUser)

            const { password: _, ...user } = newUser

            console.log(`Usuário com e-mail ${email} cadastrado com sucesso`);

            return res.status(201).json(user)
        }
        catch (error) {
            console.error('Erro ao criar usuário:', error);
            throw error;
        }
    }
    async login(req: Request, res: Response) {
        const { email, password } = req.body

        const user = await userRepository.findOneBy({ email })

        if (!user) {
            throw new BadRequestError('E-mail ou senha inválidos')
        }

        const verifyPass = await bcrypt.compare(password, user.password)

        if (!verifyPass) {
            throw new BadRequestError('E-mail ou senha inválidos')
        }

        const token = jwt.sign({ id: user.id }, process.env.JWT_PASS ?? '', {
            expiresIn: '8h',
        })

        const { password: _, ...userLogin } = user

        return res.json({
            user: userLogin,
            token: token,
        })
    }

    async getProfile(req: Request, res: Response) {
        return res.json(req.user)
    }
}