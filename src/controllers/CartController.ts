// controllers/CartController.ts

import { Request, Response } from 'express';
import { Product } from '../entities/Product'; // Importe o tipo Product

let cart: Product[] = []; // Defina o tipo da variável cart

export class CartController {
  addToCart(req: Request, res: Response) {
    const { product } = req.body;
    cart.push(product);
    res.status(200).json({ message: 'Produto adicionado ao carrinho.', cart });
  }

  removeFromCart(req: Request, res: Response) {
    const { productId } = req.body;
    cart = cart.filter((item) => item.id !== productId);
    res.status(200).json({ message: 'Produto removido do carrinho.', cart });
  }

  getCart(req: Request, res: Response) {
    res.status(200).json(cart);
  }

  clearCart(req: Request, res: Response) {
    cart = [];
    res.status(200).json({ message: 'Carrinho esvaziado.', cart });
  }
}
