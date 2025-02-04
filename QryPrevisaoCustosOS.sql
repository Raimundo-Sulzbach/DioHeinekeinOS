-- Desafio - Dio X Heinekein X MySQL Workbench
-- Criando e implementando um um Projeto Lógico de Banco de Dados para gerenciamento de OS - ordens de serviço em uma oficina mecânica.
-- Autor: Raimundo Sulzbach
-- Data: 30/01/2025
-- Ferramentas utilizadas: MySQL e PyCharm
-- 
-- Função da query: 
-- mostrar a previsão de custos com peças e serviços da OS
-- Seleciona todas as ordens de serviço ABERTAS - pendente de início de trabalho, por ordem de data de início e
-- calcula seus custos


-- acessa o banco de dados dio_osdb
use dio_osdb;
SELECT 
  os.idos AS "OS",
  cliente.clientenome AS "CLIENTE",
  veiculo.veiculoplaca AS "PLACA",
  os.osobs AS "SOLICITAÇÃO DO CLIENTE",
  s1.servicodescricao AS "SERVIÇO REAL PARA EXECUTAR",
  peca.pecadescricao AS "PEÇA DESCRIÇÃO",
  LPAD(FORMAT(peca.pecapreco, 2), 12, ' ') AS "PEÇA PREÇO UNITÁRIO",
  pecasporos.pecasporosqttprevisao AS "QTT PEÇA",
  LPAD(FORMAT(peca.pecapreco * pecasporos.pecasporosqttprevisao, 2), 12, ' ') AS "PEÇAS TOTAL PREVISÃO",
  LPAD(FORMAT(s1.servicopreco, 2), 12, ' ') AS "PREÇO UNITÁRIO",
  servicosporos.servicosporosqtt AS "QTT SERVIÇOS",
  LPAD(FORMAT(servicosporos.servicosporosqtt * s1.servicopreco, 2), 12, ' ') AS "TOTAL",
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
JOIN servico s1 ON s1.idservico = servicosporos.servico_idservico
JOIN pecasporos ON os.idos = pecasporos.os_idos
JOIN peca ON peca.idpeca = pecasporos.peca_idpeca
WHERE os.osstatus = "Aberta"
ORDER BY servicosporos.servicosporosprevisaoinicio;
