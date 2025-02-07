-- Desafio - Dio X Heinekein X MySQL Workbench
-- Criando e implementando um um Projeto Lógico de Banco de Dados para gerenciamento de OS - ordens de serviço em uma oficina mecânica.
-- Autor: Raimundo Sulzbach
-- Data: 30/01/2025
-- Ferramentas utilizadas: MySQL e PyCharm
-- 
-- Função da query: 
-- O cliente foi recebido e ouvido, agora ele vai para o mecânico fazer o orçamento.
-- seleciona todas ordens de serviço do banco com os.osstatus = "Aberta" e emissão (recepção cliente) de 01 até 31/01/2025
-- 
SELECT 
  os.idos AS "OS",
  os.osEmissao As "Abrtura OS",
  cliente.clientenome AS "CLIENTE",
  veiculo.veiculoplaca AS "PLACA",
  os.osobs AS "SOLICITAÇÃO DO CLIENTE",
  os.OSstatus AS "SITUAÇÃO",
  mecanico.mecaniconome AS "PROFISSIONAL PARA ORÇAMENTO"
FROM os
JOIN veiculo ON os.veiculo_idveiculo = veiculo.idveiculo
JOIN veiculosporcliente ON veiculo.idveiculo = veiculosporcliente.veiculo_idveiculo
JOIN cliente ON os.cliente_idcliente = cliente.idcliente
JOIN ospormecanico ON os.idos = ospormecanico.os_idos
JOIN mecanico ON mecanico.idmecanico = ospormecanico.mecanico_idmecanico
JOIN categoriaspormecanico ON mecanico.idmecanico = categoriaspormecanico.mecanico_idmecanico
JOIN categoria ON categoria.idcategoria = categoriaspormecanico.categoria_idcategoria 
WHERE os.osstatus = "Aberta" and
os.osemissao BETWEEN '2025-01-01' and '2025-01-31'
GROUP BY os.idos, cliente.clientenome, veiculo.veiculoplaca, os.osobs, os.OSstatus, mecanico.mecaniconome
ORDER BY os.idos;
