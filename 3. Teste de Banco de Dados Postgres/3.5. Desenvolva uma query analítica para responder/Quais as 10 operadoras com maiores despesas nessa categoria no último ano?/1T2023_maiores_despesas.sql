-- Aqui criei uma nova tabela para guardar as despesas do 4 trimestre de 2022 acredito que fique mais organizado

CREATE TABLE despesas1trimestre2023 (
	operadora VARCHAR(255),
        descricao_evento VARCHAR(255),
        total_despesas DECIMAL(18, 2)
);

-- Aqui estou inserindo os dados na tabela que eu criei procurando por "EVENTOS/ SINISTROS CONHECIDOS OU
AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR" a operadora equivale o reg_ans, a descricao_evento equivale a descrição onde tem o nome das operadoras, e as total_despesas equivale o valor total das despesas que tem o vl_saldo_inicial e vl_saldo_final

INSERT INTO despesas1trimestre2023 (operadora, descricao_evento, total_despesas)
SELECT 
	reg_ans AS operadora,
    descricao,
	SUM(CAST(REPLACE(vl_saldo_inicial, ',', '.') AS DECIMAL(18, 2)) + CAST(REPLACE(vl_saldo_final, ',', '.') AS DECIMAL(18, 2))) AS total_despesas
FROM 
    primeirotrimestre2023
WHERE 
    descricao LIKE '%EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR%'
    AND data_ = '2023-01-01' 
GROUP BY 
    reg_ans, descricao
ORDER BY 
    total_despesas DESC
LIMIT 10;


-- Aqui estou verificando se os dados foram para lá corretamente

select * from despesas1trimestre2023;