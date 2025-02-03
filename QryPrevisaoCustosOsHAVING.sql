-- Desafio - Dio X Heinekein X MySQL Workbench
-- Criando e implementando um um Projeto Lógico de Banco de Dados para gerenciamento de OS - ordens de serviço em uma oficina mecânica.
-- Autor: Raimundo Sulzbach
-- Data: 30/01/2025
-- Ferramentas utilizadas: MySQL e PyCharm
-- 
-- Função da query: 
-- mostrar a previsão de custos com peças e serviços da OS
-- Seleciona todas as ordens de serviço ABERTAS - pendente de início de trabalho, por ordem de data de início e
-- calcula seus custos e seleciona valores >500
-- APENAS PARA DEMONSTRA USO DE HAVING
-- 
SELECT 
  os.idos AS "OS",
  cliente.clientenome AS "CLIENTE",
  veiculo.veiculoplaca AS "PLACA",
  os.osobs AS "SOLICITAÇÃO DO CLIENTE",
  COUNT(servicosporos.servico_idservico) AS "TOTAL SERVIÇOS",
  SUM(servicosporos.servicosporosvalor) AS "VALOR TOTAL SERVIÇOS",
  mecanico.mecaniconome AS "PROFISSIONAL"
FROM os
JOIN veiculo ON os.veiculo_idveiculo = veiculo.idveiculo
JOIN cliente ON os.cliente_idcliente = cliente.idcliente
JOIN ospormecanico ON os.idos = ospormecanico.os_idos
JOIN mecanico ON ospormecanico.mecanico_idmecanico = mecanico.idmecanico
JOIN servicosporos ON os.idos = servicosporos.os_idos
GROUP BY os.idos, cliente.clientenome, veiculo.veiculoplaca, os.osobs, mecanico.mecaniconome
HAVING SUM(servicosporos.servicosporosvalor) > 500
ORDER BY os.idos;
