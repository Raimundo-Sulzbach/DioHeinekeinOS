-- Desafio - Dio X Heinekein X MySQL Workbench
-- Criando e implementando um um Projeto Lógico de Banco de Dados para gerenciamento de OS - ordens de serviço em uma oficina mecânica.
-- Autor: Raimundo Sulzbach
-- Data: 30/01/2025
-- Ferramentas utilizadas: MySQL e PyCharm
-- 
-- Função da query: 
-- Seleciona todas as ordens de serviço EM ANDAMENTO - mecanico trabalhando na OS, por ordem de data de início
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
WHERE os.osstatus = "Em andamento"
ORDER BY servicosporos.servicosporosprevisaoinicio;
