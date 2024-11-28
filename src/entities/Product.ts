import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn, UpdateDateColumn } from 'typeorm';

@Entity('products')
export class Product {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({ nullable: true })
    name: string;

    @Column('decimal', { precision: 10, scale: 2 })
    precounitariocomercial: number;

    @CreateDateColumn({ type: 'timestamp' })
    datacadastro: Date;

    @UpdateDateColumn({ type: 'timestamp' })
    dataalteracao: Date;

    @Column({ nullable: true })
    imagemproduto: string;

    @Column('decimal', { precision: 10, scale: 2 })
    valorcompra: number;

    @Column({ nullable: true })
    departamento: string;
}