import { MigrationInterface, QueryRunner } from "typeorm";

export class Default1732799108276 implements MigrationInterface {
    name = 'Default1732799108276'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE "products" ADD "subdepartamento" character varying`);
        await queryRunner.query(`ALTER TABLE "products" ALTER COLUMN "precounitariocomercial" SET NOT NULL`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE "products" ALTER COLUMN "precounitariocomercial" DROP NOT NULL`);
        await queryRunner.query(`ALTER TABLE "products" DROP COLUMN "subdepartamento"`);
    }

}
