-- Importar Dados do Arquivo CSV
COPY quartoTrimestre2022 FROM '/media/arquivos/Documentos/Emprego_Back-End/Arquivos_task3/Sqls/2022/4T2022.csv' WITH (FORMAT CSV, DELIMITER ';', ENCODING 'UTF-8', HEADER TRUE);


