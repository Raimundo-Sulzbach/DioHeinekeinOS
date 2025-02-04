-- Desafio - Dio X Heinekein X MySQL Workbench
-- Criando e implementando um um Projeto Lógico de Banco de Dados para gerenciamento de OS - ordens de serviço em uma oficina mecânica.
-- Autor: Raimundo Sulzbach
-- Data: 30/01/2025
-- Ferramentas utilizadas: MySQL e PyCharm
-- 
-- Função da query: 
-- O cliente foi recebido e ouvido, o mecânico já fez os orçamentos de peças e serviços, o cliente aprovou.
-- Agora a oficina precisa encaminhar o veículo do cliente para o(s) mecânico que possui(am) as especilizações (categorias) necessárias.
-- Ações:
-- 1) seleciona os mecânicos que possuam as especializações necessárias e que não tenham servço para a semana 01/01/2025 a 31/01/2025:
-- 2) Selecionar mecânicos ativos (não demitidos ou afastados) com especialidade em mecânica para a OS número 1
-- 3) Selecionar mecânicos (não demitidos ou afastados) com especialidade em lanternagem para a OS número 5
-- 


-- acessa o banco de dados dio_osdb
use dio_osdb;
-- Seleciona mecanicos sem trabalho entre 01 a 31/01/2025 e que tenham habilidades em Mecânica e/ou Lanternagem
SELECT 
  mecanico.mecaniconome AS "PROFISSIONAL",
  categoria.categoria AS "HABILIDADE",
  categoriaspormecanico.categoriaspormecaniconivel AS "NÍVEL"
FROM mecanico
JOIN categoriaspormecanico ON mecanico.idmecanico = categoriaspormecanico.mecanico_idmecanico
JOIN categoria ON categoria.idcategoria = categoriaspormecanico.categoria_idcategoria
WHERE mecanico.idmecanico NOT IN (
  SELECT ospormecanico.mecanico_idmecanico
  FROM ospormecanico
  JOIN servicosporos ON servicosporos.OS_idOS = ospormecanico.OS_idOS
  WHERE servicosporos.ServicosPorOSprevisaoInicio BETWEEN '2025-01-01' AND '2025-01-31'
)
-- seleciona os mecanicos ativos que tenham competência em Lanternagem ou Mecânica
AND categoria.categoria = "Lanternagem" or categoria.categoria = "Mecânica" and mecanico.mecanicostatus = 1
ORDER BY mecanico.idmecanico;
