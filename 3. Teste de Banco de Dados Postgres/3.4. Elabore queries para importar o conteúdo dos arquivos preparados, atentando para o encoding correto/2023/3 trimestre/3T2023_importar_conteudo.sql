-- importar dados do arquivo CSV
COPY terceiroTrimestre2023 FROM '/media/arquivos/Documentos/Emprego_Back-End/Arquivos_task3/Sqls/2023/3 trimestre/3T2023.csv' WITH (FORMAT CSV, DELIMITER ';', ENCODING 'UTF-8', HEADER TRUE);
