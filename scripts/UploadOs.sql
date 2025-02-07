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
-- Tabela `dio_osdb`.`OS`
-- -----------------------------------------------------
-- 
-- apaga a tabela
-- 
DROP Table IF EXISTS `dio_osdb`.`OS` ;

-- 
-- cria a tabela
-- 
CREATE Table IF NOT EXISTS `dio_osdb`.`OS` (
  `idOS` INT NOT NULL AUTO_INCREMENT COMMENT 'Código interno da OS',
  `Veiculo_idVeiculo` INT NOT NULL COMMENT 'Código interno do veículo.',
  `Cliente_idCliente` INT NOT NULL COMMENT 'Código interno do cliente.',
  `OSCustoPecas` DECIMAL NOT NULL COMMENT 'Custo das peças alocadas à OS.',
  `OSCustoServicos` DECIMAL NOT NULL COMMENT 'Custo dos serviços alocados à OS.',
  `OSEmissao` DATETIME NOT NULL COMMENT 'Data da emissão da OS.',
  `OSprevisaoInicio` DATETIME NOT NULL COMMENT 'Data prevista para início da OS.',
  `OSprevisaoFim` DATE NOT NULL COMMENT 'Data prevista para término da OS.',
  `OSStatus` VARCHAR(45) NOT NULL COMMENT 'Status da OS. Terá de ser definido através de Regras do Negócio, por exemplo: - Aguardando aprovação de cliente - Aprovada para execução - Aguardando peças - Aguardando liberação de box de serviço - Em execução - Aguardando revisão dos serviços - Em revisão dos serviços - Concluída e aguardando pagamento - Paga - Entregue e aprovada pelo cliente - Cancelada pelo cliente - Cancelada pela oficina.',
  `OSinicio` DATETIME NOT NULL COMMENT 'Data de início efetivo de trabalho na OS.',
  `OSfim` DATETIME NULL COMMENT 'Data de finalização efetiva de trabalho na OS.',
  `OSobs` VARCHAR(250) NOT NULL COMMENT 'Observações relevantes anotadas pelo mecânico quanto ao veículo ou aos serviços.',
  PRIMARY KEY (`idOS`, `Veiculo_idVeiculo`, `Cliente_idCliente`),
  INDEX `fk_OS_Veiculo1_idx` (`Veiculo_idVeiculo` ASC) VISIBLE,
  INDEX `fk_OS_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  UNIQUE INDEX `idOS_UNIQUE` (`idOS` ASC) VISIBLE,
  CONSTRAINT `fk_OS_Veiculo1`
    FOREIGN KEY (`Veiculo_idVeiculo`)
    REFERENCES `dio_osdb`.`Veiculo` (`idVeiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OS_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `dio_osdb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CHECK (`OSCustoPecas` > 0),
  CHECK (`OSCustoServicos` > 0)
) ENGINE = InnoDB;

-- desabilita o safe mode
SET SQL_SAFE_UPDATES = 0;
-- zera a tabela 
DELETE FROM dio_osdb.os;
-- reativa o modeo seguro
delete from dio_osdb.os where 1=1;
-- 
-- popula a tabela com 10 registros de abertura de OS
-- 
INSERT INTO `dio_osdb`.`OS` (`idOS`, `Veiculo_idVeiculo`, `Cliente_idCliente`, `OSCustoPecas`, `OSCustoServicos`, `OSEmissao`, `OSprevisaoInicio`, `OSprevisaoFim`, `OSStatus`, `OSinicio`, `OSfim`, `OSobs`)
VALUES
(1, 1, 1, 500.00, 1500.00, '2025-01-01 08:00:00', '2025-01-02 09:00:00', '2025-01-05', 'Aberta', '2025-01-02 09:00:00', NULL, 'Motor fazendo barulhos estranhos.'),
(2, 2, 2, 300.00, 1200.00, '2025-01-05 10:00:00', '2025-01-06 11:00:00', '2025-01-10', 'Em andamento', '2025-01-06 11:00:00', NULL, 'Pneus gastando de um lado.'),
(3, 3, 3, 200.00, 1000.00, '2025-01-10 09:00:00', '2025-01-11 10:00:00', '2025-01-15', 'Em andamento', '2025-01-11 10:00:00', NULL, 'Vidro traseiro quebrado.'),
(4, 4, 4, 800.00, 2000.00, '2025-01-15 11:00:00', '2025-01-16 12:00:00', '2025-01-20', 'Pendente', '2025-01-16 12:00:00', NULL, 'Farola não acende.'),
(5, 5, 5, 100.00, 900.00, '2025-01-20 13:00:00', '2025-01-21 14:00:00', '2025-01-25', 'Aberta', '2025-01-21 14:00:00', NULL, 'Lateral esquerda riscada.'),
(6, 1, 1, 400.00, 1300.00, '2025-01-25 15:00:00', '2025-01-26 16:00:00', '2025-01-30', 'Em andamento', '2025-01-26 16:00:00', NULL, 'Troca de óleo e filtros.'),
(7, 2, 2, 600.00, 1400.00, '2025-01-30 17:00:00', '2025-01-31 18:00:00', '2025-02-04', 'Concluída', '2025-01-31 18:00:00', '2025-02-04 12:00:00', 'Revisão geral.'),
(8, 3, 3, 700.00, 1600.00, '2025-02-04 19:00:00', '2025-02-05 20:00:00', '2025-02-09', 'Aberta', '2025-02-05 20:00:00', NULL, 'Troca de correia dentada.'),
(9, 4, 4, 150.00, 1100.00, '2025-02-09 21:00:00', '2025-02-10 22:00:00', '2025-02-14', 'Em andamento', '2025-02-10 22:00:00', NULL, 'Ajuste de freios.'),
(10, 2, 5, 250.00, 1200.00, '2025-02-14 23:00:00', '2025-02-15 08:00:00', '2025-02-19', 'Concluída', '2025-02-15 08:00:00', '2025-02-19 14:00:00', 'Substituição de bateria.');

-- lista todo conteúdo da tabela
select * from os;
