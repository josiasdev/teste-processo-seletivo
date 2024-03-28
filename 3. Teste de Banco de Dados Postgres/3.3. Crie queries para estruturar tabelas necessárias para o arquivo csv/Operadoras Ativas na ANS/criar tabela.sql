-- Criar Tabela no Banco de Dados
CREATE TABLE relatorio_cadop (
    registro_ans VARCHAR(50),
    cnpj VARCHAR(14),
    razao_social VARCHAR(255),
    nome_fantasia VARCHAR(255),
    modalidade VARCHAR(50),
    logradouro VARCHAR(255),
    numero VARCHAR(20),
    complemento VARCHAR(100),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    uf VARCHAR(2),
    cep VARCHAR(8),
    ddd VARCHAR(2),
    telefone VARCHAR(20),
    fax VARCHAR(20),
    endereco_eletronico VARCHAR(255),
    representante VARCHAR(255),
    cargo_representante VARCHAR(100),
    regiao_comercializacao VARCHAR(255),
    data_registro_ans DATE
);
