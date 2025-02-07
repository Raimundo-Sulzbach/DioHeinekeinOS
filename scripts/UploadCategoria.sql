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
-- Tabela `dio_osdb`.`Categoria` cadastro agrupado de serviços oferecidos pela oficina mecânica
-- -----------------------------------------------------
--
-- apaga a tabela
--
DROP TABLE IF EXISTS`dio_osdb`.`Categoria` ;
--
-- cria a tabela
--
CREATE TABLE IF NOT EXISTS `dio_osdb`.`Categoria` (
  `idCategoria` INT NOT NULL AUTO_INCREMENT COMMENT 'Categorias de serviço. São os agrupamentos dos diversos serviços oferecidos pela oficina mecânica. Por exemplo: Lanternagem, Elétrica, Hidráulica, Mecânica, Suspensão e Geral.',
  `Categoria` VARCHAR(45) NULL,
  PRIMARY KEY (`idCategoria`),
  UNIQUE INDEX `Categoria_UNIQUE` (`Categoria` ASC) VISIBLE)
ENGINE = InnoDB;

-- desabilita o safe mode
SET SQL_SAFE_UPDATES = 0;
-- zera a tabela categoria
DELETE FROM dio_osdb.categoria;
-- reativa o modeo seguro
delete from dio_osdb.categoria where 1=1;
-- insere 6 registros na tabela categoria
-- popula a tabela com a inserção de 6 categorias (grande agrupamentos) com os tipos 
-- de serviços oferecidos pela oficina mecânica
INSERT INTO `dio_osdb`.`Categoria` (`Categoria`) VALUES
('Lanternagem'),
('Elétrica'),
('Hidráulica'),
('Mecânica'),
('Suspensão'),
('Geral');

-- mostra os registros carregados
select * from categoria order by idCategoria;
