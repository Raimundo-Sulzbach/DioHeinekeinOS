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
-- Tabela `dio_osdb`.`CategoriasPorMecanico` relacionamento das categorias de serviços por mecânico. São as habilidades ou aptidões que ele tem.
-- ATENÇÃO para o campo nível do mecânico na categoria de serviço. Por exemplo: júnior, pleno e senior. (*) Ver regras do negócio.
-- -----------------------------------------------------
--
-- apaga a tabela
--
DROP TABLE IF EXISTS`dio_osdb`.`CategoriasPorMecanico` ;
--
-- cria a tabela
--
CREATE TABLE IF NOT EXISTS `dio_osdb`.`CategoriasPorMecanico` (
  `Mecanico_idMecanico` INT NOT NULL,
  `Categoria_idCategoria` INT NOT NULL,
  `CategoriasPorMecanicoNivel` VARCHAR(10) NOT NULL COMMENT 'Nível de conhecimento do mecânico dentro de sua categoria. Por exemplo: Júnior, Pleno ou Senior.',
  PRIMARY KEY (`Mecanico_idMecanico`, `Categoria_idCategoria`),
  INDEX `fk_Mecanico_has_Categoria_Categoria1_idx` (`Categoria_idCategoria` ASC) VISIBLE,
  INDEX `fk_Mecanico_has_Categoria_Mecanico1_idx` (`Mecanico_idMecanico` ASC) VISIBLE,
  CONSTRAINT `fk_Mecanico_has_Categoria_Mecanico1`
    FOREIGN KEY (`Mecanico_idMecanico`)
    REFERENCES `dio_osdb`.`Mecanico` (`idMecanico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mecanico_has_Categoria_Categoria1`
    FOREIGN KEY (`Categoria_idCategoria`)
    REFERENCES `dio_osdb`.`Categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela `dio_osdb`.`CategoriasPorMecanico` cadastro de categorias por mecanico
-- -----------------------------------------------------
-- desabilita o safe mode
SET SQL_SAFE_UPDATES = 0;
-- zera a tabela 
DELETE FROM dio_osdb.CategoriasPorMecanico;
-- reativa o modeo seguro
delete from dio_osdb.CategoriasPorMecanico where 1=1;
-- 
-- popula a tabela com 20 registros de categorias por mecanico
-- 
INSERT INTO `dio_osdb`.`CategoriasPorMecanico` (`Mecanico_idMecanico`, `Categoria_idCategoria`, `CategoriasPorMecanicoNivel`)
VALUES
(1, 1, 'Junior'),
(2, 2, 'Pleno'),
(3, 3, 'Senior'),
(4, 4, 'Junior'),
(5, 5, 'Pleno'),
(6, 6, 'Senior'),
(7, 1, 'Senior'),
(8, 2, 'Pleno'),
(9, 3, 'Senior'),
(10, 4, 'Pleno'),
(1, 5, 'Pleno'),
(2, 6, 'Senior'),
(3, 1, 'Junior'),
(4, 2, 'Pleno'),
(5, 3, 'Senior'),
(6, 4, 'Junior'),
(7, 5, 'Pleno'),
(8, 6, 'Senior'),
(9, 1, 'Junior'),
(10, 2, 'Pleno');

-- lista todo conteúdo da tabela
select * from CategoriasPorMecanico order by categoria_idCategoria;
