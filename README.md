Para rodar o projeto será necessário baixar o projeto ou clonar e quando aberto rodar o 2 comandos:
npm install
npm run dev
O aplicativo irá dar erro e então será necesário criar a pasta .env manualmente pois fiz o repositório para não baixar o .env. As informações a serem colocadas no .env serão:
{
DB_HOST=localhost
DB_PORT=5434
DB_USER=postgres
DB_PASS=gtsnfe2010
DB_NAME=api_marketplace

PORT=3000

JWT_PASS=VQogxYRpvdFUquj0DfaqIIStlw4P81OiefNV

EMAIL_USER=brad@sandboxb6bab3df5efc4aa48f94c255e94e6ec6.mailgun.org
EMAIL_PASS=fd48d87afab8dc108a6ac535e9d855ec-6fafb9bf-8500642d
}
Após isso, será necessário criar um banco de dados no PostgreSQL e ajustar o .env de acordo com o banco criado (Senha, Nome e Porta).

Com o banco criado, rodar o seguinte comando:
npm run migration:run 
em seguida rodas essas SQLs no banco:
{

}
