-- Lista de Pets com seus respectivos donos e veterinários que já os consultaram
SELECT 
    p.nome_pet, 
    p.especie_pet, 
    c.nome_cliente AS dono, 
    v.nome_veterinario AS medico
FROM pet p
JOIN cliente c ON p.id_pet = c.ID_PET
JOIN CONSULTA con ON p.id_pet = con.id_pet
JOIN veterinario v ON con.id_veterinario = v.id_veterinario;

-- Quantidade de pets atendidos por espécie e sua idade média
SELECT 
    especie_pet, 
    COUNT(*) AS total_animais, 
    ROUND(AVG(idade_pet), 2) AS idade_media 
FROM pet
GROUP BY especie_pet;
-- Encontrar as vacinas que têm estoque abaixo da média geral de estoque da clínica
SELECT nome_vacina, QTD_vacina
FROM vacina
WHERE QTD_vacina < (SELECT AVG(QTD_vacina) FROM vacina);
---qual veterinario fez mais consultas
SELECT v.nome_veterinario, COUNT(con.id_consulta) AS total_atendimentos
FROM veterinario v
LEFT JOIN CONSULTA con ON v.id_veterinario = con.id_veterinario
GROUP BY v.nome_veterinario
ORDER BY total_atendimentos DESC;
---Historico de vacinaçao 
SELECT p.nome_pet, vac.nome_vacina, vcn.data_vacinacao, vet.nome_veterinario
FROM VACINACAO vcn
JOIN pet p ON vcn.id_pet = p.id_pet
JOIN vacina vac ON vcn.id_vacina = vac.id_vacina
JOIN veterinario vet ON vcn.id_veterinario = vet.id_veterinario
ORDER BY vcn.data_vacinacao DESC;
-- ficha clínica básica de todos os pacientes
SELECT 
    p.id_pet,
    p.nome_pet,
    p.especie_pet,
    c.nome_cliente AS responsavel,
    c.telefone_cliente AS contato
FROM pet p
JOIN cliente c ON p.id_pet = c.ID_PET;


---filtra veterinarios com mais de uma consulta
SELECT 
    v.nome_veterinario, 
    COUNT(c.id_consulta) AS total_consultas
FROM veterinario v
JOIN CONSULTA c ON v.id_veterinario = c.id_veterinario
GROUP BY v.nome_veterinario
HAVING COUNT(c.id_consulta) > 1;