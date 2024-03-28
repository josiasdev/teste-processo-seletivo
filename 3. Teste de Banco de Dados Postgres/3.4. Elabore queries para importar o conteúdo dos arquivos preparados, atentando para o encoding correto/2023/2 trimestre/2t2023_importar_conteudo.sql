-- importar dados do arquivo CSV
COPY segundoTrimestre2023 FROM '/media/arquivos/Documentos/Emprego_Back-End/Arquivos_task3/Sqls/2023/2 trimestre/2t2023.csv' WITH (FORMAT CSV, DELIMITER ';', ENCODING 'UTF-8', HEADER TRUE);
