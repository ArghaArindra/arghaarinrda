-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Okt 2024 pada 01.22
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `expense_tracker`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `category` enum('aktiva','kewajiban','ekuitas') NOT NULL,
  `description` enum('beban rumah tangga','beban hobi','beban sosial','beban tak terduga','beban pajak','beban liburan') NOT NULL,
  `notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `expenses`
--

INSERT INTO `expenses` (`id`, `user_id`, `date`, `amount`, `category`, `description`, `notes`) VALUES
(2, 2, '2024-10-03', 250000.00, 'aktiva', 'beban sosial', 'Jajan'),
(3, 2, '2024-10-03', 100000.00, 'aktiva', 'beban hobi', 'Beli Gacoan'),
(4, 2, '2024-10-04', 120000.00, 'aktiva', 'beban sosial', 'Beli camilan'),
(5, 3, '2024-10-04', 67000.00, 'aktiva', 'beban rumah tangga', 'Beli sabun cuci'),
(6, 2, '2024-10-21', 200000.00, 'aktiva', 'beban tak terduga', 'Ganti rugi pot bunga'),
(7, 2, '2024-10-15', 100000.00, 'kewajiban', 'beban rumah tangga', 'Beli sapu'),
(8, 2, '2024-10-21', 2000000.00, 'aktiva', 'beban hobi', 'Beli buku Atomic Habits'),
(9, 2, '2024-10-27', 10000000.00, 'kewajiban', 'beban pajak', 'Bayar pajak motor per 5 tahun'),
(10, 2, '2024-10-28', 200000.00, 'aktiva', 'beban rumah tangga', 'Beli peralatan bersih bersih baru');

-- --------------------------------------------------------

--
-- Struktur dari tabel `incomes`
--

CREATE TABLE `incomes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `category` enum('aktiva','kewajiban','ekuitas') NOT NULL,
  `descriptions` enum('kas','dividen saham','gaji','pendapatan tambahan') NOT NULL,
  `notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `incomes`
--

INSERT INTO `incomes` (`id`, `user_id`, `date`, `amount`, `category`, `descriptions`, `notes`) VALUES
(1, 2, '2024-10-15', 15000000.00, 'aktiva', 'gaji', 'Gajian'),
(2, 3, '2024-10-04', 5000000.00, 'ekuitas', 'dividen saham', 'Dividen saham BBCA'),
(3, 2, '2024-11-19', 20000000.00, 'aktiva', 'kas', 'Gajian'),
(5, 2, '2024-10-24', 5000000.00, 'aktiva', 'pendapatan tambahan', 'Projek web real-time'),
(6, 2, '2024-10-31', 5000000.00, 'aktiva', 'pendapatan tambahan', 'Dividen untung saham'),
(13, 2, '2024-10-24', 12000000.00, 'ekuitas', 'dividen saham', 'Dividen Saham BBRI'),
(15, 2, '2024-10-28', 0.00, 'ekuitas', '', 'dividen saham');

-- --------------------------------------------------------

--
-- Struktur dari tabel `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction`
--

CREATE TABLE `transaction` (
  `id_transaction` varchar(50) NOT NULL,
  `nama_transaction` varchar(250) DEFAULT NULL,
  `nominal` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `category` enum('aktiva','kewajiban','ekuitas') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaction`
--

INSERT INTO `transaction` (`id_transaction`, `nama_transaction`, `nominal`, `date`, `category`) VALUES
('001', 'bayar pajak', 20000000, '2024-10-24', 'kewajiban'),
('002', 'Dividen per bulan saham', 134000000, '2024-10-25', 'ekuitas'),
('003', 'Gaji', 30000000, '2024-10-15', 'aktiva');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gambar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `gambar`) VALUES
(2, 'Kenzo210208', '$2y$10$kdHpvIJ94TADpTEowffWPOaxrHTg6DofBKf4DjmGglEUDOmXP0.46', ''),
(3, 'Ajax_3-1', '$2y$10$DTZH.hxOtadBSI2lSt3wuePFagLJ0FtHU1poEKIqnl7u6qV2w3UJK', ''),
(6, 'aldi', '$2y$10$1KRMRNl2BwlaBS/DJnbKaOWp8izJfPnBkvqpec3Z.Njlru2zGCzSq', ''),
(8, 'putra', '$2y$10$KVOxQLHRZQJkqqmWmbVZI.x4.K1TjnammsyegXvgxzDpQ6cQ4mSIG', '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_expense_user` (`user_id`);

--
-- Indeks untuk tabel `incomes`
--
ALTER TABLE `incomes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_incomes_user` (`user_id`);

--
-- Indeks untuk tabel `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `from_user_id` (`from_user_id`),
  ADD KEY `to_user_id` (`to_user_id`);

--
-- Indeks untuk tabel `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id_transaction`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `incomes`
--
ALTER TABLE `incomes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_expense_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `incomes`
--
ALTER TABLE `incomes`
  ADD CONSTRAINT `fk_incomes_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `incomes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
