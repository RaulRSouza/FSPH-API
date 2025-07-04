-- Tabela amostra
CREATE TABLE amostra (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    data_hora TIMESTAMP NOT NULL,
    protocolo BIGINT UNIQUE,
    status VARCHAR(50) NOT NULL,
    tipo_amostra VARCHAR(50),
    lote_id BIGINT,
    laudo BINARY,
    endereco_cep VARCHAR(10),
    endereco_rua VARCHAR(255),
    endereco_numero VARCHAR(10),
    endereco_bairro VARCHAR(255),
    endereco_municipio VARCHAR(255),
    data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Tabela escorpioes
CREATE TABLE escorpioes (
    id BIGINT PRIMARY KEY,
    quantidade INT NOT NULL,
    sofreu_acidente BOOLEAN NOT NULL,
    FOREIGN KEY (id) REFERENCES amostra(id)
);

-- Tabela flebotomineos
CREATE TABLE flebotomineos (
    id BIGINT PRIMARY KEY,
    classificacao_area_lv VARCHAR(50) NOT NULL,
    classificacao_area_lt VARCHAR(50) NOT NULL,
    tipo_atividade_lv VARCHAR(50) NOT NULL,
    tipo_atividade_lt VARCHAR(50) NOT NULL,
    tipo_vegetacao VARCHAR(50) NOT NULL,
    distancia_vegetacao INT NOT NULL,
    temperatura_chegada VARCHAR(10) NOT NULL,
    temperatura_saida VARCHAR(10) NOT NULL,
    temperatura_max VARCHAR(10) NOT NULL,
    temperatura_min VARCHAR(10) NOT NULL,
    umidade_chegada VARCHAR(10) NOT NULL,
    umidade_saida VARCHAR(10) NOT NULL,
    umidade_max VARCHAR(10) NOT NULL,
    umidade_min VARCHAR(10) NOT NULL,
    fase_lua VARCHAR(50) NOT NULL,
    vento VARCHAR(50) NOT NULL,
    presenca_animal_intra VARCHAR(50) NOT NULL,
    presenca_animal_peri VARCHAR(50) NOT NULL,
    galinheiro VARCHAR(50) NOT NULL,
    estacao_ano VARCHAR(50) NOT NULL,
    materia_organica VARCHAR(50) NOT NULL,
    precipitacao VARCHAR(50) NOT NULL,
    observacao CLOB,
    FOREIGN KEY (id) REFERENCES amostra(id)
);

-- Tabela triatomineos
CREATE TABLE triatomineos (
    id BIGINT PRIMARY KEY,
    peridomicilio VARCHAR(50) NOT NULL,
    intradomicilio VARCHAR(50) NOT NULL,
    comodo_captura VARCHAR(255) NOT NULL,
    vestigios VARCHAR(50) NOT NULL,
    insetifugo VARCHAR(50) NOT NULL,
    numero_insetos INT NOT NULL,
    condicao VARCHAR(50) NOT NULL,
    FOREIGN KEY (id) REFERENCES amostra(id)
);

-- Tabela moluscos
CREATE TABLE moluscos (
    id BIGINT PRIMARY KEY,
    colecao_hidrica VARCHAR(255),
    num_moluscos INT NOT NULL,
    tipo_molusco VARCHAR(50) NOT NULL,
    num_mortos INT NOT NULL,
    exposicao_luz BOOLEAN NOT NULL,
    esmagamento_concha BOOLEAN NOT NULL,
    disseccao BOOLEAN NOT NULL,
    resultado VARCHAR(50) NOT NULL,
    FOREIGN KEY (id) REFERENCES amostra(id)
);

-- Tabela larvas
CREATE TABLE larvas (
    id BIGINT PRIMARY KEY,
    num_larvas INT NOT NULL,
    tipo_larva VARCHAR(50) NOT NULL,
    tipo_imovel VARCHAR(255),
    FOREIGN KEY (id) REFERENCES amostra(id)
);

-- Tabela lamina
CREATE TABLE lamina (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    data TIMESTAMP NOT NULL,
    protocolo BIGINT UNIQUE,
    status VARCHAR(50) NOT NULL,
    lote_id BIGINT,
    numero_ovos INT NOT NULL,
    resultado VARCHAR(255),
    laudo BINARY,
    municipio VARCHAR(255)
);

-- Tabela lote
CREATE TABLE lote (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    protocolo BIGINT UNIQUE,
    status_lote VARCHAR(50) NOT NULL,
    data_criacao TIMESTAMP NOT NULL
);

-- Tabela opcoes
CREATE TABLE opcoes (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    chave VARCHAR(50) NOT NULL,
    valor VARCHAR(50) NOT NULL
);

-- Tabela usuario
CREATE TABLE usuario (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    login VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL,
    municipio VARCHAR(255),
    data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Foreign keys and indexes
ALTER TABLE amostra ADD FOREIGN KEY (lote_id) REFERENCES lote(id);
ALTER TABLE lamina ADD FOREIGN KEY (lote_id) REFERENCES lote(id);
CREATE INDEX idx_amostra_data_hora ON amostra(data_hora);
CREATE INDEX idx_amostra_protocolo ON amostra(protocolo);
CREATE INDEX idx_lamina_protocolo ON lamina(protocolo);
CREATE INDEX idx_lote_protocolo ON lote(protocolo);
CREATE INDEX idx_usuario_login ON usuario(login);