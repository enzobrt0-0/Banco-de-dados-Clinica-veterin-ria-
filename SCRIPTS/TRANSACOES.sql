BEGIN;
INSERT INTO pet (nome_pet, especie_pet, raca_pet, idade_pet) 
VALUES ('Apollo', 'Reptil', 'Cobra coral falsa', 2);

INSERT INTO cliente (nome_cliente, cpf_cliente, telefone_cliente, ID_PET) 
VALUES ('Enzo Barreto', '99988877766', '62999887766', 21);
COMMIT;

-- Cenário B: Transação que falha intencionalmente e desfaz alterações (ROLLBACK)
BEGIN;
INSERT INTO CONSULTA (id_pet, id_veterinario, data_consulta, observacoes) 
VALUES (9, 99, '2026-06-10', 'Esta linha causará erro por causa do Veterinário ID 99 inválido');
-- Se der erro de chave estrangeira, execute o comando abaixo para limpar o canal:
ROLLBACK;

-- Cenário C: Teste de consistência do TRIGGER (Baixa automática de estoque)
-- 1. Conferir estoque inicial (Deve ser 200)
SELECT nome_vacina, QTD_vacina FROM vacina WHERE id_vacina = 11;

-- 2. Registrar aplicação da vacina dentro de uma transação estável
BEGIN;
INSERT INTO VACINACAO (id_pet, id_veterinario, id_vacina, data_vacinacao) 
VALUES (9, 9, 11, '2026-06-09');
COMMIT;

-- 3. Conferir estoque final após o disparo do gatilho (Deve ser 199)
SELECT nome_vacina, QTD_vacina FROM vacina WHERE id_vacina = 11;