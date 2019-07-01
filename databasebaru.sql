-- phpMyAdmin SQL Dump
-- version 4.4.3
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2019 at 10:48 PM
-- Server version: 5.7.14
-- PHP Version: 7.0.30

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

DROP TABLE IF EXISTS `gejala`;
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
-- Table structure for table `pemeriksaan`
--

DROP TABLE IF EXISTS `pemeriksaan`;
CREATE TABLE IF NOT EXISTS `pemeriksaan` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `penyakit_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemeriksaan`
--

INSERT INTO `pemeriksaan` (`id`, `tanggal`, `user_id`, `penyakit_id`) VALUES
(45, '2019-06-01', 1, 70),
(46, '2019-06-14', 1, 70),
(47, '2019-06-20', 1, 70),
(48, '2019-06-21', 1, 70),
(49, '2019-06-21', 1, 70),
(50, '2019-06-24', 1, 70),
(51, '2019-06-24', 1, 59),
(52, '2019-06-24', 1, 70);

-- --------------------------------------------------------

--
-- Table structure for table `pemeriksaan_detail`
--

DROP TABLE IF EXISTS `pemeriksaan_detail`;
CREATE TABLE IF NOT EXISTS `pemeriksaan_detail` (
  `id` int(11) NOT NULL,
  `pemeriksaan_id` int(11) NOT NULL,
  `gejala_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemeriksaan_detail`
--

INSERT INTO `pemeriksaan_detail` (`id`, `pemeriksaan_id`, `gejala_id`) VALUES
(186, 45, 163),
(187, 45, 155),
(188, 45, 176),
(189, 45, 178),
(190, 46, 164),
(191, 46, 173),
(192, 46, 183),
(193, 46, 159),
(194, 47, 163),
(195, 47, 167),
(196, 47, 155),
(197, 48, 166),
(198, 48, 178),
(199, 48, 158),
(200, 49, 174),
(201, 49, 178),
(202, 49, 158),
(203, 50, 155),
(204, 50, 173),
(205, 50, 177),
(206, 51, 164),
(207, 51, 155),
(208, 51, 174),
(209, 52, 157),
(210, 52, 158),
(211, 52, 174);

-- --------------------------------------------------------

--
-- Table structure for table `pengetahuan`
--

DROP TABLE IF EXISTS `pengetahuan`;
CREATE TABLE IF NOT EXISTS `pengetahuan` (
  `id` int(11) NOT NULL,
  `id_penyakit` int(11) NOT NULL,
  `id_gejala` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=542 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengetahuan`
--

INSERT INTO `pengetahuan` (`id`, `id_penyakit`, `id_gejala`) VALUES
(364, 61, 154),
(365, 62, 154),
(366, 63, 154),
(367, 65, 154),
(374, 63, 155),
(375, 66, 155),
(376, 67, 155),
(378, 69, 156),
(379, 66, 156),
(380, 67, 156),
(382, 68, 157),
(383, 62, 157),
(384, 67, 157),
(386, 72, 158),
(387, 62, 158),
(388, 67, 158),
(390, 63, 159),
(391, 66, 159),
(394, 72, 160),
(395, 62, 160),
(396, 63, 160),
(397, 68, 161),
(398, 71, 161),
(399, 64, 161),
(400, 65, 161),
(401, 68, 162),
(402, 71, 162),
(404, 68, 163),
(405, 72, 163),
(407, 61, 163),
(408, 62, 163),
(409, 64, 163),
(410, 67, 163),
(411, 69, 164),
(413, 63, 164),
(414, 66, 164),
(415, 68, 165),
(416, 64, 165),
(417, 68, 166),
(420, 72, 167),
(421, 66, 167),
(422, 61, 168),
(423, 62, 168),
(424, 64, 168),
(426, 61, 169),
(427, 65, 169),
(428, 72, 170),
(429, 61, 170),
(430, 69, 171),
(431, 63, 171),
(432, 66, 171),
(434, 67, 172),
(435, 69, 173),
(436, 63, 173),
(437, 72, 174),
(438, 61, 174),
(439, 68, 175),
(441, 65, 175),
(443, 72, 176),
(444, 62, 176),
(445, 64, 176),
(446, 67, 176),
(447, 72, 177),
(449, 61, 177),
(450, 62, 177),
(451, 68, 178),
(452, 71, 178),
(454, 68, 179),
(455, 69, 179),
(456, 63, 179),
(457, 64, 179),
(458, 67, 179),
(460, 69, 180),
(461, 63, 180),
(462, 66, 180),
(463, 67, 180),
(464, 68, 181),
(467, 61, 182),
(468, 69, 183),
(469, 64, 183),
(471, 62, 184),
(472, 69, 185),
(473, 66, 185),
(474, 72, 186),
(476, 61, 186),
(477, 62, 186),
(518, 59, 163),
(519, 59, 172),
(520, 59, 155),
(521, 59, 176),
(522, 59, 179),
(523, 59, 180),
(524, 59, 156),
(525, 59, 157),
(526, 59, 158),
(527, 59, 160),
(528, 60, 163),
(529, 60, 169),
(530, 60, 177),
(531, 60, 182),
(532, 60, 184),
(533, 60, 186),
(534, 70, 164),
(535, 70, 166),
(536, 70, 167),
(537, 70, 155),
(538, 70, 175),
(539, 70, 181),
(540, 70, 159),
(541, 70, 160);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

DROP TABLE IF EXISTS `pengguna`;
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

DROP TABLE IF EXISTS `penyakit`;
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
(59, 'P1', 'Kanker paru-paru', '1.	Kombinasi kemoterapi. 2.	Erletin. 3.	Biologis, seperti bevasizumab. 4.	Terapi laser. 5.	Terapi radiasi prabedah dan pascabedah. Untuk tindak lebih lanjut komunikasikan ke Dokter spesialis penyakit dalam.', '1.	Berhenti merokok. 2.	Hindari asap rokok. 3.	Hindari polusi udara industry seperti, asbes, arsenic, kromium, debu batu bara, besi oksida, nikel, debu radioaktif, dan uranium. 4.	Berolahraga secara teratur. Diet yang seimbang dan pola hidup sehat.', '555554.png'),
(60, 'P2', 'Kanker kandung kemih', '1.	Kemoterapi intravesikel, seperti tiotepa dan mitomisin. 2.	Vaksin baksil hidup Calmette-Guerin yang telah dilemahkan. 3.	Kemoterapi, seperti sisplatin dan doksurubisin. Untuk tindak lebih lanjut komunikasikan', '1.	Hindari merokok dan pemakaian tembakau. 2.	Berhenti pemakaian zat kimia. 3.	Hindari obat-obatan non-phenacetin dengan dosis besar. 4.	Hindari seks diusia dini dan berganti-ganti pasangan. 5.	Olahraga secara teratur. 6.	Pola hidup sehat.', '22222.png'),
(61, 'P3', 'Kanker serviks', '1.	Kemoterapi, seperti bleomisin. 2.	Diet bergizi seimbang sesuai toleransi dokter. 3.	Pembedahan lesi prainvasif, yaitu biopsy eksisi total, bedah krio, penghancuran dengan laser. Untuk tindak lebih lanjut konsultasikan ke Dokter spesialis penyakit dalam', '1.	Berhenti merokok. 2.	Hindari asap rokok. 3.	Hindari seks pada usia muda dan selalu menjaga kebersihan alat reproduksi. 4.	Perbanyak konsumsi vitamin C, E, dan asam folat. Hindari makanan siap saji dan beberapa zat-zat tambahan pada makanan.', ''),
(62, 'P4', 'Kanker ginjal', '1.	Bioterapi dengan menggunakan sel pembunuh pengaktifasi limfokin ditambah  rekombinan. 2.	Kemoterapi. Pembedahan neforoktomi rudial, dengan atau tanpa diseksi nodus limfe regional. Untuk tindak lebih lanjut konsultasikan ke Dokter spesialis penyakit dal', '1.	Berhenti merokok. 2.	Hindari makanan olahan yang mengandung zat kimia berbahaya bagi ginjal. 3.	Hindari pemakaian obat-obatan berlebihan. Jaga pola makan yang teratur, perbanyak konsumsi protein dan vitamin.', ''),
(63, 'P5', 'Kanker rongga mulut', '1.	Analgestik oploid untuk nyeri. 2.	Kemoterapi, jika diindikasikan. 3.	Pembedahan reseksi tumor primer, reseksi mandibular atau maksila total parsial 4.	Pembedahan mikrografi untuk reseksi bibir. Untuk tindak lebih lanjut konsultasikan ke Dokter spesiali', '1.	Berhenti merokok, pemakaian tembakau, dan konsumsi alcohol yang berlebihan. 2.	Hindari sinar ultraviolet (UV), infeksi virus human papillomavirus (HPV) atau korsinogen lain. 3.	Hindari mengunyah daun sirih, pinang dan tembakau. Hindari iritasi pada lap', ''),
(64, 'P6', 'Serangan jantung', 'Diuretik, seperti fusosemid, bumetanide, torsemid, metolazon. 1.	Obat inotropik, seperti digoskin, dobutamin, dopamine. 2.	Vasodilator, seperti nitrat, isosorbid, nesiritid. Untuk tindak lebih lanjut konsultasikan ke Dokter spesialis penyakit dalam.', '1.	Berhenti merokok, dan hindari asap rokok. 2.	Berhenti konsumsi alcohol. Menjaga kolestrol, tekanan darah tinggi, gula darah dan diabetes. 1.	Konsumsi makanan sehat. 2.	Menjaga berat badan yang sehat. Mengurangi dan mengelola stess.', ''),
(65, 'P7', 'Aterosklerosis (gangguan pembuluh darah)', '1.	Pengobatan kolestrol. 2.	Obat antiplatelet/trombolitik 3.	Operasi kanker. Untuk tindak lebih lanjut konsultasikan ke Dokter spesialis penyakit dalam.', '1.	Berhenti merokok. 2.	Hindari asap rokok. 3.	Berhenti konsumsi alcohol. 4.	Jaga tekanan darah, gula merah, kolestrol dan berat badan. 5.	Pola makan yang sehat. Olahraga teratur.', ''),
(66, 'P8', 'Kanker laring (tenggorokan/vita suara)', '1.	Agens kemoterapeutik. 2.	Analgesik. 3.	Lesi prakanker, bedah laser atau bedah radiasi. Pembedahan kordektomi. Untuk tindak lebih lanjut konsultasikan ke Dokter spesialis penyakit dalam.', '1.	Berhenti merokok. 2.	Hindari asap rokok. 3.	Berhenti konsumsi alcohol. 4.	Hindari inhalasi kronis asap yang berbahaya. Hindari polusi udara.', ''),
(67, 'P9', 'Penyakit paru obstruktif kronik (bronchitis kronis)', '1.	Antibiotik, seperti cefdinir, cefpodoksim, levoflokasin. 2.	Bronkodilator, aformoterol, salmeterol, tiotropium. 3.	Kratikasteroid, seperti flutikason, hidrokrotison, metilprednisolon, dan prednisone. 4.	Diuretik seperti furosemide Untuk tindak lebih la', '1.	Berhenti merokok. 2.	Hindari isap rokok. 3.	Berhenti konsumsi alcohol. 4.	Hindari polusi lingkungan. 5.	Hindari debu organic atau inorganic gas beracun. 6.	Tetap menjaga pola hidup yang sehat. Olahraga teratur.', ''),
(68, 'P10', 'Hipertensi (tekanan darah tinggi)', 'Diuretik seperti furosemide, hidroklorotiazid, indapamid. 1.	Penghambat saluran kalsium seperti felodipin, nisoldipin. Penghambat beta-adrenergik, seperti atenolol dan metroprolol. 2.	Inhibitor ACE, seperti benazepril, kaptopril, enarapil. 3.	Penghambat a', '1.	Berhenti merokok. 2.	Hindari asap rokok. Berhenti konsumsi obat-obatan tertentu secara berlebihan dan tanpa resep dokter. 1.	Berhenti mengkonsumsi obat-obatan terlarang. 2.	Hindari menggunakan zat kimia berlebihan. 3.	Tetap menjaga pola hidup sehat. Ol', ''),
(69, 'P11', 'Asma (radang saluran pernafasan)', '1.	Bronkodilator, seperti albuterol, pirbuterol, salmeterol, dan teofilin. 2.	Anti radang, seperti kromolin dan nedokromil. Kortikosteroid. 1.	Antagonis histamine, seperti setirizin, dan difenhidramin. 2.	Antagonis leukotriene, seperti montelukast, zafirl', '1.	Berhenti merokok 2.	Hindari asap rokok. 3.	Hindari debu 4.	Hindari penyedap / bumbu makanan yang mengandung sulfit dan bahan sensitive lainnya. Berhenti konsumsi obat seperti aspirin, penyekat beta-adrenergik dan obat anti inflamasi nonsteroid. 6. Hind', ''),
(70, 'P12', 'Kanker nasofaring', '1.	Terapi radiasi. 2.	Kemoterapi. 3.	Operasi atau pembedahan kanker. Untuk tindak lebih lanjut konsultasikan ke Dokter spesialis penyakit dalam.', '1.	Berhenti merokok. 2.	Hindari asap rokok. 3.	Berhenti mengkonsumsi alcohol. 4.	Hindari pengasapan. 5.	Penggunaan zat pengawet nitrosamine. Penggunaan bahan kimia pada bumbu penyedap makanan.', 'about_0.jpg'),
(71, 'P13', 'Impotensi', '1.	Mempertahankan berat badan ideal. 2.	Rajin berolahraga. Latihan aerobic sekurang-kurangnya 30 menit, 3 hari. 1.	Untuk tindak lebih lanjut konsultasikan ke Dokter spesialis penyakit dalam.', '1.	Berhenti merokok. 2.	Hindari asap rokok. 3.	Perhatikan kadar hormone testoteron dan lemak. 4.	Hindari menggunakan obat-obatan, zat kimia, dan steroid.  1.	Hindari tekanan darah tinggi, kolestrol dan stress yang lebih. Tetap menjaga pola hidup yang seha', ''),
(72, 'P14', 'Gangguan kehamilan dan cacat pada janin', '1.	Olahraga ringan. 2.	Menjaga pola makan dan pola hidup sehat. 3.	Perbanyak konsumsi vitamin. 4.	Untuk tindak lebih lanjut konsultasikan ke Dokter spesialis penyakit dalam.', '1.	Berhenti merokok. 2.	Berhenti mengkonsumsi alcohol. 3.	Hindari asap rokok. 4.	Hindari yang mengandung zat kimia seperti penyedap makanan, pengawet makanan, dll Hindari penggunaan obat-obatan terlarang dan stress yang berlebihan.', '');

-- --------------------------------------------------------

--
-- Table structure for table `referensi`
--

DROP TABLE IF EXISTS `referensi`;
CREATE TABLE IF NOT EXISTS `referensi` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `umur` float NOT NULL,
  `jk` char(2) NOT NULL,
  `penyakit_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `referensi_detail`
--

DROP TABLE IF EXISTS `referensi_detail`;
CREATE TABLE IF NOT EXISTS `referensi_detail` (
  `id` int(11) NOT NULL,
  `gejala_id` int(11) NOT NULL,
  `referensi_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tmp`
--

DROP TABLE IF EXISTS `tmp`;
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
-- Indexes for table `pemeriksaan`
--
ALTER TABLE `pemeriksaan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penyakit_id` (`penyakit_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `pemeriksaan_detail`
--
ALTER TABLE `pemeriksaan_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pemeriksaan` (`pemeriksaan_id`),
  ADD KEY `gejala_id` (`gejala_id`);

--
-- Indexes for table `pengetahuan`
--
ALTER TABLE `pengetahuan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_gejala` (`id_gejala`),
  ADD KEY `id_penyakit` (`id_penyakit`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `penyakit_id` (`penyakit_id`);

--
-- Indexes for table `referensi_detail`
--
ALTER TABLE `referensi_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gejala_id` (`gejala_id`),
  ADD KEY `referensi_id` (`referensi_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gejala`
--
ALTER TABLE `gejala`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=187;
--
-- AUTO_INCREMENT for table `pemeriksaan`
--
ALTER TABLE `pemeriksaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `pemeriksaan_detail`
--
ALTER TABLE `pemeriksaan_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=212;
--
-- AUTO_INCREMENT for table `pengetahuan`
--
ALTER TABLE `pengetahuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=542;
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
-- Constraints for table `pemeriksaan`
--
ALTER TABLE `pemeriksaan`
  ADD CONSTRAINT `pemeriksaan_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `pengguna` (`id`),
  ADD CONSTRAINT `pemeriksaan_ibfk_2` FOREIGN KEY (`penyakit_id`) REFERENCES `penyakit` (`id`);

--
-- Constraints for table `pemeriksaan_detail`
--
ALTER TABLE `pemeriksaan_detail`
  ADD CONSTRAINT `fk_pemeriksaan` FOREIGN KEY (`pemeriksaan_id`) REFERENCES `pemeriksaan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pemeriksaan_detail_ibfk_1` FOREIGN KEY (`gejala_id`) REFERENCES `gejala` (`id`);

--
-- Constraints for table `pengetahuan`
--
ALTER TABLE `pengetahuan`
  ADD CONSTRAINT `pengetahuan_ibfk_1` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id`),
  ADD CONSTRAINT `pengetahuan_ibfk_2` FOREIGN KEY (`id_gejala`) REFERENCES `gejala` (`id`);

--
-- Constraints for table `referensi`
--
ALTER TABLE `referensi`
  ADD CONSTRAINT `referensi_ibfk_1` FOREIGN KEY (`penyakit_id`) REFERENCES `penyakit` (`id`);

--
-- Constraints for table `referensi_detail`
--
ALTER TABLE `referensi_detail`
  ADD CONSTRAINT `referensi_detail_ibfk_1` FOREIGN KEY (`gejala_id`) REFERENCES `gejala` (`id`),
  ADD CONSTRAINT `referensi_detail_ibfk_2` FOREIGN KEY (`referensi_id`) REFERENCES `referensi` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
