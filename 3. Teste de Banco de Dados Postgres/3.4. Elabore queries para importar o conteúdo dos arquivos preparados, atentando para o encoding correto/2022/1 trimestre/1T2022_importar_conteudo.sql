-- Importar Dados do Arquivo CSV
COPY primeiroTrimestre2022 FROM '/media/arquivos/Documentos/Emprego_Back-End/Arquivos_task3/Sqls/2022/1T2022.csv' WITH (FORMAT CSV, DELIMITER ';', ENCODING 'UTF-8', HEADER TRUE);
