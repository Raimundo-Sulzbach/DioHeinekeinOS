-- Desafio - Dio X Heinekein X MySQL Workbench
-- Criando e implementando um um Projeto Lógico de Banco de Dados para gerenciamento de OS - ordens de serviço em uma oficina mecânica.
-- Autor: Raimundo Sulzbach
-- Data: 30/01/2025
-- Ferramentas utilizadas: MySQL e PyCharm
-- 
-- Função da query: 
-- lista as peças previstas e utilizadas  por OS

SELECT 
  os.idOS AS "ID OS",
  os.OSEmissao AS "EMISSÃO OS",
  os.OSStatus AS "STATUS",
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
  p.PecaCodigo AS "PEÇA CÓDIGO",
  p.PecaDescricao AS "DESCRIÇÃO",
  -- Formatação do preço da peça para 999.999,99
  LPAD(FORMAT(p.PecaPreco, 2, 'de_DE'), 12, ' ') AS "PREÇO",
  po.PecasPorOSqttPrevisao AS "QTT PREVISTA",
  LPAD(FORMAT(po.PecasPorOSvalorPrevisao, 2, 'de_DE'), 12, ' ') AS "VALOR PREVISTO",
  po.PecasPorOSqtt AS "QTT GASTA",
  LPAD(FORMAT(po.PecasPorOSvalor, 2, 'de_DE'), 12, ' ') AS "VALOR GASTO",
  po.PecasPorOSrequisicao AS "DATA SOLICITAÇÃO",
  m.MecanicoNome AS "SOLICITANTE",
  -- Máscara para CPF (XXX.XXX.XXX-XX)
  CONCAT(
    SUBSTR(m.MecanicoCodigoContrbuinte, 1, 3), '.', 
    SUBSTR(m.MecanicoCodigoContrbuinte, 4, 3), '.', 
    SUBSTR(m.MecanicoCodigoContrbuinte, 7, 3), '-', 
    SUBSTR(m.MecanicoCodigoContrbuinte, 10, 2)
  ) AS "CPF MECÂNICO",
FROM OS os
JOIN PecasPorOS po ON os.idOS = po.OS_idOS
JOIN Peca p ON po.Peca_idPeca = p.idPeca
JOIN Cliente c ON os.Cliente_idCliente = c.idCliente
JOIN Veiculo v ON os.Veiculo_idVeiculo = v.idVeiculo
JOIN OsPorMecanico om ON os.idOS = om.OS_idOS
JOIN Mecanico m ON om.Mecanico_idMecanico = m.idMecanico
ORDER BY os.idOS;
