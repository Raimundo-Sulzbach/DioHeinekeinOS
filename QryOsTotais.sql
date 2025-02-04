-- Desafio - Dio X Heinekein X MySQL Workbench
-- Criando e implementando um um Projeto Lógico de Banco de Dados para gerenciamento de OS - ordens de serviço em uma oficina mecânica.
-- Autor: Raimundo Sulzbach
-- Data: 30/01/2025
-- Ferramentas utilizadas: MySQL e PyCharm
-- 
-- Função da query: 
-- lista o total de ordens de serviço abertas só totais


-- acessa o banco de dados dio_osdb
use dio_osdb;
SELECT
  COUNT(os.idos) AS "QTT OS",
  SUM(servicosporos.servicosporosqtt) AS "QTT SERVIÇOS",
  LPAD(FORMAT(SUM(servicosporos.servicosporosqtt * servico.servicopreco), 2), 12, ' ') AS "TOTAL VALOR",
  LPAD(FORMAT(AVG(servicosporos.servicosporosqtt * servico.servicopreco), 2), 12, ' ') AS "VALOR MÉDIO POR OS",
  LPAD(FORMAT(AVG(servico.servicopreco), 2), 12, ' ') AS "VALOR MÉDIO POR SERVIÇO"
FROM os
JOIN veiculo ON os.veiculo_idveiculo = veiculo.idveiculo
JOIN cliente ON os.cliente_idcliente = cliente.idcliente
JOIN ospormecanico ON os.idos = ospormecanico.os_idos
JOIN mecanico ON ospormecanico.mecanico_idmecanico = mecanico.idmecanico
JOIN servicosporos ON os.idos = servicosporos.os_idos
JOIN servico ON servico.idservico = servicosporos.servico_idservico
WHERE os.osstatus = "Aberta";


