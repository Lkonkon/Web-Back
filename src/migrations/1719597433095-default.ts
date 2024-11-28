import { MigrationInterface, QueryRunner } from "typeorm";

export class Default1719597433095 implements MigrationInterface {
    name = 'Default1719597433095'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE "users" ALTER COLUMN "reset_token" TYPE TEXT`);
        await queryRunner.query(`ALTER TABLE "products" DROP COLUMN "precounitariocomercial"`);
        await queryRunner.query(`ALTER TABLE "products" ADD "precounitariocomercial" numeric(10,2)`);
        await queryRunner.query(`ALTER TABLE "products" DROP COLUMN "valorcompra"`);
        await queryRunner.query(`ALTER TABLE "products" ADD "valorcompra" numeric(10,2)`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE "products" DROP COLUMN "valorcompra"`);
        await queryRunner.query(`ALTER TABLE "products" ADD "valorcompra" integer NOT NULL`);
        await queryRunner.query(`ALTER TABLE "products" DROP COLUMN "precounitariocomercial"`);
        await queryRunner.query(`ALTER TABLE "products" ADD "precounitariocomercial" integer NOT NULL`);
        await queryRunner.query(`ALTER TABLE "users" ALTER COLUMN "reset_token" DROP NOT NULL`);
    }

}
