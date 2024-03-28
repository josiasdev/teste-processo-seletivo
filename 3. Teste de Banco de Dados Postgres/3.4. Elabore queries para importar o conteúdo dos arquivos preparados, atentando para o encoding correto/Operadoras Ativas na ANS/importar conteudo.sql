-- Importar Dados do Arquivo CSV precisa mudar o caminho para o arquivo
COPY relatorio_cadop FROM '/caminho/para/o/arquivo/relatorio_cadop.csv' WITH (FORMAT CSV, DELIMITER ';', ENCODING 'UTF-8', HEADER TRUE);

-- Aqui está o código que eu rodei na minha máquina seguindo o caminho que eu tenho o arquivo:
COPY relatorio_cadop FROM '/media/arquivos/Documentos/Emprego_Back-End/Arquivos_task3/Relatorio_cadop.csv' WITH (FORMAT CSV, DELIMITER ';', ENCODING 'UTF-8', HEADER TRUE);

-- Após rodar o código no Pgadmin4 que é a ferramente de administração e desenvolvimento de banco de dados para PostgreSQL eu vi que os dados foram inseridos na tabela corretamente (o código para a criação da tabela está no arquivo criar tabela.sql) e rodei o código abaixo para verificar se as informações estava lá:
select * from relatorio_cadop;