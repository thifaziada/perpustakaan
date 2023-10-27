-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Okt 2023 pada 06.33
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `books`
--

CREATE TABLE `books` (
  `id` bigint(11) NOT NULL,
  `idbuku` int(10) NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `idkategori` bigint(20) UNSIGNED NOT NULL,
  `pengarang` varchar(255) NOT NULL,
  `penerbit` varchar(255) NOT NULL,
  `kota_terbit` varchar(255) NOT NULL,
  `editor` varchar(255) NOT NULL,
  `file_gambar` varchar(255) NOT NULL,
  `stok` int(11) NOT NULL,
  `stok_tersedia` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `books`
--

INSERT INTO `books` (`id`, `idbuku`, `isbn`, `judul`, `idkategori`, `pengarang`, `penerbit`, `kota_terbit`, `editor`, `file_gambar`, `stok`, `stok_tersedia`, `created_at`, `updated_at`) VALUES
(1, 1, '123-456-789', 'Janji', 3, 'Tere Liye', 'xyz', 'Jakarta', 'abc', 'IyQUFWWh4cuc1sn11FEB3sG108t6tcwlQKyUaFyD.jpg', 3, 3, '2023-10-23 20:51:15', '2023-10-23 20:51:15'),
(2, 2, '9780747591054', 'Harry Potter and the Deathly Hallows', 2, 'Rowling J K', 'Bloomsbury', 'Wolverhampton', 'Rowling J K', 'MEfe8vrhN33JHMq2NJBsaa8Toff9u1Pvx7edPmSB.jpg', 5, 4, '2023-10-26 20:33:16', '2023-10-26 20:33:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `idkategori` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`idkategori`, `nama`, `created_at`, `updated_at`) VALUES
(1, 'Education', '2023-10-27 03:17:47', '2023-10-27 03:17:47'),
(2, 'Fiksi', '2023-10-27 03:11:08', '2023-10-27 03:11:08'),
(3, 'Novel', '2023-10-27 03:17:10', '2023-10-27 03:17:33'),
(4, 'Romance', '2023-10-27 03:15:56', '2023-10-27 03:15:56'),
(5, 'Komik', '2023-10-27 03:15:56', '2023-10-27 03:15:56'),
(6, 'Lifestyle', '2023-10-27 03:15:56', '2023-10-27 03:15:56'),
(7, 'Teknologi', '2023-10-27 03:15:56', '2023-10-27 03:15:56'),
(8, 'Sejarah', '2023-10-27 03:15:56', '2023-10-27 03:15:56'),
(9, 'Horor', '2023-10-27 03:15:56', '2023-10-27 03:15:56'),
(10, 'Comedy', '2023-10-27 03:15:56', '2023-10-27 03:15:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idkomentar` int(11) NOT NULL,
  `komentar` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `book_id` bigint(20) DEFAULT NULL,
  `noktp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `comments`
--

INSERT INTO `comments` (`id`, `idkomentar`, `komentar`, `created_at`, `updated_at`, `book_id`, `noktp`) VALUES
(1, 1, 'Bagus', NULL, NULL, 1, '1234572757137');

-- --------------------------------------------------------

--
-- Struktur dari tabel `details`
--

CREATE TABLE `details` (
  `idtransaksi` int(5) NOT NULL,
  `idbuku` int(11) NOT NULL,
  `tgl_kembali` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `denda` int(11) NOT NULL,
  `idpetugas` int(5) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `details`
--

INSERT INTO `details` (`idtransaksi`, `idbuku`, `tgl_kembali`, `denda`, `idpetugas`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-10-24 17:38:51', 5000, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `libraries`
--

CREATE TABLE `libraries` (
  `idpetugas` int(5) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `libraries`
--

INSERT INTO `libraries` (`idpetugas`, `nama`, `email`, `password`) VALUES
(1, 'natan', 'nat@natan.com', 'natan123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `members`
--

CREATE TABLE `members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `noktp` varchar(15) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `kota` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `no_telp` varchar(255) NOT NULL,
  `file_ktp` varchar(255) NOT NULL,
  `remember_token` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `members`
--

INSERT INTO `members` (`id`, `noktp`, `nama`, `password`, `alamat`, `kota`, `email`, `email_verified_at`, `no_telp`, `file_ktp`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, '1000', 'zia', 'zia123', 'smrg', 'smrg', 'zi@zia.com', NULL, '08888827', 'n2AVDhUBQQFI7MM2KWWBrZ6HNr9RN56Zq8KfDgRi.jpg', '', '2023-10-24 02:32:28', '2023-10-24 02:32:28'),
(3, '1234', 'zeno', 'zen123', 'jkt', 'jkt', 'zen@zen.com', NULL, '08123', 'dPI7poCJ4D8yaDGzdQDHtn1jeQnTDnMdFxDTpDQZ.jpg', '', '2023-10-24 09:33:51', '2023-10-24 09:33:51'),
(1, '1234572757137', 'Thifa', 'thifa123', 'bulusan', 'semarang', 'thifa@thifa.com', NULL, '0812762733', '85zl2f7G7P4OznvPNrxwFsiDaQFa8thTiJ8k2C9M.jpg', '', '2023-10-23 21:09:17', '2023-10-23 21:09:17'),
(4, '150601111111111', 'Zhafira Amanda', 'zhafira123', 'JL. Timoho 4 Bulusan', 'Bangka Belitung', 'zhafira@zhafira.com', NULL, '082111111111', '', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_10_22_061922_create_books_table', 2),
(6, '2023_10_22_070555_create_categories_table', 2),
(7, '2023_10_23_130901_create_members_table', 3),
(8, '2023_10_24_041342_create_ratings_table', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ratings`
--

CREATE TABLE `ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `skor_rating` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `noktp` varchar(15) DEFAULT NULL,
  `book_id` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `ratings`
--

INSERT INTO `ratings` (`id`, `skor_rating`, `created_at`, `updated_at`, `noktp`, `book_id`) VALUES
(1, 5, NULL, NULL, NULL, 1),
(2, 4, '2023-10-24 06:59:02', '2023-10-24 06:59:02', '1000', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED DEFAULT NULL,
  `idtransaksi` int(5) NOT NULL,
  `noktp` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_pinjam` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idpetugas` int(5) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transactions`
--

INSERT INTO `transactions` (`id`, `idtransaksi`, `noktp`, `tgl_pinjam`, `idpetugas`, `created_at`, `updated_at`) VALUES
(0, 1, '1000', '2023-10-24 17:38:17', 1, NULL, NULL),
(NULL, 2, '1000', '2023-10-24 11:52:35', 1, '2023-10-24 11:52:35', '2023-10-24 11:52:35'),
(NULL, 3, '1234', '2023-10-24 11:54:27', 1, '2023-10-24 11:54:27', '2023-10-24 11:54:27'),
(NULL, 4, '1234', '2023-10-24 11:56:24', 1, '2023-10-24 11:56:24', '2023-10-24 11:56:24'),
(NULL, 5, '1000', '2023-10-24 11:58:46', 1, '2023-10-24 11:58:46', '2023-10-24 11:58:46'),
(NULL, 6, '1000', '2023-10-24 12:07:05', 1, '2023-10-24 12:07:05', '2023-10-24 12:07:05'),
(NULL, 7, '1000', '2023-10-24 12:08:26', 1, '2023-10-24 12:08:26', '2023-10-24 12:08:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idbuku` (`idbuku`),
  ADD KEY `fk_books_categories` (`idkategori`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`idkategori`);

--
-- Indeks untuk tabel `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comments_books` (`book_id`),
  ADD KEY `fk_comments_members` (`noktp`);

--
-- Indeks untuk tabel `details`
--
ALTER TABLE `details`
  ADD KEY `fk_details_transactions` (`idtransaksi`),
  ADD KEY `fk_details_libraries` (`idpetugas`),
  ADD KEY `fk_details_books` (`idbuku`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `libraries`
--
ALTER TABLE `libraries`
  ADD PRIMARY KEY (`idpetugas`);

--
-- Indeks untuk tabel `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`noktp`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id` (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ratings_members` (`noktp`),
  ADD KEY `fk_ratings_books` (`book_id`);

--
-- Indeks untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`idtransaksi`),
  ADD KEY `fk_transactions_libraries` (`idpetugas`),
  ADD KEY `id` (`id`),
  ADD KEY `fk_transaction_members` (`noktp`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `idkategori` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `fk_books_categories` FOREIGN KEY (`idkategori`) REFERENCES `categories` (`idkategori`);

--
-- Ketidakleluasaan untuk tabel `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_books` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `fk_comments_members` FOREIGN KEY (`noktp`) REFERENCES `members` (`noktp`);

--
-- Ketidakleluasaan untuk tabel `details`
--
ALTER TABLE `details`
  ADD CONSTRAINT `fk_details_books` FOREIGN KEY (`idbuku`) REFERENCES `books` (`idbuku`),
  ADD CONSTRAINT `fk_details_libraries` FOREIGN KEY (`idpetugas`) REFERENCES `libraries` (`idpetugas`),
  ADD CONSTRAINT `fk_details_transactions` FOREIGN KEY (`idtransaksi`) REFERENCES `transactions` (`idtransaksi`);

--
-- Ketidakleluasaan untuk tabel `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `fk_ratings_books` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `fk_ratings_members` FOREIGN KEY (`noktp`) REFERENCES `members` (`noktp`);

--
-- Ketidakleluasaan untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `fk_transaction_members` FOREIGN KEY (`noktp`) REFERENCES `members` (`noktp`),
  ADD CONSTRAINT `fk_transactions_libraries` FOREIGN KEY (`idpetugas`) REFERENCES `libraries` (`idpetugas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
