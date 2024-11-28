import { NextFunction, Request, Response } from 'express'
import { BadRequestError, ApiError } from '../helpers/api-erros'

export const errorMiddleware = (
	error: Error & Partial<ApiError>,
	req: Request,
	res: Response,
	next: NextFunction
) => {
	if (error instanceof BadRequestError) {
	  return res.status(400).json({ error: error.message });
	}
  
	const statusCode = error.statusCode ?? 500;
	const message = error.statusCode ? error.message : 'Internal Server Error';
	return res.status(statusCode).json({ message });
  };