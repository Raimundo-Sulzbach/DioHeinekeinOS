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
-- Tabela `dio_osdb`.`PecasPorOS`
-- -----------------------------------------------------
-- 
-- apaga a tabela
-- 
DROP Table IF EXISTS `dio_osdb`.`PecasPorOS` ;

-- 
-- cria a tabela
-- 
CREATE Table IF NOT EXISTS `dio_osdb`.`PecasPorOS` (
  `Peca_idPeca` INT NOT NULL COMMENT 'Código interno da peça utilizada na OS.',
  `OS_idOS` INT NOT NULL COMMENT 'Número da OS.',
  `PecasPorOSqttPrevisao` INT NOT NULL COMMENT 'Quantidade de peças previstas para uso na OS.',
  `PecasPorOSvalorPrevisao` DECIMAL(15,2) NOT NULL COMMENT 'Valor das peças previstas para uso na OS.',
  `PecasPorOSrequisicaoPrevisao` DATETIME NOT NULL COMMENT 'Data da requisição das peças na OS.',
  `PecasPorOSqtt` INT NOT NULL COMMENT 'Quantidade de peças efetivamente utilizadas na OS.',
  `PecasPorOSvalor` DECIMAL(15,2) NOT NULL COMMENT 'Valor das peças efetivamente utilizadas na OS.',
  `PecasPorOSrequisicao` DATETIME NOT NULL COMMENT 'Data efetiva da requisição das peças para a OS.',
  PRIMARY KEY (`Peca_idPeca`, `OS_idOS`),
  INDEX `fk_Peca_has_OS_OS1_idx` (`OS_idOS` ASC) VISIBLE,
  INDEX `fk_Peca_has_OS_Peca1_idx` (`Peca_idPeca` ASC) VISIBLE,
  CONSTRAINT `fk_Peca_has_OS_Peca1`
    FOREIGN KEY (`Peca_idPeca`)
    REFERENCES `dio_osdb`.`Peca` (`idPeca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Peca_has_OS_OS1`
    FOREIGN KEY (`OS_idOS`)
    REFERENCES `dio_osdb`.`OS` (`idOS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CHECK (`PecasPorOSqttPrevisao` > 0),
  CHECK (`PecasPorOSvalorPrevisao` > 0)
) ENGINE = InnoDB;

-- desabilita o safe mode
SET SQL_SAFE_UPDATES = 0;
-- zera a tabela 
DELETE FROM dio_osdb.pecasporos;
-- reativa o modeo seguro
delete from dio_osdb.pecasporos where 1=1;
-- 
-- popula a tabela com 20 registros de peças por os
-- 
INSERT INTO `dio_osdb`.`PecasPorOS` (`Peca_idPeca`, `OS_idOS`, `PecasPorOSqttPrevisao`, `PecasPorOSvalorPrevisao`, `PecasPorOSrequisicaoPrevisao`, `PecasPorOSqtt`, `PecasPorOSvalor`, `PecasPorOSrequisicao`)
VALUES
(1, 1, 1, 100.00, '2025-01-02 09:00:00', 2, 100.00, '2025-01-02 10:00:00'),
(2, 2, 2, 200.00, '2025-01-06 11:00:00', 1, 200.00, '2025-01-06 12:00:00'),
(3, 3, 2, 150.00, '2025-01-11 10:00:00', 3, 150.00, '2025-01-11 11:00:00'),
(4, 4, 1, 300.00, '2025-01-16 12:00:00', 4, 300.00, '2025-01-16 13:00:00'),
(5, 5, 1, 120.00, '2025-01-21 14:00:00', 2, 120.00, '2025-01-21 15:00:00'),
(6, 6, 2, 250.00, '2025-01-26 16:00:00', 1, 250.00, '2025-01-26 17:00:00'),
(7, 7, 4, 180.00, '2025-01-31 18:00:00', 3, 180.00, '2025-01-31 19:00:00'),
(8, 8, 1, 220.00, '2025-02-05 20:00:00', 2, 220.00, '2025-02-05 21:00:00'),
(9, 9, 2, 160.00, '2025-02-10 22:00:00', 4, 160.00, '2025-02-10 23:00:00'),
(10, 10, 1, 140.00, '2025-02-15 08:00:00', 3, 140.00, '2025-02-15 09:00:00'),
(11, 1, 1, 200.00, '2025-02-20 10:00:00', 1, 200.00, '2025-02-20 11:00:00'),
(12, 2, 1, 300.00, '2025-02-25 12:00:00', 2, 300.00, '2025-02-25 13:00:00'),
(13, 3, 1, 180.00, '2025-03-02 14:00:00', 3, 180.00, '2025-03-02 15:00:00'),
(14, 4, 1, 220.00, '2025-03-07 16:00:00', 4, 220.00, '2025-03-07 17:00:00'),
(15, 5, 2, 160.00, '2025-03-12 18:00:00', 2, 160.00, '2025-03-12 19:00:00'),
(16, 6, 1, 140.00, '2025-03-17 20:00:00', 1, 140.00, '2025-03-17 21:00:00'),
(17, 7, 8, 200.00, '2025-03-22 22:00:00', 3, 200.00, '2025-03-22 23:00:00'),
(18, 8, 1, 300.00, '2025-03-27 08:00:00', 2, 300.00, '2025-03-27 09:00:00'),
(19, 9, 1, 180.00, '2025-04-01 10:00:00', 4, 180.00, '2025-04-01 11:00:00'),
(20, 10, 2, 220.00, '2025-04-06 12:00:00', 3, 220.00, '2025-04-06 13:00:00');

-- lista todo conteúdo da tabela
select * from pecasporos;
