-- --------                      tf1                    ------------ --
--                                                                   --
--                    SCRIPT DE CRIACAO (DDL)                        --
--                                                                   --
-- Data Criacao ...........: 23/11/2017                              --
-- Autor(es) ..............: Filipe Coelho Hil�rio Barcelos          --
--                           Mônica Karoline Silva Galvão            --
--                           José Aquiles Guedes de Rezende             --
-- Banco de Dados .........: MySQL                                   --
-- Banco de Dados(nome) ...: tf1                                     --
--                                                                   --
-- Data Ultima Alteracao ..: 5/12/2017                               --
-- Autor(es) ..............: José Aquiles Guedes de Rezende          --
--                           Mônica Karoline Silva Galvão            --
--                           José Aquiles Guedes de Rezende             --
--    + auto increment e cabeçalho                                   --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 11 Tabelas                                             --
--                                                                   --
-- ----------------------------------------------------------------- --


create database IF NOT EXISTS tf1;
use tf1;

CREATE TABLE CIDADE (
  numeroHabitantes INTEGER NOT NULL,
  siglaEstado VARCHAR(2) NOT NULL,
  nomeCidade VARCHAR(100) NOT NULL,
  idCidade INTEGER NOT NULL AUTO_INCREMENT,
  CONSTRAINT CIDADE_PK PRIMARY KEY (idCidade),
  CONSTRAINT CIDADE_UK UNIQUE (siglaEstado, nomeCidade));

CREATE TABLE HOTEL (
  classificacaoEstrelas INTEGER NOT NULL,
  nomeFantasia VARCHAR(100),
  nomeHotel VARCHAR(100) NOT NULL,
  idHotel INTEGER NOT NULL,
  idCidade INTEGER NOT NULL,
  CONSTRAINT HOTEL_PK PRIMARY KEY (idHotel),
  CONSTRAINT HOTEL_CIDADE_FK FOREIGN KEY(idCidade) REFERENCES CIDADE(idCidade),
  CONSTRAINT CLASSIFICACAOESTRELAS_CK CHECK (classificacaoEstrelas>=0 and classificacaoEstrelas<=5));

CREATE TABLE TIPOQUARTO (
  idTipoQuarto INTEGER NOT NULL,
  nomeTipoQuarto VARCHAR(100) NOT NULL,
  quantidadeQuartos INTEGER NOT NULL,
  valorDiaria DECIMAL(10,2) NOT NULL,
  idHotel INTEGER NOT NULL,
  CONSTRAINT TIPOQUARTO_PK PRIMARY KEY (idTipoQuarto),
  CONSTRAINT TIPOQUARTO_HOTEL_FK FOREIGN KEY(idHotel) REFERENCES HOTEL(idHotel));

CREATE TABLE PONTOTURISTICO (
  idPontoTuristico INTEGER NOT NULL,
  nomePontoTuristico VARCHAR(100) NOT NULL,
  descricao VARCHAR(1000) NOT NULL,
  idCidade INTEGER NOT NULL,
  CONSTRAINT PONTOTURISTICO_PK PRIMARY KEY(idPontoTuristico),
  CONSTRAINT PONTOTURISTICO_CIDADE_FK FOREIGN KEY(idCidade) REFERENCES CIDADE(idCidade));

CREATE TABLE IGREJA (
  dataConstrucao DATETIME NOT NULL,
  estiloConstrucao VARCHAR(100) NOT NULL,
  idPontoTuristico INTEGER NOT NULL,
  CONSTRAINT IGREJA_PK PRIMARY KEY(idPontoTuristico),
  CONSTRAINT IGREJA_PONTOTURISTICO_FK FOREIGN KEY(idPontoTuristico) REFERENCES PONTOTURISTICO(idPontoTuristico));

CREATE TABLE MUSEU (
  dataFundacao DATETIME NOT NULL,
  numeroSalasDisponiveis INTEGER NOT NULL,
  idPontoTuristico INTEGER NOT NULL,
  CONSTRAINT MUSEU_PK PRIMARY KEY(idPontoTuristico),
  CONSTRAINT MUSEU_PONTOTURISTICO_FK FOREIGN KEY(idPontoTuristico) REFERENCES PONTOTURISTICO(idPontoTuristico));

CREATE TABLE CASASHOW (
  diaFechamento VARCHAR(20) NOT NULL,
  horarioInicioShow VARCHAR(20) NOT NULL,
  idPontoTuristico INTEGER NOT NULL,
  CONSTRAINT CASASHOW_PK PRIMARY KEY(idPontoTuristico),
  CONSTRAINT CASASHOW_PONTOTURISTICO_FK FOREIGN KEY(idPontoTuristico) REFERENCES PONTOTURISTICO(idPontoTuristico));

CREATE TABLE RESTAURANTE (
  tipoCategoria VARCHAR(100) NOT NULL,
  nomeRestaurante VARCHAR(100) NOT NULL,
  precoMedio DECIMAL(10,2) NOT NULL,
  idRestaurante INTEGER NOT NULL,
  idCidade INTEGER NOT NULL,
  idPontoTuristico INTEGER,
  idHotel INTEGER,
  CONSTRAINT RESTAURANTE_PK PRIMARY KEY (idRestaurante),
  CONSTRAINT RESTAURANTE_CIDADE_FK FOREIGN KEY(idCidade) REFERENCES CIDADE(idCidade),
  CONSTRAINT RESTAURANTE_CASASHOW_FK FOREIGN KEY(idPontoTuristico) REFERENCES CASASHOW(idPontoTuristico),
  CONSTRAINT RESTAURANTE_HOTEL_FK FOREIGN KEY(idHotel) REFERENCES HOTEL(idHotel));

CREATE TABLE ENDERECO (
  idEndereco INTEGER NOT NULL,
  bairro VARCHAR(100) NOT NULL,
  rua VARCHAR(50) NOT NULL,
  complemento VARCHAR(150) NOT NULL,
  numero INTEGER NOT NULL,
  idHotel INTEGER,
  idRestaurante INTEGER,
  idPontoTuristico INTEGER,
  CONSTRAINT ENDERECO_PK PRIMARY KEY(idEndereco),
  CONSTRAINT ENDERECO_HOTEL_FK FOREIGN KEY(idHotel) REFERENCES HOTEL(idHotel),
  CONSTRAINT ENDERECO_RESTAURANTE_FK FOREIGN KEY(idRestaurante) REFERENCES RESTAURANTE(idRestaurante),
  CONSTRAINT ENDERECO_PONTOTURISTICO_FK FOREIGN KEY(idPontoTuristico) REFERENCES PONTOTURISTICO(idPontoTuristico));

CREATE TABLE FUNDADOR (
  dataMorte DATETIME,
  atividadeProfissional VARCHAR(100) NOT NULL,
  nomeCompleto VARCHAR(200) NOT NULL,
  nacionalidade VARCHAR(50) NOT NULL,
  dataNascimento DATETIME NOT NULL,
  idFundador INTEGER NOT NULL AUTO_INCREMENT,
  CONSTRAINT FUNDADOR_PK PRIMARY KEY(idFundador),
  CONSTRAINT FUNDADOR_UK UNIQUE (dataNascimento, nomeCompleto));

CREATE TABLE CRIA (
  idFundador INTEGER,
  idPontoTuristico INTEGER,
  CONSTRAINT CRIA_FUNDADOR_FK FOREIGN KEY(idFundador) REFERENCES FUNDADOR(idFundador),
  CONSTRAINT CRIA_MUSEU_FK FOREIGN KEY(idPontoTuristico) REFERENCES MUSEU(idPontoTuristico));