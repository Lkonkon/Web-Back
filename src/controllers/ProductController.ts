import { Request, Response } from 'express';
import { productRepository } from '../repositories/productRepository';

export class ProductController {
    async create(req: Request, res: Response) {
        const { precounitariocomercial, imagemproduto, valorcompra, name, departamento } = req.body;

        const newProduct = productRepository.create({
            precounitariocomercial,
            imagemproduto,
            valorcompra,
            name,
            departamento
        });

        await productRepository.save(newProduct);
        return res.status(201).json(newProduct);
    }

    async list(req: Request, res: Response) {
        const products = await productRepository.find();
        return res.json(products);
    }
}
