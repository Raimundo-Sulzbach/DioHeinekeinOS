-- Desafio - Dio X Heinekein X MySQL Workbench
-- Criando e implementando um um Projeto Lógico de Banco de Dados para gerenciamento de OS - ordens de serviço em uma oficina mecânica.
-- Autor: Raimundo Sulzbach
-- Data: 30/01/2025
-- Ferramentas utilizadas: MySQL e PyCharm
-- 
-- Função da query: 
-- lista o total de ordens de serviço abertas só totais
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


-- -------------------------------------------------------------------------------------------------------
-- HOje é 01/02/2025 e a oficina ficou com alguns serviços pendentes de 01/2025
-- Descubra quais são as ordens pendentes e redistribua os serviços previstos para 1ª semana de 02/2025
-- para mecânicos sem trabalho para esta semana. Faça essa alteração nas tabelas e liste o resultado.
-- seleciona ordens de serviço para execução em 01/2025
-- 
-- Seleção de OS "Em andamento" <= 31/01/2025
-- 
SELECT 
  os.idos AS "OS",
  cliente.clientenome AS "CLIENTE",
  veiculo.veiculoplaca AS "PLACA",
  os.osobs AS "SOLICITAÇÃO DO CLIENTE",
  servico.servicodescricao AS "SERVIÇO PARA EXECUTAR",
  LPAD(FORMAT(servico.servicopreco, 2), 12, ' ') AS "PREÇO UNITÁRIO",
  servicosporos.servicosporosqtt AS "QTT SERVIÇOS",
  LPAD(FORMAT(servicosporos.servicosporosqtt * servico.servicopreco, 2), 12, ' ') AS "TOTAL",
  os.OSstatus AS "SITUAÇÃO",
  servicosporos.servicosporosprevisaoinicio AS "PREVISÃO INICIO",
  servicosporos.servicosporosprevisaofim AS "PREVISÃO FIM",
  mecanico.mecaniconome AS "PROFISSIONAL"
FROM os
JOIN veiculo ON os.veiculo_idveiculo = veiculo.idveiculo
JOIN cliente ON os.cliente_idcliente = cliente.idcliente
JOIN ospormecanico ON os.idos = ospormecanico.os_idos
JOIN mecanico ON ospormecanico.mecanico_idmecanico = mecanico.idmecanico
JOIN servicosporos ON os.idos = servicosporos.os_idos
JOIN servico ON servico.idservico = servicosporos.servico_idservico
WHERE os.osstatus = "Em Andamento"
  AND servicosporos.servicosporosprevisaoinicio <= '2025-01-31'
ORDER BY servicosporos.servicosporosprevisaoinicio;

-- 
-- Mecânicos sem trabalho para a semana de 01 a 07/02/2025
-- 
-- Script para verificar mecânicos ativos sem ordens de serviço no período de 01/02/2025 a 28/02/2025
-- 
SELECT *
FROM Mecanico m
WHERE m.idMecanico NOT IN (
  SELECT Mecanico_idMecanico 
  FROM OsPorMecanico
)
AND m.idMecanico NOT IN (
  SELECT ServicosPorOS.OS_idOS 
  FROM ServicosPorOS
  WHERE ServicosPorOS.ServicosPorOSprevisaoInicio BETWEEN '2025-02-01' AND '2025-02-28'
);

-- ----------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------
-- seleciona ordens de serviço para execução no 1º trimestre de 2025 pela mecânica Juliana
-- 
SELECT 
  os.idos AS "OS",
  cliente.clientenome AS "CLIENTE",
  veiculo.veiculoplaca AS "PLACA",
  os.osobs AS "SOLICITAÇÃO DO CLIENTE",
  servico.servicodescricao AS "SERVIÇO PARA EXECUTAR",
  LPAD(FORMAT(servico.servicopreco, 2), 12, ' ') AS "PREÇO UNITÁRIO",
  servicosporos.servicosporosqtt AS "QTT SERVIÇOS",
  LPAD(FORMAT(servicosporos.servicosporosqtt * servico.servicopreco, 2), 12, ' ') AS "TOTAL",
  os.OSstatus AS "SITUAÇÃO",
  servicosporos.servicosporosprevisaoinicio AS "PREVISÃO INICIO",
  servicosporos.servicosporosprevisaofim AS "PREVISÃO FIM",
  mecanico.mecaniconome AS "PROFISSIONAL"
FROM os
JOIN veiculo ON os.veiculo_idveiculo = veiculo.idveiculo
JOIN cliente ON os.cliente_idcliente = cliente.idcliente
JOIN ospormecanico ON os.idos = ospormecanico.os_idos
JOIN mecanico ON ospormecanico.mecanico_idmecanico = mecanico.idmecanico
JOIN servicosporos ON os.idos = servicosporos.os_idos
JOIN servico ON servico.idservico = servicosporos.servico_idservico
WHERE os.osstatus = "Aberta"
  AND servicosporos.servicosporosprevisaoinicio not BETWEEN '2025-02-01' AND '2025-02-28'
ORDER BY servicosporos.servicosporosprevisaoinicio;




select osstatus from os
group by osstatus;
