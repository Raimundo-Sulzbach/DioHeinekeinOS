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
-- Tabela `dio_osdb`.`Peca` cadastro de peças
-- -----------------------------------------------------
--
-- apaga a tabela
--
DROP TABLE IF EXISTS`dio_osdb`.`Peca` ;
--
-- cria a tabela
--
CREATE TABLE IF NOT EXISTS `dio_osdb`.`Peca` (
  `idPeca` INT NOT NULL AUTO_INCREMENT COMMENT 'Código interno para a peça.',
  `PecaCodigo` VARCHAR(45) NULL COMMENT 'Código internacional da peça, baseado no conceito de "part number".',
  `PecaDescricao` VARCHAR(45) NOT NULL COMMENT 'Descrição da peça.',
  `PecaPreco` DECIMAL(15,5) NOT NULL DEFAULT 0.00001 COMMENT 'Preço da peça.',
  `Fotopeca` BLOB NOT NULL COMMENT 'Foto da peça.',
  PRIMARY KEY (`idPeca`),
  UNIQUE INDEX `idPeca_UNIQUE` (`idPeca` ASC) VISIBLE,
  UNIQUE INDEX `PecaCodigo_UNIQUE` (`PecaCodigo` ASC) VISIBLE,
  CHECK (`PecaPreco` > 0)
) ENGINE = InnoDB;

-- desabilita o safe mode
SET SQL_SAFE_UPDATES = 0;
-- zera a tabela peca
DELETE FROM dio_osdb.Peca;
-- reativa o modeo seguro
delete from dio_osdb.Peca where 1=1;
-- insere 50 registros na tabela peca
INSERT INTO dio_osdb.Peca (PecaCodigo, PecaDescricao, PecaPreco, Fotopeca) VALUES
('BM001', 'Filtro de ar', 150.00, IFNULL(LOAD_FILE('d:/DioHeinekeinOs/BM001.png'), '')),
('BM002', 'Vela de ignição', 45.00, IFNULL(LOAD_FILE('path_to_images/BM002.png'), '')),
('BM003', 'Pastilha de freio', 250.00, IFNULL(LOAD_FILE('path_to_images/BM003.png'), '')),
('BM004', 'Bateria', 700.00, IFNULL(LOAD_FILE('path_to_images/BM004.png'), '')),
('BM005', 'Correia dentada', 120.00, IFNULL(LOAD_FILE('path_to_images/BM005.png'), '')),
('BM006', 'Amortecedor traseiro', 560.00, IFNULL(LOAD_FILE('path_to_images/BM006.png'), '')),
('BM007', 'Disco de freio', 400.00, IFNULL(LOAD_FILE('path_to_images/BM007.png'), '')),
('BM008', 'Filtro de óleo', 80.00, IFNULL(LOAD_FILE('path_to_images/BM008.png'), '')),
('BM009', 'Farol dianteiro', 1300.00, IFNULL(LOAD_FILE('path_to_images/BM009.png'), '')),
('BM010', 'Radiador', 900.00, IFNULL(LOAD_FILE('path_to_images/BM010.png'), '')),

('I3001', 'Filtro de combustível', 200.00, IFNULL(LOAD_FILE('path_to_images/I3001.png'), '')),
('I3002', 'Sensor de oxigênio', 300.00, IFNULL(LOAD_FILE('path_to_images/I3002.png'), '')),
('I3003', 'Bomba de combustível', 800.00, IFNULL(LOAD_FILE('path_to_images/I3003.png'), '')),
('I3004', 'Alternador', 950.00, IFNULL(LOAD_FILE('path_to_images/I3004.png'), '')),
('I3005', 'Velas de aquecimento', 130.00, IFNULL(LOAD_FILE('path_to_images/I3005.png'), '')),
('I3006', 'Catalisador', 1400.00, IFNULL(LOAD_FILE('path_to_images/I3006.png'), '')),
('I3007', 'Parafuso de roda', 20.00, IFNULL(LOAD_FILE('path_to_images/I3007.png'), '')),
('I3008', 'Correia de distribuição', 110.00, IFNULL(LOAD_FILE('path_to_images/I3008.png'), '')),
('I3009', 'Kit de embreagem', 750.00, IFNULL(LOAD_FILE('path_to_images/I3009.png'), '')),
('I3010', 'Palheta do limpador', 40.00, IFNULL(LOAD_FILE('path_to_images/I3010.png'), '')),

('FX001', 'Tampa do radiador', 70.00, IFNULL(LOAD_FILE('path_to_images/FX001.png'), '')),
('FX002', 'Bobina de ignição', 320.00, IFNULL(LOAD_FILE('path_to_images/FX002.png'), '')),
('FX003', 'Filtro de combustível', 200.00, IFNULL(LOAD_FILE('path_to_images/FX003.png'), '')),
('FX004', 'Velas de ignição', 80.00, IFNULL(LOAD_FILE('path_to_images/FX004.png'), '')),
('FX005', 'Cilindro mestre', 900.00, IFNULL(LOAD_FILE('path_to_images/FX005.png'), '')),
('FX006', 'Cabo de vela', 150.00, IFNULL(LOAD_FILE('path_to_images/FX006.png'), '')),
('FX007', 'Câmbio', 1400.00, IFNULL(LOAD_FILE('path_to_images/FX007.png'), '')),
('FX008', 'Bobina de indução', 450.00, IFNULL(LOAD_FILE('path_to_images/FX008.png'), '')),
('FX009', 'Filtro de ar', 130.00, IFNULL(LOAD_FILE('path_to_images/FX009.png'), '')),
('FX010', 'Sensor de pressão', 250.00, IFNULL(LOAD_FILE('path_to_images/FX010.png'), '')),

('ONX001', 'Filtro de ar', 130.00, IFNULL(LOAD_FILE('path_to_images/ONX001.png'), '')),
('ONX002', 'Vela de ignição', 60.00, IFNULL(LOAD_FILE('path_to_images/ONX002.png'), '')),
('ONX003', 'Pastilha de freio', 210.00, IFNULL(LOAD_FILE('path_to_images/ONX003.png'), '')),
('ONX004', 'Bateria', 650.00, IFNULL(LOAD_FILE('path_to_images/ONX004.png'), '')),
('ONX005', 'Correia dentada', 180.00, IFNULL(LOAD_FILE('path_to_images/ONX005.png'), '')),
('ONX006', 'Amortecedor traseiro', 600.00, IFNULL(LOAD_FILE('path_to_images/ONX006.png'), '')),
('ONX007', 'Disco de freio', 440.00, IFNULL(LOAD_FILE('path_to_images/ONX007.png'), '')),
('ONX008', 'Filtro de óleo', 90.00, IFNULL(LOAD_FILE('path_to_images/ONX008.png'), '')),
('ONX009', 'Farol dianteiro', 1400.00, IFNULL(LOAD_FILE('path_to_images/ONX009.png'), '')),
('ONX010', 'Radiador', 950.00, IFNULL(LOAD_FILE('path_to_images/ONX010.png'), '')),

('CR001', 'Filtro de ar', 170.00, IFNULL(LOAD_FILE('path_to_images/CR001.png'), '')),
('CR002', 'Vela de ignição', 65.00, IFNULL(LOAD_FILE('path_to_images/CR002.png'), '')),
('CR003', 'Pastilha de freio', 300.00, IFNULL(LOAD_FILE('path_to_images/CR003.png'), '')),
('CR004', 'Bateria', 720.00, IFNULL(LOAD_FILE('path_to_images/CR004.png'), '')),
('CR005', 'Correia dentada', 200.00, IFNULL(LOAD_FILE('path_to_images/CR005.png'), '')),
('CR006', 'Amortecedor traseiro', 590.00, IFNULL(LOAD_FILE('path_to_images/CR006.png'), '')),
('CR007', 'Disco de freio', 410.00, IFNULL(LOAD_FILE('path_to_images/CR007.png'), '')),
('CR008', 'Filtro de óleo', 85.00, IFNULL(LOAD_FILE('path_to_images/CR008.png'), '')),
('CR009', 'Farol dianteiro', 1350.00, IFNULL(LOAD_FILE('path_to_images/CR009.png'), '')),
('CR010', 'Radiador', 930.00, IFNULL(LOAD_FILE('path_to_images/CR010.png'), ''));

select * from peca;
