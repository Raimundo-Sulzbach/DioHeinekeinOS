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
-- Tabela `dio_osdb`.`OsPorMecanico` - relacionamento de ordens de serviço por mecânico
-- -----------------------------------------------------
--
-- apaga a tabela
--
DROP TABLE IF EXISTS`dio_osdb`.`OsPorMecanico` ;
--
-- cria a tabela
--
CREATE TABLE IF NOT EXISTS `dio_osdb`.`OsPorMecanico` (
  `OS_idOS` INT NOT NULL COMMENT 'Código interno da OS.',
  `Mecanico_idMecanico` INT NOT NULL COMMENT 'Código interno do mecânico alocado à OS.',
  PRIMARY KEY (`OS_idOS`, `Mecanico_idMecanico`),
  INDEX `fk_OS_has_Mecanico_Mecanico1_idx` (`Mecanico_idMecanico` ASC) VISIBLE,
  INDEX `fk_OS_has_Mecanico_OS1_idx` (`OS_idOS` ASC) VISIBLE,
  CONSTRAINT `fk_OS_has_Mecanico_OS1`
    FOREIGN KEY (`OS_idOS`)
    REFERENCES `dio_osdb`.`OS` (`idOS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OS_has_Mecanico_Mecanico1`
    FOREIGN KEY (`Mecanico_idMecanico`)
    REFERENCES `dio_osdb`.`Mecanico` (`idMecanico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela `dio_osdb`.`ospormecanico` cadastro de OS ordens de serviço orçadas, em serviço ou canceladas por mecanico
-- -----------------------------------------------------
-- desabilita o safe mode
SET SQL_SAFE_UPDATES = 0;
-- zera a tabela 
DELETE FROM dio_osdb.ospormecanico;
-- reativa o modeo seguro
delete from dio_osdb.ospormecanico where 1=1;
-- 
-- popula a tabela com 20 registros de os por mecanico
-- 

INSERT INTO `dio_osdb`.`OsPorMecanico` (`OS_idOS`, `Mecanico_idMecanico`)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 1),
(12, 2),
(13, 3),
(14, 4),
(15, 5),
(16, 6),
(17, 7),
(18, 8),
(19, 9),
(20, 10);

-- lista todo conteúdo da tabela
select * from ospormecanico;
