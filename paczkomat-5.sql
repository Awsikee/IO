-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 09 Cze 2020, 18:28
-- Wersja serwera: 10.4.11-MariaDB
-- Wersja PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `paczkomat`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `finanse`
--

CREATE TABLE `finanse` (
  `customerNumber` int(11) NOT NULL,
  `checkNumber` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `paymentDate` date NOT NULL,
  `amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `finanse`
--

INSERT INTO `finanse` (`customerNumber`, `checkNumber`, `paymentDate`, `amount`) VALUES
(1, 'HQ336336', '2020-02-01', '21.32'),
(2, 'JM555205', '2020-06-02', '11.73'),
(3, 'OM314933', '2020-06-03', '15.83'),
(4, 'BO864823', '2020-01-23', '16.24'),
(5, 'AE215433', '2020-01-28', '27.12');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `customerNumber` int(11) NOT NULL,
  `contactLastName` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `contactFirstName` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `addressLine` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `city` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `country` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `postalCode` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `klienci`
--

INSERT INTO `klienci` (`customerNumber`, `contactLastName`, `contactFirstName`, `phone`, `addressLine`, `city`, `country`, `postalCode`) VALUES
(41, 'Stronko', 'Dariusz', '564978361', 'Poniatowskiego 7', 'Poznań', 'Poland', '60-001'),
(42, 'Miszna', 'Magda', '663801483', 'Wojska Polskiego 16', 'Kraków', 'Poland', '30-001 '),
(43, 'Halak', 'Michał', '899732742', 'Stoisława 2', 'Szczecin', 'Poland', '70-001'),
(44, 'Matuszkiewicz', 'Bogdan', '989241531', 'Chopina 32', 'Szczecin', 'Poland', '70-001'),
(45, 'Siwko', 'Ania', '788421753', 'Niemcewicza 31', 'Kraków', 'Poland', '30-001 ');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kurierzy`
--

CREATE TABLE `kurierzy` (
  `courierID` int(11) NOT NULL,
  `contactLastName` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `contactFirstName` varchar(59) COLLATE utf8mb4_polish_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `kurierzy`
--

INSERT INTO `kurierzy` (`courierID`, `contactLastName`, `contactFirstName`, `phone`) VALUES
(21, 'Major', 'Karol', '843217583'),
(22, 'Wojciechowski', 'Konrad', '639738095'),
(23, 'Murarz', 'Adrian', '609215837'),
(20, 'Sztuba', 'Zosia', '536985285'),
(24, 'Golis', 'Judyta', '542793727');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `paczki`
--

CREATE TABLE `paczki` (
  `boxID` int(11) NOT NULL,
  `sizeX` int(11) NOT NULL,
  `sizeY` int(11) NOT NULL,
  `sizeZ` int(11) NOT NULL,
  `state` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `phone` varchar(100) COLLATE utf8mb4_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `paczki`
--

INSERT INTO `paczki` (`boxID`, `sizeX`, `sizeY`, `sizeZ`, `state`, `phone`) VALUES
(12, 20, 30, 10, 'Shipped', '899732742'),
(11, 23, 43, 21, 'in transit', '663801483'),
(10, 11, 11, 5, 'in transit', '564978361'),
(13, 32, 32, 15, 'Shipped', '989241531'),
(14, 15, 15, 8, 'Shipped', '788421753');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `paczkomaty`
--

CREATE TABLE `paczkomaty` (
  `lockerID` int(11) NOT NULL,
  `addressLine` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `capacity` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `orderID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `paczkomaty`
--

INSERT INTO `paczkomaty` (`lockerID`, `addressLine`, `capacity`, `orderID`) VALUES
(12, 'Kraków, Niemcewicza 31', '13', 12),
(32, 'Kraków, Wojska Polskiego 19', '23', 13),
(52, 'Szczecin, Stoisława 3', '34', 10),
(53, 'Szczecin, Chopina 30', '21', 11),
(63, 'Poznań, Poniatowskiego 1', '28', 14);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamówienia`
--

CREATE TABLE `zamówienia` (
  `orderNumber` int(11) NOT NULL,
  `orderDate` date NOT NULL,
  `requiredDate` date NOT NULL,
  `shippedDate` date NOT NULL,
  `status` varchar(15) COLLATE utf8mb4_polish_ci NOT NULL,
  `comments` text COLLATE utf8mb4_polish_ci NOT NULL,
  `customerNumber` int(11) NOT NULL,
  `boxID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `zamówienia`
--

INSERT INTO `zamówienia` (`orderNumber`, `orderDate`, `requiredDate`, `shippedDate`, `status`, `comments`, `customerNumber`, `boxID`) VALUES
(10, '2020-01-20', '2020-06-29', '2020-06-25', 'Shipped', 'NULL', 41, 10),
(11, '2020-01-19', '2020-01-30', '2020-01-24', 'Shipped', 'NULL', 42, 11),
(12, '2020-02-02', '2020-02-13', '2020-02-11', 'Shipped', 'NULL', 43, 12),
(13, '2020-02-06', '2020-02-17', '2020-02-14', 'Shipped', 'NULL', 44, 13),
(14, '2020-02-23', '2020-03-04', '2020-03-02', 'Shipped', 'NULL', 45, 14);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
