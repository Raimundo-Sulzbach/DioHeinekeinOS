-- Desafio - Dio X Heinekein X MySQL Workbench
-- Criando e implementando um um Projeto Lógico de Banco de Dados para gerenciamento de OS - ordens de serviço em uma oficina mecânica.
-- Autor: Raimundo Sulzbach
-- Data: 30/01/2025
-- Ferramentas utilizadas: MySQL e PyCharm
-- 
-- Função da query: 
-- lista o cadastro de clientes em ordem alfabética selecionando clientes PJ da cidade de São Paulo

SELECT 
  ClienteNome AS "NOME",
  -- Máscara para CPF (XXX.XXX.XXX-XX) e CNPJ (XX.XXX.XXX/XXXX-XX)
  CASE
    WHEN LENGTH(ClienteCodigoContribuinte) = 11 THEN 
      CONCAT(
        SUBSTR(ClienteCodigoContribuinte, 1, 3), '.', 
        SUBSTR(ClienteCodigoContribuinte, 4, 3), '.', 
        SUBSTR(ClienteCodigoContribuinte, 7, 3), '-', 
        SUBSTR(ClienteCodigoContribuinte, 10, 2)
      )
    ELSE 
      CONCAT(
        SUBSTR(ClienteCodigoContribuinte, 1, 2), '.', 
        SUBSTR(ClienteCodigoContribuinte, 3, 3), '.', 
        SUBSTR(ClienteCodigoContribuinte, 6, 3), '/', 
        SUBSTR(ClienteCodigoContribuinte, 9, 4), '-', 
        SUBSTR(ClienteCodigoContribuinte, 13, 2)
      )
  END AS "CONTRIBUINTE",
  CASE 
    WHEN LENGTH(ClienteCodigoContribuinte) = 11 THEN 'PF'
    ELSE 'PJ'
  END AS "TIPO",
  ClienteEndereco AS "ENDEREÇO",
  -- Máscara para CEP (XXXXX-XXX)
  CONCAT(
    SUBSTR(ClienteCEP, 1, 5), '-', 
    SUBSTR(ClienteCEP, 6, 3)
  ) AS "CEP",
  ClienteNumero AS "Nº",
  ClienteComplemento AS "COMPL",
  ClienteBairro AS "BAIRRO",
  ClienteCidade AS "CIDADE",
  ClienteUF AS "UF",
  ClienteTelefone AS "TELEFONE",
  ClienteWhatsapp AS "WHATSAPP",
  ClienteEmail AS "EMAIL"
FROM cliente
WHERE clientecidade = "São Paulo" and LENGTH(ClienteCodigoContribuinte) = 14
ORDER BY ClienteNome;

