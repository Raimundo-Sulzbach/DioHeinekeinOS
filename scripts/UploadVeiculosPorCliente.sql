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
-- Tabela `dio_osdb`.`VeiculosPorCliente`
-- -----------------------------------------------------
-- 
-- apaga a tabela
-- 
DROP Table IF EXISTS `dio_osdb`.`VeiculosPorCliente` ;

-- 
-- cria a tabela
-- 
CREATE Table IF NOT EXISTS `dio_osdb`.`VeiculosPorCliente` (
  `Cliente_idCliente` INT NOT NULL COMMENT 'Código interno para o cliente.\n',
  `Veiculo_idVeiculo` INT NOT NULL COMMENT 'Código interno para o veículo.',
  `VeiculosPorClienteNarrativaCliente` VARCHAR(250) NOT NULL COMMENT 'Resumo dos problemas apontados pelo cliente.',
  `VeiculosPorClienteDataNarrativa` DATETIME NOT NULL COMMENT 'Data do apontamento dos defeitos pelo cliente.',
  PRIMARY KEY (`Cliente_idCliente`, `Veiculo_idVeiculo`),
  INDEX `fk_Cliente_has_Veiculo_Veiculo1_idx` (`Veiculo_idVeiculo` ASC) VISIBLE,
  INDEX `fk_Cliente_has_Veiculo_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_has_Veiculo_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `dio_osdb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_has_Veiculo_Veiculo1`
    FOREIGN KEY (`Veiculo_idVeiculo`)
    REFERENCES `dio_osdb`.`Veiculo` (`idVeiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- desabilita o safe mode
SET SQL_SAFE_UPDATES = 0;
-- zera a tabela veiculosporcliente
DELETE FROM dio_osdb.veiculosporcliente;
-- reativa o modeo seguro
delete from dio_osdb.veiculosporcliente where 1=1;
-- insere 10 registros na tabela `dio_osdb`.`veiculosporcliente`

INSERT INTO `dio_osdb`.`VeiculosPorCliente` (`Cliente_idCliente`, `Veiculo_idVeiculo`, `VeiculosPorClienteNarrativaCliente`, `VeiculosPorClienteDataNarrativa`)
VALUES
(1, 1, 'Barulho estranho no motor', '2025-01-15 10:30:00'),
(2, 2, 'Pneus desgastados', '2025-01-16 09:45:00'),
(3, 3, 'Vidro traseiro trincado', '2025-01-17 14:00:00'),
(4, 4, 'Problema no sistema elétrico', '2025-01-18 11:20:00'),
(5, 5, 'Pintura riscada', '2025-01-19 13:15:00');

select * from veiculosporcliente;
