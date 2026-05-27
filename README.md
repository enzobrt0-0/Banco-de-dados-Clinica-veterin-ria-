# Banco-de-dados-Clinica-veterinaria-
Trabalho de banco de dados 
Este repositório contém o script de um trabalho acadêmico de modelagem física e população de dados para um sistema de banco de dados relacional voltado ao gerenciamento de uma clínica veterinária. O sistema atende desde animais domésticos convencionais (cães e gatos) até animais exóticos de pequeno e grande porte.

## 📌 Estrutura do Banco de Dados

O banco de dados é composto por 6 tabelas principais interligadas por chaves estrangeiras (`FOREIGN KEY`):

* **pet**: Armazena as informações dos animais (Nome, Espécie, Raça e Idade).
* **cliente**: Registra os dados dos tutores dos animais. Cada cliente está vinculado a um pet específico.
* **veterinario**: Cadastro dos médicos veterinários e suas respectivas especialidades clínicas.
* **vacina**: Controle do estoque de imunizantes e medicamentos, contendo o código e a quantidade disponível.
* **CONSULTA**: Histórico de atendimentos médicos realizados, registrando qual veterinário atendeu qual pet, a data e as observações clínicas.
* **VACINACAO**: Histórico de aplicações de vacinas, interligando o pet, o veterinário responsável, o imunizante utilizado e a data da aplicação.
---

## 📊 Cenário dos Dados Cadastrados

O script popula o banco com **20 registros completos** para cada tabela, divididos metodologicamente em dois perfis de atendimento:

### Bloco 1: Pets Variados e Exóticos (Registros 1 ao 8)
Focado no atendimento de animais exóticos e silvestres raros mantidos por criadores autorizados.
* **Exemplos de Pets:** Gekko, Flamingo, Tartaruga Tigre-d'água, Cavalo Puro Sangue.
* **Veterinários:** Especialistas em Herpetologia, Ornitologia, Animais Aquáticos e Medicina Zoológica.
* **Vacinas:** Poliomielite Aviária, Influenza Equina, Salmonelose.

### Bloco 2: Pets Domésticos Tradicionais (Registros 9 ao 20)
Focado no atendimento convencional de clínicas urbanas de pequeno porte.
* **Exemplos de Pets:** Cães (Golden Retriever, Poodle, Pastor Alemão) e Gatos (Persa, Siamês, Maine Coon).
* **Veterinários:** Especialistas em Dermatologia, Felinos, Odontologia Canina e Cirurgia Ortopédica.
* **Vacinas:** Antirrábica Importada, Quádrupla Felina V4, Óctupla Canina V8, Déctupla V10.

> [!NOTE]
> A relação atual entre `cliente` e `pet` está modelada de forma **1 para 1** (cada linha de cliente aponta para um `ID_PET`). Para cenários reais onde um cliente possui múltiplos animais, recomenda-se mover a chave estrangeira `id_cliente` para dentro da tabela `pet`.
