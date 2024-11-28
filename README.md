Para rodar o projeto será necessário baixar o projeto ou clonar e quando aberto rodar o 2 comandos:

npm install
npm run dev

O aplicativo irá dar erro e em seguida será necessário criar um banco PostgreSql (Versão do PostgrSQL: 16):

nome do banco:api_marketplace
porta:5434
Senha: gtsnfe2010

Caso tenha criado com outras informções, alterar no .env do backend.
Deixado no projeto o arquivo de backup do banco utilizado com o nome "backup.sql", restaurar esse banco para rodar a aplicação.
Caso não consiga restaurar pelo PGadmin, fazer o processo pelo CMD:
Pegue o arquivo "backup.sql" e o coloque dentro da pasta bin do Postgres(O caminho normalmemnte é:C:\Program Files\PostgreSQL\16\bin)
Depois de colocar o arquivo, abra o CMD na pasta bin, e rode o seguinte comando:

pg_restore -U postgres -p 5434 -d api_marketplace < backup.sql

O CMD irá pedir a senha do usuário postgres e em seguida será restaurado o banco.

Lembrando que caso o nome do banco e a porta sejam outras, será necessário alterar no camando a ser rodado no CMD;

Em seguida, rodar:

npm run dev

E o aplicativo é para rodar.
