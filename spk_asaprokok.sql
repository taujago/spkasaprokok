-- phpMyAdmin SQL Dump
-- version 4.4.3
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 01, 2019 at 01:07 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `spk_asaprokok`
--

-- --------------------------------------------------------

--
-- Table structure for table `gejala`
--

CREATE TABLE IF NOT EXISTS `gejala` (
  `id` int(11) NOT NULL,
  `gejala` varchar(255) NOT NULL,
  `kode` varchar(10) DEFAULT NULL,
  `bobot` float NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gejala`
--

INSERT INTO `gejala` (`id`, `gejala`, `kode`, `bobot`) VALUES
(154, 'Anemia (Kurang Darah), ciri-cirinya seperti kulit pucat', 'G1', 2),
(155, 'Batuk berdarah', 'G2', 6),
(156, 'Batuk terus-menerus secara berulang', 'G3', 6),
(157, 'Bengkak pada leher dan bagian wajah', 'G4', 2),
(158, 'Berat badan menurun', 'G5', 4),
(159, 'Berkurangnya nafsu makan', 'G6', 2),
(160, 'Demam', 'G7', 4),
(161, 'Denyut jantung yang tidak normal', 'G8', 4),
(162, 'Insomnia atau susah tidur', 'G9', 2),
(163, 'Kelelahan', 'G10', 6),
(164, 'Kesulitan saat mengunyah, menelan dan berbicara', 'G11', 4),
(165, 'Merasa pusing bahkan pingsan', 'G12', 2),
(166, 'Mimisan', 'G13', 2),
(167, 'Mual bahkan muntah', 'G14', 2),
(168, 'Nyeri bahu dan bagian punggung', 'G15', 2),
(169, 'Nyeri pada tulang', 'G16', 2),
(170, 'Pendarahan vagina diluar masa haid', 'G17', 2),
(171, 'Peningkatan lender dan dahak pada rongga mulut', 'G18', 2),
(172, 'Rasa nyeri didada dalam waktu lama', 'G19', 2),
(173, 'Rasa nyeri pada tenggorokan tembus pada rongga mulut', 'G20', 2),
(174, 'Rasa nyeri yang hebat disekitar perut', 'G21', 2),
(175, 'Sakit kepala', 'G22', 6),
(176, 'Sering berkeringat dingin', 'G23', 4),
(177, 'Sering buang air kecil dalam jumlah yang sedikit dengan interval yang pendek', 'G24', 2),
(178, 'Sering emosi dan tersinggung', 'G25', 2),
(179, 'Sesak nafas', 'G26', 6),
(180, 'Suara menjadi parau dan serak', 'G27', 6),
(181, 'Telinga sering mendenging', 'G28', 2),
(182, 'Terjadi pendarahan saat berhubungan suami istri', 'G29', 2),
(183, 'Tidak mampu berbicara karna kesulitan mengatur pernafasan', 'G30', 2),
(184, 'Timbul benjolan pada sisi bagian belakang perut', 'G31', 2),
(185, 'Timbul pembengkakan kelenjar getah bening disekitar leher', 'G32', 2),
(186, 'Urine bercampur dengan darah', 'G33', 2);

-- --------------------------------------------------------

--
-- Table structure for table `konsultasi`
--

CREATE TABLE IF NOT EXISTS `konsultasi` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `waktu` datetime NOT NULL,
  `pesan` text NOT NULL,
  `pemeriksaan_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `konsultasi`
--

INSERT INTO `konsultasi` (`id`, `user_id`, `waktu`, `pesan`, `pemeriksaan_id`) VALUES
(2, 11, '2019-05-29 12:57:09', 'saya bingung dok. kenapa kok sakit sekali di mata saya ', 36),
(3, 11, '2019-05-29 12:59:34', 'saya tidak tau do. kenap tiba tiba kepala saya bengkak dan bernanah ', 36),
(4, 11, '2019-05-29 12:59:49', 'saya tidak tau do. kenap tiba tiba kepala saya bengkak dan bernanah ', 36),
(6, 1, '2019-05-29 01:05:19', 'hmm.. sebaiknya anda melakukan ini dan itu ', 0),
(7, 1, '2019-05-29 01:06:47', 'helo helo ', 0),
(8, 1, '2019-05-29 01:08:23', 'helo halo ', 0),
(9, 1, '2019-05-29 01:10:47', 'coba lagi ahh', 0),
(10, 1, '2019-05-29 01:11:48', 'mbalala', 36),
(11, 1, '2019-05-29 01:12:09', 'mbalala', 36),
(12, 9, '2019-05-29 01:14:13', 'saya harap anda tidak sungkan sungkan ', 37),
(13, 9, '2019-05-29 01:29:11', 'oke. teirma kasih karena telah berbelanja di toko kami ', 37),
(14, 1, '2019-05-29 01:29:43', 'kenapa anda bisa seperti itu ? ', 37),
(15, 9, '2019-05-29 01:31:08', 'saya sudah pesan ke mereka supaya jangan dikucek matanya. ', 37),
(16, 1, '2019-05-29 01:31:36', 'saya kira anda tidak akan dipermasalahkan oleh mereka. baiklah kalo begit ', 37);

-- --------------------------------------------------------

--
-- Table structure for table `pemeriksaan`
--

CREATE TABLE IF NOT EXISTS `pemeriksaan` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `penyakit_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemeriksaan`
--

INSERT INTO `pemeriksaan` (`id`, `tanggal`, `user_id`, `penyakit_id`) VALUES
(44, '2019-05-30', 1, 4),
(45, '2019-06-01', 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `pemeriksaan_detail`
--

CREATE TABLE IF NOT EXISTS `pemeriksaan_detail` (
  `id` int(11) NOT NULL,
  `pemeriksaan_id` int(11) NOT NULL,
  `gejala_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemeriksaan_detail`
--

INSERT INTO `pemeriksaan_detail` (`id`, `pemeriksaan_id`, `gejala_id`) VALUES
(184, 44, 149),
(185, 44, 123),
(186, 45, 163),
(187, 45, 155),
(188, 45, 176),
(189, 45, 178);

-- --------------------------------------------------------

--
-- Table structure for table `pengetahuan`
--

CREATE TABLE IF NOT EXISTS `pengetahuan` (
  `id` int(11) NOT NULL,
  `id_penyakit` int(11) NOT NULL,
  `id_gejala` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=478 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengetahuan`
--

INSERT INTO `pengetahuan` (`id`, `id_penyakit`, `id_gejala`) VALUES
(364, 61, 154),
(365, 62, 154),
(366, 63, 154),
(367, 65, 154),
(372, 59, 155),
(373, 70, 155),
(374, 63, 155),
(375, 66, 155),
(376, 67, 155),
(377, 59, 156),
(378, 69, 156),
(379, 66, 156),
(380, 67, 156),
(381, 59, 157),
(382, 68, 157),
(383, 62, 157),
(384, 67, 157),
(385, 59, 158),
(386, 72, 158),
(387, 62, 158),
(388, 67, 158),
(389, 70, 159),
(390, 63, 159),
(391, 66, 159),
(392, 59, 160),
(393, 70, 160),
(394, 72, 160),
(395, 62, 160),
(396, 63, 160),
(397, 68, 161),
(398, 71, 161),
(399, 64, 161),
(400, 65, 161),
(401, 68, 162),
(402, 71, 162),
(403, 59, 163),
(404, 68, 163),
(405, 72, 163),
(406, 60, 163),
(407, 61, 163),
(408, 62, 163),
(409, 64, 163),
(410, 67, 163),
(411, 69, 164),
(412, 70, 164),
(413, 63, 164),
(414, 66, 164),
(415, 68, 165),
(416, 64, 165),
(417, 68, 166),
(418, 70, 166),
(419, 70, 167),
(420, 72, 167),
(421, 66, 167),
(422, 61, 168),
(423, 62, 168),
(424, 64, 168),
(425, 60, 169),
(426, 61, 169),
(427, 65, 169),
(428, 72, 170),
(429, 61, 170),
(430, 69, 171),
(431, 63, 171),
(432, 66, 171),
(433, 59, 172),
(434, 67, 172),
(435, 69, 173),
(436, 63, 173),
(437, 72, 174),
(438, 61, 174),
(439, 68, 175),
(440, 70, 175),
(441, 65, 175),
(442, 59, 176),
(443, 72, 176),
(444, 62, 176),
(445, 64, 176),
(446, 67, 176),
(447, 72, 177),
(448, 60, 177),
(449, 61, 177),
(450, 62, 177),
(451, 68, 178),
(452, 71, 178),
(453, 59, 179),
(454, 68, 179),
(455, 69, 179),
(456, 63, 179),
(457, 64, 179),
(458, 67, 179),
(459, 59, 180),
(460, 69, 180),
(461, 63, 180),
(462, 66, 180),
(463, 67, 180),
(464, 68, 181),
(465, 70, 181),
(466, 60, 182),
(467, 61, 182),
(468, 69, 183),
(469, 64, 183),
(470, 60, 184),
(471, 62, 184),
(472, 69, 185),
(473, 66, 185),
(474, 72, 186),
(475, 60, 186),
(476, 61, 186),
(477, 62, 186);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE IF NOT EXISTS `pengguna` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(64) NOT NULL,
  `level` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `hp` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `jk` varchar(2) NOT NULL,
  `umur` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id`, `username`, `password`, `level`, `nama`, `hp`, `alamat`, `jk`, `umur`) VALUES
(1, 'admin', '0cc175b9c0f1b6a831c399e269772661', 1, 'Aministrator', '08132945559', 'Jl. kenair no. 343', 'L', 0),
(7, 'budi', '0cc175b9c0f1b6a831c399e269772661', 0, 'Firmansyah', '0813280800', 'jl. kenari no. 34', 'L', 20),
(8, 'bejo', '7fc56270e7a70fa81a5935b72eacbe29', 0, 'Bejo sandix', '0813243595', 'Jl. keramat jadixxx', 'P', 40),
(9, 'heri', '0cc175b9c0f1b6a831c399e269772661', 0, 'Heru hendriyadi', '45838538r3985', 'Jl. undru no. 4', 'P', 40),
(10, 'heru', '0cc175b9c0f1b6a831c399e269772661', 0, 'Heru hendriyadi', '083848583', 'Jl. kenari no. 345', 'L', 3),
(11, 'eko', '0cc175b9c0f1b6a831c399e269772661', 0, 'Eko kurniawan', '03895935893', 'Jl. kenari no. 335', 'L', 25);

-- --------------------------------------------------------

--
-- Table structure for table `penyakit`
--

CREATE TABLE IF NOT EXISTS `penyakit` (
  `id` int(11) NOT NULL,
  `kode` varchar(10) NOT NULL,
  `penyakit` varchar(255) NOT NULL,
  `pengobatan` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `gambar` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penyakit`
--

INSERT INTO `penyakit` (`id`, `kode`, `penyakit`, `pengobatan`, `keterangan`, `gambar`) VALUES
(59, 'P1', 'Kanker paru-paru', '1.	Kombinasi kemoterapi. 2.	Erletin. 3.	Biologis, seperti bevasizumab. 4.	Terapi laser. 5.	Terapi radiasi prabedah dan pascabedah. Untuk tindak lebih lanjut komunikasikan ke Dokter spesialis penyakit dalam.', '1.	Berhenti merokok. 2.	Hindari asap rokok. 3.	Hindari polusi udara industry seperti, asbes, arsenic, kromium, debu batu bara, besi oksida, nikel, debu radioaktif, dan uranium. 4.	Berolahraga secara teratur. Diet yang seimbang dan pola hidup sehat.', ''),
(60, 'P2', 'Kanker kandung kemih', '1.	Kemoterapi intravesikel, seperti tiotepa dan mitomisin. 2.	Vaksin baksil hidup Calmette-Guerin yang telah dilemahkan. 3.	Kemoterapi, seperti sisplatin dan doksurubisin. Untuk tindak lebih lanjut komunikasikan', '1.	Hindari merokok dan pemakaian tembakau. 2.	Berhenti pemakaian zat kimia. 3.	Hindari obat-obatan non-phenacetin dengan dosis besar. 4.	Hindari seks diusia dini dan berganti-ganti pasangan. 5.	Olahraga secara teratur. 6.	Pola hidup sehat.', ''),
(61, 'P3', 'Kanker serviks', '1.	Kemoterapi, seperti bleomisin. 2.	Diet bergizi seimbang sesuai toleransi dokter. 3.	Pembedahan lesi prainvasif, yaitu biopsy eksisi total, bedah krio, penghancuran dengan laser. Untuk tindak lebih lanjut konsultasikan ke Dokter spesialis penyakit dalam', '1.	Berhenti merokok. 2.	Hindari asap rokok. 3.	Hindari seks pada usia muda dan selalu menjaga kebersihan alat reproduksi. 4.	Perbanyak konsumsi vitamin C, E, dan asam folat. Hindari makanan siap saji dan beberapa zat-zat tambahan pada makanan.', ''),
(62, 'P4', 'Kanker ginjal', '1.	Bioterapi dengan menggunakan sel pembunuh pengaktifasi limfokin ditambah  rekombinan. 2.	Kemoterapi. Pembedahan neforoktomi rudial, dengan atau tanpa diseksi nodus limfe regional. Untuk tindak lebih lanjut konsultasikan ke Dokter spesialis penyakit dal', '1.	Berhenti merokok. 2.	Hindari makanan olahan yang mengandung zat kimia berbahaya bagi ginjal. 3.	Hindari pemakaian obat-obatan berlebihan. Jaga pola makan yang teratur, perbanyak konsumsi protein dan vitamin.', ''),
(63, 'P5', 'Kanker rongga mulut', '1.	Analgestik oploid untuk nyeri. 2.	Kemoterapi, jika diindikasikan. 3.	Pembedahan reseksi tumor primer, reseksi mandibular atau maksila total parsial 4.	Pembedahan mikrografi untuk reseksi bibir. Untuk tindak lebih lanjut konsultasikan ke Dokter spesiali', '1.	Berhenti merokok, pemakaian tembakau, dan konsumsi alcohol yang berlebihan. 2.	Hindari sinar ultraviolet (UV), infeksi virus human papillomavirus (HPV) atau korsinogen lain. 3.	Hindari mengunyah daun sirih, pinang dan tembakau. Hindari iritasi pada lap', ''),
(64, 'P6', 'Serangan jantung', 'Diuretik, seperti fusosemid, bumetanide, torsemid, metolazon. 1.	Obat inotropik, seperti digoskin, dobutamin, dopamine. 2.	Vasodilator, seperti nitrat, isosorbid, nesiritid. Untuk tindak lebih lanjut konsultasikan ke Dokter spesialis penyakit dalam.', '1.	Berhenti merokok, dan hindari asap rokok. 2.	Berhenti konsumsi alcohol. Menjaga kolestrol, tekanan darah tinggi, gula darah dan diabetes. 1.	Konsumsi makanan sehat. 2.	Menjaga berat badan yang sehat. Mengurangi dan mengelola stess.', ''),
(65, 'P7', 'Aterosklerosis (gangguan pembuluh darah)', '1.	Pengobatan kolestrol. 2.	Obat antiplatelet/trombolitik 3.	Operasi kanker. Untuk tindak lebih lanjut konsultasikan ke Dokter spesialis penyakit dalam.', '1.	Berhenti merokok. 2.	Hindari asap rokok. 3.	Berhenti konsumsi alcohol. 4.	Jaga tekanan darah, gula merah, kolestrol dan berat badan. 5.	Pola makan yang sehat. Olahraga teratur.', ''),
(66, 'P8', 'Kanker laring (tenggorokan/vita suara)', '1.	Agens kemoterapeutik. 2.	Analgesik. 3.	Lesi prakanker, bedah laser atau bedah radiasi. Pembedahan kordektomi. Untuk tindak lebih lanjut konsultasikan ke Dokter spesialis penyakit dalam.', '1.	Berhenti merokok. 2.	Hindari asap rokok. 3.	Berhenti konsumsi alcohol. 4.	Hindari inhalasi kronis asap yang berbahaya. Hindari polusi udara.', ''),
(67, 'P9', 'Penyakit paru obstruktif kronik (bronchitis kronis)', '1.	Antibiotik, seperti cefdinir, cefpodoksim, levoflokasin. 2.	Bronkodilator, aformoterol, salmeterol, tiotropium. 3.	Kratikasteroid, seperti flutikason, hidrokrotison, metilprednisolon, dan prednisone. 4.	Diuretik seperti furosemide Untuk tindak lebih la', '1.	Berhenti merokok. 2.	Hindari isap rokok. 3.	Berhenti konsumsi alcohol. 4.	Hindari polusi lingkungan. 5.	Hindari debu organic atau inorganic gas beracun. 6.	Tetap menjaga pola hidup yang sehat. Olahraga teratur.', ''),
(68, 'P10', 'Hipertensi (tekanan darah tinggi)', 'Diuretik seperti furosemide, hidroklorotiazid, indapamid. 1.	Penghambat saluran kalsium seperti felodipin, nisoldipin. Penghambat beta-adrenergik, seperti atenolol dan metroprolol. 2.	Inhibitor ACE, seperti benazepril, kaptopril, enarapil. 3.	Penghambat a', '1.	Berhenti merokok. 2.	Hindari asap rokok. Berhenti konsumsi obat-obatan tertentu secara berlebihan dan tanpa resep dokter. 1.	Berhenti mengkonsumsi obat-obatan terlarang. 2.	Hindari menggunakan zat kimia berlebihan. 3.	Tetap menjaga pola hidup sehat. Ol', ''),
(69, 'P11', 'Asma (radang saluran pernafasan)', '1.	Bronkodilator, seperti albuterol, pirbuterol, salmeterol, dan teofilin. 2.	Anti radang, seperti kromolin dan nedokromil. Kortikosteroid. 1.	Antagonis histamine, seperti setirizin, dan difenhidramin. 2.	Antagonis leukotriene, seperti montelukast, zafirl', '1.	Berhenti merokok 2.	Hindari asap rokok. 3.	Hindari debu 4.	Hindari penyedap / bumbu makanan yang mengandung sulfit dan bahan sensitive lainnya. Berhenti konsumsi obat seperti aspirin, penyekat beta-adrenergik dan obat anti inflamasi nonsteroid. 6. Hind', ''),
(70, 'P12', 'Kanker nasofaring', '1.	Terapi radiasi. 2.	Kemoterapi. 3.	Operasi atau pembedahan kanker. Untuk tindak lebih lanjut konsultasikan ke Dokter spesialis penyakit dalam.', '1.	Berhenti merokok. 2.	Hindari asap rokok. 3.	Berhenti mengkonsumsi alcohol. 4.	Hindari pengasapan. 5.	Penggunaan zat pengawet nitrosamine. Penggunaan bahan kimia pada bumbu penyedap makanan.', ''),
(71, 'P13', 'Impotensi', '1.	Mempertahankan berat badan ideal. 2.	Rajin berolahraga. Latihan aerobic sekurang-kurangnya 30 menit, 3 hari. 1.	Untuk tindak lebih lanjut konsultasikan ke Dokter spesialis penyakit dalam.', '1.	Berhenti merokok. 2.	Hindari asap rokok. 3.	Perhatikan kadar hormone testoteron dan lemak. 4.	Hindari menggunakan obat-obatan, zat kimia, dan steroid.  1.	Hindari tekanan darah tinggi, kolestrol dan stress yang lebih. Tetap menjaga pola hidup yang seha', ''),
(72, 'P14', 'Gangguan kehamilan dan cacat pada janin', '1.	Olahraga ringan. 2.	Menjaga pola makan dan pola hidup sehat. 3.	Perbanyak konsumsi vitamin. 4.	Untuk tindak lebih lanjut konsultasikan ke Dokter spesialis penyakit dalam.', '1.	Berhenti merokok. 2.	Berhenti mengkonsumsi alcohol. 3.	Hindari asap rokok. 4.	Hindari yang mengandung zat kimia seperti penyedap makanan, pengawet makanan, dll Hindari penggunaan obat-obatan terlarang dan stress yang berlebihan.', '');

-- --------------------------------------------------------

--
-- Table structure for table `referensi`
--

CREATE TABLE IF NOT EXISTS `referensi` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `umur` float NOT NULL,
  `jk` char(2) NOT NULL,
  `penyakit_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `referensi`
--

INSERT INTO `referensi` (`id`, `nama`, `umur`, `jk`, `penyakit_id`) VALUES
(4, 'Budi', 34, 'L', 1),
(5, 'Herman', 30, 'L', 2),
(6, 'Bejo', 20, 'L', 59),
(7, 'Herman', 30, 'L', 70);

-- --------------------------------------------------------

--
-- Table structure for table `referensi_detail`
--

CREATE TABLE IF NOT EXISTS `referensi_detail` (
  `id` int(11) NOT NULL,
  `gejala_id` int(11) NOT NULL,
  `referensi_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `referensi_detail`
--

INSERT INTO `referensi_detail` (`id`, `gejala_id`, `referensi_id`) VALUES
(9, 133, 5),
(10, 134, 5),
(11, 122, 5),
(12, 150, 5),
(13, 124, 5),
(18, 122, 4),
(19, 141, 4),
(20, 123, 4),
(21, 164, 6),
(22, 165, 6),
(23, 172, 6),
(24, 155, 6),
(25, 179, 6),
(26, 156, 6),
(27, 158, 6),
(28, 159, 6),
(29, 162, 6),
(30, 154, 7),
(31, 167, 7),
(32, 173, 7),
(33, 157, 7),
(34, 158, 7),
(35, 159, 7),
(36, 160, 7);

-- --------------------------------------------------------

--
-- Table structure for table `tmp`
--

CREATE TABLE IF NOT EXISTS `tmp` (
  `id_penyakit` int(11) NOT NULL,
  `skor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tmp`
--

INSERT INTO `tmp` (`id_penyakit`, `skor`) VALUES
(1, 0.0666667),
(53, 0.0666667),
(54, 0.0666667),
(55, 0.0666667),
(56, 0.0666667),
(57, 0.0666667),
(58, 0.0666667),
(2, 0.0666667),
(4, 0.0666667),
(5, 0.0666667),
(6, 0.0666667),
(44, 0.0666667),
(50, 0.0666667),
(51, 0.0666667),
(52, 0.0666667);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gejala`
--
ALTER TABLE `gejala`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `konsultasi`
--
ALTER TABLE `konsultasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pemeriksaan`
--
ALTER TABLE `pemeriksaan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pemeriksaan_detail`
--
ALTER TABLE `pemeriksaan_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pemeriksaan` (`pemeriksaan_id`);

--
-- Indexes for table `pengetahuan`
--
ALTER TABLE `pengetahuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penyakit`
--
ALTER TABLE `penyakit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referensi`
--
ALTER TABLE `referensi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referensi_detail`
--
ALTER TABLE `referensi_detail`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gejala`
--
ALTER TABLE `gejala`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=187;
--
-- AUTO_INCREMENT for table `konsultasi`
--
ALTER TABLE `konsultasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `pemeriksaan`
--
ALTER TABLE `pemeriksaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `pemeriksaan_detail`
--
ALTER TABLE `pemeriksaan_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=190;
--
-- AUTO_INCREMENT for table `pengetahuan`
--
ALTER TABLE `pengetahuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=478;
--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `penyakit`
--
ALTER TABLE `penyakit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT for table `referensi`
--
ALTER TABLE `referensi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `referensi_detail`
--
ALTER TABLE `referensi_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=37;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `pemeriksaan_detail`
--
ALTER TABLE `pemeriksaan_detail`
  ADD CONSTRAINT `fk_pemeriksaan` FOREIGN KEY (`pemeriksaan_id`) REFERENCES `pemeriksaan` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
