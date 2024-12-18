import { Request, Response, NextFunction  } from "express";
import { userRepository } from "../repositories/userReposity"
import jwt from 'jsonwebtoken'
import { BadRequestError, UnauthorizedError } from "../helpers/api-erros"

type JwtPayload = {
    id: number;
}

export const authMiddleware = async (req: Request, res: Response, next: NextFunction) => {

    const { authorization } = req.headers

        if (!authorization) {
            throw new UnauthorizedError('Não autorizado ')
        }

        if (authorization) {
        }

        const token = authorization.split(' ')[1]

        const { id } = jwt.verify(token, process.env.JWT_PASS ?? '') as JwtPayload

        const user = await userRepository.findOneBy({ id })
        if (!user) {
            throw new UnauthorizedError('Não autorizado')
        }

        const { password: _, ...loggedUser } = user 

        req.user = loggedUser

        next()
}