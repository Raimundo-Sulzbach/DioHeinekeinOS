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
-- Tabela `dio_osdb`.`Mecanico` cadastro com os mecânicos da oficina
-- -----------------------------------------------------
--
-- apaga a tabela
--
DROP TABLE IF EXISTS`dio_osdb`.`Mecanico` ;
--
-- cria a tabela
--
CREATE TABLE IF NOT EXISTS `dio_osdb`.`Mecanico` (
  `idMecanico` INT NOT NULL AUTO_INCREMENT COMMENT 'Código interno para o mecânico.',
  `MecanicoNome` VARCHAR(100) NOT NULL COMMENT 'Nome do mecânico.\n',
  `MecanicoCodigoContrbuinte` VARCHAR(14) NOT NULL COMMENT 'Código do contribuinte do mecânico (CPF).',
  `MecanicoEndereco` VARCHAR(100) NOT NULL COMMENT 'Endereço do mecânico.',
  `MecanicoCEP` VARCHAR(10) NOT NULL COMMENT 'CEP - código do endereçamento postal do mecânico.',
  `MecanicoNumero` VARCHAR(10) NOT NULL COMMENT 'Número da casa ou apartamento de onde o mecânico reside.',
  `MecanicoComplemento` VARCHAR(45) NOT NULL COMMENT 'Complemento do número, pode ser apartamento, andar, letra, sala, etc.',
  `MecanicoBairro` VARCHAR(100) NOT NULL COMMENT 'BAirro onde reside o mecânico.',
  `MecanicoCidade` VARCHAR(100) NOT NULL COMMENT 'Cidade onde reside o mecânico.',
  `MecanicoUF` VARCHAR(2) NOT NULL COMMENT 'UF - Unidade da federação brasileira ou estado onde reside o mecânico.',
  `MecanicoTelefone` VARCHAR(20) NOT NULL COMMENT 'Telefone do mecânico.',
  `MecanicoWhatsapp` VARCHAR(20) NOT NULL COMMENT 'Whatsapp do mecânico.',
  `MecanicoEmail` VARCHAR(45) NOT NULL COMMENT 'Email do mecânico.\n',
  `MecanicoStatus` TINYINT NULL COMMENT 'Ativo: .t.\nInativo: .f.',
  PRIMARY KEY (`idMecanico`),
  UNIQUE INDEX `idMecanico_UNIQUE` (`idMecanico` ASC) VISIBLE,
  UNIQUE INDEX `MecanicoCodigoContrbuinte_UNIQUE` (`MecanicoCodigoContrbuinte` ASC) VISIBLE)
ENGINE = InnoDB;


-- desabilita o safe mode
SET SQL_SAFE_UPDATES = 0;
-- zera a tabela mecanico
DELETE FROM dio_osdb.mecanico;
-- reativa o modeo seguro
delete from dio_osdb.mecanico where 1=1;
-- insere 10 registros na tabela `dio_osdb`.`mecanico`

INSERT INTO `dio_osdb`.`Mecanico` (`idMecanico`, `MecanicoNome`, `MecanicoCodigoContrbuinte`, `MecanicoEndereco`, `MecanicoCEP`, `MecanicoNumero`, `MecanicoComplemento`, `MecanicoBairro`, `MecanicoCidade`, `MecanicoUF`, `MecanicoTelefone`, `MecanicoWhatsapp`, `MecanicoEmail`, `MecanicoStatus`)
VALUES
(1, 'Roberto Lima', '123.456.789-09', 'Rua das Flores, 123', '01000-000', '123', 'Apto 101', 'Centro', 'São Paulo', 'SP', '(11) 98765-4321', '(11) 98765-4321', 'roberto.lima@email.com', 1),
(2, 'Ana Souza', '987.654.321-00', 'Av. Paulista, 456', '01310-000', '456', 'Sala 202', 'Bela Vista', 'São Paulo', 'SP', '(11) 99876-5432', '(11) 99876-5432', 'ana.souza@email.com', 1),
(3, 'Carlos Mendes', '111.222.333-44', 'Rua dos Pinheiros, 789', '05422-000', '789', 'Casa', 'Pinheiros', 'São Paulo', 'SP', '(11) 98877-6543', '(11) 98877-6543', 'carlos.mendes@email.com', 0),
(4, 'Fernanda Costa', '555.666.777-88', 'Av. Brasil, 890', '22250-040', '890', 'Cobertura', 'Copacabana', 'Rio de Janeiro', 'RJ', '(21) 97765-4321', '(21) 97765-4321', 'fernanda.costa@email.com', 1),
(5, 'Paulo Almeida', '333.444.555-66', 'Rua das Acácias, 32', '30130-110', '32', 'Fundos', 'Savassi', 'Belo Horizonte', 'MG', '(31) 98865-4321', '(31) 98865-4321', 'paulo.almeida@email.com', 1),
(6, 'Mariana Santos', '222.333.444-55', 'Rua do Comércio, 98', '40010-000', '98', 'Sala 3', 'Comércio', 'Salvador', 'BA', '(71) 91234-5678', '(71) 91234-5678', 'mariana.santos@email.com', 0),
(7, 'Rafael Oliveira', '444.555.666-77', 'Rua das Palmeiras, 456', '20031-000', '456', 'Apto 202', 'Centro', 'Rio de Janeiro', 'RJ', '(21) 92345-6789', '(21) 92345-6789', 'rafael.oliveira@email.com', 1),
(8, 'Juliana Batista', '666.777.888-99', 'Av. Rio Branco, 300', '60125-050', '300', 'Andar 4', 'Centro', 'Fortaleza', 'CE', '(85) 93456-7890', '(85) 93456-7890', 'juliana.batista@email.com', 1),
(9, 'Lucas Machado', '888.999.000-11', 'Rua Sete de Setembro, 45', '30120-020', '45', 'Apto 12', 'Lourdes', 'Belo Horizonte', 'MG', '(31) 94567-8901', '(31) 94567-8901', 'lucas.machado@email.com', 0),
(10, 'Patrícia Rocha', '000.111.222-33', 'Av. Brasil, 500', '70290-000', '500', 'Sala 7', 'Asa Sul', 'Brasília', 'DF', '(61) 95678-9012', '(61) 95678-9012', 'patricia.rocha@email.com', 1);


select * from mecanico order by idMecanico;
