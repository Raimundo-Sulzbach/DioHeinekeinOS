-- Desafio - Dio X Heinekein X MySQL Workbench
-- Criando e implementando um um Projeto Lógico de Banco de Dados para gerenciamento de OS - ordens de serviço em uma oficina mecânica.
-- Autor: Raimundo Sulzbach
-- Data: 30/01/2025
-- Ferramentas utilizadas: MySQL e PyCharm
-- 
-- Função da query: 
-- lista os veídulos por cliente em ordem de cliente + placa com a narrativa deles sobre os problemas do veículo
-- selecionando apenas modelo i30 do ano 2015


-- acessa o banco de dados dio_osdb
use dio_osdb;
SELECT 
  c.ClienteNome AS "Nome do Cliente",
  -- Máscara para CPF (XXX.XXX.XXX-XX) e CNPJ (XX.XXX.XXX/XXXX-XX)
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
  v.VeiculoPlaca AS "PLACA VEÍCULO",
  v.VeiculoAno AS "ANO VEÍCULO",
  v.VeiculoMarca AS "MARCA VEÓCULO",
  v.VeiculoModelo AS "MODELO VEÍCULO",
  v.VeiculoEstadoPintura AS "ESTADO PINTURA",
  v.VeiculoEstadoInterior AS "ESTADO INTERIOR",
  v.VeiculoEstadoVidros AS "ESTADO VÍDROS",
  v.VeiculoEstadoPneus AS "ESTADO PNEUS",
  v.VeiculoKMatual AS "KM ATUAL",
  vp.VeiculosPorClienteNarrativaCliente AS "NARRATIVA CLIENTE",
  vp.VeiculosPorClienteDataNarrativa AS "DATA DA NARRATIVA"
FROM Cliente c
JOIN VeiculosPorCliente vp ON c.idCliente = vp.Cliente_idCliente
JOIN Veiculo v ON vp.Veiculo_idVeiculo = v.idVeiculo
-- seleciona registros do modelo i30 e ano 2015
where v.VeiculoModelo = "i30" and v.veiculoano = "2015"
ORDER BY c.ClienteNome,v.VeiculoPlaca;
