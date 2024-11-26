-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Nov 26, 2024 alle 13:51
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ticket_management`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `admin`
--

INSERT INTO `admin` (`id`, `nome`, `email`) VALUES
(1, 'Admin Admin', 'admin.admin@admin.com');

-- --------------------------------------------------------

--
-- Struttura della tabella `aggiornamenti_ticket`
--

CREATE TABLE `aggiornamenti_ticket` (
  `id` int(11) NOT NULL,
  `id_ticket` int(11) NOT NULL,
  `id_tecnico` int(11) DEFAULT NULL,
  `descrizione` text NOT NULL,
  `data_aggiornamento` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `clienti`
--

CREATE TABLE `clienti` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `partita_iva` char(11) DEFAULT NULL,
  `cf` char(16) NOT NULL,
  `indirizzo` varchar(255) NOT NULL,
  `telefono` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `risoluzione_ticket`
--

CREATE TABLE `risoluzione_ticket` (
  `id` int(11) NOT NULL,
  `id_ticket` int(11) NOT NULL,
  `id_tecnico` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `data_risoluzione` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `stato_ticket`
--

CREATE TABLE `stato_ticket` (
  `id` int(11) NOT NULL,
  `stato` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `stato_ticket`
--

INSERT INTO `stato_ticket` (`id`, `stato`) VALUES
(1, 'Aperto'),
(3, 'Chiuso'),
(2, 'In Lavorazione');

-- --------------------------------------------------------

--
-- Struttura della tabella `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_stato` int(11) DEFAULT 1,
  `descrizione` text NOT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE `utenti` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `ruolo` enum('cliente','tecnico') NOT NULL,
  `last_access` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_cliente` int(11) DEFAULT NULL,
  `id_admin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`id`, `username`, `password`, `ruolo`, `last_access`, `id_cliente`, `id_admin`) VALUES
(1, 'Admin', 'Admin', 'tecnico', '2024-11-26 10:54:22', NULL, 1);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indici per le tabelle `aggiornamenti_ticket`
--
ALTER TABLE `aggiornamenti_ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_ticket` (`id_ticket`),
  ADD KEY `id_tecnico` (`id_tecnico`);

--
-- Indici per le tabelle `clienti`
--
ALTER TABLE `clienti`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cf` (`cf`),
  ADD UNIQUE KEY `telefono` (`telefono`),
  ADD UNIQUE KEY `partita_iva` (`partita_iva`);

--
-- Indici per le tabelle `risoluzione_ticket`
--
ALTER TABLE `risoluzione_ticket`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_ticket` (`id_ticket`),
  ADD KEY `id_tecnico` (`id_tecnico`);

--
-- Indici per le tabelle `stato_ticket`
--
ALTER TABLE `stato_ticket`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stato` (`stato`);

--
-- Indici per le tabelle `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_stato` (`id_stato`);

--
-- Indici per le tabelle `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_admin` (`id_admin`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `aggiornamenti_ticket`
--
ALTER TABLE `aggiornamenti_ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `clienti`
--
ALTER TABLE `clienti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `risoluzione_ticket`
--
ALTER TABLE `risoluzione_ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `stato_ticket`
--
ALTER TABLE `stato_ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `utenti`
--
ALTER TABLE `utenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `aggiornamenti_ticket`
--
ALTER TABLE `aggiornamenti_ticket`
  ADD CONSTRAINT `aggiornamenti_ticket_ibfk_1` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `aggiornamenti_ticket_ibfk_2` FOREIGN KEY (`id_tecnico`) REFERENCES `admin` (`id`) ON DELETE SET NULL;

--
-- Limiti per la tabella `risoluzione_ticket`
--
ALTER TABLE `risoluzione_ticket`
  ADD CONSTRAINT `risoluzione_ticket_ibfk_1` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `risoluzione_ticket_ibfk_2` FOREIGN KEY (`id_tecnico`) REFERENCES `admin` (`id`) ON DELETE SET NULL;

--
-- Limiti per la tabella `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clienti` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`id_stato`) REFERENCES `stato_ticket` (`id`);

--
-- Limiti per la tabella `utenti`
--
ALTER TABLE `utenti`
  ADD CONSTRAINT `utenti_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clienti` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `utenti_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
