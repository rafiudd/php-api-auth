
-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Inang: localhost
-- Waktu pembuatan: 07 Mei 2018 pada 10.35
-- Versi Server: 10.1.20-MariaDB
-- Versi PHP: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Basis data: `u104480431_egub`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `pilihan_poll`
--

CREATE TABLE IF NOT EXISTS `pilihan_poll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_poll` int(11) NOT NULL,
  `nama` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dibuat` datetime NOT NULL,
  `diubah` datetime NOT NULL,
  `status` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_poll` (`id_poll`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data untuk tabel `pilihan_poll`
--

INSERT INTO `pilihan_poll` (`id`, `id_poll`, `nama`, `dibuat`, `diubah`, `status`) VALUES
(1, 1, 'Ganjar Pranowo', '2017-02-23 09:00:00', '2017-02-23 09:00:00', '1'),
(2, 1, 'Sudirman Sahid', '2017-02-23 09:00:00', '2017-02-23 09:00:00', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `poll`
--

CREATE TABLE IF NOT EXISTS `poll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tanya` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dibuat` datetime NOT NULL,
  `diubah` datetime NOT NULL,
  `status` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data untuk tabel `poll`
--

INSERT INTO `poll` (`id`, `tanya`, `dibuat`, `diubah`, `status`) VALUES
(1, 'Pilih CaGub-CaWaGub dibawah ini dengan Hati Nurani Anda.', '2017-02-23 08:00:00', '2017-02-23 08:00:00', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `poll_vote`
--

CREATE TABLE IF NOT EXISTS `poll_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_poll` int(11) NOT NULL,
  `id_pilihan_poll` int(11) NOT NULL,
  `id_user` int(255) NOT NULL,
  `jumlah_vote` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_poll` (`id_poll`),
  KEY `id_pilihan_poll` (`id_pilihan_poll`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data untuk tabel `poll_vote`
--

INSERT INTO `poll_vote` (`id`, `id_poll`, `id_pilihan_poll`, `id_user`, `jumlah_vote`) VALUES
(1, 1, 2, 0, 16),
(3, 1, 1, 0, 19);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `level` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `status`, `level`) VALUES
(3, 'test1234@pilgub.com', 'e10adc3949ba59abbe56e057f20f883e', 'on', 'ppds'),
(4, 'asdasdfghfd@pilgub.com', 'e10adc3949ba59abbe56e057f20f883e', 'on', 'ppds'),
(5, 'asdasdfghfd@pilgub.com', 'e10adc3949ba59abbe56e057f20f883e', 'on', 'ppds'),
(6, 'asdasdfghfd@pilgub.com', 'e10adc3949ba59abbe56e057f20f883e', 'on', 'ppds'),
(7, 'asdasdfghfd@pilgub.com', 'e10adc3949ba59abbe56e057f20f883e', 'on', 'ppds'),
(8, 'asdasdfghfd@pilgub.com', 'e10adc3949ba59abbe56e057f20f883e', 'on', 'ppds'),
(9, 'asdasdfghfd@pilgub.com', 'e10adc3949ba59abbe56e057f20f883e', 'on', 'ppds'),
(10, 'asdasdfghfd@pilgub.com', 'e10adc3949ba59abbe56e057f20f883e', 'on', 'ppds'),
(11, 'asdasdfghfd@pilgub.com', 'e10adc3949ba59abbe56e057f20f883e', 'on', 'ppds'),
(12, 'asdasdfghfd@pilgub.com', 'e10adc3949ba59abbe56e057f20f883e', 'on', 'ppds'),
(13, 'asdasdfghfd@pilgub.com', 'e10adc3949ba59abbe56e057f20f883e', 'on', 'ppds'),
(14, 'gfddsfs@pilgub.com', 'e10adc3949ba59abbe56e057f20f883e', 'on', 'ppds'),
(15, 'gfddsfs@pilgub.com', 'e10adc3949ba59abbe56e057f20f883e', 'on', 'ppds'),
(16, 'test@pilgub.com', '75f34b5502bec3c609734fdf4d37fa5c', 'off', 'umum'),
(17, 'test12@pilgub.com', 'e10adc3949ba59abbe56e057f20f883e', 'on', 'ppds'),
(18, 'aic', 'e10adc3949ba59abbe56e057f20f883e', 'on', 'ppds'),
(19, 'test@a.vv', '35a3f4581cf159a572aac3acca5bc599', 'off', 'umum'),
(20, 'off@off.com', 'e10adc3949ba59abbe56e057f20f883e', 'on', 'umum'),
(22, 'jdidu@jdjdj.ddd', 'c3b20e2f32cbb1b91603ca492a70c186', 'off', 'umum'),
(21, 'asdoff@off.com', 'e10adc3949ba59abbe56e057f20f883e', 'off', 'umum');

-- --------------------------------------------------------

--
-- Struktur dari tabel `vote`
--

CREATE TABLE IF NOT EXISTS `vote` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `id_user` int(255) NOT NULL,
  `pilihan` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data untuk tabel `vote`
--

INSERT INTO `vote` (`id`, `id_user`, `pilihan`) VALUES
(1, 1, '0'),
(2, 3, 'Ganjar Pranowo'),
(3, 4, 'Ganjar Pranowo');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
