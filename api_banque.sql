-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 18, 2020 at 04:53 PM
-- Server version: 5.7.26
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `api_banque`
--

-- --------------------------------------------------------

--
-- Table structure for table `cb`
--

CREATE TABLE `cb` (
  `id` int(11) NOT NULL,
  `uuid` int(11) NOT NULL,
  `exp` date NOT NULL,
  `cryptogramme` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `compte_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cb`
--

INSERT INTO `cb` (`id`, `uuid`, `exp`, `cryptogramme`, `code`, `active`, `user_id`, `compte_id`) VALUES
(1, 1234, '2021-07-07', 234, 1234, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `compte`
--

CREATE TABLE `compte` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `fonds` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `actif` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `compte`
--

INSERT INTO `compte` (`id`, `user_id`, `fonds`, `type`, `actif`) VALUES
(1, 1, 30, 'livret a', 1);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `montant` int(11) NOT NULL,
  `valide` tinyint(1) NOT NULL,
  `moyenPaiement` varchar(255) NOT NULL,
  `compte_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `date`, `montant`, `valide`, `moyenPaiement`, `compte_id`) VALUES
(1, '2020-10-07', 10, 1, 'carte bancaire', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` json NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nom`, `prenom`, `email`, `password`, `role`) VALUES
(1, 'Battut', 'Théo', 'theo.battut@maigre.fr', '$2y$10$SCwgmdjQpVR9dRdBDPhhMO34wv3nXu5Hrn.Cn8Kq3tfhxUQjVsi0i', '[\"ROLE_USER\"]'),
(3, 'Woodhouse', 'oscar', 'oscar@woodhouse.fr', '$2y$10$k3MZ4AgMX/HNew0/8RzW3.O9zxkQIQ051C4xGwQpJW29wXPB900BG', '[\"ROLE_USER\"]'),
(4, 'Manraj', 'prameet', 'prameet@manraj.fr', '$2y$10$pOxC/Q0WciiwmxlLt5a.6eetBnlwLr8dtJH/MGjOAQwZJvSyhUXu.', '[\"ROLE_USER\"]'),
(6, 'Papin', 'Balthazar', 'balth@papin.fr', '$2y$10$BrTv6eahGJdlBNvTGgO9b.z3tsvby3XubxYywRpkNHXGOFWZq2.ge', '[\"ROLE_USER\"]');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cb`
--
ALTER TABLE `cb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `compte_id` (`compte_id`);

--
-- Indexes for table `compte`
--
ALTER TABLE `compte`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compte_id` (`compte_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cb`
--
ALTER TABLE `cb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `compte`
--
ALTER TABLE `compte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cb`
--
ALTER TABLE `cb`
  ADD CONSTRAINT `cb_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `cb_ibfk_2` FOREIGN KEY (`compte_id`) REFERENCES `compte` (`id`);

--
-- Constraints for table `compte`
--
ALTER TABLE `compte`
  ADD CONSTRAINT `compte_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`compte_id`) REFERENCES `compte` (`id`);