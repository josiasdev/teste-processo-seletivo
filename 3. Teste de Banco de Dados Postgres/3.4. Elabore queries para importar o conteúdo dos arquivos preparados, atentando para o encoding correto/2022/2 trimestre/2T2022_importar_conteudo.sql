-- Importar Dados do Arquivo CSV
-- alguns caracteres utilizam latin1
COPY segundoTrimestre2022 FROM '/media/arquivos/Documentos/Emprego_Back-End/Arquivos_task3/Sqls/2022/2T2022.csv' WITH (FORMAT CSV, DELIMITER ';', ENCODING 'LATIN1', HEADER TRUE);
