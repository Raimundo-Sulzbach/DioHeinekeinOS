-- Desafio - Dio X Heinekein X MySQL Workbench
-- Criando e implementando um um Projeto Lógico de Banco de Dados para gerenciamento de OS - ordens de serviço em uma oficina mecânica.
-- Autor: Raimundo Sulzbach
--
-- (*) Atenção! O script Apaga e reinicia o banco de dados dio_ecomercedb.
--
-- Data: 30/01/2025
-- Ferramentas utilizadas: MySQL e PyCharm
--
-- Banco: dio_osdb - banco de dados para um sistema de gerenciamento de OS - ordens de serviço, em uma oficina mecânica.
--
-- -----------------------------------------------------
-- Tabela `dio_osdb`.`Veiculo`
-- -----------------------------------------------------
-- 
-- apaga a tabela
-- 
DROP Table IF EXISTS `dio_osdb`.`Veiculo` ;

-- 
-- cria a tabela
-- 
CREATE Table IF NOT EXISTS `dio_osdb`.`Veiculo` (
  `idVeiculo` INT NOT NULL AUTO_INCREMENT COMMENT 'Código interno de identificação do veículo',
  `VeiculoPlaca` VARCHAR(7) NOT NULL COMMENT 'Placa do veículo.',
  `VeiculoAno` VARCHAR(4) NOT NULL COMMENT 'Ano do veículo.',
  `VeiculoMarca` VARCHAR(20) NOT NULL COMMENT 'Marca do veículo.',
  `VeiculoModelo` VARCHAR(45) NOT NULL COMMENT 'Modelo do veículo.',
  `VeiculoEstadoPintura` VARCHAR(100) NOT NULL COMMENT 'Estado da pintura do veículo quando recebido na oficina.',
  `VeiculoEstadoInterior` VARCHAR(100) NOT NULL COMMENT 'Estado do interior do veículo quando deu entrada na oficina.',
  `VeiculoEstadoVidros` VARCHAR(100) NOT NULL COMMENT 'Estado dos vidros do veículo quando deu entrada na oficina.',
  `VeiculoEstadoPneus` VARCHAR(100) NOT NULL COMMENT 'Estado dos pneus do veículo quando deu entrada na oficina.',
  `VeiculoKMatual` INT NOT NULL COMMENT 'Quilometragem do veículo quando deu entrada na oficina.',
  PRIMARY KEY (`idVeiculo`),
  CHECK (`VeiculoKMatual` > 0)
) ENGINE = InnoDB
COMMENT = ' ';

-- desabilita o safe mode
SET SQL_SAFE_UPDATES = 0;
-- zera a tabela veiculo
DELETE FROM dio_osdb.veiculo;
-- reativa o modeo seguro
delete from dio_osdb.veiculo where 1=1;
-- insere 10 registros na tabela `dio_osdb`.`veiculo`

INSERT INTO `dio_osdb`.`Veiculo` (`idVeiculo`, `VeiculoPlaca`, `VeiculoAno`, `VeiculoMarca`, `VeiculoModelo`, `VeiculoEstadoPintura`, 
`VeiculoEstadoInterior`, `VeiculoEstadoVidros`, `VeiculoEstadoPneus`, `VeiculoKMatual`)
VALUES
(1, 'ABC1234', '2015', 'HYUNDAI', 'i30', 'Boa', 'Bom', 'Bom', 'Bom', 50000),
(2, 'XYZ5678', '2020', 'BMW', '118i', 'Razoável', 'Razoável', 'Bom', 'Razoável', 30000),
(3, 'DEF9101', '2022', 'VOLKSWAGEN', 'Fox', 'Excelente', 'Excelente', 'Excelente', 'Bom', 15000),
(4, 'GHI1213', '2024', 'GM', 'Onix', 'Boa', 'Bom', 'Razoável', 'Razoável', 45000),
(5, 'JKL1415', '2023', 'KIA', 'Creta', 'Excelente', 'Excelente', 'Bom', 'Excelente', 25000);

select * from veiculo;
