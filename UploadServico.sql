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
-- Tabela `dio_osdb`.`Servico`
-- -----------------------------------------------------
-- 
-- apaga a tabela
-- 
DROP Table IF EXISTS `dio_osdb`.`Servico` ;

-- 
-- cria a tabela
-- 
CREATE Table IF NOT EXISTS `dio_osdb`.`Servico` (
  `idServico` INT NOT NULL AUTO_INCREMENT COMMENT 'Código interno para o serviço.',
  `Categoria_idCategoria` INT NOT NULL COMMENT 'Categoria a qual está vinculado este serviço: lanternagem, mecânica, etc.',
  `ServicoMarcaVeiculo` VARCHAR(45) NOT NULL COMMENT 'Marcas de veículos.',
  `ServicoModeloVeiculo` VARCHAR(45) NOT NULL COMMENT 'Modelos de veículo.',
  `ServicoAnoVeiculo` VARCHAR(5) NOT NULL COMMENT 'Anos de fabricação de veículos.',
  `ServicoDescricao` VARCHAR(100) NOT NULL COMMENT 'Descrição do serviço praticado.',
  `ServicoPreco` DECIMAL(15,2) NOT NULL COMMENT 'Preço do serviço descrito.',
  PRIMARY KEY (`idServico`, `Categoria_idCategoria`),
  INDEX `fk_Servico_Categoria1_idx` (`Categoria_idCategoria` ASC) VISIBLE,
  CONSTRAINT `fk_Servico_Categoria1`
    FOREIGN KEY (`Categoria_idCategoria`)
    REFERENCES `dio_osdb`.`Categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CHECK (`ServicoPreco` > 0)
) ENGINE = InnoDB;

-- desabilita o safe mode
SET SQL_SAFE_UPDATES = 0;
-- zera a tabela servico
DELETE FROM dio_osdb.servico;
-- reativa o modeo seguro
delete from dio_osdb.servico where 1=1;
-- insere 50 registros na tabela servico
INSERT INTO dio_osdb.Servico (idServico, Categoria_idCategoria, ServicoMarcaVeiculo, ServicoModeloVeiculo, ServicoAnoVeiculo, ServicoDescricao, ServicoPreco) VALUES
(1, 1, 'BMW', '118i', 2020, 'Troca de óleo', 350.00),
(2, 2, 'HYUNDAI', 'i30', 2015, 'Substituição de pastilhas de freio', 250.00),
(3, 3, 'GM', 'Onix', 2024, 'Alinhamento e balanceamento', 180.00),
(4, 4, 'KIA', 'Creta', 2023, 'Troca de filtro de ar', 110.00),
(5, 5, 'VOLKSWAGEN', 'Fox', 2022, 'Revisão geral', 500.00),
(6, 6, 'BMW', '118i', 2020, 'Substituição de velas', 150.00),
(7, 1, 'HYUNDAI', 'i30', 2015, 'Troca de correia dentada', 400.00),
(8, 2, 'GM', 'Onix', 2024, 'Substituição de amortecedores', 600.00),
(9, 3, 'KIA', 'Creta', 2023, 'Troca de bateria', 350.00),
(10, 4, 'VOLKSWAGEN', 'Fox', 2022, 'Substituição de disco de freio', 320.00),
(11, 5, 'BMW', '118i', 2020, 'Troca de óleo', 350.00),
(12, 6, 'HYUNDAI', 'i30', 2015, 'Substituição de pastilhas de freio', 250.00),
(13, 1, 'GM', 'Onix', 2024, 'Alinhamento e balanceamento', 180.00),
(14, 2, 'KIA', 'Creta', 2023, 'Troca de filtro de ar', 110.00),
(15, 3, 'VOLKSWAGEN', 'Fox', 2022, 'Revisão geral', 500.00),
(16, 4, 'BMW', '118i', 2020, 'Substituição de velas', 150.00),
(17, 5, 'HYUNDAI', 'i30', 2015, 'Troca de correia dentada', 400.00),
(18, 6, 'GM', 'Onix', 2024, 'Substituição de amortecedores', 600.00),
(19, 1, 'KIA', 'Creta', 2023, 'Troca de bateria', 350.00),
(20, 2, 'VOLKSWAGEN', 'Fox', 2022, 'Substituição de disco de freio', 320.00),
(21, 3, 'BMW', '118i', 2020, 'Troca de óleo', 350.00),
(22, 4, 'HYUNDAI', 'i30', 2015, 'Substituição de pastilhas de freio', 250.00),
(23, 5, 'GM', 'Onix', 2024, 'Alinhamento e balanceamento', 180.00),
(24, 6, 'KIA', 'Creta', 2023, 'Troca de filtro de ar', 110.00),
(25, 1, 'VOLKSWAGEN', 'Fox', 2022, 'Revisão geral', 500.00),
(26, 2, 'BMW', '118i', 2020, 'Substituição de velas', 150.00),
(27, 3, 'HYUNDAI', 'i30', 2015, 'Troca de correia dentada', 400.00),
(28, 4, 'GM', 'Onix', 2024, 'Substituição de amortecedores', 600.00),
(29, 5, 'KIA', 'Creta', 2023, 'Troca de bateria', 350.00),
(30, 6, 'VOLKSWAGEN', 'Fox', 2022, 'Substituição de disco de freio', 320.00),
(31, 1, 'BMW', '118i', 2020, 'Troca de óleo', 350.00),
(32, 2, 'HYUNDAI', 'i30', 2015, 'Substituição de pastilhas de freio', 250.00),
(33, 3, 'GM', 'Onix', 2024, 'Alinhamento e balanceamento', 180.00),
(34, 4, 'KIA', 'Creta', 2023, 'Troca de filtro de ar', 110.00),
(35, 5, 'VOLKSWAGEN', 'Fox', 2022, 'Revisão geral', 500.00),
(36, 6, 'BMW', '118i', 2020, 'Substituição de velas', 150.00),
(37, 1, 'HYUNDAI', 'i30', 2015, 'Troca de correia dentada', 400.00),
(38, 2, 'GM', 'Onix', 2024, 'Substituição de amortecedores', 600.00),
(39, 3, 'KIA', 'Creta', 2023, 'Troca de bateria', 350.00),
(40, 4, 'VOLKSWAGEN', 'Fox', 2022, 'Substituição de disco de freio', 320.00),
(41, 5, 'BMW', '118i', 2020, 'Troca de óleo', 350.00),
(42, 6, 'HYUNDAI', 'i30', 2015, 'Substituição de pastilhas de freio', 250.00),
(43, 1, 'GM', 'Onix', 2024, 'Alinhamento e balanceamento', 180.00),
(44, 2, 'KIA', 'Creta', 2023, 'Troca de filtro de ar', 110.00),
(45, 3, 'VOLKSWAGEN', 'Fox', 2022, 'Revisão geral', 500.00),
(46, 4, 'BMW', '118i', 2020, 'Substituição de velas', 150.00),
(47, 5, 'HYUNDAI', 'i30', 2015, 'Troca de correia dentada', 400.00),
(48, 6, 'GM', 'Onix', 2024, 'Substituição de amortecedores', 600.00),
(49, 1, 'KIA', 'Creta', 2023, 'Troca de bateria', 350.00),
(50, 2, 'VOLKSWAGEN', 'Fox', 2022, 'Substituição de disco de freio', 320.00);

-- mostra os registros carregados
select * from servico;
