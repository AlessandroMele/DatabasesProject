-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Dic 30, 2020 alle 21:47
-- Versione del server: 10.4.16-MariaDB
-- Versione PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `riescomarche2`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `associazione`
--

CREATE TABLE `associazione` (
  `PIVA` char(11) NOT NULL,
  `Nome` varchar(20) DEFAULT NULL,
  `Referente` char(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `associazione`
--

INSERT INTO `associazione` (`PIVA`, `Nome`, `Referente`) VALUES
('12345678901', 'Anpas', 'DPRNDR69C12D781E'),
('23456789012', 'Croce Gialla', 'DPRNDR69C12D781E'),
('34567890123', 'Enpa', 'VRDCLA88T12R432T'),
('45678901235', 'Mani di Dio', 'RSOLSA87F12T638Z'),
('76543210912', 'ACLI', 'DPRNDR69C12D781E'),
('87654321091', 'Luce del Sole', 'RSOLSA87F12T638Z'),
('98765432101', 'Croce Rossa', 'PTNDRA96R10D465R');

-- --------------------------------------------------------

--
-- Struttura della tabella `calendario`
--

CREATE TABLE `calendario` (
  `OrarioInizio` time NOT NULL,
  `OrarioFine` time NOT NULL,
  `Giorno` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `calendario`
--

INSERT INTO `calendario` (`OrarioInizio`, `OrarioFine`, `Giorno`) VALUES
('08:30:00', '20:30:00', 'Giovedì'),
('09:00:00', '18:00:00', 'Lunedì'),
('09:00:00', '18:00:00', 'Mercoledì'),
('09:00:00', '20:00:00', 'Venerdì'),
('09:30:00', '18:30:00', 'Martedì');

-- --------------------------------------------------------

--
-- Struttura della tabella `cittadino`
--

CREATE TABLE `cittadino` (
  `CF` char(16) NOT NULL,
  `Nome` varchar(20) DEFAULT NULL,
  `Cognome` varchar(20) DEFAULT NULL,
  `DataDiNascita` date DEFAULT NULL,
  `Tipologia` enum('Nucleo familiare','Minore','Giovane','Adulto','Anziano','Disabile','Migrante/Rom/sinti','Condizione di povertà/Disagio sociale','Senza fissa dimora','Donna vittima di violenza','Soggetti con dipendenze','Donatori di sangue') DEFAULT NULL,
  `Genere` char(1) DEFAULT NULL CHECK (`Genere` = 'M' or `Genere` = 'F'),
  `RecapitoTelefonico` decimal(10,0) UNSIGNED DEFAULT NULL,
  `Canale` enum('Facebook','Internet','Telegiornale','Radio','Regione Marche','Numero verde Regione Marche','Protezione civile','Assistenti sociali','Comune','ASUR','ASL','Farmacia','Medico','Conoscenti','Associazioni','Progetto Riesco') DEFAULT NULL,
  `Via` varchar(30) NOT NULL,
  `Civico` smallint(5) UNSIGNED NOT NULL,
  `Localita` varchar(30) NOT NULL,
  `CAP` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `cittadino`
--

INSERT INTO `cittadino` (`CF`, `Nome`, `Cognome`, `DataDiNascita`, `Tipologia`, `Genere`, `RecapitoTelefonico`, `Canale`, `Via`, `Civico`, `Localita`, `CAP`) VALUES
('MLELSN99C24A462K', 'Alessandro', 'Mele', '1999-03-24', 'Giovane', 'M', '3456272128', 'ASL', '25 Aprile', 1, 'Castel Di Lama', 63082),
('MRARSS76P05A463O', 'Mario', 'Rossi', '1976-09-05', 'Senza fissa dimora', 'M', '3456311078', 'ASUR', 'delle Tavernelle', 23, 'Falconara', 60121),
('PLNFBR99F17A537T', 'Fabrizio', 'Pilone', '1999-11-17', 'Giovane', 'M', '3116789056', 'Regione Marche', 'Giuseppe Garibaldi', 69, 'Corridonia', 63900),
('PRTMRC97D12A462I', 'Marco', 'Proietti', '1997-04-12', 'Giovane', 'M', '3212345768', 'Numero verde Regione Marche', 'Nazario Sauro', 23, 'Ascoli Piceno', 63100),
('SBRRBR22A783O', 'Roberta', 'Sobrini', '1967-11-11', 'Adulto', 'F', '3332389967', 'Facebook', 'Mario Rossi', 32, 'Gradara', 61122),
('SPRLXA99E12E467W', 'Alexia', 'Sprecacè', '1999-09-12', 'Giovane', 'F', '3547392127', 'Medico', 'roma', 54, 'Belmonte Piceno', 63900),
('TRNDVD99C22A462Z', 'Davide', 'Traini', '1999-03-22', 'Nucleo familiare', 'M', '3805887765', 'Facebook', 'Stellati', 7, 'Corridonia', 62100);

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `costiperassociazione`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `costiperassociazione` (
`CostoTotalePerAssociazione` double(19,2)
,`PivaAssociazione` char(11)
,`NomeAssociazione` varchar(20)
);

-- --------------------------------------------------------

--
-- Struttura della tabella `disponibilita`
--

CREATE TABLE `disponibilita` (
  `OrarioInizio` time NOT NULL,
  `OrarioFine` time NOT NULL,
  `Giorno` varchar(9) NOT NULL,
  `Referente` char(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `disponibilita`
--

INSERT INTO `disponibilita` (`OrarioInizio`, `OrarioFine`, `Giorno`, `Referente`) VALUES
('08:30:00', '20:30:00', 'Giovedì', 'DPRNDR69C12D781E'),
('08:30:00', '20:30:00', 'Giovedì', 'PTNDRA96R10D465R'),
('08:30:00', '20:30:00', 'Giovedì', 'RSOLSA87F12T638Z'),
('09:00:00', '18:00:00', 'Lunedì', 'DPRNDR69C12D781E'),
('09:00:00', '18:00:00', 'Lunedì', 'PTNDRA96R10D465R'),
('09:00:00', '18:00:00', 'Lunedì', 'RSOLSA87F12T638Z'),
('09:00:00', '18:00:00', 'Lunedì', 'VRDCLA88T12R432T'),
('09:00:00', '18:00:00', 'Mercoledì', 'DPRNDR69C12D781E'),
('09:00:00', '18:00:00', 'Mercoledì', 'PTNDRA96R10D465R'),
('09:00:00', '18:00:00', 'Mercoledì', 'RSOLSA87F12T638Z'),
('09:00:00', '20:00:00', 'Venerdì', 'DPRNDR69C12D781E'),
('09:00:00', '20:00:00', 'Venerdì', 'PTNDRA96R10D465R'),
('09:00:00', '20:00:00', 'Venerdì', 'RSOLSA87F12T638Z'),
('09:00:00', '20:00:00', 'Venerdì', 'VRDCLA88T12R432T'),
('09:30:00', '18:30:00', 'Martedì', 'DPRNDR69C12D781E'),
('09:30:00', '18:30:00', 'Martedì', 'PTNDRA96R10D465R'),
('09:30:00', '18:30:00', 'Martedì', 'VRDCLA88T12R432T');

-- --------------------------------------------------------

--
-- Struttura della tabella `domicilio`
--

CREATE TABLE `domicilio` (
  `Via` varchar(30) NOT NULL,
  `Civico` smallint(5) UNSIGNED NOT NULL,
  `Localita` varchar(30) NOT NULL,
  `CAP` smallint(5) UNSIGNED NOT NULL,
  `Provincia` enum('AN','AP','FM','MC','PU') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `domicilio`
--

INSERT INTO `domicilio` (`Via`, `Civico`, `Localita`, `CAP`, `Provincia`) VALUES
('25 Aprile', 1, 'Castel Di Lama', 63082, 'AP'),
('delle Tavernelle', 23, 'Falconara', 60121, 'AN'),
('Giuseppe Garibaldi', 69, 'Corridonia', 63900, 'FM'),
('Mario Rossi', 32, 'Gradara', 61122, 'PU'),
('Nazario Sauro', 23, 'Ascoli Piceno', 63100, 'AP'),
('roma', 54, 'Belmonte Piceno', 63900, 'FM'),
('Stellati', 7, 'Corridonia', 62100, 'MC');

-- --------------------------------------------------------

--
-- Struttura della tabella `garanzia`
--

CREATE TABLE `garanzia` (
  `NomeTerritoriale` varchar(40) NOT NULL,
  `Comune` varchar(40) NOT NULL,
  `Tipologia` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `garanzia`
--

INSERT INTO `garanzia` (`NomeTerritoriale`, `Comune`, `Tipologia`) VALUES
(' Buon Pastore San Benedetto del Tronto', 'San Benedetto del Tronto', 'Assistenza sanitaria'),
(' Buon Pastore San Benedetto del Tronto', 'San Benedetto del Tronto', 'Consegna spesa'),
('ACLI Ancona', 'Camerata Picena', 'Consegna libri'),
('ACLI Ancona', 'Camerata Picena', 'Consegna spesa'),
('ACLI Ancona', 'Camerata Picena', 'Supporto in caso di eventi atmosferici'),
('ACLI Fermo', 'Porto San Giorgio', 'Consegna medicinali'),
('ACLI Fermo', 'Porto San Giorgio', 'Consegna spesa'),
('ACLI Fermo', 'Porto San Giorgio', 'Trasporti protetti per accessi a servizi e prestazioni socio-sanitarie'),
('Anpas Macerata', 'Auditore', 'Consegna medicinali'),
('Anpas Macerata', 'Auditore', 'Supporto psicologico'),
('Anpas Macerata', 'Montefeltro', 'Assistenza sanitaria'),
('Anpas Macerata', 'Montefeltro', 'Consegna medicinali'),
('Comitato di Ascoli Piceno', 'Castel di Lama', 'Consegna medicinali'),
('Comitato di Ascoli Piceno', 'Castel di Lama', 'Supporto in caso di eventi atmosferici'),
('Comitato di Ascoli Piceno', 'Folignano', 'Consegna medicinali'),
('Comitato di Ascoli Piceno', 'Folignano', 'Supporto psicologico'),
('Comitato di Corridonia', 'Corridonia', 'Supporto psicologico'),
('Comitato di Corridonia', 'Corridonia', 'Trasporti protetti per accessi a servizi e prestazioni socio-sanitarie'),
('Comitato di Pesaro Urbino', 'Montecalvo in Foglia', 'Assistenza sanitaria'),
('Comitato di Pesaro Urbino', 'Montecalvo in Foglia', 'Consegna spesa'),
('Croce Gialla Ancona', 'Camerata Picena', 'Consegna libri'),
('Croce Gialla Ancona', 'Camerata Picena', 'Supporto in caso di eventi atmosferici'),
('Croce Gialla Fermo', 'Porto San Giorgio', 'Consegna spesa'),
('Croce Gialla Fermo', 'Porto San Giorgio', 'Supporto psicologico'),
('Enpa Pesaro-Urbino', 'Gabicce Mare', 'Supporto in caso di eventi atmosferici'),
('Enpa Pesaro-Urbino', 'Gabicce Mare', 'Trasporti protetti per accessi a servizi e prestazioni socio-sanitarie'),
('Enpa Pesaro-Urbino', 'Mombaroccio', 'Supporto in caso di eventi atmosferici'),
('Enpa Pesaro-Urbino', 'Mombaroccio', 'Trasporti protetti per accessi a servizi e prestazioni socio-sanitarie'),
('Mani di Dio Ascoli Piceno', 'Castel di Lama', 'Supporto psicologico'),
('Mani di Dio Ascoli Piceno', 'Folignano', 'Consegna medicinali');

-- --------------------------------------------------------

--
-- Struttura della tabella `informazione`
--

CREATE TABLE `informazione` (
  `DataOra` datetime NOT NULL,
  `Operatore` tinyint(3) UNSIGNED DEFAULT NULL,
  `Referente` char(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `informazione`
--

INSERT INTO `informazione` (`DataOra`, `Operatore`, `Referente`) VALUES
('2020-11-09 13:00:00', 3, 'RSOLSA87F12T638Z'),
('2020-11-09 17:55:00', 2, 'DPRNDR69C12D781E'),
('2020-11-10 10:00:00', 1, 'PTNDRA96R10D465R'),
('2020-11-10 15:59:00', 3, 'PTNDRA96R10D465R'),
('2020-11-10 18:15:00', 3, 'RSOLSA87F12T638Z'),
('2020-11-11 16:50:00', 2, 'RSOLSA87F12T638Z'),
('2020-11-11 16:55:00', 2, 'VRDCLA88T12R432T'),
('2020-11-13 18:05:00', 1, 'RSOLSA87F12T638Z');

-- --------------------------------------------------------

--
-- Struttura della tabella `localita`
--

CREATE TABLE `localita` (
  `Comune` varchar(40) NOT NULL,
  `Provincia` enum('AP','AN','FM','MC','PU') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `localita`
--

INSERT INTO `localita` (`Comune`, `Provincia`) VALUES
('Auditore', 'MC'),
('Camerata Picena', 'AN'),
('Castel di Lama', 'AP'),
('Corridonia', 'MC'),
('Folignano', 'AP'),
('Gabicce Mare', 'PU'),
('Mombaroccio', 'PU'),
('Montecalvo in Foglia', 'PU'),
('Montefeltro', 'MC'),
('Porto San Giorgio', 'FM'),
('San Benedetto del Tronto', 'AP');

-- --------------------------------------------------------

--
-- Struttura della tabella `notadidebito`
--

CREATE TABLE `notadidebito` (
  `Codice` mediumint(9) NOT NULL,
  `Documento` varchar(40) DEFAULT NULL,
  `ImportoPagamento` float(8,2) DEFAULT NULL,
  `Prestazione` mediumint(8) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `notadidebito`
--

INSERT INTO `notadidebito` (`Codice`, `Documento`, `ImportoPagamento`, `Prestazione`) VALUES
(1242742, 'Utenti/noteDiDebito', 10.50, 2),
(1248123, 'Utenti/noteDiDebito', 10.80, 5),
(1248293, 'Utenti/noteDiDebito', 50.00, 4),
(1248627, 'Utenti/noteDiDebito', 30.50, 3),
(1248687, 'Utenti/noteDiDebito', 50.20, 7),
(1248982, 'Utenti/noteDiDebito', 10.40, 1),
(1385123, 'Utenti/noteDiDebito', 20.20, 6),
(8388607, 'Utenti/noteDiDebito', 100.00, 8);

-- --------------------------------------------------------

--
-- Struttura della tabella `operatore`
--

CREATE TABLE `operatore` (
  `Nome` varchar(20) DEFAULT NULL,
  `Cognome` varchar(20) DEFAULT NULL,
  `Codice` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `operatore`
--

INSERT INTO `operatore` (`Nome`, `Cognome`, `Codice`) VALUES
('Marika', 'Traini', 1),
('Fabrizio', 'Maurizio', 2),
('Danny', 'Lazzarin', 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `prestazione`
--

CREATE TABLE `prestazione` (
  `CodiceProgressivo` mediumint(8) UNSIGNED NOT NULL,
  `CodiceColore` enum('verde','giallo','rosso') NOT NULL,
  `Tipologia` varchar(100) DEFAULT NULL,
  `DataOra` datetime DEFAULT NULL,
  `SchedaMonitoraggio` varchar(40) DEFAULT NULL,
  `Associazione` varchar(11) DEFAULT NULL,
  `Cittadino` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `prestazione`
--

INSERT INTO `prestazione` (`CodiceProgressivo`, `CodiceColore`, `Tipologia`, `DataOra`, `SchedaMonitoraggio`, `Associazione`, `Cittadino`) VALUES
(1, 'giallo', 'Consegna medicinali', '2020-11-10 16:43:17', 'Utenti/SchedaDiMonitoraggio', '98765432101', 'PRTMRC97D12A462I'),
(2, 'verde', 'Supporto psicologico', '2020-11-10 17:30:21', 'Utenti/SchedaDiMonitoraggio', '87654321091', 'MLELSN99C24A462K'),
(3, 'giallo', 'Trasporti protetti per accessi a servizi e prestazioni socio-sanitarie', '2020-11-11 10:45:43', 'Utenti/SchedaDiMonitoraggio', '12345678901', 'TRNDVD99C22A462Z'),
(4, 'rosso', 'Supporto in caso di eventi atmosferici', '2020-11-11 12:47:32', 'Utenti/SchedaDiMonitoraggio', '34567890123', 'SBRRBR22A783O'),
(5, 'verde', 'Supporto psicologico', '2020-11-11 19:01:04', 'Utenti/SchedaDiMonitoraggio', '87654321091', 'PLNFBR99F17A537T'),
(6, 'verde', 'Supporto psicologico', '2020-11-12 18:23:20', 'Utenti/SchedaDiMonitoraggio', '98765432101', 'PRTMRC97D12A462I'),
(7, 'rosso', 'Supporto in caso di eventi atmosferici', '2020-11-12 20:20:20', 'Utenti/SchedaDiMonitoraggio', '76543210912', 'MRARSS76P05A463O'),
(8, 'verde', 'Consegna spesa', '2020-11-12 20:35:20', 'Utenti/SchedaDiMonitoraggio', '23456789012', 'SPRLXA99E12E467W');

-- --------------------------------------------------------

--
-- Struttura della tabella `referente`
--

CREATE TABLE `referente` (
  `CF` char(16) NOT NULL,
  `Nome` varchar(20) DEFAULT NULL,
  `Cognome` varchar(20) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `RecapitoTelefonico` decimal(10,0) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `referente`
--

INSERT INTO `referente` (`CF`, `Nome`, `Cognome`, `email`, `RecapitoTelefonico`) VALUES
('DPRNDR69C12D781E', 'Andrea', 'Diprè', 'andreadipre@gmail.com', '3218877654'),
('PTNDRA96R10D465R', 'Dario', 'Pettinari', 'dario.pettinari@libero.it', '3513478956'),
('RSOLSA87F12T638Z', 'Alessio', 'Rossi', 'alered@outlook.com', '3421234756'),
('VRDCLA88T12R432T', 'Claudio', 'Verdecchia', 'verdecchiaudio@gmail.com', '3224576392');

-- --------------------------------------------------------

--
-- Struttura della tabella `servizio`
--

CREATE TABLE `servizio` (
  `Tipologia` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `servizio`
--

INSERT INTO `servizio` (`Tipologia`) VALUES
('Assistenza sanitaria'),
('Consegna libri'),
('Consegna medicinali'),
('Consegna spesa'),
('Supporto in caso di eventi atmosferici'),
('Supporto psicologico'),
('Trasporti protetti per accessi a servizi e prestazioni socio-sanitarie');

-- --------------------------------------------------------

--
-- Struttura della tabella `sottoassociazione`
--

CREATE TABLE `sottoassociazione` (
  `NomeTerritoriale` varchar(40) NOT NULL,
  `Comune` varchar(40) NOT NULL,
  `Associazione` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `sottoassociazione`
--

INSERT INTO `sottoassociazione` (`NomeTerritoriale`, `Comune`, `Associazione`) VALUES
('Anpas Macerata', 'Auditore', '12345678901'),
('Anpas Macerata', 'Montefeltro', '12345678901'),
('Croce Gialla Ancona', 'Camerata Picena', '23456789012'),
('Croce Gialla Fermo', 'Porto San Giorgio', '23456789012'),
('Enpa Pesaro-Urbino', 'Gabicce Mare', '34567890123'),
('Enpa Pesaro-Urbino', 'Mombaroccio', '34567890123'),
(' Buon Pastore San Benedetto del Tronto', 'San Benedetto del Tronto', '45678901235'),
('Mani di Dio Ascoli Piceno', 'Castel di Lama', '45678901235'),
('Mani di Dio Ascoli Piceno', 'Folignano', '45678901235'),
('ACLI Ancona', 'Camerata Picena', '76543210912'),
('ACLI Fermo', 'Porto San Giorgio', '76543210912'),
('Comitato di Corridonia', 'Corridonia', '87654321091'),
('Comitato di Pesaro Urbino', 'Montecalvo in Foglia', '87654321091'),
('Comitato di Ascoli Piceno', 'Castel di Lama', '98765432101'),
('Comitato di Ascoli Piceno', 'Folignano', '98765432101');

-- --------------------------------------------------------

--
-- Struttura della tabella `telefonata`
--

CREATE TABLE `telefonata` (
  `DataOra` datetime NOT NULL,
  `Durata` tinyint(3) UNSIGNED DEFAULT NULL,
  `Cittadino` char(16) DEFAULT NULL,
  `Operatore` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `telefonata`
--

INSERT INTO `telefonata` (`DataOra`, `Durata`, `Cittadino`, `Operatore`) VALUES
('2020-11-09 12:45:00', 10, 'PRTMRC97D12A462I', 3),
('2020-11-09 17:49:00', 6, 'PLNFBR99F17A537T', 2),
('2020-11-10 09:30:00', 5, 'TRNDVD99C22A462Z', 1),
('2020-11-10 15:49:00', 8, 'MLELSN99C24A462K', 3),
('2020-11-10 18:00:00', 8, 'SBRRBR22A783O', 3),
('2020-11-11 16:40:17', 10, 'MRARSS76P05A463O', 2),
('2020-11-11 16:43:17', 7, 'PRTMRC97D12A462I', 2),
('2020-11-13 17:49:00', 9, 'SPRLXA99E12E467W', 1);

-- --------------------------------------------------------

--
-- Struttura per vista `costiperassociazione`
--
DROP TABLE IF EXISTS `costiperassociazione`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `costiperassociazione`  AS SELECT sum(`notadidebito`.`ImportoPagamento`) AS `CostoTotalePerAssociazione`, `associazione`.`PIVA` AS `PivaAssociazione`, `associazione`.`Nome` AS `NomeAssociazione` FROM (`associazione` join (`prestazione` join `notadidebito` on(`notadidebito`.`Prestazione` = `prestazione`.`CodiceProgressivo`)) on(`associazione`.`PIVA` = `prestazione`.`Associazione`)) WHERE `prestazione`.`DataOra` > '2020-11-11 08:30:00' AND `prestazione`.`DataOra` < '2020-11-18 08:30:00' GROUP BY `associazione`.`PIVA` ;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `associazione`
--
ALTER TABLE `associazione`
  ADD PRIMARY KEY (`PIVA`),
  ADD KEY `Referente` (`Referente`);

--
-- Indici per le tabelle `calendario`
--
ALTER TABLE `calendario`
  ADD PRIMARY KEY (`OrarioInizio`,`OrarioFine`,`Giorno`);

--
-- Indici per le tabelle `cittadino`
--
ALTER TABLE `cittadino`
  ADD PRIMARY KEY (`CF`),
  ADD KEY `Via` (`Via`,`Civico`,`Localita`,`CAP`);

--
-- Indici per le tabelle `disponibilita`
--
ALTER TABLE `disponibilita`
  ADD PRIMARY KEY (`OrarioInizio`,`OrarioFine`,`Giorno`,`Referente`),
  ADD KEY `Referente` (`Referente`);

--
-- Indici per le tabelle `domicilio`
--
ALTER TABLE `domicilio`
  ADD PRIMARY KEY (`Via`,`Civico`,`Localita`,`CAP`);

--
-- Indici per le tabelle `garanzia`
--
ALTER TABLE `garanzia`
  ADD PRIMARY KEY (`NomeTerritoriale`,`Comune`,`Tipologia`),
  ADD KEY `Tipologia` (`Tipologia`);

--
-- Indici per le tabelle `informazione`
--
ALTER TABLE `informazione`
  ADD PRIMARY KEY (`DataOra`),
  ADD KEY `Operatore` (`Operatore`),
  ADD KEY `Referente` (`Referente`);

--
-- Indici per le tabelle `localita`
--
ALTER TABLE `localita`
  ADD PRIMARY KEY (`Comune`);

--
-- Indici per le tabelle `notadidebito`
--
ALTER TABLE `notadidebito`
  ADD PRIMARY KEY (`Codice`),
  ADD KEY `Prestazione` (`Prestazione`);

--
-- Indici per le tabelle `operatore`
--
ALTER TABLE `operatore`
  ADD PRIMARY KEY (`Codice`);

--
-- Indici per le tabelle `prestazione`
--
ALTER TABLE `prestazione`
  ADD PRIMARY KEY (`CodiceProgressivo`),
  ADD KEY `Tipologia` (`Tipologia`),
  ADD KEY `Associazione` (`Associazione`),
  ADD KEY `Cittadino` (`Cittadino`);

--
-- Indici per le tabelle `referente`
--
ALTER TABLE `referente`
  ADD PRIMARY KEY (`CF`);

--
-- Indici per le tabelle `servizio`
--
ALTER TABLE `servizio`
  ADD PRIMARY KEY (`Tipologia`);

--
-- Indici per le tabelle `sottoassociazione`
--
ALTER TABLE `sottoassociazione`
  ADD PRIMARY KEY (`NomeTerritoriale`,`Comune`),
  ADD KEY `Comune` (`Comune`),
  ADD KEY `Associazione` (`Associazione`);

--
-- Indici per le tabelle `telefonata`
--
ALTER TABLE `telefonata`
  ADD PRIMARY KEY (`DataOra`),
  ADD KEY `Cittadino` (`Cittadino`),
  ADD KEY `Operatore` (`Operatore`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `prestazione`
--
ALTER TABLE `prestazione`
  MODIFY `CodiceProgressivo` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `associazione`
--
ALTER TABLE `associazione`
  ADD CONSTRAINT `associazione_ibfk_1` FOREIGN KEY (`Referente`) REFERENCES `referente` (`CF`);

--
-- Limiti per la tabella `cittadino`
--
ALTER TABLE `cittadino`
  ADD CONSTRAINT `cittadino_ibfk_1` FOREIGN KEY (`Via`,`Civico`,`Localita`,`CAP`) REFERENCES `domicilio` (`Via`, `Civico`, `Localita`, `CAP`);

--
-- Limiti per la tabella `disponibilita`
--
ALTER TABLE `disponibilita`
  ADD CONSTRAINT `disponibilita_ibfk_1` FOREIGN KEY (`Referente`) REFERENCES `referente` (`CF`),
  ADD CONSTRAINT `disponibilita_ibfk_2` FOREIGN KEY (`OrarioInizio`,`OrarioFine`,`Giorno`) REFERENCES `calendario` (`OrarioInizio`, `OrarioFine`, `Giorno`);

--
-- Limiti per la tabella `garanzia`
--
ALTER TABLE `garanzia`
  ADD CONSTRAINT `garanzia_ibfk_1` FOREIGN KEY (`NomeTerritoriale`,`Comune`) REFERENCES `sottoassociazione` (`NomeTerritoriale`, `Comune`),
  ADD CONSTRAINT `garanzia_ibfk_2` FOREIGN KEY (`Tipologia`) REFERENCES `servizio` (`Tipologia`);

--
-- Limiti per la tabella `informazione`
--
ALTER TABLE `informazione`
  ADD CONSTRAINT `informazione_ibfk_1` FOREIGN KEY (`Operatore`) REFERENCES `operatore` (`Codice`),
  ADD CONSTRAINT `informazione_ibfk_2` FOREIGN KEY (`Referente`) REFERENCES `referente` (`CF`);

--
-- Limiti per la tabella `notadidebito`
--
ALTER TABLE `notadidebito`
  ADD CONSTRAINT `notadidebito_ibfk_1` FOREIGN KEY (`Prestazione`) REFERENCES `prestazione` (`CodiceProgressivo`);

--
-- Limiti per la tabella `prestazione`
--
ALTER TABLE `prestazione`
  ADD CONSTRAINT `prestazione_ibfk_1` FOREIGN KEY (`Tipologia`) REFERENCES `servizio` (`Tipologia`),
  ADD CONSTRAINT `prestazione_ibfk_2` FOREIGN KEY (`Associazione`) REFERENCES `associazione` (`PIVA`),
  ADD CONSTRAINT `prestazione_ibfk_3` FOREIGN KEY (`Cittadino`) REFERENCES `cittadino` (`CF`);

--
-- Limiti per la tabella `sottoassociazione`
--
ALTER TABLE `sottoassociazione`
  ADD CONSTRAINT `sottoassociazione_ibfk_1` FOREIGN KEY (`Comune`) REFERENCES `localita` (`Comune`),
  ADD CONSTRAINT `sottoassociazione_ibfk_2` FOREIGN KEY (`Associazione`) REFERENCES `associazione` (`PIVA`);

--
-- Limiti per la tabella `telefonata`
--
ALTER TABLE `telefonata`
  ADD CONSTRAINT `telefonata_ibfk_1` FOREIGN KEY (`Cittadino`) REFERENCES `cittadino` (`CF`),
  ADD CONSTRAINT `telefonata_ibfk_2` FOREIGN KEY (`Operatore`) REFERENCES `operatore` (`Codice`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
