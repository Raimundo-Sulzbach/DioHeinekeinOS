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
  `ClienteCodigoContribuinte` VARCHAR(18) NULL COMMENT 'Código do contribuinte do cliente. Pessoa física (CPF) - 14 caracteres. Pessoa jurídica (CNPJ) - 18 caracteres). Os cálculos dos digitos verificadores terão de ser feitos à nível de aplicação.',
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

-- desabilita o safe mode
SET SQL_SAFE_UPDATES = 0;
-- zera a tabela cliente
DELETE FROM dio_osdb.cliente;
-- reativa o modeo seguro
delete from dio_osdb.cliente where 1=1;
-- insere 10 registros na tabela cliente
INSERT INTO `dio_osdb`.`Cliente` 
(`idCliente`, `ClienteNome`, `ClienteCodigoContribuinte`, `ClienteEndereco`, `ClienteCEP`, `ClienteNumero`, `ClienteComplemento`, `ClienteBairro`, `ClienteCidade`, `ClienteUF`, `ClienteTelefone`, `ClienteWhatsapp`, `ClienteEmail`)
VALUES
(1, 'João Silva', '12345678909', 'Rua das Flores, 123', '01000-000', '123', 'Apto 101', 'Centro', 'São Paulo', 'SP', '(11) 98765-4321', '(11) 98765-4321', 'joao.silva@email.com'),
(2, 'Maria Oliveira', '98765432100', 'Av. Paulista, 456', '01310-000', '456', 'Sala 202', 'Bela Vista', 'São Paulo', 'SP', '(11) 99876-5432', '(11) 99876-5432', 'maria.oliveira@email.com'),
(3, 'Carlos Pereira', '11122233344', 'Rua dos Pinheiros, 789', '05422-000', '789', 'Casa', 'Pinheiros', 'São Paulo', 'SP', '(11) 98877-6543', '(11) 98877-6543', 'carlos.pereira@email.com'),
(4, 'Ana Costa', '55566677788', 'Av. Brasil, 890', '22250-040', '890', 'Cobertura', 'Copacabana', 'Rio de Janeiro', 'RJ', '(21) 97765-4321', '(21) 97765-4321', 'ana.costa@email.com'),
(5, 'Paulo Almeida', '33344455566', 'Rua das Acácias, 32', '30130-110', '32', 'Fundos', 'Savassi', 'Belo Horizonte', 'MG', '(31) 98865-4321', '(31) 98865-4321', 'paulo.almeida@email.com'),
(6, 'Lucas Lima', '11223344556', 'Rua do Comércio, 98', '40010-000', '98', 'Sala 3', 'Comércio', 'Salvador', 'BA', '(71) 91234-5678', '(71) 91234-5678', 'lucas.lima@email.com'),
(7, 'Fernanda Souza', '22334455667', 'Rua das Palmeiras, 456', '20031-000', '456', 'Apto 202', 'Centro', 'Rio de Janeiro', 'RJ', '(21) 92345-6789', '(21) 92345-6789', 'fernanda.souza@email.com'),
(8, 'Ricardo Batista', '33445566778', 'Av. Rio Branco, 300', '60125-050', '300', 'Andar 4', 'Centro', 'Fortaleza', 'CE', '(85) 93456-7890', '(85) 93456-7890', 'ricardo.batista@email.com'),
(9, 'Julia Machado', '44556677889', 'Rua Sete de Setembro, 45', '30120-020', '45', 'Apto 12', 'Lourdes', 'Belo Horizonte', 'MG', '(31) 94567-8901', '(31) 94567-8901', 'julia.machado@email.com'),
(10, 'Mateus Rocha', '55667788990', 'Av. Brasil, 500', '70290-000', '500', 'Sala 7', 'Asa Sul', 'Brasília', 'DF', '(61) 95678-9012', '(61) 95678-9012', 'mateus.rocha@email.com'),
(11, 'Empresa A', '12345678000195', 'Rua do Comércio, 123', '01000-010', '123', 'Sala 10', 'Centro', 'São Paulo', 'SP', '(11) 91234-5678', '(11) 91234-5678', 'empresaA@email.com'),
(12, 'Empresa B', '22345678000196', 'Av. Paulista, 200', '01310-020', '200', 'Andar 5', 'Jardins', 'São Paulo', 'SP', '(11) 92345-6789', '(11) 92345-6789', 'empresaB@email.com'),
(13, 'Empresa C', '32345678000197', 'Rua das Palmeiras, 300', '20031-050', '300', 'Apto 301', 'Botafogo', 'Rio de Janeiro', 'RJ', '(21) 93456-7890', '(21) 93456-7890', 'empresaC@email.com'),
(14, 'Empresa D', '42345678000198', 'Av. Rio Branco, 400', '60125-100', '400', 'Andar 6', 'Centro', 'Fortaleza', 'CE', '(85) 94567-8901', '(85) 94567-8901', 'empresaD@email.com'),
(15, 'Empresa E', '52345678000199', 'Rua Sete de Setembro, 500', '30120-030', '500', 'Apto 401', 'Lourdes', 'Belo Horizonte', 'MG', '(31) 95678-9012', '(31) 95678-9012', 'empresaE@email.com'),
(16, 'Empresa F', '62345678000190', 'Av. Brasil, 600', '70290-010', '600', 'Sala 8', 'Asa Norte', 'Brasília', 'DF', '(61) 96789-0123', '(61) 96789-0123', 'empresaF@email.com'),
(17, 'Empresa G', '72345678000191', 'Rua das Flores, 700', '40010-010', '700', 'Sala 9', 'Pituba', 'Salvador', 'BA', '(71) 97890-1234', '(71) 97890-1234', 'empresaG@email.com'),
(18, 'Empresa H', '82345678000192', 'Av. Sete de Setembro, 800', '40050-020', '800', 'Andar 10', 'Centro', 'Curitiba', 'PR', '(41) 98901-2345', '(41) 98901-2345', 'empresaH@email.com'),
(19, 'Empresa I', '92345678000193', 'Rua do Comércio, 900', '50010-030', '900', 'Apto 11', 'Boa Viagem', 'Recife', 'PE', '(81) 99012-3456', '(81) 99012-3456', 'empresaI@email.com'),
(20, 'Empresa J', '10345678000194', 'Av. Presidente Vargas, 1000', '22250-100', '1000', 'Sala 12', 'Centro', 'Rio de Janeiro', 'RJ', '(21) 99123-4567', '(21) 99123-4567', 'empresaJ@email.com');

-- mostra os registros carregados
select * from cliente;
