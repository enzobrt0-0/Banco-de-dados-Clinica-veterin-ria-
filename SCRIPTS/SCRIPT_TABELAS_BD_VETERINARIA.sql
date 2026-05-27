CREATE DATABASE "Veterinaria "
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LOCALE_PROVIDER = 'libc'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
-----CRIANDO AS TABELAS ---
CREATE TABLE pet (
id_pet SERIAL PRIMARY KEY ,
nome_pet VARCHAR (250),
especie_pet VARCHAR (250),
raca_pet VARCHAR (250),
idade_pet INT  
);
CREATE TABLE cliente(
id_cliente SERIAL PRIMARY KEY ,
nome_cliente VARCHAR (250),
cpf_cliente VARCHAR (11),
telefone_cliente VARCHAR(15),
ID_PET INT ,
CONSTRAINT ID_PET FOREIGN KEY (id_PET)references pet(id_pet)
);
CREATE TABLE veterinario (
    id_veterinario SERIAL PRIMARY KEY,
    nome_veterinario VARCHAR(250),
    CRM_V VARCHAR(10),
    especialidade_veterinario VARCHAR(250)
);

CREATE TABLE CONSULTA (
    id_consulta SERIAL PRIMARY KEY,
    id_pet INT, 
    id_veterinario INT,
    data_consulta DATE,
    observacoes VARCHAR(500),
    CONSTRAINT FK_CONSULTA_PET FOREIGN KEY (id_pet) REFERENCES pet(id_pet),
    CONSTRAINT FK_CONSULTA_VET FOREIGN KEY (id_veterinario) REFERENCES veterinario(id_veterinario)
);

CREATE TABLE vacina (
    id_vacina SERIAL PRIMARY KEY,
    nome_vacina VARCHAR(250),
    codigo_vacina VARCHAR(10),
    QTD_vacina INT 
  

);

CREATE TABLE VACINACAO (
    id_vacinacao SERIAL PRIMARY KEY,
    id_pet INT, 
    id_veterinario INT,
    id_vacina INT, 
   data_vacinaçao date ,
    CONSTRAINT ID_VACINACAO_PET FOREIGN KEY (id_pet) REFERENCES pet(id_pet),
    CONSTRAINT ID_VACINACAO_VET FOREIGN KEY (id_veterinario) REFERENCES veterinario(id_veterinario),
    CONSTRAINT ID_VACINACAO_VACINA FOREIGN KEY (id_vacina) REFERENCES vacina(id_vacina)
);
