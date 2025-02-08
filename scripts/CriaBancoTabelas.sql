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
-- Tabelas =>
--
-- cliente: cadastro de clientes
--
-- veiculosporcliente: cadastro com os veículos por cliente
-- veiculo: cadastro de veículos
--
-- peca: cadastro de peças (usa o padrão internacional de "part number")
-- pecasporos: tabela de peças por os (alocadas e/ou utilizadas em ordens de serviço)
--
-- servico: cadastro de serviços oferecidos pela oficina mecânica. Será também a tabela de preços dos serviços da oficina mecânica.
-- servicosporos: tabela de serviços por os (alocadas e/ou utilizadas em ordens de serviço)
--
-- mecanico: cadastro de mecânicos
-- categoria: cadastro com os agrupamentos dos serviços oferecidos pela oficina mecânica
-- categoriaspormecanico: relação de habilidades ou aptidões ou proficiências de serviços por mecânico
-- (*) Atenção aqui para o nível de conhecimento do mecânico na categoria que terá de ser definido por regra de negócio.
-- ospormecanico: relação de OS - ordens de serviço por mecânico
--
-- os: cadastro de ordens de serviço orçadas, em execução, executadas ou canceladas.
-- (*) Atenção: o controle sobre a exclusão de OS - ordens de serviço, tem de ser sobre o campo STATUS, através de Regras de Negócio. 
--
--
--

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- apaga o banco de dados se ele existe
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `dio_osdb` ;

-- -----------------------------------------------------
-- cria o banco de dados
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dio_osdb` DEFAULT CHARACTER SET utf8 ;
USE `dio_osdb` ;

-- -----------------------------------------------------
-- Tabela `dio_osdb`.`Peca` cadastro de peças de veículos para uso nas OS
-- -----------------------------------------------------
-- 
-- apaga a tabela
-- 
DROP Table IF EXISTS `dio_osdb`.`Peca` ;
--
-- cria a tabela
-- 
CREATE Table IF NOT EXISTS `dio_osdb`.`Peca` (
  `idPeca` INT NOT NULL AUTO_INCREMENT COMMENT 'Código interno para a peça.',
  `PecaCodigo` VARCHAR(45) NULL COMMENT 'Código internacional da peça, baseado no conceito de "part number".',
  `PecaDescricao` VARCHAR(45) NOT NULL COMMENT 'Descrição da peça.',
  `PecaPreco` DECIMAL(15,5) NOT NULL COMMENT 'Preço da peça.',
  `Fotopeça` BLOB NOT NULL,
  PRIMARY KEY (`idPeca`),
  UNIQUE INDEX `idPeca_UNIQUE` (`idPeca` ASC) VISIBLE,
  UNIQUE INDEX `PecaCodigo_UNIQUE` (`PecaCodigo` ASC) VISIBLE,
  CHECK (`PecaPreco` > 0)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela `dio_osdb`.`Categoria`
-- -----------------------------------------------------
-- 
-- apaga a tabela
-- 
DROP Table IF EXISTS `dio_osdb`.`Categoria` ;
--
-- cria a tabela
--

CREATE TABLE IF NOT EXISTS `dio_osdb`.`Categoria` (
  `idCategoria` INT NOT NULL AUTO_INCREMENT COMMENT 'Código interno para a categoria de serviços.',
  `Categoria` VARCHAR(45) CHARACTER SET 'ascii' NULL COMMENT 'Categorias de serviço. São os agrupamentos dos diversos serviços oferecidos pela oficina mecânica. Por exemplo: Lanternagem, Elétrica, Hidráulica, Mecânica, Suspensão e Geral.',
  PRIMARY KEY (`idCategoria`),
  UNIQUE INDEX `Categoria_UNIQUE` (`Categoria` ASC) VISIBLE)
ENGINE = InnoDB;

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

-- -----------------------------------------------------
-- Tabela `dio_osdb`.`Cliente`
-- -----------------------------------------------------
-- 
-- apaga a tabela
-- 
DROP Table IF EXISTS `dio_osdb`.`Cliente` ;

-- 
-- cria a tabela
-- 
CREATE Table IF NOT EXISTS `dio_osdb`.`Cliente` (
  `idCliente` INT NOT NULL COMMENT 'Código interno para o cliente.',
  `ClienteNome` VARCHAR(100) NOT NULL COMMENT 'Nome do cliente.',
  `ClienteCodigoContribuinte` VARCHAR(18) NULL COMMENT 'Código do contribuinte do cliente. Pessoa física (CPF) - 11 caracteres. Pessoa jurídica (CNPJ) - 14 caracteres). Os cálculos dos digitos verificadores terão de ser feitos à nível de aplicação.',
  `ClienteEndereco` VARCHAR(100) NOT NULL COMMENT 'Endereço do cliente.',
  `ClienteCEP` VARCHAR(10) NOT NULL COMMENT 'CEP - código de endereçamento postal brasileiro para o endereço do cliente.',
  `ClienteNumero` VARCHAR(10) NOT NULL COMMENT 'Número do endereço do cliente.',
  `ClienteComplemento` VARCHAR(45) NOT NULL COMMENT 'Complemento do endereço do cliente: sala, andar, letra, lado, apartamento, casa, etc.',
  `ClienteBairro` VARCHAR(100) NOT NULL COMMENT 'Bairro onde reside o cliente.',
  `ClienteCidade` VARCHAR(100) NOT NULL COMMENT 'Cidade onde reside o cliente.',
  `ClienteUF` VARCHAR(2) NOT NULL COMMENT 'UF - unidade federativa ou estado onde reside o cliente.',
  `ClienteTelefone` VARCHAR(20) NOT NULL COMMENT 'Telefone de contato do cliente.\n',
  `ClienteWhatsapp` VARCHAR(20) NOT NULL COMMENT 'Whatsapp do cliente.',
  `ClienteEmail` VARCHAR(45) NOT NULL COMMENT 'Email do cliente',
  PRIMARY KEY (`idCliente`),
  UNIQUE INDEX `ClienteCodigoContrbuinte_UNIQUE` (`ClienteCodigoContribuinte` ASC) VISIBLE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela `dio_osdb`.`Veiculo`
-- -----------------------------------------------------
-- 
-- apaga a tabela
-- 
DROP Table IF EXISTS `dio_osdb`.`Veiculo` ;

-- 
-- cria a tabela
-- 
CREATE Table IF NOT EXISTS `dio_osdb`.`Veiculo` (
  `idVeiculo` INT NOT NULL AUTO_INCREMENT COMMENT 'Código interno de identificação do veículo',
  `VeiculoPlaca` VARCHAR(7) NOT NULL COMMENT 'Placa do veículo.',
  `VeiculoAno` VARCHAR(4) NOT NULL COMMENT 'Ano do veículo.',
  `VeiculoMarca` VARCHAR(20) NOT NULL COMMENT 'Marca do veículo.',
  `VeiculoModelo` VARCHAR(45) NOT NULL COMMENT 'Modelo do veículo.',
  `VeiculoEstadoPintura` VARCHAR(100) NOT NULL COMMENT 'Estado da pintura do veículo quando recebido na oficina.',
  `VeiculoEstadoInterior` VARCHAR(100) NOT NULL COMMENT 'Estado do interior do veículo quando deu entrada na oficina.',
  `VeiculoEstadoVidros` VARCHAR(100) NOT NULL COMMENT 'Estado dos vidros do veículo quando deu entrada na oficina.',
  `VeiculoEstadoPneus` VARCHAR(100) NOT NULL COMMENT 'Estado dos pneus do veículo quando deu entrada na oficina.',
  `VeiculoKMatual` INT NOT NULL COMMENT 'Quilometragem do veículo quando deu entrada na oficina.',
  PRIMARY KEY (`idVeiculo`),
  CHECK (`VeiculoKMatual` > 0)
) ENGINE = InnoDB
COMMENT = ' ';

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

-- -----------------------------------------------------
-- Tabela `dio_osdb`.`Mecanico`
-- -----------------------------------------------------
-- 
-- apaga a tabela
-- 
DROP Table IF EXISTS `dio_osdb`.`Mecanico` ;

-- 
-- cria a tabela
-- 
CREATE Table IF NOT EXISTS `dio_osdb`.`Mecanico` (
  `idMecanico` INT NOT NULL AUTO_INCREMENT COMMENT 'Código interno para o mecânico.',
  `MecanicoNome` VARCHAR(100) NOT NULL COMMENT 'Nome do mecânico.',
  `MecanicoCodigoContrbuinte` VARCHAR(14) NOT NULL COMMENT 'Código do contribuinte do mecânico (CPF).',
  `MecanicoEndereco` VARCHAR(100) NOT NULL COMMENT 'Endereço do mecânico.',
  `MecanicoCEP` VARCHAR(10) NOT NULL COMMENT 'CEP - código do endereçamento postal do mecânico.',
  `MecanicoNumero` VARCHAR(10) NOT NULL COMMENT 'Número da casa ou apartamento de onde o mecânico reside.',
  `MecanicoComplemento` VARCHAR(45) NOT NULL COMMENT 'Complemento do número, pode ser apartamento, andar, letra, sala, etc.',
  `MecanicoBairro` VARCHAR(100) NOT NULL COMMENT 'Bairro onde reside o mecânico.',
  `MecanicoCidade` VARCHAR(100) NOT NULL COMMENT 'Cidade onde reside o mecânico.',
  `MecanicoUF` VARCHAR(2) NOT NULL COMMENT 'UF - Unidade da federação brasileira ou estado onde reside o mecânico.',
  `MecanicoTelefone` VARCHAR(20) NOT NULL COMMENT 'Telefone do mecânico.',
  `MecanicoWhatsapp` VARCHAR(20) NOT NULL COMMENT 'Whatsapp do mecânico.',
  `MecanicoEmail` VARCHAR(45) NOT NULL COMMENT 'Email do mecânico.',
  `MecanicoStatus` TINYINT NULL COMMENT 'Ativo: 1\nInativo: 0',
  PRIMARY KEY (`idMecanico`),
  UNIQUE INDEX `idMecanico_UNIQUE` (`idMecanico` ASC) VISIBLE,
  UNIQUE INDEX `MecanicoCodigoContrbuinte_UNIQUE` (`MecanicoCodigoContrbuinte` ASC) VISIBLE,
  CHECK (`MecanicoStatus` IN (0, 1))
) ENGINE = InnoDB;

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

-- -----------------------------------------------------
-- Tabela `dio_osdb`.`ServicosPorOS`
-- -----------------------------------------------------
-- 
-- apaga a tabela
-- 
DROP Table IF EXISTS `dio_osdb`.`ServicosPorOS` ;

-- 
-- cria a tabela
-- 
CREATE Table IF NOT EXISTS `dio_osdb`.`ServicosPorOS` (
  `Servico_idServico` INT NOT NULL COMMENT 'Código do serviço que será ou poderá ser executado na OS.',
  `OS_idOS` INT NOT NULL COMMENT 'Número da OS.',
  `ServicosPorOSqtt` INT NOT NULL COMMENT 'Quantidade de serviços da OS.',
  `ServicosPorOSvalor` DECIMAL(15,2) NOT NULL COMMENT 'Valor dos serviços da OS.',
  `ServicosPorOSprevisaoInicio` DATETIME NOT NULL COMMENT 'Data prevista para início dos serviços.',
  `ServicosPorOSinicio` DATETIME NOT NULL COMMENT 'Data de início efetivo dos serviços.',
  `ServicosPorOSprevisaoFim` DATETIME NOT NULL COMMENT 'Data prevista para finalização dos serviços.',
  `ServicosPorOSfim` DATETIME NOT NULL COMMENT 'Data efetiva do término dos serviços.',
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
-- Tabela `dio_osdb`.`OsPorMecanico`
-- -----------------------------------------------------
-- 
-- apaga a tabela
-- 
DROP Table IF EXISTS `dio_osdb`.`OsPorMecanico` ;

-- 
-- cria a tabela
-- 
CREATE Table IF NOT EXISTS `dio_osdb`.`OsPorMecanico` (
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
-- Tabela `dio_osdb`.`CategoriasPorMecanico`
-- -----------------------------------------------------
-- 
-- apaga a tabela
-- 
DROP Table IF EXISTS `dio_osdb`.`CategoriasPorMecanico` ;

-- 
-- cria a tabela
-- 
CREATE Table IF NOT EXISTS `dio_osdb`.`CategoriasPorMecanico` (
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

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

use dio_osdb;
show tables;
