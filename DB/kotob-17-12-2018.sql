-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 17, 2018 at 11:31 AM
-- Server version: 5.7.21
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kotob`
--

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` int(11) NOT NULL,
  `area_ar_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `check_in` datetime NOT NULL,
  `check_out` datetime DEFAULT NULL,
  `latency` double NOT NULL,
  `extra_hours` double NOT NULL,
  `total_hours` double NOT NULL,
  `day_fare` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `days`
--

CREATE TABLE `days` (
  `id` int(11) NOT NULL,
  `day_ar_name` varchar(11) NOT NULL,
  `day_eng_name` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `days`
--

INSERT INTO `days` (`id`, `day_ar_name`, `day_eng_name`) VALUES
(1, 'الاثنين', 'Monday'),
(2, 'الثلاثاء', 'Tuesday'),
(3, 'الاربعاء', 'Wednesday'),
(4, 'الخميس', 'Thuresday'),
(5, 'الجمعة', 'Friday'),
(6, 'السبت', 'Saturday'),
(7, 'الاحد', 'Sunday');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `id` int(11) NOT NULL,
  `delivery_name` varchar(200) NOT NULL,
  `delivery_mobile` varchar(200) NOT NULL,
  `delivery_mobile2` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`id`, `delivery_name`, `delivery_mobile`, `delivery_mobile2`) VALUES
(1, 'وزعلي', '01001234561', ''),
(2, 'محمد أشرف', '01123776761', '');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `employee_name` varchar(255) NOT NULL,
  `employee_mobile` varchar(255) NOT NULL,
  `employee_id_number` int(20) DEFAULT NULL,
  `salary` int(11) NOT NULL,
  `working_hours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `employee_name`, `employee_mobile`, `employee_id_number`, `salary`, `working_hours`) VALUES
(1, 'خالد', '', NULL, 2000, 6),
(2, 'عمر', '', NULL, 2500, 10),
(3, 'اسلام', '01011277930', NULL, 2000, 8),
(4, 'حسام', '', NULL, 2000, 8),
(5, 'عبد الله', '', NULL, 1500, 8),
(6, 'محمد أشرف', '01123776761', NULL, 1500, 8);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_phone` varchar(50) NOT NULL,
  `customer_mobile` varchar(50) NOT NULL,
  `order_type` int(11) NOT NULL,
  `customer_address` varchar(255) DEFAULT NULL,
  `customer_area` int(11) DEFAULT NULL,
  `order_details` varchar(1000) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_status` int(11) NOT NULL DEFAULT '1',
  `order_taker` int(11) NOT NULL,
  `order_maker` int(11) DEFAULT NULL,
  `order_delivered_by` int(11) DEFAULT NULL,
  `order_delivered_to` int(11) DEFAULT NULL,
  `order_suggessted_delivery_date` date DEFAULT NULL,
  `order_delivery_date` date DEFAULT NULL,
  `order_price` int(11) DEFAULT NULL,
  `delivery_price` int(11) DEFAULT NULL,
  `order_total_price` int(11) DEFAULT NULL,
  `cash_collector` int(11) DEFAULT NULL,
  `cash_collected` int(11) DEFAULT NULL,
  `collection_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_name`, `customer_phone`, `customer_mobile`, `order_type`, `customer_address`, `customer_area`, `order_details`, `order_date`, `order_status`, `order_taker`, `order_maker`, `order_delivered_by`, `order_delivered_to`, `order_suggessted_delivery_date`, `order_delivery_date`, `order_price`, `delivery_price`, `order_total_price`, `cash_collector`, `cash_collected`, `collection_date`) VALUES
(55, 'شيرين زيدان', '', '01001660979', 1, 'الشطر الخامس - عمارات شركة المعادي - ع 15 / 2 - د4 - ش41 - دجلة - المعادي - عمارة زيروكس', 6, '<p>\n	<span style=\"font-size:36px;\">Mech + Thermal O.L Mostafa Allam X 2</span></p>\n', '2018-12-02 22:59:28', 4, 2, 3, 4, 1, '2018-12-04', '2018-12-03', 650, NULL, NULL, 7, NULL, '2018-12-10 00:00:00'),
(57, 'محمد يوسف', '', '00000000000', 2, NULL, NULL, '<p>\n	<span style=\"font-size:48px;\">Math Grade 8 Heba</span></p>\n', '2018-12-02 23:01:51', 4, 2, 3, 3, NULL, '2018-12-04', '2018-12-03', 0, NULL, NULL, 7, NULL, '2018-12-09 00:00:00'),
(60, 'عمر عصام', '', '01065594030', 1, 'دريم لاند 575 الدور 4 شقة 32 اكتوبر', 3, '<p>\n	5 copies Mostafa allam thermal O.L</p>\n', '2018-12-03 08:46:29', 4, 4, 3, 3, 1, '2018-12-05', NULL, 0, NULL, NULL, 7, NULL, '2018-12-10 00:00:00'),
(61, 'زياد محمد', '', '01066698483', 2, NULL, NULL, '<p>\n	<span style=\"font-size:16px;\"><span style=\"font-family:arial,helvetica,sans-serif;\"><strong>Heba Math G7</strong></span></span></p>\n', '2018-12-03 08:55:11', 4, 3, 3, 3, NULL, '2018-12-05', '2018-12-03', 175, NULL, NULL, 3, NULL, '2018-12-03 00:00:00'),
(62, 'جودى برهان', '', '01110007882', 2, NULL, NULL, '<p>\n	<span style=\"font-size:16px;\">Math A.S C12</span></p>\n', '2018-12-03 09:01:36', 4, 3, 3, 4, NULL, '2018-12-03', '2018-12-03', 110, NULL, NULL, 4, NULL, '2018-12-03 00:00:00'),
(63, 'محمد احمد محمود', '', '01096185922', 2, NULL, NULL, '<p>\n	Mostafa Allam Thermal O.L</p>\n', '2018-12-03 09:08:18', 4, 3, 4, 3, NULL, '2018-12-03', '2018-12-03', 150, NULL, NULL, 3, NULL, '2018-12-03 00:00:00'),
(64, 'دينا حلمى', '', '01001659190', 1, '44 ش الهرم عمارة البنك الاهلى مدخل بنك القطرى سلم شمال من مدخل العمارة د 3 ش 302', 1, '<p>\n	Physics Pastpaper G9 ALL Paper</p>\n<p>\n	Math Pastpaper G9 ALL Paper</p>\n', '2018-12-03 09:49:44', 4, 3, 3, 3, 1, '2018-12-05', '2018-12-03', 0, NULL, NULL, 7, NULL, '2018-12-12 00:00:00'),
(65, 'سلمى اياد', '', '01022214905', 2, NULL, NULL, '<p>\n	<span style=\"font-size:16px;\"><span style=\"font-family:arial,helvetica,sans-serif;\">Physics A.S Paper 3 2010</span></span></p>\n', '2018-12-03 12:30:49', 4, 3, 3, 3, NULL, '2018-12-03', '2018-12-05', 0, NULL, NULL, 3, NULL, '2018-12-10 00:00:00'),
(66, 'لوجين محمد', '', '01158945744', 2, NULL, NULL, '<p>\n	Ame Elsaeed Classfied Edexcel 2Copeis</p>\n<p>\n	Ame Elsaeed Notes Edexcel 1Copeis</p>\n', '2018-12-03 12:34:32', 4, 4, 3, 4, NULL, '2018-12-03', '2018-12-03', 840, NULL, NULL, 4, NULL, '2018-12-04 00:00:00'),
(67, 'يحيى اشرف', '', '01111108839', 1, '55 ش الؤشيد وادى النيل د 3 ش 8', 7, '<p>\n	<span style=\"font-size:16px;\"><span style=\"font-family:arial,helvetica,sans-serif;\">Heba Kamel Math G8</span></span></p>\n', '2018-12-03 12:39:06', 4, 2, 3, 4, 2, '2018-12-03', '2018-12-03', 225, NULL, NULL, 1, NULL, '2018-12-04 00:00:00'),
(68, 'ميرنا تامر ', '', '01148997771', 2, NULL, NULL, '<p>\n	<span style=\"font-size:16px;\"><span style=\"font-family:arial,helvetica,sans-serif;\">Heba Kamel Math G8</span></span></p>\n', '2018-12-03 12:46:57', 4, 3, 3, 3, NULL, '2018-12-03', NULL, 225, NULL, NULL, 3, NULL, '2018-12-03 00:00:00'),
(69, 'محمد اليمانى ', '', '01119055777', 2, NULL, NULL, '<p>\n	<span style=\"font-size:16px;\"><span style=\"font-family:arial,helvetica,sans-serif;\">Heba Elshaeer English G7</span></span></p>\n', '2018-12-03 12:50:25', 4, 3, 3, 4, NULL, '2018-12-04', '2018-12-05', 200, NULL, NULL, 3, NULL, '2018-12-07 00:00:00'),
(70, 'سماح شلبى ', '', '01024593153', 1, ' المعادى 66 ش 104 فوق محل كوافير سلمى د 2 ش 4', 6, '<p>\n	<span style=\"font-size:16px;\"><span style=\"font-family:arial,helvetica,sans-serif;\">Mostafa Allam O.L&nbsp;</span></span></p>\n<p>\n	<span style=\"font-size:16px;\"><span style=\"font-family:arial,helvetica,sans-serif;\">Mechanics + Thermal&nbsp;</span></span></p>\n', '2018-12-03 13:00:37', 4, 3, 1, 3, 1, '2018-12-05', '2018-12-04', 310, NULL, NULL, 7, NULL, '2018-12-10 00:00:00'),
(71, 'سلمى نجم', '', '01201092877', 1, 'الشيخ زايد الحى 16 المجاورة الاولى ع 115', 12, '<p>\n	<span style=\"font-size:16px;\">Mostafa Allam Thermal O.L 3 Copeis</span></p>\n', '2018-12-03 13:05:54', 4, 4, 4, 4, 1, '2018-12-04', '2018-12-03', 500, NULL, NULL, 7, NULL, '2018-12-10 00:00:00'),
(72, 'سمير ثروت', '', '01211288690', 1, 'اكتوبر المنطقة السياحية 4 فيلا 215 خلف مينا جاردن سيتى ', 3, '<p>\n	<span style=\"font-family:arial,helvetica,sans-serif;\"><span style=\"font-size:16px;\">Maha Hamedy O.L + M.S</span></span></p>\n', '2018-12-03 17:02:45', 4, 4, 5, NULL, 1, '2018-12-05', '2018-12-04', 450, NULL, NULL, 7, NULL, '2018-12-10 00:00:00'),
(73, 'محمد محمود محمد', '', '01065627644', 2, NULL, NULL, '<p>\n	Mostafa Allam Thermal O.L</p>\n', '2018-12-03 17:08:08', 4, 4, 1, 4, NULL, '2018-12-04', '2018-12-04', 150, NULL, NULL, 4, NULL, '2018-12-04 00:00:00'),
(74, 'سهيله حسين', '', '01017386647', 2, NULL, NULL, '<p>\n	Alyaa English Notes</p>\n<p>\n	Alyaa English Pastpaper Combridge</p>\n<p>\n	Alyaa English Pastpaper Edexcel</p>\n', '2018-12-03 17:11:38', 4, 4, 2, 4, NULL, '2018-12-04', '2018-12-05', 0, NULL, NULL, 4, NULL, '2018-12-05 00:00:00'),
(75, 'بسمله ايمن', '', '01118969888', 2, NULL, NULL, '<p>\n	Ann Classfied Part 2&nbsp;</p>\n', '2018-12-03 17:13:22', 4, 4, 3, 2, NULL, '2018-12-04', '2018-12-06', 180, NULL, NULL, 2, NULL, '2018-12-12 00:00:00'),
(76, 'سهيله ربيع', '', '01154031330', 2, NULL, NULL, '<p>\n	<span style=\"font-size:16px;\">Ann Classfied Part 2</span></p>\n', '2018-12-03 17:14:42', 4, 4, 5, 2, NULL, '2018-12-05', '2018-12-06', 180, NULL, NULL, 2, NULL, '2018-12-12 00:00:00'),
(77, 'لوجين محمد ', '', '01158945744', 2, NULL, NULL, '<p>\n	<span style=\"font-size:16px;\">gamal notes + class ICT + ahmed motaz class +notes&nbsp;</span></p>\n', '2018-12-03 17:25:49', 4, 4, 4, 2, NULL, '2018-12-04', '2018-12-05', 400, NULL, NULL, 2, NULL, '2018-12-05 00:00:00'),
(78, 'مهندسة عبير الكونيسي ', '', '01002184834', 1, '4أ عزيز اباظة امام سفارة الهند شركة المصرية للمنتجات ', 20, '<p>\n	<span style=\"font-size:16px;\">MAHA HAMDY + M.S&nbsp;</span></p>\n', '2018-12-03 17:29:20', 4, 4, 4, 4, 2, '2018-12-05', NULL, 425, NULL, NULL, 6, NULL, '2018-12-04 00:00:00'),
(79, 'حبيية وائل ', '', '01270336739', 2, NULL, NULL, '<p>\n	MONA G9 NOTES + M.S MOSTAFA BARKAT</p>\n', '2018-12-03 17:30:36', 2, 4, 4, NULL, NULL, '2018-12-05', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(80, 'سيف وجيه ', '', '01097981493', 1, '13 خالد امين من طارق بن زياد محطة التعاون الهرم ', 1, '<p>\n	<span style=\"font-size:16px;\">1B+2B +M.S&nbsp;</span></p>\n<p>\n	<span style=\"font-size:16px;\">TARMAL نسختين&nbsp;</span></p>\n', '2018-12-03 17:32:28', 3, 4, 2, 3, 1, '2018-12-05', '2018-12-04', 0, NULL, NULL, NULL, NULL, NULL),
(81, 'بسملة عصام ', '', '01274074629', 1, '90د حدائق الاهرام د الاول البوابة الاولي ', 5, '<p>\n	<span style=\"font-size:16px;\">MAHA HAMDY + M.S&nbsp; نسختين&nbsp;</span></p>\n', '2018-12-03 17:34:18', 4, 4, 4, 3, 1, '2018-12-05', '2018-12-04', 850, NULL, NULL, 7, NULL, '2018-12-10 00:00:00'),
(82, 'يوسف العسال ', '', '01225558960', 2, NULL, NULL, '<p>\n	<span style=\"font-size:16px;\">TRARMAL + MECH O.L</span></p>\n', '2018-12-03 17:35:32', 4, 4, 5, 4, NULL, '2018-12-05', '2018-12-04', 300, NULL, NULL, 4, NULL, '2018-12-04 00:00:00'),
(83, 'لوجين هشام ', '', '01011331287', 2, NULL, NULL, '<p>\n	ANN PART2&nbsp;</p>\n', '2018-12-03 17:41:12', 2, 4, 4, NULL, NULL, '2018-12-04', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(84, 'رامي محسن ', '', '01067803411', 2, NULL, NULL, '<p>\n	<span style=\"font-size:16px;\">1B+2B</span></p>\n<p>\n	<span style=\"font-size:16px;\">1C+2C</span></p>\n<p>\n	<span style=\"font-size:16px;\">BIO UNIT 1 A.S&nbsp;</span></p>\n', '2018-12-03 17:42:55', 4, 4, 2, 4, NULL, '2018-12-04', '2018-12-04', 575, NULL, NULL, 4, NULL, '2018-12-04 00:00:00'),
(85, 'عاصم اسماعيل ', '', '01148633888', 2, NULL, NULL, '<p>\n	<span style=\"font-size:16px;\">HUMAN P.P&nbsp;</span></p>\n', '2018-12-03 18:28:25', 4, 3, 3, NULL, NULL, '2018-12-05', '2018-12-04', 130, NULL, NULL, 4, NULL, '2018-12-04 00:00:00'),
(86, ' عرفان عبد اللطيف ', '', '01001400675', 1, 'قطعه 120 ب ش6 د2 ش9 المقطم ', 15, '<p>\n	<span style=\"font-size: 28px;\">THERM + MECH ALLAM O.L&nbsp;</span></p>\n<p>\n	<span style=\"font-size: 28px;\">BARAKAT CAMB O.L + MS&nbsp;</span></p>\n', '2018-12-03 18:31:18', 3, 2, 1, 3, 1, '2018-12-05', '2018-12-04', 0, NULL, NULL, NULL, NULL, NULL),
(87, 'نورهان موافى ', '', '01201550756', 1, '25ش26يوليو ميدان لينان المهندسين ', 7, '<p>\n	<span style=\"font-size:20px;\">CHY MAHA HAMDY + M.S</span></p>\n', '2018-12-03 18:32:43', 3, 2, 2, 3, 1, '2018-12-05', '2018-12-04', 0, NULL, NULL, NULL, NULL, NULL),
(88, 'مريم محمد سيد ', '', '01026341638', 1, '231ا حدائق الاهرام البوابة الاولى ', 5, '<p>\n	<span style=\"font-size: 28px;\">THERMAL ALLAM O.L&nbsp;</span></p>\n', '2018-12-03 18:35:31', 4, 2, 2, 3, 1, '2018-12-05', '2018-12-04', 200, NULL, NULL, 7, NULL, '2018-12-10 00:00:00'),
(89, 'محمد حافظ', '', '01223397777', 1, 'الحى الثالث المجاورة الخامسة , شارع 21 , رقم 1019 - دور 4', 3, '<p>\n	HEBA ELSHAER G6&nbsp;</p>\n', '2018-12-03 20:01:30', 4, 2, 2, 3, 1, '2018-12-05', '2018-12-04', 325, NULL, NULL, 7, NULL, '2018-12-10 00:00:00'),
(90, 'حسن وليد', '', '01022000788', 2, NULL, NULL, '<p>\n	<span style=\"font-size:28px;\"><span style=\"font-family:comic sans ms,cursive;\"><strong><span style=\"background-color:#ff0000;\">ALLAM ALL O.L CLASS+NOTES</span></strong></span></span></p>\n', '2018-12-03 20:20:33', 4, 1, 2, 3, NULL, '2018-12-05', '2018-12-04', 450, NULL, NULL, 3, NULL, '2018-12-04 00:00:00'),
(91, 'مارك شريف ', '', '01284039943', 2, NULL, NULL, '<p>\n	MR ISLAM GR 9&nbsp;</p>\n', '2018-12-03 22:48:14', 3, 2, 2, 3, NULL, '2018-12-05', '2018-12-04', 255, NULL, NULL, 3, NULL, '2018-12-04 00:00:00'),
(92, 'عمر عبد الحميد', '', '01017934442', 1, 'فيلا 68 الحي المتميز السياحية الاولى', 3, '<p>\n	Thermal O.L Mostafa Allam</p>\n', '2018-12-03 23:58:02', 4, 7, 7, 3, 1, '2018-12-05', '2018-12-04', 200, NULL, NULL, 7, NULL, '2018-12-10 00:00:00'),
(93, 'يوسف القصبى', '', '01117446281', 1, 'فيلا 693 الحى المتميز شارع امن الدولة ', 3, '<p>\n	<span style=\"font-size:16px;\">Heba ElShaeer O.L</span></p>\n<p>\n	<span style=\"font-size:16px;\">Maha Hamedy O.L +M.S</span></p>\n', '2018-12-04 11:31:57', 4, 2, 3, 3, 1, '2018-12-05', '2018-12-04', 800, NULL, NULL, 7, NULL, '2018-12-10 00:00:00'),
(94, 'محمد وليد', '', '01148181313', 2, NULL, NULL, '<p>\n	humman bio&nbsp;</p>\n', '2018-12-04 12:21:05', 4, 6, 4, 4, NULL, '2018-12-04', '2018-12-04', 150, NULL, NULL, 4, NULL, '2018-12-04 00:00:00'),
(95, 'سارة عمرو', '', '01156999737', 1, 'كنب', NULL, '<p>\n	<span style=\"font-size:48px;\">3 CS PAst papers</span></p>\n<p>\n	&nbsp;</p>\n<p>\n	&nbsp;</p>\n', '2018-12-04 14:53:11', 3, 7, 2, 3, NULL, '2018-12-06', '2018-12-06', 255, NULL, NULL, 3, NULL, '2018-12-07 00:00:00'),
(96, 'عبدو سلمان', '', '01125282255', 2, NULL, NULL, '<p>\n	<span style=\"font-size:16px;\">Human p.p</span></p>\n<p>\n	<span style=\"font-size:16px;\">CS NOTES GAMAL</span></p>\n', '2018-12-04 15:17:16', 3, 3, 2, 3, NULL, '2018-12-05', '2018-12-06', 230, NULL, NULL, 3, NULL, '2018-12-06 00:00:00'),
(97, 'مروة القاضي', '', '01222724365', 1, '11ش القدس متفرع من الطائف 3برج الاقصي دور الاول ش4', 1, '<p>\n	<span style=\"font-size:16px;\">ANN Classfied part 2</span></p>\n', '2018-12-04 15:26:41', 3, 4, 4, 4, 1, '2018-12-06', '2018-12-05', 0, NULL, NULL, NULL, NULL, '2018-12-07 00:00:00'),
(98, 'سامح صلاح', '', '01206364062', 2, NULL, NULL, '<p>\n	<span style=\"font-size:16px;\">1B+2B</span></p>\n', '2018-12-04 15:32:00', 2, 4, 2, NULL, NULL, '2018-12-06', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(99, 'د احمد البتانوني', '', '01111104894', 1, 'فيلا 330 فينوس رويال سيتي الشيخ زايد بجوار هايبر وان.', 12, '<p>\n	&nbsp;past papers د مها chemistry</p>\n', '2018-12-04 17:09:28', 4, 4, 2, 4, 1, '2018-12-06', '2018-12-05', 450, NULL, NULL, 7, NULL, '2018-12-10 00:00:00'),
(100, 'احمد ابراهيم ', '', '01111140845', 1, '3أ موريس الطبع من ش زغلول المشغل الهرم ', 1, '<p>\n	ann part 2&nbsp;</p>\n', '2018-12-04 17:11:42', 3, 4, 4, 4, 1, '2018-12-06', '2018-12-05', 0, NULL, NULL, NULL, NULL, NULL),
(101, 'الاري  ايهاب ', '', '01222264386', 1, '1ش غانا مصر الجديدة بجوار ماك الميرلاند', 11, '<p>\n	<span style=\"font-size:22px;\">gamal Ict</span></p>\n', '2018-12-04 17:14:21', 3, 4, 2, 4, 1, '2018-12-06', '2018-12-05', 0, NULL, NULL, NULL, NULL, NULL),
(102, 'ناهد زيدان ', '', '01096185922', 2, NULL, NULL, '<p>\n	<span style=\"font-size:36px;\">hany class&nbsp;</span></p>\n', '2018-12-04 20:04:20', 4, 2, 2, 4, NULL, '2018-12-06', '2018-12-05', 200, NULL, NULL, 4, NULL, '2018-12-05 00:00:00'),
(103, 'ادم احمد ', '', '01275699550', 2, NULL, NULL, '<p>\n	<span style=\"font-size: 36px;\">phy core 2010 + math core 2010</span></p>\n', '2018-12-04 20:05:46', 4, 2, 2, 3, NULL, '2018-12-06', '2018-12-06', 870, NULL, NULL, 3, NULL, '2018-12-13 00:00:00'),
(104, 'على هشام ', '', '01001142046', 2, NULL, NULL, '<p>\n	<span style=\"font-size:48px;\">Hany class o.l</span></p>\n', '2018-12-04 21:50:55', 3, 2, 2, 4, NULL, '2018-12-06', NULL, 150, NULL, NULL, 4, NULL, '2018-12-05 00:00:00'),
(105, 'سلمى شريف ', '', '01223301635', 1, '100ش السودان تقاطع جامعه الدول مع السودان عمارة تويوتا  د4 ش7 ', 7, '<p>\n	<span style=\"font-size:72px;\">allam therm o.l&nbsp;</span></p>\n', '2018-12-04 21:53:49', 3, 2, 2, 4, 1, '2018-12-06', '2018-12-05', 0, NULL, NULL, NULL, NULL, NULL),
(106, 'زين عمر ', '', '01021305657', 2, NULL, NULL, '<p>\n	<span style=\"font-size:36px;\">bio 2006 + ms core&nbsp;</span></p>\n<p>\n	<span style=\"font-size:36px;\">phy 2006 + ms core&nbsp;</span></p>\n<p>\n	<span style=\"font-size:36px;\">chy 2006+ ms core&nbsp;</span></p>\n<p>\n	<span style=\"font-size:36px;\">math 2006 + ms core&nbsp;</span></p>\n', '2018-12-04 22:37:00', 2, 2, 4, NULL, NULL, '2018-12-06', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(107, 'جودى برهان ', '', '01110007882', 2, NULL, NULL, '<p>\n	<span style=\"font-size:36px;\">comp sci نسختين&nbsp;</span></p>\n', '2018-12-05 16:24:40', 2, 4, 2, NULL, NULL, '2018-12-07', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(108, 'المهندس هشام ', '', '01005150908', 1, '4ش وادى النيل المهندسين د9 ش 91', 7, '<p>\n	<span style=\"font-size:36px;\">thermel + mech allam o.l</span></p>\n', '2018-12-05 16:27:14', 4, 4, 2, 2, NULL, '2018-12-07', '2018-12-06', 330, NULL, NULL, 4, NULL, '2018-12-08 00:00:00'),
(109, 'حبيبه محمد ', '', '01271371893', 2, NULL, NULL, '<p>\n	<span style=\"font-size:36px;\">thermal 3 نسخ&nbsp;</span></p>\n', '2018-12-05 17:13:38', 4, 2, 2, 2, NULL, '2018-12-07', NULL, 450, NULL, NULL, 2, NULL, '2018-12-05 00:00:00'),
(110, 'شهد مديح ', '', '01212488733', 1, '20ش استديو الاهرام د4 ش17الهرم ', 1, '<p>\n	<span style=\"font-size:48px;\">thermal 2 <span style=\"font-size:72px;\"><span style=\"background-color:#ff0000;\">نسختين</span></span><span style=\"background-color:#ff0000;\">&nbsp;</span></span></p>\n', '2018-12-05 17:15:23', 3, 2, 2, 3, NULL, '2018-12-08', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(111, 'رولانا تامر ', '', '01015153285', 1, '8ش ابن بطوطة من ش الهرم - على الناصية ناجية سنتر د1 ش5 ', 1, '<p>\n	<span style=\"font-size:22px;\"><span style=\"background-color:#ff0000;\">thermal o.l&nbsp;</span></span></p>\n', '2018-12-05 22:17:26', 4, 2, 2, 2, NULL, '2018-12-07', '2018-12-06', 185, NULL, NULL, 4, NULL, '2018-12-08 00:00:00'),
(112, 'محمود عمرو ', '', '01007337083', 1, 'اوبر سيتى c44 - شيخ زايد د1 ش1 ', 12, '<p>\n	<span style=\"font-size: 48px;\">maha hamdy o.l + m.s</span></p>\n', '2018-12-05 22:18:57', 4, 2, 2, 3, NULL, '2018-12-08', '2018-12-06', 450, NULL, NULL, 4, NULL, '2018-12-08 00:00:00'),
(113, 'نهلة على ', '', '01001539995', 1, '38ش ايران الدقى - د6ش27', 8, '<p>\n	<span style=\"font-size:48px;\">thermal core allam&nbsp;</span></p>\n', '2018-12-06 14:21:09', 4, 2, 2, 3, NULL, '2018-12-08', '2018-12-08', 170, NULL, NULL, 6, NULL, '2018-12-10 00:00:00'),
(114, 'عمر اشرف ', '', '01285528255', 1, 'قطعه 389 - السياحية الرابعه د3 ش7 6اكتوبر ', 3, '<p>\n	<span style=\"font-size:36px;\">math C1 + C2 + C12 2006</span></p>\n<p>\n	<span style=\"font-size:36px;\">مرتجع غازي&nbsp;</span></p>\n<p>\n	<span style=\"font-size:36px;\">8-12</span></p>\n', '2018-12-06 14:23:25', 4, 3, 3, 2, NULL, '2018-12-08', '2018-12-06', 0, NULL, NULL, 4, NULL, '2018-12-09 00:00:00'),
(115, 'زياد معوض ', '', '01014008767', 2, NULL, NULL, '<p>\n	<span style=\"font-size: 48px;\">Thermal o.l allam</span></p>\n', '2018-12-06 14:24:48', 4, 3, 5, 6, NULL, '2018-12-08', '2018-12-08', 150, NULL, NULL, 4, NULL, '2018-12-08 00:00:00'),
(116, 'سيف وليد ', '', '01095894000', 2, NULL, NULL, '<p>\n	<span style=\"font-size:48px;\">thermal o.l</span></p>\n', '2018-12-06 14:37:02', 4, 2, 2, 2, NULL, '2018-12-08', NULL, 150, NULL, NULL, 2, NULL, '2018-12-11 00:00:00'),
(117, 'عبدو سلمان', '', '01125282255', 2, NULL, NULL, '<p>\n	<span style=\"font-size:16px;\"><span style=\"font-family:arial,helvetica,sans-serif;\">Gamal Classfied CS&nbsp;</span></span></p>\n', '2018-12-06 16:08:44', 2, 3, 2, NULL, NULL, '2018-12-08', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(118, 'نور خالد', '', '01129466061', 2, NULL, NULL, '<p>\n	<span style=\"font-size:22px;\">MONA ABE ELGHANY HUMAN CLASS</span></p>\n', '2018-12-06 19:58:18', 2, 1, 2, NULL, NULL, '2018-12-08', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(119, 'نور الهدى علام', '', '01229292592', 2, NULL, NULL, '<p>\n	<span style=\"font-size:48px;\">ANN 3 نسخ&nbsp;</span></p>\n', '2018-12-06 21:05:27', 2, 1, 4, NULL, NULL, '2018-12-08', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(120, 'زياد محسن ', '', '01008212196', 2, NULL, NULL, '<p>\n	<span style=\"font-size:48px;\">ARABIC EDX&nbsp;</span></p>\n', '2018-12-06 21:09:11', 2, 2, 2, NULL, NULL, '2018-12-07', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(121, 'ينال رفيق ', '', '01027609699', 1, '36ش الحسن من المروة الدقى د8ش22', 8, '<p>\n	<span style=\"font-size:48px;\">THERMAL O.L</span></p>\n', '2018-12-06 21:11:03', 3, 2, 2, 3, NULL, '2018-12-08', '2018-12-08', 0, NULL, NULL, NULL, NULL, NULL),
(122, 'مروان عصام', '', '01117322224', 2, NULL, NULL, '<p>\n	<span style=\"font-family:arial,helvetica,sans-serif;\"><span style=\"font-size:16px;\">CS P.P</span></span></p>\n', '2018-12-07 13:59:16', 4, 3, 2, 3, NULL, '2018-12-08', '2018-12-11', 85, NULL, NULL, 3, NULL, '2018-12-11 00:00:00'),
(123, 'سارة عمرو', '', '01156999737', 2, NULL, NULL, '<p>\n	<span style=\"font-size:16px;\">Cmmputer SCIENCE</span></p>\n', '2018-12-07 14:08:28', 4, 3, 4, 3, NULL, '2018-12-08', '2018-12-08', 85, NULL, NULL, 3, NULL, '2018-12-08 00:00:00'),
(124, 'مجدى رمضان', '', '01006007505', 1, 'الزمالك شارع بن النبية موبايل مى ', 20, '<p>\n	<span style=\"font-size:16px;\">Math A.S C1+C2+C12</span></p>\n<p>\n	<span style=\"font-size:16px;\">2B Pastpaper</span></p>\n', '2018-12-07 14:13:34', 4, 2, 2, 2, NULL, '2018-12-09', '2018-12-07', 390, NULL, NULL, 2, NULL, '2018-12-07 00:00:00'),
(125, 'احمد فاروق', '', '01222430810', 1, '11 تقسيم الرقابة الادارية المعادى الجديدة بجوار منزل الدائرى د8 ش 82', 6, '<p>\n	<span style=\"font-size:16px;\"><span style=\"font-family:arial,helvetica,sans-serif;\">Maha Hamdy O.L + M.S</span></span></p>\n', '2018-12-07 19:54:36', 3, 3, 3, 3, NULL, '2018-12-09', '2018-12-08', 0, NULL, NULL, NULL, NULL, NULL),
(126, 'محمد الحلو', '', '01112452455', 2, NULL, NULL, '<p>\n	<span style=\"font-size:16px;\"><span style=\"font-family:arial,helvetica,sans-serif;\">ANN Part 2</span></span></p>\n<p>\n	<span style=\"font-family:arial,helvetica,sans-serif;\"><span style=\"font-size:16px;\">ANN Notes</span></span></p>\n', '2018-12-07 19:57:21', 2, 3, 3, NULL, NULL, '2018-12-08', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(127, 'مروة مشعل ', '', '01223241618', 1, 'فيلا312 كمباوند غرب الجولف بجوار القطامية هايتس ', 13, '<p>\n	<span style=\"font-size: 36px;\">maha hamdy ol + m.s</span></p>\n', '2018-12-07 20:24:00', 3, 4, 3, 4, 1, '2018-12-09', '2018-12-08', 0, NULL, NULL, NULL, NULL, NULL),
(128, 'كريم السعيد ', '', '01111114940', 2, NULL, NULL, '<p>\n	<span style=\"font-size:48px;\">thermal 5نسخ +&nbsp; allam gr9 كاملة +Mechanics O.L</span></p>\n', '2018-12-07 20:25:42', 4, 4, 5, 4, NULL, '2018-12-09', '2018-12-08', 1320, NULL, NULL, 4, NULL, '2018-12-08 00:00:00'),
(129, 'زياد خير الله ', '', '01000400047', 1, 'جاردنيا 1 - فيلا 52 - 6اكتوبر ', 3, '<p>\n	<span style=\"font-size:48px;\">heba elshaer gr7</span></p>\n', '2018-12-07 20:28:09', 3, 2, 5, 3, NULL, '2018-12-09', '2018-12-08', 0, NULL, NULL, NULL, NULL, NULL),
(130, 'ادهم وليد ', '', '01223408344', 1, '1ش اليمن  ميدان لبنان المهندسين الدور الثالث', 7, '<p>\n	<span style=\"font-size:72px;\">5 نسخ thermal o.l</span></p>\n', '2018-12-07 21:25:00', 3, 2, 2, 4, NULL, '2018-12-09', '2018-12-09', 780, NULL, NULL, 4, NULL, '2018-12-09 00:00:00'),
(131, 'يوسف الكردى ', '', '01114331466', 1, '12ش الحجاز المهندسين د3ش7', 7, '<p>\n	<span style=\"font-size:48px;\">thermal o.l&nbsp;</span></p>\n', '2018-12-07 21:26:37', 3, 7, 2, 3, NULL, '2018-12-09', '2018-12-08', 0, NULL, NULL, NULL, NULL, NULL),
(132, 'حسام غازى', '', '01117125504', 1, 'الشطر13 زهراء المعادى - عمارة33/8 د5 ش يمين الاسانسير ', 6, '<p>\n	<span style=\"font-size:48px;\">Mostafa allam gr9</span></p>\n', '2018-12-07 21:28:22', 3, 7, 2, 3, NULL, '2018-12-09', '2018-12-08', 0, NULL, NULL, NULL, NULL, NULL),
(133, 'ليلى زهران', '', '01060660036', 2, NULL, NULL, '<p>\n	<span style=\"font-size:24px;\">&nbsp;Math C12 P.P</span></p>\n', '2018-12-08 10:36:34', 4, 3, 3, 3, NULL, '2018-12-08', '2018-12-08', 110, NULL, NULL, 3, NULL, '2018-12-08 00:00:00'),
(134, 'عبدالله الخولى', '', '01006071073', 2, NULL, NULL, '<p>\n	<span style=\"font-size:20px;\"><span style=\"font-family:arial,helvetica,sans-serif;\">Heba Elshaer G7&nbsp;</span></span></p>\n', '2018-12-08 11:02:25', 2, 3, 3, NULL, NULL, '2018-12-08', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(135, 'بسنت كمال', '', '01111436802', 2, NULL, NULL, '<p>\n	<span style=\"font-size:22px;\"><span style=\"font-family:arial,helvetica,sans-serif;\">Thermal .O.L</span></span></p>\n', '2018-12-08 11:52:37', 4, 3, 3, 3, NULL, '2018-12-08', '2018-12-08', 150, NULL, NULL, 3, NULL, '2018-12-08 00:00:00'),
(136, 'نور مدحت', '', '01202161616', 2, NULL, NULL, '<p>\n	<span style=\"font-family:arial,helvetica,sans-serif;\"><span style=\"font-size:20px;\">Biology 2B P.P</span></span></p>\n', '2018-12-08 13:16:09', 2, 3, 3, NULL, NULL, '2018-12-09', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(137, 'حازم احمد', '', '01118119182', 2, NULL, NULL, '<p>\n	<span style=\"font-size:20px;\"><span style=\"font-family:arial,helvetica,sans-serif;\">ANN Part 2</span></span></p>\n', '2018-12-08 13:37:09', 4, 3, 3, 4, NULL, '2018-12-09', '2018-12-11', 180, NULL, NULL, 2, NULL, '2018-12-11 00:00:00'),
(138, 'ملك هشام ', '', '01011411244', 1, 'فيلا 105 المجاورة 4 الحي 9 الشيخ زايد ', 12, '<p>\n	<span style=\"font-size:22px;\">maha hamdy + m.s o.l</span></p>\n', '2018-12-08 14:24:16', 3, 4, 4, 4, NULL, '2018-12-10', '2018-12-08', 0, NULL, NULL, NULL, NULL, NULL),
(139, 'مايا محمد', '', '01001550575', 2, NULL, NULL, '<p>\n	<span style=\"font-family:arial,helvetica,sans-serif;\"><span style=\"font-size:20px;\">Ahmed Moataz Cambridge&nbsp;</span></span></p>\n<p>\n	<span style=\"font-size:20px;\">Classfied + Notes O.L</span></p>\n', '2018-12-08 15:14:13', 4, 3, 3, 4, NULL, '2018-12-09', '2018-12-09', 170, NULL, NULL, 4, NULL, '2018-12-09 00:00:00'),
(140, 'احمد محمد يحيى', '', '01009555365', 1, '93ش احمد عرابى د8 ش802', 7, '<p>\n	NOTES ALIA ENG</p>\n', '2018-12-08 18:23:39', 3, 1, 4, 4, 0, '2018-12-10', '2018-12-08', 0, NULL, NULL, NULL, NULL, NULL),
(141, 'هنا سعيد ', '', '01287777701', 1, '7 ش شاهين العجوزة د7 ش 13', 9, '<p>\n	<span style=\"font-size:26px;\">ANN PART 2&nbsp;</span></p>\n', '2018-12-08 18:35:19', 3, 4, 4, 4, NULL, '2018-12-10', '2018-12-08', 0, NULL, NULL, NULL, NULL, NULL),
(142, 'هشام عثمان', '', '01000560085', 1, '13ش عبد لبحميد لطفى متفرع من البطل احمد عبد العزيز -  د3 - ش6', 7, '<p>\n	<span style=\"font-size:48px;\">THERMAL ALLAM O.L</span></p>\n', '2018-12-08 19:50:54', 4, 1, 1, 6, 2, '2018-12-10', '2018-12-09', 180, NULL, NULL, 3, NULL, '2018-12-09 00:00:00'),
(143, 'جون ', '', '01012222560', 2, NULL, NULL, '<p>\n	<span style=\"font-size:22px;\">CHE + BIO+ MATH G9 2010</span></p>\n', '2018-12-08 20:06:22', 2, 4, 4, NULL, NULL, '2018-12-09', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(144, 'يوسف حازم ', '', '01006810007', 2, NULL, NULL, '<p>\n	COMPUTER + M.S&nbsp;</p>\n', '2018-12-08 20:07:41', 4, 4, 4, 1, NULL, '2018-12-10', NULL, 0, NULL, NULL, NULL, NULL, '2018-12-08 00:00:00'),
(145, 'كريم محي الدين ', '', '01114822212', 2, NULL, NULL, '<p>\n	هبة الشاعر G8&nbsp;</p>\n', '2018-12-08 20:09:17', 4, 4, 4, 2, NULL, '2018-12-09', NULL, 0, NULL, NULL, 2, NULL, '2018-12-10 00:00:00'),
(146, 'لارا هانى', '', '01227446784', 2, NULL, NULL, '<p>\n	<span style=\"font-size:36px;\">ALLAM MEC + THE O.L</span></p>\n', '2018-12-08 20:26:54', 2, 1, 1, NULL, NULL, '2018-12-10', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(147, 'امينة محمد ', '', '01066626006', 1, '13ش التحرير بجوار محطة مترو البحوث - د4 - ش17', 7, '<p>\n	<span style=\"font-size:48px;\">ANN PART 2</span></p>\n', '2018-12-08 20:48:50', 4, 1, 1, 6, 2, '2018-12-10', '2018-12-09', 210, NULL, NULL, 6, NULL, '2018-12-09 00:00:00'),
(148, 'عمرو وجدى ', '', '01114044660', 2, NULL, NULL, '<p>\n	<span style=\"font-size:48px;\">ALLAM THERMAL O.L</span></p>\n', '2018-12-08 20:50:14', 4, 1, 1, 3, NULL, '2018-12-10', '2018-12-10', 0, NULL, NULL, 3, NULL, '2018-12-10 00:00:00'),
(149, 'ثويبه البرعى', '', '01141337700', 2, NULL, NULL, '<p>\n	<span style=\"font-size:48px;\">CLASS AHMED MOATZ O.L</span></p>\n', '2018-12-08 21:22:07', 2, 1, 1, NULL, NULL, '2018-12-10', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(150, 'احمد احمد ', '', '01122556354', 2, NULL, NULL, '<p>\n	<span style=\"font-size:48px;\">ann part 2</span></p>\n', '2018-12-08 21:52:10', 4, 1, 1, 1, NULL, '2018-12-10', NULL, 0, NULL, NULL, NULL, NULL, '2018-12-08 00:00:00'),
(151, 'مريم احمد', '', '01091254026', 1, '٢٧ أنس بن مالك  من شارع شهاب -المهندسين - الدور التاني شقة ٢٢', 7, '<p>\n	<span style=\"font-size:48px;\">2 copy thermal classifieds O.L</span></p>\n', '2018-12-08 22:03:06', 4, 1, 1, 6, 2, '2018-12-10', '2018-12-09', 330, NULL, NULL, 6, NULL, '2018-12-09 00:00:00'),
(152, 'عبدالرحمن رشاد', '', '01101881886', 2, NULL, NULL, '<p>\n	<span style=\"font-family:arial,helvetica,sans-serif;\"><span style=\"font-size:20px;\">Mostafa Allam Thermal O.L</span></span></p>\n', '2018-12-09 12:13:28', 4, 3, 3, 3, NULL, '2018-12-09', '2018-12-09', 150, NULL, NULL, 3, NULL, '2018-12-09 00:00:00'),
(153, 'على تامر', '', '01010028863', 2, NULL, NULL, '<p>\n	<span style=\"font-family:arial,helvetica,sans-serif;\"><span style=\"font-size:20px;\">A.Moataz Classfied Edexcel</span></span></p>\n', '2018-12-09 12:34:41', 4, 3, 3, 3, NULL, '2018-12-09', '2018-12-09', 100, NULL, NULL, 3, NULL, '2018-12-09 00:00:00'),
(154, 'احمد طارق', '', '01003516201', 2, NULL, NULL, '<p>\n	<span style=\"font-size:24px;\"><span style=\"font-family:arial,helvetica,sans-serif;\">1B +2B P.P</span></span></p>\n', '2018-12-09 14:50:28', 4, 3, 3, 3, NULL, '2018-12-11', '2018-12-09', 215, NULL, NULL, 3, NULL, '2018-12-09 00:00:00'),
(155, 'غادة ', '', '01140999772', 2, NULL, NULL, '<p>\n	<span style=\"font-size:22px;\">COMPUTER SCINCE</span></p>\n', '2018-12-09 15:06:48', 2, 4, 3, NULL, NULL, '2018-12-10', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(156, 'اسراء سمير ', '', '01009051686', 2, NULL, NULL, '<p>\n	<span style=\"font-size:26px;\">COMPUTER SCINCE&nbsp;</span></p>\n<p>\n	&nbsp;</p>\n', '2018-12-09 15:07:53', 4, 4, 4, 3, NULL, '2018-12-10', '2018-12-11', 85, NULL, NULL, 3, NULL, '2018-12-11 00:00:00'),
(157, 'عمر حمدي احمد ', '', '01003959570', 2, NULL, NULL, '<p>\n	<span style=\"font-size:20px;\">NILY ECO PART 2&nbsp;</span></p>\n', '2018-12-09 15:11:35', 4, 4, 3, 3, NULL, '2018-12-10', '2018-12-10', 50, NULL, NULL, 3, NULL, '2018-12-10 00:00:00'),
(158, 'جنا محمد مجدى', '', '01007136396', 1, 'غرب سوميد - مجاورة 3 - اكتوبر - بلوك 3/15 - شارع هدى شعراوى فيلا 4', 3, '<p>\n	<span style=\"font-size:48px;\">ANN PART 2</span></p>\n', '2018-12-09 18:36:05', 3, 1, 1, 3, 1, '2018-12-11', '2018-12-10', 0, NULL, NULL, NULL, NULL, '2018-12-10 00:00:00'),
(159, 'عبد الرحمن اشرف', '', '01005082801', 1, 'ش 102 المقطم عمارة -  8163 - د1 ش4 - اول شارع يمين شارع 9', 15, '<p>\n	<span style=\"font-size:20px;\">Mostafa Allam O.L</span></p>\n<p>\n	<span style=\"font-size:20px;\">Mechanics + Thermal + Notes</span></p>\n', '2018-12-09 18:45:32', 3, 3, 3, 3, 1, '2018-12-11', '2018-12-10', 0, NULL, NULL, NULL, NULL, NULL),
(160, 'دانى فيكتور ', '', '01223377507', 1, '4ش الببلاوى من جمال الدين الافغانى - الهرم د3 ش 3 خلف معهد السينما ', 1, '<p>\n	<span style=\"font-size: 48px;\">CHY CORE 2006 + M.S</span></p>\n', '2018-12-09 20:31:18', 3, 2, 2, 3, 1, '2018-12-11', '2018-12-10', 0, NULL, NULL, NULL, NULL, NULL),
(161, 'احمد هشام ', '', '01127779370', 1, 'فيلا 144 الحى 4 المنطقة 5 - التجمع الخامس بجوار مدرسة الفرابى خلف شارع قسم التجمع ', 14, '<p>\n	<span style=\"font-size:36px;\">THERMAL O.L&nbsp;</span></p>\n', '2018-12-09 20:33:31', 3, 2, 2, 3, 1, '2018-12-11', '2018-12-10', 0, NULL, NULL, NULL, NULL, NULL),
(162, 'عبدالله زاهر ', '', '01111909299', 2, NULL, NULL, '<p>\n	<span style=\"font-size:48px;\">french p1 / p2 2015&nbsp;</span></p>\n', '2018-12-09 22:37:42', 4, 2, 1, 3, NULL, '2018-12-10', '2018-12-10', 140, NULL, NULL, 3, NULL, '2018-12-10 00:00:00'),
(163, 'محمد ياسر ', '', '01024898420', 2, NULL, NULL, '<p>\n	<span style=\"font-size:36px;\">eng 2006 o.l cam</span></p>\n', '2018-12-10 12:54:41', 4, 4, 3, 3, NULL, '2018-12-11', NULL, 0, NULL, NULL, 4, NULL, '2018-12-11 00:00:00'),
(164, 'عمر اشرف ', '', '01285528255', 1, 'قطعه 389 - السياحية الرابعه د3 ش7 6اكتوبر ', 3, '<p>\n	&nbsp;</p>\n<p>\n	<span style=\"color: rgb(68, 68, 68); font-family: Tahoma, Arial, sans-serif; font-size: 36px; text-align: right; background-color: rgb(237, 237, 237);\">math C1 + C2 + C12 2006</span></p>\n<p>\n	&nbsp;</p>\n', '2018-12-10 13:44:35', 3, 4, 4, 4, 1, '2018-12-11', '2018-12-10', 0, NULL, NULL, NULL, NULL, NULL),
(165, 'هنا النجار ', '', '01122464119', 2, NULL, NULL, '<p>\n	<span style=\"font-size:36px;\">ANN P2</span></p>\n', '2018-12-10 14:04:08', 2, 4, 1, NULL, NULL, '2018-12-12', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(166, 'رنا حازم', '', '01154020900', 2, NULL, NULL, '<p>\n	<span style=\"font-size:48px;\">C1 + C2 + C12</span></p>\n', '2018-12-10 15:18:31', 2, 2, 3, NULL, NULL, '2018-12-12', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(167, 'احمد عبد المعز', '', '01112181316', 1, '27ش اسراء المعلمين - ميدان لبنان - د3 - ش5', 7, '<p>\n	<span style=\"font-size:48px;\">ALLAM THERMAL O.L</span></p>\n', '2018-12-10 18:17:17', 4, 1, 1, 3, 2, '2018-12-12', '2018-12-11', 180, NULL, NULL, 4, NULL, '2018-12-12 00:00:00'),
(168, 'ريهام عبد العزيز ', '', '01223979279', 2, NULL, NULL, '<p>\n	<span style=\"font-size:36px;\">chy maha hamdy o.l&nbsp;</span></p>\n<p>\n	<span style=\"font-size:36px;\">travel &amp; tourism نسختين&nbsp;</span></p>\n', '2018-12-10 18:27:09', 2, 2, 2, NULL, NULL, '2018-12-12', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(169, 'منة مصطفى ', '', '01023220828', 2, NULL, NULL, '<p>\n	<span style=\"font-size:48px;\">ARABIC EDX O.L</span></p>\n', '2018-12-10 18:56:44', 2, 1, 1, NULL, NULL, '2018-12-12', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(170, 'رولا احمد', '', '01003889468', 1, 'الفسطاط الجديدة - المجاورة 2 - عمارة 97 - د1 - ش12', 22, '<p>\n	<span style=\"font-size:48px;\">ALLAM THERMAL O.L</span></p>\n', '2018-12-10 19:24:57', 3, 1, 1, 2, 1, '2018-12-12', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(171, 'لوجين خالد ', '', '01099968793', 1, '15ش رشيد من احمد عرابى د8 ش28 المهندسين ', 7, '<p>\n	<span style=\"font-size:48px;\"><span style=\"background-color:#ff0000;\">ANN P2</span></span></p>\n<p>\n	<span style=\"font-size:48px;\"><span style=\"background-color:#ff0000;\">ENG O.L 2006&nbsp;</span></span></p>\n', '2018-12-10 19:45:30', 4, 2, 2, 3, 2, '2018-12-12', '2018-12-11', 470, NULL, NULL, 4, NULL, '2018-12-12 00:00:00'),
(172, 'كنزى هيثم', '', '01026334563', 2, NULL, NULL, '<p>\n	ANN PART 2</p>\n', '2018-12-10 22:06:14', 2, 2, 3, NULL, NULL, '2018-12-12', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(173, 'محمد ابراهيم', '', '01001531211', 1, 'دريم لاند عمارة 706- د 4 - ش 55', 3, '<p>\n	<span style=\"font-family:arial,helvetica,sans-serif;\"><span style=\"font-size:20px;\">Maha Hamdy O.L +M.S</span></span></p>\n', '2018-12-11 09:45:54', 3, 3, 3, 3, 1, '2018-12-13', '2018-12-11', 0, NULL, NULL, NULL, NULL, NULL),
(174, 'الحاج علاء عبد المنعم', '', '01001900148', 1, '22 ش مهدى عرفة -متفرع من ذاكر حسين-الحى العاشر مدينة نصر-الدور 11- شمال الاسانسير-امام مسجد نور الاسلام-برج الفردوس', 10, '<p>\n	<span style=\"font-family:comic sans ms,cursive;\"><span style=\"font-size:20px;\">&nbsp;Mostafa Allam Classfied ALL G9 7Copies</span></span></p>\n<p>\n	<span style=\"font-family:comic sans ms,cursive;\"><span style=\"font-size:20px;\">&nbsp;Mostafa Allam Notes&nbsp; G9&nbsp;</span></span><span style=\"font-family: &quot;comic sans ms&quot;, cursive; font-size: 20px;\">5 Copies</span></p>\n', '2018-12-11 11:21:17', 3, 7, 3, 3, 1, '2018-12-13', '2018-12-11', 0, NULL, NULL, NULL, NULL, '2018-12-11 00:00:00'),
(175, 'اسراء سمير ', '', '01009051686', 2, NULL, NULL, '<p>\n	<span style=\"font-size:20px;\"><span style=\"font-family:comic sans ms,cursive;\">Mostafa Allam Thermal O.L</span></span></p>\n', '2018-12-11 11:35:40', 2, 3, 3, NULL, NULL, '2018-12-13', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(176, 'شهد اشرف ', '', '01021222465', 1, 'حدائق الاهرام 90 هـ البوابه 2 ', 5, '<p>\n	<span style=\"font-family:arial,helvetica,sans-serif;\"><span style=\"font-size:20px;\">Physics P1+P3 2010+ M.S</span></span></p>\n', '2018-12-11 12:32:07', 3, 3, 3, 3, 1, '2018-12-13', '2018-12-11', 0, NULL, NULL, NULL, NULL, NULL),
(177, 'مريم حازم', '', '01009294378', 1, 'حى الاشجار -عمارة 145- د3 - ش7 بجوار الفردوس امام دريم لاند طريق الواحات', 3, '<p>\n	<span style=\"font-size:20px;\"><span style=\"font-family:arial,helvetica,sans-serif;\">ANN Part 2</span></span></p>\n', '2018-12-11 12:35:23', 3, 4, 4, 3, 1, '2018-12-13', '2018-12-11', 0, NULL, NULL, NULL, NULL, NULL),
(178, 'فريدة ياسر', '', '01140999772', 2, NULL, NULL, '<p>\n	<span style=\"font-family:comic sans ms,cursive;\"><span style=\"font-size:20px;\">Math C12 P.P</span></span></p>\n', '2018-12-11 12:37:10', 2, 3, 3, NULL, NULL, '2018-12-13', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(179, 'ليلى زهران', '', '01060660036', 2, NULL, NULL, '<p>\n	C1 + C2&nbsp;</p>\n', '2018-12-11 14:23:18', 2, 2, 2, NULL, NULL, '2018-12-13', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(180, 'فرح محسن ', '', '01003296155', 2, NULL, NULL, '<p>\n	<span style=\"font-size:48px;\">3 نسخ COMP SCI&nbsp;</span></p>\n<p>\n	<span style=\"font-size:48px;\">CLASS + NOTES عرفى&nbsp;</span></p>\n', '2018-12-11 14:27:03', 2, 2, 2, NULL, NULL, '2018-12-13', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(181, 'احمد عشرى ', '', '01221091002', 2, NULL, NULL, '<p>\n	<span style=\"font-size:48px;\">M.S 3H + 4H 2006</span></p>\n', '2018-12-11 14:32:37', 2, 2, 2, NULL, NULL, '2018-12-12', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(182, 'هيا وليد ', '', '01008883066', 1, 'ابن النبيه الزمالك ', 20, '<p>\n	<span style=\"font-size:48px;\">c2 + c12&nbsp;</span></p>\n', '2018-12-11 15:22:21', 4, 2, 2, 2, NULL, '2018-12-11', NULL, 205, NULL, NULL, 2, NULL, '2018-12-12 00:00:00'),
(183, 'عبدالله نجم ', '', '01200384119', 2, NULL, NULL, '<p>\n	<span style=\"font-size:48px;\">thermal 2 نسختين&nbsp;</span></p>\n', '2018-12-11 15:55:50', 4, 2, 4, 4, NULL, '2018-12-12', NULL, 0, NULL, NULL, 2, NULL, '2018-12-13 00:00:00'),
(184, 'جودي برهان ', '', '01110007882', 2, NULL, NULL, '<p>\n	m1</p>\n', '2018-12-11 17:13:05', 4, 4, 1, 2, NULL, '2018-12-13', NULL, 170, NULL, NULL, 2, NULL, '2018-12-12 00:00:00'),
(185, 'هبة صفوت', '', '01001661040', 2, NULL, NULL, '<p>\n	<span style=\"font-size:48px;\">MATH P.P CHECKPOINT</span></p>\n', '2018-12-11 18:25:17', 4, 1, 1, 4, NULL, '2018-12-13', NULL, 140, NULL, NULL, 2, NULL, '2018-12-12 00:00:00'),
(186, 'احمد السكرى ', '', '00000000000', 2, NULL, NULL, '<p>\n	<span style=\"font-size:36px;\">ann p2 نسختين&nbsp;</span></p>\n', '2018-12-11 19:48:54', 4, 2, 2, 4, NULL, '2018-12-13', NULL, 360, NULL, NULL, NULL, NULL, '2018-12-12 00:00:00'),
(187, 'مريم عبد الكريم', '', '01066940941', 1, '5ش البطل احمد عبد العزيز - د1 ش13 ', 7, '<p>\n	<span style=\"font-size:48px;\">ann p2&nbsp; نسختين&nbsp;</span></p>\n', '2018-12-11 19:59:14', 3, 7, 1, 2, NULL, '2018-12-13', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(188, 'محمد مصطفى', '', '01113223915', 2, NULL, NULL, '<p>\n	<span style=\"font-size:28px;\">ANN PART 2 - 2 COPIES</span></p>\n', '2018-12-11 20:24:28', 4, 1, 1, 4, NULL, '2018-12-13', NULL, 370, NULL, NULL, 4, NULL, '2018-12-12 00:00:00'),
(189, 'ايمن وهدان', '', '01229901990', 2, NULL, NULL, '<p>\n	<span style=\"font-size:28px;\">ANN PART 2&nbsp;</span></p>\n<p>\n	<span style=\"font-size:28px;\">MATH - P.P G8</span></p>\n<p>\n	<span style=\"font-size:28px;\">BIO - P.P G9</span></p>\n<p>\n	<span style=\"font-size:28px;\">PHY - P.P G9</span></p>\n', '2018-12-11 21:34:03', 4, 1, 4, 4, NULL, '2018-12-13', '2018-12-15', 1505, NULL, NULL, 3, NULL, '2018-12-15 00:00:00'),
(190, 'اثر محمد ', '', '01001308627', 2, NULL, NULL, '<p>\n	<span style=\"font-size:48px;\">thermal o.l</span></p>\n', '2018-12-12 14:35:14', 4, 2, 1, 4, NULL, '2018-12-14', NULL, 150, NULL, NULL, 4, NULL, '2018-12-13 00:00:00'),
(191, 'امينة كردية', '', '01110007993', 2, NULL, NULL, '<p>\n	<span style=\"font-size:48px;\">3H 2010</span></p>\n<p>\n	<span style=\"font-size:48px;\">4H 2010</span></p>\n<p>\n	<span style=\"font-size:48px;\">C12</span></p>\n', '2018-12-12 14:36:47', 3, 2, 4, 4, NULL, '2018-12-13', NULL, 370, NULL, NULL, 4, NULL, '2018-12-13 00:00:00'),
(192, 'مريم احمد ', '', '01119009020', 2, NULL, NULL, '<p>\n	<span style=\"font-size:28px;\">BIO V2&amp;3 2010</span></p>\n', '2018-12-12 15:00:51', 2, 2, 1, NULL, NULL, '2018-12-14', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(193, 'على عماد ', '', '01128200557', 2, NULL, NULL, '<p>\n	ANN PART 2&nbsp;</p>\n', '2018-12-12 15:04:58', 2, 2, 2, NULL, NULL, '2018-12-14', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(194, 'عبد الرحمن بدر', '', '01123264044', 2, NULL, NULL, '<p>\n	<span style=\"font-size:36px;\">ALIAA ENG O.L&nbsp;</span></p>\n<p>\n	<span style=\"font-size:36px;\">THERMAL O.L&nbsp;</span></p>\n', '2018-12-12 15:26:08', 4, 2, 2, 2, NULL, '2018-12-13', NULL, 770, NULL, NULL, 2, NULL, '2018-12-12 00:00:00'),
(195, 'مهند اشرف ', '', '01004754540', 1, 'وادى الربيع فيلا 69 اكتوبر المتتميز ', 3, '<p>\n	THERMAL O.L&nbsp;</p>\n', '2018-12-12 15:59:32', 3, 2, 2, 3, 1, '2018-12-14', '2018-12-15', 0, NULL, NULL, NULL, NULL, NULL),
(196, 'مريم فرج ', '', '01009456096', 2, NULL, NULL, '<p>\n	<span style=\"font-size:72px;\">C12</span></p>\n', '2018-12-12 17:08:17', 4, 2, 2, 2, NULL, '2018-12-14', NULL, 0, NULL, NULL, 2, NULL, '2018-12-12 00:00:00'),
(197, 'ادهم حاتم ', '', '01125222888', 2, NULL, NULL, '<p>\n	<span style=\"font-family:comic sans ms,cursive;\"><span style=\"font-size:28px;\">tarvel&nbsp;</span></span></p>\n<p>\n	<span style=\"font-family:comic sans ms,cursive;\"><span style=\"font-size:28px;\">mah hamdy o.l</span></span></p>\n<p>\n	<span style=\"font-family:comic sans ms,cursive;\"><span style=\"font-size:28px;\">barakat camb o.l&nbsp;</span></span></p>\n', '2018-12-12 18:58:40', 4, 2, 2, 2, NULL, '2018-12-14', NULL, 715, NULL, NULL, 2, NULL, '2018-12-13 00:00:00'),
(198, 'سارة هشام ', '', '01142392985', 1, '2ش عدبره من احمد عرابى د1ش 2 اعلى صيدلية التحسين ', 7, '<p>\n	<span style=\"font-family:georgia,serif;\"><span style=\"font-size:28px;\">heba gr6</span></span></p>\n<p>\n	<span style=\"font-family:georgia,serif;\"><span style=\"font-size:28px;\">sci gr6&nbsp;</span></span></p>\n<p>\n	<span style=\"font-family:georgia,serif;\"><span style=\"font-size:28px;\">math gr6</span></span></p>\n', '2018-12-12 21:11:34', 4, 2, 2, 4, 2, '2018-12-14', NULL, 570, NULL, NULL, 4, NULL, '2018-12-14 00:00:00'),
(199, 'اندرو امجد', '', '01221600376', 1, 'حدائق الزيتون - 11 ش محمود سالم - من محطة المترو بجوار كبرى سنان - د 8 - ش32', 0, '<p>\n	<span style=\"font-size:36px;\">eng core heba hassan&nbsp;</span></p>\n', '2018-12-12 22:38:07', 3, 2, 2, 2, 1, '2018-12-14', NULL, 0, NULL, NULL, NULL, NULL, '2018-12-13 00:00:00'),
(200, 'اسراء ', '', '01125661100', 2, NULL, NULL, '<p>\n	c12</p>\n', '2018-12-13 13:50:25', 4, 4, 4, 4, NULL, '2018-12-15', '2018-12-14', 110, NULL, NULL, 4, NULL, NULL),
(201, 'ادم احمد ', '', '01005455552', 2, NULL, NULL, '<p>\n	<span style=\"font-size:48px;\">m.s math 2010</span></p>\n<p>\n	<span style=\"font-size: 48px;\">che 2010+ bio 2010</span></p>\n', '2018-12-13 14:09:55', 2, 2, 6, NULL, NULL, '2018-12-15', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(202, 'منه محرم ', '', '01000800114', 1, '5بدر الدين من الدقى - الدقى د11ش 1102', 8, '<p>\n	<span style=\"font-size:36px;\"><span style=\"font-family:times new roman,times,serif;\">M.S BUIS P1 + P2&nbsp;</span></span></p>\n<p>\n	<span style=\"font-size:36px;\"><span style=\"font-family:times new roman,times,serif;\">M.S C12&nbsp;</span></span></p>\n', '2018-12-13 14:57:33', 4, 2, 2, 3, 2, '2018-12-15', '2018-12-15', 325, NULL, NULL, 6, NULL, '2018-12-16 00:00:00'),
(203, 'سما شريف ', '', '01009978666', 1, '21/6 زهراء المعادى بجوار نقطة شرطة زهراء المعادى د1', 6, '<p>\n	<span style=\"font-size:48px;\">THERMAL O.L&nbsp;</span></p>\n', '2018-12-13 16:44:29', 3, 2, 2, 3, 1, '2018-12-16', '2018-12-15', 0, NULL, NULL, NULL, NULL, NULL),
(204, 'مصطفى كريم ', '', '01227836792', 2, NULL, NULL, '<p>\n	<span style=\"font-size:36px;\">MATH GR8&nbsp;</span></p>\n<p>\n	<span style=\"font-size:36px;\">ENG SCE</span></p>\n', '2018-12-13 16:58:59', 2, 2, 3, NULL, NULL, '2018-12-14', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(205, 'نور الدين رفاعى ', '', '01007671500', 2, NULL, NULL, '<p>\n	<span style=\"font-family:times new roman,times,serif;\"><span style=\"font-size:36px;\">MATH GR8 +M.S</span></span></p>\n<p>\n	<span style=\"font-family:times new roman,times,serif;\"><span style=\"font-size:36px;\">ENG SCE +M.S + CD</span></span></p>\n', '2018-12-13 17:00:19', 2, 2, 6, NULL, NULL, '2018-12-14', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(206, 'عمر عصام ', '', '01008719991', 1, '5 ش سوريا د7 ش1701 المهندسين ', 7, '<p>\n	<span style=\"font-family:georgia,serif;\"><span style=\"font-size:48px;\">Esaam english Core + cd&nbsp;</span></span></p>\n', '2018-12-13 20:41:05', 4, 2, 3, 3, 2, '2018-12-15', '2018-12-15', 335, NULL, NULL, 6, NULL, '2018-12-16 00:00:00'),
(207, 'رحاب توكل ', '', '01008632080', 1, '7049ش 17 من ش 9 د2 ش2 ع الناصية اولاد رجب القديم ', 15, '<p>\n	<span style=\"font-family:courier new,courier,monospace;\"><span style=\"font-size:48px;\">Mech + Thermal O.L&nbsp;</span></span></p>\n', '2018-12-13 20:58:43', 3, 2, 2, 3, 1, '2018-12-15', '2018-12-15', 0, NULL, NULL, NULL, NULL, NULL),
(208, ' على عماد', '', '01128200557', 2, NULL, NULL, '<p>\n	ANN NOTES + ANN EDX P.P 2014</p>\n', '2018-12-13 23:02:14', 4, 1, 1, 1, NULL, '2018-12-15', NULL, 0, NULL, NULL, 1, NULL, '2018-12-13 00:00:00'),
(209, 'سامح فواد', '', '01223383630', 1, '7 ش محمود عزمي الجيزة ع الناصية قطونيل', 1, '<p>\n	ann part 2&nbsp;</p>\n', '2018-12-14 14:07:06', 4, 4, 4, 4, 2, '2018-12-13', '2018-12-13', 210, NULL, NULL, 4, NULL, '2018-12-04 00:00:00'),
(210, 'المتسشار احمد حمدي ', '', '01141402260', 1, '5 ش عامر ميدان المساحة د2 ش 204', 8, '<p>\n	<span style=\"font-size:28px;\">c12+ m.s</span></p>\n', '2018-12-14 14:10:15', 4, 4, 4, 4, 2, '2018-12-13', '2018-12-13', 200, NULL, NULL, 4, NULL, '2018-12-14 00:00:00'),
(211, 'شريف اسماعيل', '', '01118000494', 2, NULL, NULL, '<p>\n	<span style=\"font-family:comic sans ms,cursive;\"><span style=\"font-size:20px;\">Heba Kamel G8&nbsp;</span></span></p>\n', '2018-12-15 11:35:22', 2, 3, 3, 4, NULL, '2018-12-15', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(212, 'مريم مصطفى', '', '01066873736', 2, NULL, NULL, '<p>\n	<span style=\"font-family:verdana,geneva,sans-serif;\"><span style=\"font-size:20px;\">ANN Part 2</span></span></p>\n', '2018-12-15 11:40:47', 4, 3, 3, 4, NULL, '2018-12-16', '2018-12-16', 180, NULL, NULL, 4, NULL, '2018-12-16 00:00:00'),
(213, 'هنا هشام ', '', '01228777313', 1, '11 ابو المحاسن الشاذلى الدور الارضى ش 8', 7, '<p>\n	<span style=\"font-family:comic sans ms,cursive;\"><span style=\"font-size:20px;\">Mostafa Allam O.L</span></span></p>\n<p>\n	<span style=\"font-family:comic sans ms,cursive;\"><span style=\"font-size:20px;\">Mechanics + Thermal&nbsp;</span></span></p>\n', '2018-12-15 11:44:47', 4, 3, 6, 3, 2, '2018-12-17', '2018-12-15', 330, NULL, NULL, 6, NULL, '2018-12-16 00:00:00'),
(214, 'يوسف هشام', '', '01001046497', 1, '116 شارع خالد بن الواليد جنوب الاكاديمية الدور الارضى', 14, '<p>\n	<span style=\"font-family:comic sans ms,cursive;\"><span style=\"font-size:20px;\">Mostafa Allam O.L</span></span></p>\n<p>\n	<span style=\"font-family:comic sans ms,cursive;\"><span style=\"font-size:20px;\">Mechanics + Thermal&nbsp;</span></span></p>\n', '2018-12-15 11:47:28', 3, 3, 3, 3, 1, '2018-12-17', '2018-12-16', 0, NULL, NULL, NULL, NULL, NULL),
(215, 'محمود عمرو ', '', '01096002849', 2, NULL, NULL, '<p>\n	<span style=\"font-family:comic sans ms,cursive;\"><span style=\"font-size:20px;\">ANN Part 2 (2Copies)</span></span></p>\n', '2018-12-15 11:50:58', 4, 3, 3, 4, NULL, '2018-12-16', '2018-12-16', 360, NULL, NULL, 4, NULL, '2018-12-16 00:00:00'),
(216, 'يحى زكريا', '', '01552710640', 2, NULL, NULL, '<p>\n	<span style=\"font-family:comic sans ms,cursive;\"><span style=\"font-size:20px;\">Alyaa Eng Notes + Pastpaper Cambridge + Edexcel</span></span></p>\n', '2018-12-15 14:53:49', 2, 3, 3, NULL, NULL, '2018-12-15', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(217, 'جودي برهان ', '', '00000000000', 2, NULL, NULL, '<p>\n	<span style=\"font-size:16px;\">c1 +c2 2010</span></p>\n', '2018-12-15 15:35:18', 2, 4, 4, NULL, NULL, '2018-12-16', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(218, 'احمد عادل راشد ', '', '01126832777', 2, NULL, NULL, '<p>\n	<span style=\"font-size:22px;\">hany class+ notes&nbsp;</span></p>\n', '2018-12-15 17:42:17', 2, 4, 4, NULL, NULL, '2018-12-16', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(219, 'يحيي هشام ', '', '01117995454', 1, 'فينو فيلا 113E بجوار المدرسة الامريكية شيخ زايد ', 12, '<p>\n	TRMAL +ELCT G9 ALIAM</p>\n', '2018-12-15 17:48:10', 3, 4, 4, 3, 1, '2018-12-17', '2018-12-16', 0, NULL, NULL, NULL, NULL, NULL),
(220, 'محمد شوقى', '', '01221659561', 1, '117ز البوابة الاولي حدائق الاهرام امام ابو مازن السوري د 1 ش يمين السلم ', 5, '<p>\n	<span style=\"font-size:22px;\">TRMAL O.L&nbsp;</span></p>\n', '2018-12-15 17:50:59', 3, 4, 5, 3, 1, '2018-12-17', '2018-12-16', 0, NULL, NULL, NULL, NULL, '2018-12-16 00:00:00'),
(221, 'عبد الرحمن محمد سليمان ', '', '01066360198', 1, 'المقطم قطعة 8600 ش الرضاء والنور دور الاول ش5', 15, '<p>\n	MOSTAFA BARKAT O.L CAM + M.S&nbsp;</p>\n<p>\n	MOSTAFA ALAM OL MECH + TARMAL&nbsp;</p>\n', '2018-12-15 18:08:12', 3, 4, 5, 3, 1, '2018-12-17', '2018-12-16', 0, NULL, NULL, NULL, NULL, NULL),
(222, 'رنا خالد', '', '01277484499', 2, NULL, NULL, '<p>\n	ALIA ENG EDX P.P</p>\n', '2018-12-15 19:48:01', 2, 1, 1, NULL, NULL, '2018-12-17', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(223, 'فريدة هانى', '', '01001093831', 2, NULL, NULL, '<p>\n	ANN PART 2</p>\n', '2018-12-15 20:49:09', 4, 1, 1, 4, NULL, '2018-12-17', '2018-12-16', 180, NULL, NULL, 4, NULL, '2018-12-16 00:00:00'),
(224, 'هنا هشام الروضة ', '', '01006091870', 1, '17 ش محمود احمد باشا دور الثاني الروضة بعد مستودع  البوتجازات قبل محطة لمياه ', 19, '<p>\n	<span style=\"font-size:36px;\">ann p2&nbsp;</span></p>\n', '2018-12-16 11:26:07', 3, 4, 4, 4, 1, '2018-12-18', '2018-12-16', 0, NULL, NULL, NULL, NULL, NULL),
(225, 'سما محمد', '', '01227400474', 2, NULL, NULL, '<p>\n	<span style=\"font-family:comic sans ms,cursive;\"><span style=\"font-size:20px;\">Alyaa Eng Edexcel&nbsp;</span></span></p>\n', '2018-12-16 12:22:43', 2, 3, 3, NULL, NULL, '2018-12-16', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(226, 'كريم اشرف ', '', '01065812197', 2, NULL, NULL, '<p>\n	<span style=\"font-size:22px;\">mech + tharmal&nbsp;</span></p>\n', '2018-12-16 14:27:24', 2, 4, 4, NULL, NULL, '2018-12-17', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(227, 'نهى وجية', '', '01001662825', 1, 'الرحاب 1 مجموعه 99-عماره 10- الدور الارضى ش3 - اقرب بوابه 19امام مسجد ابو بكر الصديق', 23, '<p>\n	<span style=\"font-family:comic sans ms,cursive;\"><span style=\"font-size:20px;\">Mostafa Allam Thermal O.L</span></span></p>\n', '2018-12-16 16:09:17', 3, 3, 3, 3, 1, '2018-12-18', '2018-12-17', 0, NULL, NULL, NULL, NULL, NULL),
(228, 'عادل الشريف', '', '01223436470', 2, NULL, NULL, '<p>\n	<span style=\"font-size:36px;\"><span style=\"font-family:georgia,serif;\">Ann Class Part 2</span></span></p>\n', '2018-12-16 16:56:06', 2, 2, 1, NULL, NULL, '2018-12-18', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(229, 'شهد ميرا', '', '01121002662', 1, 'حدائق الاهرام - البوابة الاولى - شارع 16أ - فيلا 425 - أ/احمد ميرا', 5, '<p>\n	<span style=\"font-size:48px;\">ANN PART 2</span></p>\n', '2018-12-16 18:16:22', 3, 1, 1, 3, 1, '2018-12-18', '2018-12-17', 0, NULL, NULL, NULL, NULL, NULL),
(230, 'احمد محب', '', '01005223132', 1, 'زايد - الحى السابع - مجاورة 2 - عمارة 29 - د2 ش5', 12, '<p>\n	<span style=\"font-size:48px;\">MONA CLASS G9</span></p>\n', '2018-12-16 19:07:25', 3, 1, 1, 3, 1, '2018-12-18', '2018-12-17', 0, NULL, NULL, NULL, NULL, NULL),
(231, 'عبد الرجن فرناس ', '', '00000000000', 2, NULL, NULL, '<p>\n	ANN PART 2</p>\n', '2018-12-16 19:08:29', 2, 2, 1, NULL, NULL, '2018-12-18', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(232, 'مريم اسامة ', '', '01007983639', 2, NULL, NULL, '<p>\n	<span style=\"font-size:48px;\">ENG P4 2010 P.P&nbsp;</span></p>\n', '2018-12-16 19:20:47', 2, 1, 1, NULL, NULL, '2018-12-18', NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `customer_name`, `customer_phone`, `customer_mobile`, `order_type`, `customer_address`, `customer_area`, `order_details`, `order_date`, `order_status`, `order_taker`, `order_maker`, `order_delivered_by`, `order_delivered_to`, `order_suggessted_delivery_date`, `order_delivery_date`, `order_price`, `delivery_price`, `order_total_price`, `cash_collector`, `cash_collected`, `collection_date`) VALUES
(233, 'محمد على ', '', '01227893947', 1, '4ش السمار ', 7, '<p>\n	MATH G8 MARK SCHEME</p>\n<p>\n	SCI&nbsp; &nbsp; G8 MARK SCHEME P1</p>\n<p>\n	استبدال مستر اسلام G7</p>\n', '2018-12-16 19:39:59', 2, 2, 1, NULL, NULL, '2018-12-18', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(234, 'محمد الباهى', '', '01119993046', 1, 'البطل احمد عبد العزيز - 13 صلاح الدين مصطفى - د الارضى -ش 1', 7, '<p>\n	<span style=\"font-size:48px;\">ANN PART 2</span></p>\n', '2018-12-16 20:25:51', 2, 4, 1, NULL, NULL, '2018-12-18', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(235, 'مروان وليد', '', '01212214070', 2, NULL, NULL, '<p>\n	<span style=\"font-size:36px;\">ANN PART 2</span></p>\n', '2018-12-16 20:44:50', 2, 1, 1, NULL, NULL, '2018-12-18', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(236, 'ايهاب خفاجى', '', '01202353533', 1, '3ش ابو بكر الصديق', 7, '<p>\n	<span style=\"font-size:48px;\">MONA NOTES EDX</span></p>\n', '2018-12-16 21:00:50', 2, 2, 2, NULL, NULL, '2018-12-18', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(237, 'محمود اسامه ', '', '01270558620', 2, NULL, NULL, '<p>\n	<span style=\"font-size:48px;\">COMP SCI P.P&nbsp;</span></p>\n', '2018-12-16 22:00:33', 2, 1, 1, NULL, NULL, '2018-12-18', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(238, 'فريدة البندرى ', '', '01115502500', 2, NULL, NULL, '<p>\n	ANN PART 2</p>\n', '2018-12-16 22:07:09', 2, 2, 1, NULL, NULL, '2018-12-18', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(239, 'احمد الامين', '', '01145343238', 1, '36أ عمارات التطوير - د2 - ش5 - الحى الخامس - التجمع الخامس - ع الناصية مدرسة اخناتون', 14, '<p>\n	<span style=\"font-size:48px;\">3 COPIES ALLAM CORE&nbsp;</span></p>\n', '2018-12-16 22:22:20', 1, 2, NULL, NULL, NULL, '2018-12-18', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(240, 'جنا عاصم', '', '01032775010', 2, NULL, NULL, '<p>\n	ANN PART 2</p>\n<p>\n	&nbsp;</p>\n', '2018-12-16 22:55:44', 1, 1, NULL, NULL, NULL, '2018-12-18', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(241, 'ريم طه', '', '01123607269', 1, 'فيصل - شارع اللبينى عمارة فوق قهوة الملك فاروق - د2', 16, '<p>\n	<span style=\"font-size:48px;\">ALIA Eng EDX</span></p>\n', '2018-12-16 23:37:52', 1, 1, NULL, NULL, NULL, '2018-12-18', NULL, 0, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `order_status_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `order_status_name`) VALUES
(1, 'غير جاهز'),
(2, 'جاهز'),
(3, 'قيد التوصيل'),
(4, 'تم التحصيل');

-- --------------------------------------------------------

--
-- Table structure for table `order_types`
--

CREATE TABLE `order_types` (
  `id` int(11) NOT NULL,
  `order_type_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_types`
--

INSERT INTO `order_types` (`id`, `order_type_name`) VALUES
(1, 'توصيل'),
(2, 'مكتبة');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL,
  `day_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `shift_start` time NOT NULL,
  `shift_end` time NOT NULL,
  `is_holiday` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`id`, `day_id`, `employee_id`, `shift_start`, `shift_end`, `is_holiday`) VALUES
(10, 1, 3, '08:00:00', '16:00:00', 0),
(11, 2, 3, '08:00:00', '16:00:00', 0),
(12, 3, 3, '00:00:00', '00:00:00', 1),
(13, 4, 3, '08:00:00', '16:00:00', 0),
(14, 5, 3, '14:00:00', '22:00:00', 0),
(15, 6, 3, '08:00:00', '16:00:00', 0),
(19, 7, 3, '08:00:00', '16:00:00', 0),
(22, 1, 1, '18:00:00', '23:59:00', 0),
(23, 7, 1, '18:00:00', '23:59:00', 0),
(24, 3, 1, '18:00:00', '23:59:00', 0),
(25, 2, 1, '18:00:00', '23:59:00', 0),
(26, 5, 1, '00:00:00', '00:00:00', 1),
(27, 4, 1, '18:00:00', '23:59:00', 0),
(28, 6, 1, '18:00:00', '23:59:00', 0),
(29, 1, 2, '12:00:00', '22:00:00', 0),
(30, 7, 2, '12:00:00', '22:00:00', 0),
(31, 3, 2, '12:00:00', '22:00:00', 0),
(32, 2, 2, '12:00:00', '22:00:00', 0),
(33, 5, 2, '14:00:00', '23:59:00', 0),
(34, 4, 2, '12:00:00', '23:59:00', 0),
(35, 6, 2, '00:00:00', '00:00:00', 1),
(36, 6, 4, '13:00:00', '21:00:00', 0),
(37, 7, 4, '13:00:00', '21:00:00', 0),
(38, 3, 4, '08:00:00', '16:00:00', 0),
(39, 1, 4, '10:00:00', '18:00:00', 0),
(40, 2, 4, '10:00:00', '18:00:00', 0),
(41, 4, 4, '00:00:00', '00:00:00', 1),
(42, 5, 4, '14:00:00', '22:00:00', 0),
(43, 7, 5, '00:00:00', '00:00:00', 1),
(44, 1, 5, '16:00:00', '23:59:00', 0),
(45, 3, 5, '16:00:00', '23:59:00', 0),
(46, 2, 5, '16:00:00', '23:59:00', 0),
(47, 4, 5, '16:00:00', '23:59:00', 0),
(48, 6, 5, '16:00:00', '23:59:00', 0),
(49, 5, 5, '16:00:00', '23:59:00', 0),
(50, 1, 6, '08:00:00', '16:00:00', 0),
(51, 7, 6, '08:00:00', '16:00:00', 0),
(52, 3, 6, '08:00:00', '16:00:00', 0),
(53, 2, 6, '08:00:00', '16:00:00', 0),
(54, 5, 6, '00:00:00', '00:00:00', 1),
(55, 4, 6, '08:00:00', '16:00:00', 0),
(56, 6, 6, '08:00:00', '16:00:00', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendance_ibfk_1` (`employee_id`);

--
-- Indexes for table `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_ibfk_1` (`order_taker`),
  ADD KEY `orders_ibfk_2` (`order_delivered_by`),
  ADD KEY `orders_ibfk_3` (`order_maker`),
  ADD KEY `cash_collector` (`cash_collector`),
  ADD KEY `customer_area` (`customer_area`),
  ADD KEY `order_type` (`order_type`),
  ADD KEY `order_status` (`order_status`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_types`
--
ALTER TABLE `order_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `day_id` (`day_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- AUTO_INCREMENT for table `days`
--
ALTER TABLE `days`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_types`
--
ALTER TABLE `order_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`order_taker`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`order_delivered_by`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`order_maker`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`cash_collector`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_5` FOREIGN KEY (`customer_area`) REFERENCES `areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_6` FOREIGN KEY (`order_type`) REFERENCES `order_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_7` FOREIGN KEY (`order_status`) REFERENCES `order_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`day_id`) REFERENCES `days` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
