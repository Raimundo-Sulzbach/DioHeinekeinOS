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
-- Tabela `dio_osdb`.`ServicosPorOS` relação de serviços por OS, orçados, em execução, realizados, cancelados, ...
-- -----------------------------------------------------
--
-- apaga a tabela
--
DROP TABLE IF EXISTS`dio_osdb`.`ServicosPorOS` ;
--
-- cria a tabela
--
CREATE TABLE IF NOT EXISTS `dio_osdb`.`ServicosPorOS` (
  `Servico_idServico` INT NOT NULL COMMENT 'Código do serviço que será ou poderá ser executado na OS.',
  `OS_idOS` INT NOT NULL COMMENT 'Número da OS.',
  `ServicosPorOSqtt` INT NOT NULL DEFAULT 1 COMMENT 'Quantidade de serviços da OS.',
  `ServicosPorOSvalor` DECIMAL(15,2) NOT NULL DEFAULT 0.01 COMMENT 'Valor dos serviços da OS.',
  `ServicosPorOSprevisaoInicio` DATETIME NULL COMMENT 'Data prevista para início dos serviços.',
  `ServicosPorOSinicio` DATETIME NULL COMMENT 'Data de início efetivo dos serviços.',
  `ServicosPorOSprevisaoFim` DATETIME NULL COMMENT 'Data prevista para finalização dos serviços.',
  `ServicosPorOSfim` DATETIME NULL COMMENT 'Data efetiva do término dos serviços.',
  PRIMARY KEY (`Servico_idServico`, `OS_idOS`),
  INDEX `fk_Servico_has_OS_OS1_idx` (`OS_idOS` ASC) VISIBLE,
  INDEX `fk_Servico_has_OS_Servico1_idx` (`Servico_idServico` ASC) VISIBLE,
  CONSTRAINT `fk_Servico_has_OS_Servico1`
    FOREIGN KEY (`Servico_idServico`)
    REFERENCES `dio_osdb`.`Servico` (`idServico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Servico_has_OS_OS1`
    FOREIGN KEY (`OS_idOS`)
    REFERENCES `dio_osdb`.`OS` (`idOS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CHECK (`ServicosPorOSqtt` > 0),
  CHECK (`ServicosPorOSvalor` > 0)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela `dio_osdb`.`servicosporos` cadastro de serviços por ordens de serviço orçadas, em serviço ou canceladas
-- -----------------------------------------------------
-- desabilita o safe mode
SET SQL_SAFE_UPDATES = 0;
-- zera a tabela 
DELETE FROM dio_osdb.servicosporos;
-- reativa o modeo seguro
delete from dio_osdb.servicosporos where 1=1;
-- 
-- popula a tabela com 20 registros de serviços por os
-- 

INSERT INTO `dio_osdb`.`ServicosPorOS` (`Servico_idServico`, `OS_idOS`, `ServicosPorOSqtt`, `ServicosPorOSvalor`, `ServicosPorOSprevisaoInicio`, `ServicosPorOSinicio`, `ServicosPorOSprevisaoFim`, `ServicosPorOSfim`)
VALUES
(1, 1, 2, 500.00, '2025-01-02 09:00:00', '2025-01-02 10:00:00', '2025-01-05 17:00:00', '2025-01-05 17:00:00'),
(2, 2, 1, 300.00, '2025-01-06 11:00:00', '2025-01-06 12:00:00', '2025-01-10 17:00:00', '2025-01-10 17:00:00'),
(3, 3, 3, 450.00, '2025-01-11 10:00:00', '2025-01-11 11:00:00', '2025-01-15 17:00:00', '2025-01-15 17:00:00'),
(4, 4, 4, 600.00, '2025-01-16 12:00:00', '2025-01-16 13:00:00', '2025-01-20 17:00:00', '2025-01-20 17:00:00'),
(5, 5, 2, 350.00, '2025-01-21 14:00:00', '2025-01-21 15:00:00', '2025-01-25 17:00:00', '2025-01-25 17:00:00'),
(6, 6, 1, 250.00, '2025-01-26 16:00:00', '2025-01-26 17:00:00', '2025-01-30 17:00:00', '2025-01-30 17:00:00'),
(7, 7, 3, 400.00, '2025-01-31 18:00:00', '2025-01-31 19:00:00', '2025-02-04 17:00:00', '2025-02-04 17:00:00'),
(8, 8, 2, 220.00, '2025-02-05 20:00:00', '2025-02-05 21:00:00', '2025-02-09 17:00:00', '2025-02-09 17:00:00'),
(9, 9, 4, 160.00, '2025-02-10 22:00:00', '2025-02-10 23:00:00', '2025-02-14 17:00:00', '2025-02-14 17:00:00'),
(10, 10, 3, 140.00, '2025-02-15 08:00:00', '2025-02-15 09:00:00', '2025-02-19 17:00:00', '2025-02-19 17:00:00'),
(11, 1, 1, 200.00, '2025-02-20 10:00:00', '2025-02-20 11:00:00', '2025-02-24 17:00:00', '2025-02-24 17:00:00'),
(12, 2, 2, 300.00, '2025-02-25 12:00:00', '2025-02-25 13:00:00', '2025-02-27 17:00:00', '2025-02-28 17:00:00'),
(13, 3, 3, 180.00, '2025-03-02 14:00:00', '2025-03-02 15:00:00', '2025-03-06 17:00:00', '2025-03-06 17:00:00'),
(14, 4, 4, 220.00, '2025-03-07 16:00:00', '2025-03-07 17:00:00', '2025-03-11 17:00:00', '2025-03-11 17:00:00'),
(15, 5, 2, 160.00, '2025-03-12 18:00:00', '2025-03-12 19:00:00', '2025-03-16 17:00:00', '2025-03-16 17:00:00'),
(16, 6, 1, 140.00, '2025-03-17 20:00:00', '2025-03-17 21:00:00', '2025-03-21 17:00:00', '2025-03-21 17:00:00'),
(17, 7, 3, 200.00, '2025-03-22 22:00:00', '2025-03-22 23:00:00', '2025-03-26 17:00:00', '2025-03-26 17:00:00'),
(18, 8, 2, 300.00, '2025-03-27 08:00:00', '2025-03-27 09:00:00', '2025-03-31 17:00:00', '2025-03-31 17:00:00'),
(19, 9, 4, 180.00, '2025-04-01 10:00:00', '2025-04-01 11:00:00', '2025-04-05 17:00:00', '2025-04-05 17:00:00'),
(20, 10, 3, 220.00, '2025-04-06 12:00:00', '2025-04-06 13:00:00', '2025-04-10 17:00:00', '2025-04-10 17:00:00');

-- lista todo conteúdo da tabela
select * from servicosporos;

