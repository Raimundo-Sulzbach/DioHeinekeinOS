-- Desafio - Dio X Heinekein X MySQL Workbench
-- Criando e implementando um um Projeto Lógico de Banco de Dados para gerenciamento de OS - ordens de serviço em uma oficina mecânica.
-- Autor: Raimundo Sulzbach
-- Data: 30/01/2025
-- Ferramentas utilizadas: MySQL e PyCharm
-- 
-- Função da query: 
-- tabela de preços dos serviços
-- ordenado por categoria + marca + modelo + ano + serviço

-- acessa o banco de dados dio_osdb
use dio_osdb;
SELECT 
  s.ServicoMarcaVeiculo AS "MARCA",
  s.ServicoModeloVeiculo AS "MODELO",
  s.ServicoAnoVeiculo AS "ANO",
  c.Categoria AS "CATEGORIA",
  s.ServicoDescricao AS "DESCRIÇÃO DO SERVIÇO",
  -- Formatação do preço do serviço para 999.999,99
  LPAD(FORMAT(s.ServicoPreco, 2, 'de_DE'), 12, ' ') AS "PREÇO UNITÁRIO"
FROM Servico s
JOIN Categoria c ON s.Categoria_idCategoria = c.idCategoria
-- ordena a saída
ORDER BY s.ServicoMarcaVeiculo,s.ServicoModeloVeiculo,s.ServicoAnoVeiculo,c.categoria,s.ServicoDescricao;
