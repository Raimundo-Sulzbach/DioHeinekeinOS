-- Desafio - Dio X Heinekein X MySQL Workbench
-- Criando e implementando um um Projeto Lógico de Banco de Dados para gerenciamento de OS - ordens de serviço em uma oficina mecânica.
-- Autor: Raimundo Sulzbach
-- Data: 30/01/2025
-- Ferramentas utilizadas: MySQL e PyCharm
-- 
-- Função da query: 
-- lista o cadastro de mecânicos com as habilidades e nível de proficiência dele.
-- Seleciona apenas LANTERNAGEM 


-- acessa o banco de dados dio_osdb
use dio_osdb;
SELECT 
  m.MecanicoNome AS "MECANICO NOME",
  -- Máscara para CPF (XXX.XXX.XXX-XX)
  CONCAT(
    SUBSTR(m.MecanicoCodigoContrbuinte, 1, 3), '.', 
    SUBSTR(m.MecanicoCodigoContrbuinte, 4, 3), '.', 
    SUBSTR(m.MecanicoCodigoContrbuinte, 7, 3), '-', 
    SUBSTR(m.MecanicoCodigoContrbuinte, 10, 2)
  ) AS "CPF",
  m.MecanicoEndereco AS "ENDEREÇO",
  -- Máscara para CEP (XXXXX-XXX)
  CONCAT(
    SUBSTR(m.MecanicoCEP, 1, 5), '-', 
    SUBSTR(m.MecanicoCEP, 6, 3)
  ) AS "CEP",
  m.MecanicoNumero AS "Nº",
  m.MecanicoComplemento AS "COMPL",
  m.MecanicoBairro AS "BAIRRO",
  m.MecanicoCidade AS "CIDADE",
  m.MecanicoUF AS "UF",
  m.MecanicoTelefone AS "TELEFONE",
  m.MecanicoWhatsapp AS "WHATSAPP",
  m.MecanicoEmail AS "EMAIL",
  c.Categoria AS "HABILIDADES",
  cp.categoriaspormecaniconivel AS "Nível"
FROM Mecanico m
JOIN CategoriasPorMecanico cp ON m.idMecanico = cp.Mecanico_idMecanico
JOIN Categoria c ON cp.Categoria_idCategoria = c.idCategoria
WHERE c.categoria = "Lanternagem"
ORDER BY m.MecanicoNome, c.Categoria;
