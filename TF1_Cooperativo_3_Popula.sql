-- --------                      tf1                    ------------ --
--                                                                   --
--                    SCRIPT DE INSER��O (DML)                       --
--                                                                   --
-- Data Criacao ...........: 23/11/2017                              --
-- Autor(es) ..............: Filipe Coelho Hil�rio Barcelos          --
--                           Mônica Karoline Silva Galvão            --
--                           José Aquiles Guedes de Rezende             --
-- Banco de Dados .........: MySQL                                   --
-- Banco de Dados(nome) ...: tf1                                     --
--                                                                   --
-- Data Ultima Alteracao ..: 05/12/2017                              --
-- Autor(es) ..............: José Aquiles Guedes de Rezende          --
--                           Mônica Karoline Silva Galvão            --
--                           José Aquiles Guedes de Rezende             --
--    + atualizar conforme auto increment                            --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 11 Tabelas                                             --
--                                                                   --
-- ----------------------------------------------------------------- --

use tf1;

insert into CIDADE(numeroHabitantes, siglaEstado, nomeCidade) values
	('100000', 'RJ', 'Rio Bonito'),
	('200000', 'MG', 'Ituiutaba'),
  ('300000', 'SP', 'Campinas');


insert into HOTEL values
	('3', 'Hotel do Rio', 'Hotel Rio Bonito', '11', '1'),
	('5', null, 'Hotel Mineiro', '22', '2'),
	('4', 'Hotel Bela Vista', 'Hotel Campinense', '33', '3');

insert into TIPOQUARTO values
	('1', 'comum', '100', '200.10', '11'),
	('2', 'luxo', '20', '1000.20', '33'),
	('3', 'suite presidencial', '5', '2000.30', '22');

insert into PONTOTURISTICO values
	('1', 'Igreja Nossa Senhora', 'Igreja histórica.', '1'),
	('2', 'Museu Carioca', 'Museu mais visitado do RJ.', '1'),
	('3', 'Boa Dança', 'Casa de Show mais popular do RJ.', '1'),
	('4', 'Igreja Pai Nosso', 'Igreja centenária.', '2'),
	('5', 'Museu Mineiro', 'Museu histórico de MG.', '2'),
  	('6', 'Casa da Noite', 'Casa de Show mais famosa da cidade.', '2'),
  	('7', 'Igreja Bom Jesus', 'Igreja histórica e centenária.', '3'),
  	('8', 'Museu Paulista', 'Museu famoso de SP.', '3'),
  	('9', 'Super Eventos', 'Casa de Show famosa no estado.', '3');

insert into IGREJA values
	('19560722', 'gotico', '1'),
	('19080817', 'barroco', '4'),
	('18990512', 'contemporaneo', '7');

insert into MUSEU values
	('19960523', '10', '2'),
  	('19720220', '15', '5'),
  	('19431113', '20', '8');

insert into CASASHOW values
	('segunda-feira', '14 horas', '3'),
	('segunda-feira', '19 horas', '6'),
	('segunda-feira', '16 horas', '9');

insert into RESTAURANTE values
	('comida chinesa', 'China in Rio', '30.50', '121', '1', null, null),
	('comida mineira', 'Brasa Mineira', '40.75', '122', '2', '6', null),
	('comida caseira', 'Comida de Casa', '25.45', '123', '3', null, '33');

insert into ENDERECO values
	('111', 'bairro da madeira', 'rua Sebastião Passos', 'lote 12', '14', '11', null, null),
	('222', 'bairro São Marcos', 'rua Jõao Miguel', 'lote 2', '32', '22', null, null),
	('333', 'Palmares', 'Dom Pedro I', 'lote 11', '11', '33', '123', null),
  	('444', 'Santa Clara', 'Dom Pedro II', 'lote 33', '4', null, '121', null),
	('555', 'bairro da canoa', 'rua Sebastião', 'lote 12', '14', null, null, '1'),
	('666', 'bairro do Comercio', 'rua Miguel', 'lote 2', '32', null, null, '2'),
	('777', 'Palmeiras', 'Dom Paulo', 'lote 11', '11', null, null, '3'),
  	('888', 'Cocais', 'Dom Cesar', 'lote 33', '4', null, null, '4'),
	('999', 'bairro das maçãs', 'rua Passos', 'lote 12', '14', null, null, '5'),
	('100', 'bairro São Leandro', 'rua Jõao', 'lote 2', '32', null, '122', '6'),
	('101', 'Pará', 'rua do pará', 'lote 1', '1', null, null, '7'),
  	('102', 'Candango', 'rua candanga', 'lote 3', '42', null, null, '8'),
  	('103', 'Sulista', 'rua sulista', 'lote 33', '41', null, null, '9');

insert into FUNDADOR(dataMorte, atividadeProfissional, nomeCompleto, nacionalidade, dataNascimento) values
	('19790312', 'engenheiro', 'José Amaral Valadares', 'brasileiro', '18890421'),
	('20150726', 'arquiteto', 'Carlos Tenório Acosta', 'argentino', '19310901'),
	( null, 'professora', 'Angélica Silveira Magalhães', 'brasileira', '19610807');

insert into CRIA values
	('1', '8'),
  	('1', '5'),
	('2', '5'),
	('3', '2');