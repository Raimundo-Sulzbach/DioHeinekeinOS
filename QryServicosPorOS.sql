-- Desafio - Dio X Heinekein X MySQL Workbench
-- Criando e implementando um um Projeto Lógico de Banco de Dados para gerenciamento de OS - ordens de serviço em uma oficina mecânica.
-- Autor: Raimundo Sulzbach
-- Data: 30/01/2025
-- Ferramentas utilizadas: MySQL e PyCharm
-- 
-- Função da query: 
-- lista os serviços por OS


-- acessa o banco de dados dio_osdb
use dio_osdb;
SELECT 
  os.idOS AS "ID OS",
  os.OSEmissao AS "EMISSÃO OS",
  os.OSStatus AS "STATUS ATUAL",
  c.ClienteNome AS "NOME CLIENTE",
  -- Máscara para CPF (XXX.XXX.XXX-XX)
  CASE
    WHEN LENGTH(c.ClienteCodigoContribuinte) = 11 THEN 
      CONCAT(
        SUBSTR(c.ClienteCodigoContribuinte, 1, 3), '.', 
        SUBSTR(c.ClienteCodigoContribuinte, 4, 3), '.', 
        SUBSTR(c.ClienteCodigoContribuinte, 7, 3), '-', 
        SUBSTR(c.ClienteCodigoContribuinte, 10, 2)
      )
    ELSE 
      CONCAT(
        SUBSTR(c.ClienteCodigoContribuinte, 1, 2), '.', 
        SUBSTR(c.ClienteCodigoContribuinte, 3, 3), '.', 
        SUBSTR(c.ClienteCodigoContribuinte, 6, 3), '/', 
        SUBSTR(c.ClienteCodigoContribuinte, 9, 4), '-', 
        SUBSTR(c.ClienteCodigoContribuinte, 13, 2)
      )
  END AS "CONTRIBUINTE",
  v.VeiculoPlaca AS "PLACA",
  v.VeiculoAno AS "ANO",
  v.VeiculoMarca AS "MARCA",
  v.VeiculoModelo AS "MODELO",
  m.MecanicoNome AS "MECÂNICO",
  -- Máscara para CPF (XXX.XXX.XXX-XX)
  CONCAT(
    SUBSTR(m.MecanicoCodigoContrbuinte, 1, 3), '.', 
    SUBSTR(m.MecanicoCodigoContrbuinte, 4, 3), '.', 
    SUBSTR(m.MecanicoCodigoContrbuinte, 7, 3), '-', 
    SUBSTR(m.MecanicoCodigoContrbuinte, 10, 2)
  ) AS "CPF MECÂNICO",
  s.ServicoDescricao AS "SERVIÇOS",
  sp.ServicosPorOSqtt AS "QTT",
  LPAD(FORMAT(sp.ServicosPorOSvalor, 2, 'de_DE'), 12, ' ') AS "VALOR",
  sp.ServicosPorOSprevisaoInicio AS "PREVISÃO INÍCIO",
  sp.ServicosPorOSinicio AS "INÍCIO REAL",
  sp.ServicosPorOSprevisaoFim AS "PREVISÃO FIM",
  sp.ServicosPorOSfim AS "FIM REAL"
FROM OS os
JOIN Cliente c ON os.Cliente_idCliente = c.idCliente
JOIN Veiculo v ON os.Veiculo_idVeiculo = v.idVeiculo
JOIN OsPorMecanico om ON os.idOS = om.OS_idOS
JOIN Mecanico m ON om.Mecanico_idMecanico = m.idMecanico
JOIN ServicosPorOS sp ON os.idOS = sp.OS_idOS
JOIN Servico s ON sp.Servico_idServico = s.idServico
ORDER BY os.idOS;
