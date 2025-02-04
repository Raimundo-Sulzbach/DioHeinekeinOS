-- Desafio - Dio X Heinekein X MySQL Workbench
-- Criando e implementando um um Projeto Lógico de Banco de Dados para gerenciamento de OS - ordens de serviço em uma oficina mecânica.
-- Autor: Raimundo Sulzbach
-- Data: 30/01/2025
-- Ferramentas utilizadas: MySQL e PyCharm
-- 
-- Função da query: 
-- lista a tabela com os preços das peças para utilização nas ordens de serviço, ordenado por descrição

-- acessa o banco de dados dio_osdb
use dio_osdb;
SELECT 
  PecaDescricao AS "DESCRIÇÃO", PecaCodigo AS "CÓDIGO",
  -- Formatação do preço para 999.999,99
  LPAD(FORMAT(PecaPreco, 2, 'de_DE'), 12, ' ') AS "PREÇO"
FROM Peca
ORDER BY PecaDescricao;
