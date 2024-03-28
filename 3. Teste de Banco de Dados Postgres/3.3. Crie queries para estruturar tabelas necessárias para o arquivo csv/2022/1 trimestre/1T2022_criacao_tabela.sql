-- utilizei boa parte dos atributos em varchar já que tava tendo um problema com a , ai o Postgresql só entende . nós valores númericos tentei corrigir e não funcionou então fiz tudo como se fosse texto.
-- Criar Tabela no Banco de Dados
CREATE TABLE primeiroTrimestre2022 (
    data_ DATE,
    reg_ans VARCHAR(10),
    cd_conta_contabil VARCHAR(20),
    descricao VARCHAR(255),
    vl_saldo_inicial VARCHAR(20),
    vl_saldo_final VARCHAR(20)
);

