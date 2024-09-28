/* MR Eventos e Festa: */

CREATE TABLE Evento (
    ID_Evento_ INTEGER PRIMARY KEY,
    Data_Inicio DATE,
    Data_Termino DATE,
    Tipo_Evento_ VARCHAR,
    Nome_Evento VARCHAR,
    Descricao VARCHAR,
    Capacidade_Maxima INTEGER
);

CREATE TABLE Participante (
    ID_Participante_ INTEGER PRIMARY KEY,
    Nome VARCHAR,
    Email VARCHAR,
    Telefone VARCHAR,
    Data_Nascimento DATE,
    CPF VARCHAR,
    Endereco VARCHAR
);

CREATE TABLE Inscricao (
    ID_Inscricao_ INTEGER PRIMARY KEY,
    Data_Inscricao DATE,
    Status_Inscricao_ BIT,
    Valor_Pago DECIMAL
);

CREATE TABLE SALA___Local_Galeria_Shopping_ (
    Numero_Sala INTEGER,
    Capacidade INTEGER,
    Andar VARCHAR,
    Tema_SALA_ VARCHAR,
    ID_Sala_ INTEGER,
    fk_Evento_ID_Evento_ INTEGER,
    ID_Shopping_ INTEGER,
    Nome_Shopping VARCHAR,
    Endereco VARCHAR,
    Telefone VARCHAR,
    Numero_Salas INTEGER,
    Valor_Aluguel DECIMAL,
    PRIMARY KEY (ID_Sala_, ID_Shopping_)
);

CREATE TABLE Palestrante (
    ID_Palestrante_ INTEGER PRIMARY KEY,
    Nome VARCHAR,
    Email VARCHAR,
    Telefone VARCHAR,
    Especialidade VARCHAR
);

CREATE TABLE Sessao (
    ID_Sessao_ INTEGER PRIMARY KEY,
    Nome_Sessao VARCHAR,
    Data_Hora_Inicio TIME,
    Data_Hora_Termino TIME,
    Tema VARCHAR
);

CREATE TABLE Organizador (
    ID_Organizador_ INTEGER PRIMARY KEY,
    Nome_Organizador VARCHAR,
    Email VARCHAR,
    Telefone VARCHAR,
    CNPJ_ VARCHAR
);

CREATE TABLE Patrocinador (
    ID_Patrocinador_ INTEGER PRIMARY KEY,
    Nome_Patrocinador VARCHAR,
    CNPJ VARCHAR,
    Endereco VARCHAR,
    Telefone VARCHAR,
    Email VARCHAR,
    fk_Patrocinio_ID_Patrocinio_ INTEGER
);

CREATE TABLE Patrocinio (
    ID_Patrocinio_ INTEGER PRIMARY KEY,
    Valor_Patrocinio DECIMAL,
    Data_Contrato DATE,
    Tipo_Patrocinio_ VARCHAR
);

CREATE TABLE Fornecedor (
    ID_Fornecedor_ INTEGER PRIMARY KEY,
    Nome_Fornecedor VARCHAR,
    CNPJ VARCHAR,
    Servico_Oferecido VARCHAR,
    Telefone VARCHAR,
    Email VARCHAR
);

CREATE TABLE Contrato_Fornecedor (
    ID_Contrato_ INTEGER PRIMARY KEY,
    Data_Contrato DATE,
    Valor_Contrato DECIMAL,
    Descricao_Servico VARCHAR
);

CREATE TABLE Equipe_Suporte (
    ID_Equipe_ INTEGER PRIMARY KEY,
    Nome_Equipe VARCHAR,
    Quantidade_Membros INTEGER
);

CREATE TABLE Midia_Cobertura (
    ID_Midia_ INTEGER PRIMARY KEY,
    Nome_Organizacao VARCHAR,
    Contato VARCHAR,
    Tipo_Midia_ VARCHAR
);

CREATE TABLE Funcao (
    ID_Funcao_ INTEGER PRIMARY KEY,
    Nome_Funcao VARCHAR,
    Descricao VARCHAR,
    Tipo_Funcao_ VARCHAR
);

CREATE TABLE Faturamento (
    ID_Pagamento INTEGER PRIMARY KEY,
    Valor_Pago DECIMAL,
    Data_Pagamento DATE
);

CREATE TABLE _Ocorre_em (
    fk_Sessao_ID_Sessao_ INTEGER,
    fk_Evento_ID_Evento_ INTEGER
);

CREATE TABLE Apresenta_em (
    fk_Sessao_ID_Sessao_ INTEGER,
    fk_Palestrante_ID_Palestrante_ INTEGER
);

CREATE TABLE Refere_se_a (
    fk_Inscricao_ID_Inscricao_ INTEGER,
    fk_Evento_ID_Evento_ INTEGER
);

CREATE TABLE Inscreve_se_em_ (
    fk_Inscricao_ID_Inscricao_Participante INTEGER,
    fk_Participante_ID_Participante_ INTEGER
);

CREATE TABLE Patrocinado_por (
    fk_Patrocinio_ID_Patrocinio_ INTEGER,
    fk_Evento_ID_Evento_ INTEGER
);

CREATE TABLE _Presta_servico_em (
    fk_Contrato_Fornecedor_ID_Contrato_ INTEGER,
    fk_Fornecedor_ID_Fornecedor_ INTEGER
);

CREATE TABLE Contrata (
    fk_Contrato_Fornecedor_ID_Contrato_ INTEGER,
    fk_Evento_ID_Evento_ INTEGER
);

CREATE TABLE Organiza_ (
    fk_Evento_ID_Evento_ INTEGER,
    fk_Organizador_ID_Organizador_ INTEGER
);

CREATE TABLE Apoia (
    fk_Equipe_Suporte_ID_Equipe_ INTEGER,
    fk_Evento_ID_Evento_ INTEGER
);

CREATE TABLE Atribui_se_a (
    fk_Funcao_ID_Funcao_ INTEGER,
    fk_Equipe_Suporte_ID_Equipe_ INTEGER
);

CREATE TABLE Assistido_por (
    fk_Midia_Cobertura_ID_Midia_ INTEGER,
    fk_Evento_ID_Evento_ INTEGER
);

CREATE TABLE Gera (
    fk_Evento_ID_Evento_ INTEGER,
    fk_Faturamento_ID_Pagamento INTEGER
);

CREATE TABLE Paga (
    fk_Faturamento_ID_Pagamento INTEGER,
    fk_SALA___Local_Galeria_Shopping__ID_Sala_ INTEGER,
    fk_SALA___Local_Galeria_Shopping__ID_Shopping_ INTEGER
);
 
ALTER TABLE SALA___Local_Galeria_Shopping_ ADD CONSTRAINT FK_SALA___Local_Galeria_Shopping__2
    FOREIGN KEY (fk_Evento_ID_Evento_)
    REFERENCES Evento (ID_Evento_)
    ON DELETE RESTRICT;
 
ALTER TABLE Patrocinador ADD CONSTRAINT FK_Patrocinador_2
    FOREIGN KEY (fk_Patrocinio_ID_Patrocinio_)
    REFERENCES Patrocinio (ID_Patrocinio_)
    ON DELETE CASCADE;
 
ALTER TABLE _Ocorre_em ADD CONSTRAINT FK__Ocorre_em_1
    FOREIGN KEY (fk_Sessao_ID_Sessao_)
    REFERENCES Sessao (ID_Sessao_)
    ON DELETE RESTRICT;
 
ALTER TABLE _Ocorre_em ADD CONSTRAINT FK__Ocorre_em_2
    FOREIGN KEY (fk_Evento_ID_Evento_)
    REFERENCES Evento (ID_Evento_)
    ON DELETE RESTRICT;
 
ALTER TABLE Apresenta_em ADD CONSTRAINT FK_Apresenta_em_1
    FOREIGN KEY (fk_Sessao_ID_Sessao_)
    REFERENCES Sessao (ID_Sessao_)
    ON DELETE RESTRICT;
 
ALTER TABLE Apresenta_em ADD CONSTRAINT FK_Apresenta_em_2
    FOREIGN KEY (fk_Palestrante_ID_Palestrante_)
    REFERENCES Palestrante (ID_Palestrante_)
    ON DELETE SET NULL;
 
ALTER TABLE Refere_se_a ADD CONSTRAINT FK_Refere_se_a_1
    FOREIGN KEY (fk_Inscricao_ID_Inscricao_)
    REFERENCES Inscricao (ID_Inscricao_)
    ON DELETE RESTRICT;
 
ALTER TABLE Refere_se_a ADD CONSTRAINT FK_Refere_se_a_2
    FOREIGN KEY (fk_Evento_ID_Evento_)
    REFERENCES Evento (ID_Evento_)
    ON DELETE RESTRICT;
 
ALTER TABLE Inscreve_se_em_ ADD CONSTRAINT FK_Inscreve_se_em__1
    FOREIGN KEY (fk_Inscricao_ID_Inscricao_Participante)
    REFERENCES Inscricao (ID_Inscricao_)
    ON DELETE RESTRICT;
 
ALTER TABLE Inscreve_se_em_ ADD CONSTRAINT FK_Inscreve_se_em__2
    FOREIGN KEY (fk_Participante_ID_Participante_)
    REFERENCES Participante (ID_Participante_)
    ON DELETE SET NULL;
 
ALTER TABLE Patrocinado_por ADD CONSTRAINT FK_Patrocinado_por_1
    FOREIGN KEY (fk_Patrocinio_ID_Patrocinio_)
    REFERENCES Patrocinio (ID_Patrocinio_)
    ON DELETE RESTRICT;
 
ALTER TABLE Patrocinado_por ADD CONSTRAINT FK_Patrocinado_por_2
    FOREIGN KEY (fk_Evento_ID_Evento_)
    REFERENCES Evento (ID_Evento_)
    ON DELETE RESTRICT;
 
ALTER TABLE _Presta_servico_em ADD CONSTRAINT FK__Presta_servico_em_1
    FOREIGN KEY (fk_Contrato_Fornecedor_ID_Contrato_)
    REFERENCES Contrato_Fornecedor (ID_Contrato_)
    ON DELETE RESTRICT;
 
ALTER TABLE _Presta_servico_em ADD CONSTRAINT FK__Presta_servico_em_2
    FOREIGN KEY (fk_Fornecedor_ID_Fornecedor_)
    REFERENCES Fornecedor (ID_Fornecedor_)
    ON DELETE SET NULL;
 
ALTER TABLE Contrata ADD CONSTRAINT FK_Contrata_1
    FOREIGN KEY (fk_Contrato_Fornecedor_ID_Contrato_)
    REFERENCES Contrato_Fornecedor (ID_Contrato_)
    ON DELETE RESTRICT;
 
ALTER TABLE Contrata ADD CONSTRAINT FK_Contrata_2
    FOREIGN KEY (fk_Evento_ID_Evento_)
    REFERENCES Evento (ID_Evento_)
    ON DELETE RESTRICT;
 
ALTER TABLE Organiza_ ADD CONSTRAINT FK_Organiza__1
    FOREIGN KEY (fk_Evento_ID_Evento_)
    REFERENCES Evento (ID_Evento_)
    ON DELETE RESTRICT;
 
ALTER TABLE Organiza_ ADD CONSTRAINT FK_Organiza__2
    FOREIGN KEY (fk_Organizador_ID_Organizador_)
    REFERENCES Organizador (ID_Organizador_)
    ON DELETE RESTRICT;
 
ALTER TABLE Apoia ADD CONSTRAINT FK_Apoia_1
    FOREIGN KEY (fk_Equipe_Suporte_ID_Equipe_)
    REFERENCES Equipe_Suporte (ID_Equipe_)
    ON DELETE RESTRICT;
 
ALTER TABLE Apoia ADD CONSTRAINT FK_Apoia_2
    FOREIGN KEY (fk_Evento_ID_Evento_)
    REFERENCES Evento (ID_Evento_)
    ON DELETE RESTRICT;
 
ALTER TABLE Atribui_se_a ADD CONSTRAINT FK_Atribui_se_a_1
    FOREIGN KEY (fk_Funcao_ID_Funcao_)
    REFERENCES Funcao (ID_Funcao_)
    ON DELETE RESTRICT;
 
ALTER TABLE Atribui_se_a ADD CONSTRAINT FK_Atribui_se_a_2
    FOREIGN KEY (fk_Equipe_Suporte_ID_Equipe_)
    REFERENCES Equipe_Suporte (ID_Equipe_)
    ON DELETE RESTRICT;
 
ALTER TABLE Assistido_por ADD CONSTRAINT FK_Assistido_por_1
    FOREIGN KEY (fk_Midia_Cobertura_ID_Midia_)
    REFERENCES Midia_Cobertura (ID_Midia_)
    ON DELETE RESTRICT;
 
ALTER TABLE Assistido_por ADD CONSTRAINT FK_Assistido_por_2
    FOREIGN KEY (fk_Evento_ID_Evento_)
    REFERENCES Evento (ID_Evento_)
    ON DELETE RESTRICT;
 
ALTER TABLE Gera ADD CONSTRAINT FK_Gera_1
    FOREIGN KEY (fk_Evento_ID_Evento_)
    REFERENCES Evento (ID_Evento_)
    ON DELETE RESTRICT;
 
ALTER TABLE Gera ADD CONSTRAINT FK_Gera_2
    FOREIGN KEY (fk_Faturamento_ID_Pagamento)
    REFERENCES Faturamento (ID_Pagamento)
    ON DELETE RESTRICT;
 
ALTER TABLE Paga ADD CONSTRAINT FK_Paga_1
    FOREIGN KEY (fk_Faturamento_ID_Pagamento)
    REFERENCES Faturamento (ID_Pagamento)
    ON DELETE SET NULL;
 
ALTER TABLE Paga ADD CONSTRAINT FK_Paga_2
    FOREIGN KEY (fk_SALA___Local_Galeria_Shopping__ID_Sala_, fk_SALA___Local_Galeria_Shopping__ID_Shopping_)
    REFERENCES SALA___Local_Galeria_Shopping_ (ID_Sala_, ID_Shopping_)
    ON DELETE SET NULL;