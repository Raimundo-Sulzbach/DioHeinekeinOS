-- Desafio - Dio X Heinekein X MySQL Workbench
-- Criando e implementando um um Projeto Lógico de Banco de Dados para gerenciamento de OS - ordens de serviço em uma oficina mecânica.
-- Autor: Raimundo Sulzbach
-- Data: 30/01/2025
-- Ferramentas utilizadas: MySQL e PyCharm
-- 
-- Função da query: 
-- O cliente foi recebido e ouvido, o mecânico já fez os orçamentos de peças e serviços, o cliente aprovou.
-- A oficina já selecionou 2 profissionais para trabalhar no veículo do cliente que estavam disponíveis para o período 01 a 31/01/2025:
-- Patricia Rocha (id=10), Nível Pleno em Mecânica para a OS 1
-- Rafael Oliveira (id=7), Nível Senior em Lanternagem para a OS 5
-- Agora a oficina vai atualizar as duas ordens de serviço, alocando elas para os mecânicos.
-- Ações:
-- 1) seleciona os registros das OS e altera o mecanico:
-- OS 1 = Patricia Rocha (id = 10)
-- OS 5 = Rafael Oliveira (id = 7)
-- 

-- Seleciona mecanicos sem trabalho entre 01 a 31/01/2025 e que tenham habilidades em Mecânica e/ou Lanternagem
-- OS 1 altera de 1 (Mecanico Roberto Lima) para 10 Patricia Rocha (id = 10)
-- Anteriormente essa OS estava com o mecânico 1 (Roberto Lima)
UPDATE ospormecanico
SET mecanico_idmecanico = 10
WHERE os_idos = 1;
-- OS 5 altera de 5 (Mecanico Paulo Almeida) para Rafael Oliveira (id = 7)
-- Anteriormente essa OS estava com o mecânico 5 (Paulo Almeida)
UPDATE ospormecanico
SET mecanico_idmecanico = 1
WHERE os_idos = 5;
