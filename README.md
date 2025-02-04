# DioHeinekeinOS
Solução do desafio Dio-Heinekein ref. criação de projeto lógico para um sistema de gerenciamento de OS - ordens de serviço para uma oficina mecânica.

# Escopo
Aqui veremos a solução para o desafio Dio-Heinekein referente a criação do projeto lógico do banco de dados para um sistema de gerenciamento de OS - ordens de serviço para uma oficina mecânica, bem como carga de dados e desenvolvimento de todos os scripts sql para a criação do banco, de suas tabelas, população com dados e por fim, diversas queries de consulta, utilizando MySQL WorkBench, PyCharm e GitHub.

# Roteiro para leitura do "README.md" e scripts SQL

Para entendimento do trabalho desenvolvido, favor ver abaixo a descrição ordenada das atividades executadas e os resultados obtidos, na ordem que segue.

A) Descrição do desafio e diretrizes

B) Solução do desafio com o desenvolvimento dos scripts (*)

  (*) Atenção! Os scripts contém comentários para interpretação. Todo desenvolvimento a seguir listado, está aqui disponibilizado, assim como as saídas geradas (ver quadro ao lado).

#

# A) Descrição do desafio e diretrizes

Vamos a descrição do desafio e das diretrizes propostas:

Utilizando o aprendizado das aulas anteriores (modelagem de BD com modelo ER), o esquema conceitual e as ferramentas disponíveis, criar o esquema lógico para o contexto de uma oficina, implementando o esquema e o banco de dados com suas tabelas, com o uso de scripts SQL.

Faça a persistência de dados para as diversas tabelas para a realização de testes e desenvolva queries de consulta mais complexas do que apresentadas durante a explicação do desafio:

### QUERIES SOLICITADAS:

- Recuperações simples com SELECT Statement;
- Filtros com WHERE Statement;
- Crie expressões para gerar atributos derivados;
- Defina ordenações dos dados com ORDER BY;
- Condições de filtros aos grupos – HAVING Statement;
- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados;

### DIRETRIZES:

- Não há um mínimo de queries a serem realizadas;
- Os tópicos supracitados devem estar presentes nas queries;
- Elabore perguntas que podem ser respondidas pelas consultas
- As cláusulas podem estar presentes em mais de uma query

O projeto deverá ser adicionado a um repositório do Github para futura avaliação do desafio de projeto. Adicione ao Readme a descrição do projeto lógico para fornecer o contexto sobre seu esquema lógico apresentado.

#

# B) Solução do desafio com o desenvolvimento dos scripts

Para solução do desafio, foram necessárias as ações a seguir listadas:

  1. Entendimento e simulação de rotinas de uma oficina mecânica com base na narrativa apresentada.
     - De um modo geral (simplificado) o mecânico ouvirá o cliente, cadastrará o cliente e seu veículo e, abrirá a ordem de serviços (status orçada), fará a inspeção e diagóstico, relacionando peças e serviços (custos para o cliente e receita de vendas para a oficina) que ele julgar necessário na OS, assim como fará a ligação ao(s) mecânico(s) que irá(ão) executar os serviços com base nas habilidades de cada um, determinando também datas previstas de início e fim para cada serviço a ser executado. Ao término, ele apresenta ao cliente as ordens de serviço ainda como orçamento, para aprovação ou rejeição.
  3. Desenvolvimento do modelo ER para a oficina.
     - Arquivo DioHeinekeinOS.mwb.
  5. Modelagem do banco de dados e de suas tabelas.
     - Banco de dados: 'dio_osdb'.
     - Tabelas: abaixo relacionadas.
  7. Desenvolvimento dos scripts solicitados e alguns mais complexos, para carga de dados (persistência) e consultas (ver a seguir).
     - script para criação do banco e tabelas (abaixo)
     - scripts para popular as tabelas (abaixo)
     - scripts de consultas/queries (abaixo)
     - scripts diversos para update de dados e lista banco e suas tabelas (abaixo)
  9. Formulação de perguntas respondidas pelas queries.
      - abaixo e dentro dos scripts das queries de consultas (objetivo das tabelas).

#

## Queries de consultas (*) Queries documentadas internamente.
- QryMecanicoDisponivel:
  - Pergunta: recebemos 2 veículos para conserto, os quais tiverem os orçamentos aprovados. Os clientes tem pressa (como sempre), então, quais são mecânicos estão disponíveis em janeiro/2025 e que tenham competências para atender os veículos que chegaram na oficina?
  - Função: lista mecanicos disponíveis, ou seja, não alocados (sem trabalho) a nenhuma OS (ordem de serviço) em um determinado período de tempo. Serve para auxiliar o usuário a localizar o mecânico automaticamente a partir do cadastro de habilidades (categorias de serviço) onde ele é proficiente e qualificado entre JUNIOR, PLENO E SENIOR.
- QryMecanicoXhabilidades: 
  - Pergunta: o movimento está aumentando e os serviços são variados (categoria ou habilidade ou competência ou proficiência). O gestor resolveu fazer um programa qualificação em multi-funções e treinar toda a equipe em diversos tipos de competência então, quais são as competências do time de mecânicos ativos?
  - Função: listagem dos mecânicos com suas habilidades e níveis de proficiência relacionados.
- QryMecanicoXhabilidades-Lanternagem: 
  - Pergunta: estamos recebendo muitos serviços de Lanternagem (categoria ou habilidade ou competência ou proficiência), então, quais mecânicos tem essa competência?
  - Função: listagem dos mecânicos com suas habilidades e níveis de proficiência relacionados, filtrando habilidade "Lanternagem" (chapeação e pintura).
- QryMecanicoXhabilidadesAtivosInativos: 
  - Pergunta: o movimenta da oficina só aumenta e o proprietártio pensa em trazer de volta para o quadro de funcionários alguns mecânicos que ele teve de demitir quando teve uma crise no negócio há alguns anos. Quais são os mecânicos que já trabalharam na oficina e foram demitidos ou pediram para sair?
  - Função: listagem dos mecânicos com suas habilidades e níveis de proficiência relacionados, filtrando habilidade "Lanternagem" (chapeação e pintura).
- QryOsConcluida: 
  - Pergunta: está chegando o final de mês e o proprietário precisa faturar para receber e pagar as contas. Quais são as OS que estão concluídas e podem ser faturadas (e recebidas)?
  - Função: lista as OS com status de concluidas.
- QryOsEmAndamento: 
  - Pergunta: a oficina está cheia e o chefe da mecânica quer saber quais são as OS que estão no pavilhão, em conserto ou em execução?
  - Função: lista as OS com status como com serviços em andamento.
- QryOsParaOrçamento: 
  - Pergunta: existem vários carros parados na recepção, então, por lógica, temos várias OS para concluir orçamento. Quais são as OS que estão prontas para orçamento?
  - Função: lista as OS com status de recebidas para orçamento.
- QryOsTotais: 
  - Pergunta: o gestor do negócio quer uma previsão de faturamento, apenas com os valores.
  - Função: lista apenas os totais de OS.
- QryOsUmMecanico: 
  - Pergunta: um dos mecânicos está doente e terá de ter as suas atividades executadas por outro profissional. OU, um dos mecânicos pediu para antecipar as férias. Quais são as OS que este mecânico (doente ou férias) está trabalhando e que terão de ser passadas para um de seus colegas?
  - Função: lista as OS de um mecanico em um determinado intevalo de datas.
- QryPecasPrevistoXrealPorOS: 
  - Pergunta: o cliente acho o orçamento caro. A atendente explicou que se tratavam do custo das peças, pois a mão de obra era sempre muito "em conta". O CLiente pediu para ver quais eram as peças?
  - Função: lista as peças previstas X utilizadas por OS.
- QryPrevisaoCustosOS: 
  - Pergunta: todos clientes pedem para ver o orçamento. Quais são os custos de uma OS?
  - Função: lista as OS com os custos de peças e serviços previstos.
- QryPrevisaoCustosOsHAVING: 
  - Pergunta: todos clientes pedem para ver o orçamento. Quais são os custos de uma OS?
  - Função: lista as OS com os custos de peças e serviços previstos (apenas para uso de HAVING).
- QryServiçosPorOS: 
  - Pergunta: todos clientes tem uma reclamação (narrativa dele quanto ao seu veículo). Qual é na realidade, os serviços que terão de ser executados?
  - Função: lista os serviços por OS.
- QryTabelaPrecosPecas: 
  - Pergunta: para agilizar os serviços e manter o negócio andando quando não houver energia ou internet, o gestor quer ter uma tabela de preços de peças (gigante... Não! Salva em PDF e coloca no celular de cada um!)  na mão de cada atendente que recebe os veículos para orçamento. COmo atendê-lo?
  - Função: tabela de preços das peças para utilização nas OS.
- QryTabelaPrecosServicos: 
  - Pergunta: para agilizar os serviços e manter o negócio andando quando não houver energia ou internet, o gestor quer ter uma tabela de preços de serviços (gigante... Não! Salva em PDF e coloca no celular de cada um!)  na mão de cada atendente que recebe os veículos para orçamento. COmo atendê-lo?
  - Função: tabela de preços dos serviços das OS.
- QryClientes.sql: 
  - Pergunta: o movimento da oficina caiu. O gestor observou que isso acontecia nas terças e quartas-feiras e pediu para a área de marketing fazer algo a respeito. Para iniciar, o gestor de marketing pediu o cadastro com os clientes para iniciar as suas análises e assim propor alguma coisa para chamar (ou trazer) clientes para a oficina.
  - Função: lista todos clientes em ordem alfabética e usa algumas mascáras de formatação para CPFs (PF-pessoa física) e CNPJs (PJ-pessoa jurídica), por exemplo.
- QryClientesPJ-SP.sql: 
  - Pergunta: o gestor observou que a maioria dos clientes são de SP, então pediu novo relatório, agora apenas com os clientes de SP.
  - Função: lista todos clientes PJ de SP (São Paulo) em ordem alfabética e usa algumas mascáras de formatação para CPFs e CNPJs, por exemplo.
- QryClientesSP: 
  - Pergunta: o gestor observou que a maioria dos clientes são de SP, então pediu novo relatório, agora apenas com os clientes de SP.
  - Função: lista todos clientes de SP (São Paulo) em ordem alfabética e usa algumas mascáras de formatação para CPFs e CNPJs, por exemplo.
- QryVeiculosPorCliente: 
  - Pergunta: o marketing - muito rápido, já pensou em alternativas e pediu agora uma lista com os veículos por cliente.
  - Função: lista os veículos por cliente.
- QryVeiculosPorClienteI30-2015: 
  - Pergunta: um cliente chegou a loja com reclamações dos serviços prestados. COmo ver qual o seu veículo?
  - Função: lista os veículos por cliente - seleção modelo i30 2015.

## Scrips de upload (*) Scripts documentados internamente.
- UploadCliente.sql - script que cria e popula a tabela de clientes (CLIENTE), usando CPF uo CNPJ como código de contribuinte, com dígitos validados e CEPs (códigos de endereçamento postal brasileiro) validado.
- UploadVeiculosPorCliente.sql - script que cria e popula a tabela com o relacionamento de veículos por cliente (VEICULOSPORCLIENTE).
- UploadVeiculo.sql - script que cria e popula a tabela de veículos (VEICULO).
- UploadPeca.sql - script que cria e popula a tabela de peças sem fotos (PECA).
- UploadPecasPorOs.sql - script que cria e popula a tabela que faz o relacionamento das peças utilizadas (ou a ser utilizadas-orçamentos) por OS - ordem de serviço (PECASPOROS).
- UploadServico.sql - script que cria e popula a tabela de serviços da oficina mecânica por marca, modelo e ano do veículo. Ela é tambémm a tabela de preços dos serviços (SERVICO).
- UploadServicosPorOs.sql - script que cria e popula a tabela que relaciona os serviços (realizados e/ou orçados) por OS (SERVICOSPOROS).
- UploadMecanico.sql - script que cria e popula a tabela de mecânicos (10 registros) da oficina. (*) Atenção para ativos e inativos (MECANICO).
- UploadCategoria.sql - script que cria e popula a tabela com os agrupamentos dos serviços oferecidos pela oficina mecânica e que serão também as habilidades (áreas de proficiência) dos mecânicos: Lanternagem, Elétrica, Hidráulica, Mecânica, Suspensão e Geral (CATEGORIA).
- UploadCategoriasPorMecanico.sql - script que cria e popula a tabela que faz o relacionamento entre a tabela de mecânicoscom os agrupamentos dos serviços oferecidos pela oficina mecânica e que serão também as habilidades (áreas de proficiência) dos mecânicos: Lanternagem, Elétrica, Hidráulica, Mecânica, Suspensão e Geral (CATEGORIASPORMECANICO).
- UploadOsPorMecanico.sql - script que cria e popula a tabela que faz o relacionamento das OS - ordens de serviço por mecânico (OSPORMECANICO). (*) Atenção para as habilidades (categorias).
- UploadOs.sql - script que cria e popula a tabela de OS - Ordens de Serviço (OS). (*) Atenção para o campo status.

## Scrips de update e diversos (*) Scripts documentados internamente.
- UpdateAlocaOsParaMecanico: altera o (s) maecânico (s) responsáveis pela execução das OS consoante as habilidades (competências).
- LIstaBancoTabelas: apenas lista os bancos existentes e as tabelas do banco dio_osdb.

## Tabelas do banco de dados 'dio_osdb' e seus conteúdos:
- CLIENTE: cadastro de clientes
- VEICULOSPORCLIENTE: cadastro com os veículos por cliente
- VEICULO: cadastro de veículos
- PECA: cadastro de peças (usa o padrão internacional de "part number") e tabela de preços das peças. (*) Prevê uma foto pequena (blob).
- PECASPOROS: tabela de peças por os (alocadas e/ou utilizadas em ordens de serviço)
- SERVICO: cadastro de serviços oferecidos pela oficina mecânica. Será também a tabela de preços dos serviços da oficina mecânica.
- SERVICOPOROS: tabela de serviços por os (alocadas e/ou utilizadas em ordens de serviço)
- MECANICO: cadastro de mecânicos
- CATEGORIA: cadastro com os agrupamentos dos serviços oferecidos pela oficina mecânica
- CATEGORIAPORMECANICO: relação de habilidades ou aptidões ou proficiências de serviços por mecânico
- (*) Atenção aqui para o nível de conhecimento do mecânico na categoria que terá de ser definido por regra de negócio.
- OSPORMECANICO: relação de OS - ordens de serviço por mecânico
- OS: cadastro de ordens de serviço orçadas, em execução, executadas ou canceladas.
- (*) Atenção: o controle sobre a exclusão de OS - ordens de serviço, tem de ser sobre o campo STATUS (ver bem ao final do README.md), através de Regras de Negócio. 

## Outros arquivos (e conteúdos) carregados neste repositório:
- README.md - roteiro para entendimento do repositório com a narrativa original e a solução para o desafio proposto.
- DioHeinekeinOS.mwb - diagrama entidade relacionamento (MySQL Workbench) com o diagrama, banco e tabelas.
- DioHeinekeinOS.png - diagrama entidade relacionamento (PNG) com o diagrama, banco e tabelas.
- DadosDasTabelas.XLSX - arquivo excel com separadores com os dados das tabelas do dio_osdb exportados para o formato CSV/XLSX.
  
## Mais detalhes (apenas para melhor entendimento do desenvolvimento do projeto)

## Detalhamento da narrativa original

- Sistema de controle e gerenciamento de execução de ordens de serviço em uma oficina mecânica.
- Clientes levam seus veículos (um cliente pode levar mais de um veículo) à oficina mecânica para serem consertados ou para passarem por revisões periódicas (tipos: conserto e revisão).
- Cada veículo é designado a uma equipe de mecânicos que identifica os serviços a serem executados e preenche uma OS com data de entrega.
- A partir da OS, calcula-se o valor de cada serviço, consultando-se uma tabela de referência de mão-de-obra (tabela de preços).
- O valor de cada peça também irá compor a OS (valor = peças + mão-de-obra).
- O cliente autoriza a execução dos serviços propostos pela oficina mecânica (orçamento).
- A mesma equipe avalia e executa os serviços.
- Os mecânicos possuem código, nome, endereço e especialidade.
- Cada OS possui: nº, data de emissão, um valor (peças e mão-de-obra), status e uma data para conclusão dos trabalhos.
- Uma OS pode ser composta por vários serviços e um mesmo serviço pode estar contido em mais de uma OS;
- Uma OS pode ter vários tipos de peça e uma peça pode estar presente em mais de uma OS.

## Desenvolvimento do modelo ERR

## 1. Clientes:
- Criamos a tabela CLIENTE para armazenar os dados de identificação dos diversos clientes.
- A tabela clientes terá vínculos com as tabelas VEICULO e OS (ordens de serviço).
- Criamos a tabela VEICULOSPORCLIENTE para armazenar a narrativa do cliente quanto as suas necessidades com relação ao veículo em questão na data e assim, podemos manter um histórico das considerações do cliente quanto ao veículo, pois o cliente pode, eventualmente decidir por não avançar com a execução dos serviços da OS e a oficina perderia assim o histórico do caso.
- Um cliente poderá ter mais de um veículo.
- Um cliente poderá ter mais de uma ordem de serviço.
  
## 2. Veículos:
- Criamos a tabela VEICULO para armazenar os dados de identificação dos veículos por cliente.
- A sua vinculação com a tabela CLIENTE gerada em VEICULOSPORCLIENTE, como já colocamos, irá manter a eventual narrativa histórica do que o cliente entende que precisa ser consertado (ou revisado) em seu veículo.
- Um cliente poderá ter mais de um veículo.
- Um veículo poderá ter mais de uma ordem de serviço.
- Optamos por deixar o campo "placa" como "non unique" pois o veículo pode trocar de dono e acabar por voltar a oficina, porém com um novo proprietário. 

## 3. Peças:
- Criamos a tabela PECA para armazenar os dados de identificação das diversas peças disponíveis para a oficina mecânica, bem como o seu preço para o cliente.
- Consideramos que a codificação das peças obedece o critério "part number".
- Consideramos que o estoque de peças encontra-se a disposição imediata para início dos serviços, seja isso em formato interno ou externo.
- A tabela PECA vincula-se a tabela de ordens de serviço - OS, através de PECASPOROS, que mantém o histórico de requisição de peças por ordem de serviços, com os dados de quantidade, valor e data de utilização das peças, tanto a nivel de previsão (orçamento), como da realização dos serviços.
- As peças podem ser utilizadas em diferentes ordens de serviço.
  
## 4. Serviços:
- Criamos a tabela SERVICO para definir os diversos serviços prestados pela oficina mecânica, a qual está categorizada através da tabela CATEGORIAS, a qual é vinculada aos mecânicos através de CATEGORIASPORMECANICO enquanto definição de especialidade ou capacidade laboral.
- A tabela SERVICO será a tabela de preços de serviços do negócio, pois também armazena os preços dos diversos serviços oferecidos aos clientes, porém, levando em conta agora a sua complexidade.
- Como critério de complexidade estamos definindo uma descrição crítica, bem como marca, modelo e ano do veículo do cliente.
- Consideramos que uma revisão periódica ou espontânea é um tipo de serviço oferecido pela mecânica.

## 5. Mecânicos:
- Criamos a tabela MECANICO para armazenar os dados de identificação dos mecânicos.
- Vinculada a tabela MECANICO, temos a tabela CATEGORIA, que irá trazer a especialização necessária para cada indivíduo da equipe de mecânicos.
- Por REGRA DO NEGÓCIO, está sendo definida a seguinte tabela inicial de categorias de serviço, as quais abrigarão os diferentes tipos de serviços em níveis JÚNIOR, PLENO E SENIOR:
  - Lanternagem: serviços de pintura, chapeação, polimento, amassamentos e manutenções diversas na lataria, para-choques, vidros e rodas.
  - Elétrica: serviços no sistema elétrico e eletrônico.
  - Hidráulica: serviços no sistema hidráulico.
  - Mecânica: que envolvam a macânica.
  - Suspensão: serviços que envolvam pneus, suspensão, amortecedores, molas e estabilidade.
  - Geral: que nao se enquadram em nenhum dos ítens acima. 

## 6. OS - Ordens de Serviço:
- Criamos a tabela OS para armazenar as diversas ordens de serviço abertas para os veículos dos clientes, suas datas globais previstas e realizadas de início e fim, seus custos totais (por cliente e veículo), bem como campos para registro de observações.
- Vinculadas a tabela OS, temos:
  - PECASPOROS: para fazer a armazenagem das diversas peças utilizadas em cada OS, tanto a nível previsional (orçamento) como o efetivamente realizado.
  - SERVICOSPOROS: para fazer a armazenagem dos diversos serviços executados em cada OS, tanto a nível previsional (orçamento) como o efetivamente realizado.
  - CLIENTE: trazer os dados dos clientes para as Ordens de Serviços.
  - VEICULO: trazer os dados dos veículos para as Ordens de Serviços.
  - OSPORMECANICO: disponibilizar dados dos mecânicos para programação e alocação dos serviços consoante as suas habilidades.
- Na abertura das ordens de serviços, o responsável irá ouvir o cliente e listar as suas necessidades enquanto inspeciona o veículo, ele abre a OS e víncula ali as peças e serviços que julgar necessários, bem como faz a ligação ao mecânico que irá executar os serviços, determinando também datas previstas de início e fim para cada serviço a ser executado.
- As ordens de serviço poderão ter os seguintes status iniciais por REGRA DO NEGÓCIO (apenas exemplificando):
  - Aguardando aprovação de cliente
  - Aprovada para execução
  - Aguardando peças
  - Aguardando liberação de box de serviço
  - Em execução
  - Aguardando revisão dos serviços
  - Em revisão dos serviços
  - Concluída e aguardando pagamento
  - Paga
  - Entregue e aprovada pelo cliente
  - Cancelada pelo cliente.
  - Cancelada pela oficina.

## Projeto Lógico:

Consta anexo neste repositório os arquivos PNG e MWB com o projeto lógico.

## Ferramentas:

- MySQL Workbench
- PyCharm
- Git / Github
