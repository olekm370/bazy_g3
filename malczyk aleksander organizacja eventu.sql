-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 11 Lis 2020, 16:40
-- Wersja serwera: 10.0.28-MariaDB-2+b1
-- Wersja PHP: 7.3.11-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `malczyka`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dzial`
--

CREATE TABLE `dzial` (
  `id` int(11) NOT NULL,
  `Nazwa` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `dzial`
--

INSERT INTO `dzial` (`id`, `Nazwa`) VALUES
(1, 'sekretariat');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `email`
--

CREATE TABLE `email` (
  `id` int(11) NOT NULL,
  `ID_firma` int(11) DEFAULT NULL,
  `id_dzial` int(11) DEFAULT NULL,
  `mail` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `email`
--

INSERT INTO `email` (`id`, `ID_firma`, `id_dzial`, `mail`) VALUES
(1, 1, 1, 'firma@o2.pl');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kontrachenci`
--

CREATE TABLE `kontrachenci` (
  `nip` int(11) NOT NULL,
  `Firma` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `id_miasto` int(11) DEFAULT NULL,
  `id_ulica` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `kontrachenci`
--

INSERT INTO `kontrachenci` (`nip`, `Firma`, `id_miasto`, `id_ulica`) VALUES
(134, 'firma', 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `miasto`
--

CREATE TABLE `miasto` (
  `id` int(11) NOT NULL,
  `Nazwa` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `miasto`
--

INSERT INTO `miasto` (`id`, `Nazwa`) VALUES
(1, 'Olsztyn');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownik`
--

CREATE TABLE `pracownik` (
  `id` int(11) NOT NULL,
  `Imie` varchar(15) COLLATE utf8_polish_ci DEFAULT NULL,
  `nazwisko` varchar(25) COLLATE utf8_polish_ci DEFAULT NULL,
  `id_ulica` int(11) DEFAULT NULL,
  `id_miasto` int(11) DEFAULT NULL,
  `Pensja` float DEFAULT NULL,
  `premia` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `pracownik`
--

INSERT INTO `pracownik` (`id`, `Imie`, `nazwisko`, `id_ulica`, `id_miasto`, `Pensja`, `premia`) VALUES
(1, 'Mariusz', 'Kowalik', 1, 1, 50, -25);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rozliczenie`
--

CREATE TABLE `rozliczenie` (
  `id` int(11) NOT NULL,
  `id_wydarzenie` int(11) DEFAULT NULL,
  `koszt` float DEFAULT NULL,
  `zysk` float DEFAULT NULL,
  `dochod` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `rozliczenie`
--

INSERT INTO `rozliczenie` (`id`, `id_wydarzenie`, `koszt`, `zysk`, `dochod`) VALUES
(1, 1, 325, 800, 475);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ulica`
--

CREATE TABLE `ulica` (
  `id` int(11) NOT NULL,
  `Nazwa` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `ulica`
--

INSERT INTO `ulica` (`id`, `Nazwa`) VALUES
(1, 'Warminska');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wydarzenie`
--

CREATE TABLE `wydarzenie` (
  `id` int(11) NOT NULL,
  `id_pracownik` int(11) DEFAULT NULL,
  `id_miasto` int(11) DEFAULT NULL,
  `id_ulica` int(11) DEFAULT NULL,
  `id_kontrachenci` int(11) DEFAULT NULL,
  `ilosc_uczestnikow` int(11) DEFAULT NULL,
  `data` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `wydarzenie`
--

INSERT INTO `wydarzenie` (`id`, `id_pracownik`, `id_miasto`, `id_ulica`, `id_kontrachenci`, `ilosc_uczestnikow`, `data`) VALUES
(1, 1, 1, 1, 1, 5, '2020-06-04');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `dzial`
--
ALTER TABLE `dzial`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Nazwa` (`Nazwa`);

--
-- Indeksy dla tabeli `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `kontrachenci`
--
ALTER TABLE `kontrachenci`
  ADD PRIMARY KEY (`nip`),
  ADD UNIQUE KEY `Firma` (`Firma`);

--
-- Indeksy dla tabeli `miasto`
--
ALTER TABLE `miasto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Nazwa` (`Nazwa`);

--
-- Indeksy dla tabeli `pracownik`
--
ALTER TABLE `pracownik`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `rozliczenie`
--
ALTER TABLE `rozliczenie`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `ulica`
--
ALTER TABLE `ulica`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Nazwa` (`Nazwa`);

--
-- Indeksy dla tabeli `wydarzenie`
--
ALTER TABLE `wydarzenie`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `dzial`
--
ALTER TABLE `dzial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `email`
--
ALTER TABLE `email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `miasto`
--
ALTER TABLE `miasto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `pracownik`
--
ALTER TABLE `pracownik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `rozliczenie`
--
ALTER TABLE `rozliczenie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `ulica`
--
ALTER TABLE `ulica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `wydarzenie`
--
ALTER TABLE `wydarzenie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
