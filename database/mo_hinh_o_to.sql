-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 02, 2023 lúc 08:39 AM
-- Phiên bản máy phục vụ: 10.4.17-MariaDB
-- Phiên bản PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `mo_hinh_o_to`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills`
--

CREATE TABLE `bills` (
  `id` int(11) NOT NULL,
  `id_users` int(11) NOT NULL,
  `id_coupon` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `address` varchar(255) NOT NULL,
  `data_order` date NOT NULL,
  `total` float NOT NULL,
  `payment` tinyint(1) DEFAULT 1 COMMENT '1: thanh toán khi nhận hàng\r\n2: Thanh toán trực tuyến',
  `note` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1: Đang Xử Lý\r\n2: Đang Giao\r\n3: Đã Giao',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `bills`
--

INSERT INTO `bills` (`id`, `id_users`, `id_coupon`, `name`, `phone`, `address`, `data_order`, `total`, `payment`, `note`, `status`, `updated_at`, `created_at`) VALUES
(74, 8, NULL, 'Ngô Văn Thắng', '0388549606', 'Hà Lam Thăng Bình Quảng Nam', '2022-12-29', 470000, 1, NULL, 2, '2022-12-29 02:13:29', '2022-12-29 01:23:31'),
(76, 9, NULL, 'Ngô Văn Hải Trường', '0123456789', 'TT Hà Lam, H.Thăng Bình, T.Quảng Nam', '2022-11-26', 1080000, 1, NULL, 4, '2022-12-29 09:49:20', '2022-12-29 01:26:21'),
(81, 10, NULL, 'Trần viết thái', '0123456789', 'đà nẵng', '2022-11-25', 570000, 2, NULL, 1, '2022-12-29 08:42:54', '2022-12-29 01:38:34'),
(82, 8, 1, 'Trần viết thái', '0123456789', 'đà nẵng', '2022-11-29', 350000, 1, NULL, 1, '2022-12-29 09:20:09', '2022-12-29 01:44:08'),
(83, 10, NULL, 'Trần viết thái', '0123456789', 'đà nẵng', '2022-12-29', 730000, 1, NULL, 4, '2022-12-29 09:55:54', '2022-12-29 01:46:50'),
(84, 9, NULL, 'Ngô Văn Hải Trường', '0123456789', 'TT Hà Lam, H.Thăng Bình, T.Quảng Nam', '2022-11-17', 1580000, 1, NULL, 1, '2023-01-02 06:53:53', '2022-12-29 01:52:48'),
(87, 9, NULL, 'Ngô Văn Hải Trường', '0123456789', 'TT Hà Lam, H.Thăng Bình, T.Quảng Nam', '2022-11-17', 760000, 2, NULL, 3, '2023-01-02 06:53:48', '2022-12-29 01:56:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` int(11) NOT NULL,
  `id_bill` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `id_bill`, `id_product`, `quantity`, `price`, `updated_at`, `created_at`) VALUES
(122, 74, 17, 1, 220000, '2022-12-29 01:23:31', '2022-12-29 01:23:31'),
(123, 74, 4, 1, 220000, '2022-12-29 01:23:31', '2022-12-29 01:23:31'),
(124, 76, 2, 2, 400000, '2022-12-29 01:26:21', '2022-12-29 01:26:21'),
(125, 76, 23, 1, 250000, '2022-12-29 01:26:21', '2022-12-29 01:26:21'),
(127, 81, 34, 1, 190000, '2022-12-29 01:38:34', '2022-12-29 01:38:34'),
(128, 81, 14, 1, 350000, '2022-12-29 01:38:34', '2022-12-29 01:38:34'),
(129, 82, 25, 1, 350000, '2022-12-29 01:44:08', '2022-12-29 01:44:08'),
(130, 83, 25, 2, 350000, '2022-12-29 01:46:50', '2022-12-29 01:46:50'),
(131, 84, 23, 1, 250000, '2022-12-29 01:52:48', '2022-12-29 01:52:48'),
(132, 84, 40, 1, 1300000, '2022-12-29 01:52:48', '2022-12-29 01:52:48'),
(138, 87, 1, 1, 350000, '2022-12-29 01:56:41', '2022-12-29 01:56:41'),
(139, 87, 48, 1, 190000, '2022-12-29 01:56:41', '2022-12-29 01:56:41'),
(140, 87, 52, 1, 190000, '2022-12-29 01:56:41', '2022-12-29 01:56:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `content` text NOT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `blog`
--

INSERT INTO `blog` (`id`, `title`, `image`, `date`, `content`, `updated_at`, `created_at`) VALUES
(1, 'Tìm hiểu về tỷ lệ và kích thước xe mô hình', '12.webp', '2022-12-07', '<h2><strong>T&igrave;m hiểu về tỉ lệ v&agrave; k&iacute;ch thước xe m&ocirc; h&igrave;nh</strong></h2>\r\n\r\n<p>B&agrave;i viết n&agrave;y sẽ chỉ ra cho bạn biết về k&iacute;ch thước theo tỉ lệ xe m&ocirc; h&igrave;nh, đồng thời sẽ đưa ra những gợi &yacute; về k&iacute;ch cỡ xe m&ocirc; h&igrave;nh ph&ugrave; hợp với nhu cầu của bạn.</p>\r\n\r\n<p><img alt=\"\" src=\"/front_end/img/blog/ti_le/1.webp\" /></p>\r\n\r\n<p>Tỷ lệ&nbsp;<strong>xe m&ocirc; h&igrave;nh tĩnh</strong>&nbsp;sẽ tỉ lệ nghịch k&iacute;ch thước của xe.</p>\r\n\r\n<p>- Xe tỷ lệ 1:24: xe m&ocirc; h&igrave;nh được m&ocirc; phỏng nhỏ hơn 24 lần so với xe thật.</p>\r\n\r\n<p>- Xe tỷ lệ 1:18 : xe m&ocirc; h&igrave;nh được m&ocirc; phỏng nhỏ hơn 18 lần so với xe thật.</p>\r\n\r\n<p><img alt=\"\" src=\"/front_end/img/blog/ti_le/2.webp\" /></p>\r\n\r\n<p>Vd: &nbsp;Si&ecirc;u xe Ferrari 458 Italia thật c&oacute; k&iacute;ch thước l&agrave; : chiều d&agrave;i 4.527mm, chiều rộng 1.937mm v&agrave; chiều cao 1.213 mm.</p>\r\n\r\n<p>- K&iacute;ch thước của xe m&ocirc; h&igrave;nh tỷ lệ 1:18&nbsp;sẽ như sau:</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp;Chiều d&agrave;i: &nbsp;&nbsp;4.527mm :18 = 250mm</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp;Chiều rộng: 1.937mm :18 = 110mm</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp;Chiều Cao:&nbsp; 1.213mm :18 = 60mm</p>\r\n\r\n<p>- C&aacute;c chi tiết như lốc m&aacute;y, bảng điều khiển cũng đều được thu nhỏ lại 18 lần so với xe thật.</p>\r\n\r\n<p>C&aacute;c k&iacute;ch thước phổ th&ocirc;ng của m&ocirc; h&igrave;nh tĩnh:</p>\r\n\r\n<p>Xe &ocirc; t&ocirc;: tỷ lệ 1:18 (phổ th&ocirc;ng nhất), tỷ lệ 1:24, 1:32&amp;1:36.</p>\r\n\r\n<p>Xe m&ocirc; t&ocirc;: tỷ lệ 1:12 (phổ th&ocirc;ng nhất), tỷ lệ 1:18.</p>\r\n\r\n<p>Xe c&ocirc;ng tr&igrave;nh: tỷ lệ 1:50 (phổ th&ocirc;ng nhất), tỷ lệ 1:87.</p>\r\n\r\n<p>*** Xem tại đ&acirc;y để biết&nbsp;<strong>chi tiết k&iacute;ch thước của c&aacute;c m&ocirc; h&igrave;nh</strong>&nbsp;ch&uacute;ng t&ocirc;i đang ph&acirc;n phối.</p>\r\n\r\n<p><img alt=\"\" src=\"/front_end/img/blog/ti_le/3.webp\" /></p>\r\n\r\n<p>Lựa chọn tỷ lệ&nbsp;<strong>xe m&ocirc; h&igrave;nh</strong>&nbsp;bao nhi&ecirc;u l&agrave; ph&ugrave; hợp để sưu tầm? C&acirc;u trả lời c&ograve;n t&ugrave;y thuộc v&agrave;o mục đ&iacute;ch, kh&ocirc;ng gian, sở th&iacute;ch v&agrave; kinh ph&iacute; m&agrave; bạn dự định sẽ bỏ ra.&nbsp;</p>\r\n\r\n<p>Sở hữu bộ sưu tập&nbsp;<strong>xe m&ocirc; h&igrave;nh</strong>&nbsp;đẹp c&ograve;n phụ thuộc v&agrave;o c&aacute;ch trưng b&agrave;y, chủ đề sưu tầm, kh&ocirc;ng gian sưu tầm. Bộ sưu tập của bạn tuy nhỏ độ chi tiết kh&ocirc;ng cao bằng những những k&iacute;ch cỡ lớn nhưng nếu c&aacute;ch bố tr&iacute;, chủ đề sưu tầm đồng nhất chắc chắn sẽ trở th&agrave;nh một bộ sưu tập đẹp v&agrave; mang lại ni&ecirc;m vui d&agrave;i l&acirc;u cho bạn.</p>\r\n\r\n<p>Ở đ&acirc;y ch&uacute;ng t&ocirc;i chỉ ra một số bộ sưu tập đẹp của kh&aacute;ch h&agrave;ng theo từng tỉ lệ, hy vọng để bạn c&oacute; thể chọn được một k&iacute;ch cỡ ưng &yacute; nhất cho bộ sưu tập của m&igrave;nh.</p>\r\n\r\n<p>- G&oacute;c sa b&agrave;n xe m&ocirc; h&igrave;nh tỷ lệ 1:32 của bạn Pro_hung (clbmohinh)</p>\r\n\r\n<p><img alt=\"\" src=\"/front_end/img/blog/ti_le/4.webp\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/front_end/img/blog/ti_le/5.webp\" /></p>\r\n\r\n<p>- Một bộ sưu tập Lamborghini Aventador LP700 Tỉ lệ 1:18 đủ m&agrave;u của bạn hieuvu1210.</p>\r\n\r\n<p><img alt=\"\" src=\"/front_end/img/blog/ti_le/6.webp\" /></p>\r\n\r\n<p>- Một bộ sưu tập Mercedes-Benz tỉ lệ 1:18</p>\r\n\r\n<p><img alt=\"\" src=\"/front_end/img/blog/ti_le/7.webp\" /></p>\r\n\r\n<p>- Bộ sưu tập ho&agrave;nh tr&aacute;ng theo h&atilde;ng xe kết hợp m&agrave;u sắc đồng bộ</p>\r\n\r\n<p><img alt=\"\" src=\"/front_end/img/blog/ti_le/8.webp\" /></p>\r\n\r\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Ch&uacute;c bạn chọn được một bộ sưu tập ưng &yacute;</strong></p>', '2022-12-05 05:10:09', NULL),
(2, 'Tìm hiểu về các thương hiệu sản xuất xe mô hình', 'hieu.webp', '2022-12-05', '<p><strong>Ch&agrave;o c&aacute;c bạn!</strong></p>\r\n\r\n<p><strong>H&ocirc;m nay BMHT l&agrave;m&nbsp;b&agrave;i viết n&agrave;y để gi&uacute;p c&aacute;c bạn hiểu r&otilde; hơn về xuất xứ v&agrave; sản xuất của xe m&ocirc; h&igrave;nh. &nbsp;</strong></p>\r\n\r\n<p><img alt=\"\" src=\"/front_end/img/blog/thuonghieu/1.webp\" /></p>\r\n\r\n<p>Nh&igrave;n tổng thể 90% đồ chơi v&agrave; m&ocirc; h&igrave;nh hiện nay tr&ecirc;n to&agrave;n thế giới đa phần đều được lắp r&aacute;p v&agrave; gia c&ocirc;ng tại Trung Quốc. V&igrave; l&agrave; 1 nước đ&ocirc;ng d&acirc;n nhất tr&ecirc;n thế giới n&ecirc;n việc thu&ecirc; nh&acirc;n c&ocirc;ng b&ecirc;n TQ sẽ gi&uacute;p giảm thiểu tối đa c&aacute;c chi ph&iacute; trong kh&acirc;u sản xuất. Đặc biệt,&nbsp;những sản phẩm xe m&ocirc; h&igrave;nh đều được l&aacute;p r&aacute;p bằng thủ c&ocirc;ng kh&aacute; tỉ mỉ v&agrave; chi tiết.&nbsp;V&agrave; đ&atilde; được qua kiểm tra về mặt chất lượng của nh&agrave; nước cũng như c&aacute;c tập đo&agrave;n lớn sản xuất xe m&ocirc; h&igrave;nh. ( Autoart, Maisto, Welly, Bburago, vv.. ).&nbsp;Để đem lại độ sắc sảo cao cho sản phẩm.</p>\r\n\r\n<h2><strong>T&igrave;m hiểu về c&aacute;c thương hiệu sản xuất xe m&ocirc; h&igrave;nh:</strong></h2>\r\n\r\n<h3><strong>1. Thương hiệu Maisto</strong></h3>\r\n\r\n<p><strong><img alt=\"\" src=\"/front_end/img/blog/thuonghieu/2.webp\" style=\"height:300px; width:600px\" /></strong></p>\r\n\r\n<p>Thương hiệu sản xuất m&ocirc; h&igrave;nh Maisto được th&agrave;nh lập từ năm 1967, với t&ecirc;n đầy đủ l&agrave; Maisto International Inc. Đ&acirc;y l&agrave; một thương hiệu sản xuất m&ocirc; h&igrave;nh phổ biến của Cheong May Group Hồng K&ocirc;ng. Maisto chuy&ecirc;n sản xuất c&aacute;c m&ocirc; h&igrave;nh đ&uacute;c của xe &ocirc; t&ocirc; v&agrave; xe m&aacute;y. Tất cả sản phẩm của Maisto đều được đăng k&yacute; bản quyền từ c&aacute;c h&atilde;ng xe nổi tiếng tr&ecirc;n thế giới.&nbsp;</p>\r\n\r\n<p><strong>- Website:&nbsp;<a href=\"http://www.maisto.com/\">http://www.maisto.com/</a></strong></p>\r\n\r\n<p><strong>- Xuất xứ:&nbsp;</strong>HongKong</p>\r\n\r\n<p><strong>- D&ograve;ng sản phẩm chủ lực:&nbsp;</strong>M&ocirc; h&igrave;nh &ocirc; t&ocirc;, M&ocirc;t&ocirc;</p>\r\n\r\n<p><strong>- C&aacute;c tỷ lệ phổ biến:&nbsp;</strong>1:32, 1:24, 1:18, 1:12</p>\r\n\r\n<h3><strong>2. Thương hiệu Welly</strong></h3>\r\n\r\n<p><strong><img alt=\"\" src=\"/front_end/img/blog/thuonghieu/3.webp\" style=\"height:211px; width:600px\" /></strong></p>\r\n\r\n<p>Welly l&agrave; một nh&agrave; sản xuất chuy&ecirc;n chế tạo c&aacute;c mẫu m&ocirc; h&igrave;nh &ocirc; t&ocirc;, m&ocirc; t&ocirc;, xe m&aacute;y. Thương hiệu n&agrave;y được th&agrave;nh lập năm 1980 tại tỉnh Guandong, Welly được biết đến l&agrave; h&atilde;ng sản xuất diecast tầm trung, kh&aacute; phổ biến tr&ecirc;n khắp thế giới. C&aacute;c mẫu m&ocirc; h&igrave;nh do&nbsp;Welly sản xuất được l&agrave;m tỉ mỉ, cẩn thận tạo n&ecirc;n những mẫu m&ocirc; h&iacute;nh sắc n&eacute;t v&agrave; ch&acirc;n thật, tạo được niềm y&ecirc;u th&iacute;ch v&agrave; trở th&agrave;nh một trong những thương hiệu được nhiều t&iacute;n đồ đam m&ecirc; m&ocirc; h&igrave;nh tĩnh y&ecirc;u th&iacute;ch.</p>\r\n\r\n<p><strong>- Website:&nbsp;<a href=\"http://www.wellydiecast.com/\">http://www.wellydiecast.com/</a></strong></p>\r\n\r\n<p><strong>- Xuất xứ:&nbsp;</strong>HongKong</p>\r\n\r\n<p><strong>- D&ograve;ng sản phẩm chủ lực:&nbsp;</strong>M&ocirc; h&igrave;nh &ocirc; t&ocirc;, M&ocirc;t&ocirc;</p>\r\n\r\n<p><strong>- C&aacute;c tỷ lệ phổ biến:&nbsp;</strong>1:32, 1:24, 1:18</p>\r\n\r\n<h3><strong>3. Thươ<img alt=\"\" src=\"/front_end/img/blog/front_end/4.webp\" />ng hiệu Bburago</strong></h3>\r\n\r\n<p><strong><img alt=\"\" src=\"/front_end/img/blog/thuonghieu/4.webp\" style=\"height:286px; width:600px\" /></strong></p>\r\n\r\n<p>BBurago l&agrave; một c&ocirc;ng ti sản xuất m&ocirc; h&igrave;nh của &Yacute; được th&agrave;nh lập năm 1974, chuy&ecirc;n sản xuất những chiếc Ferrari. Sau khi bản quyền Ferrari rơi v&agrave;o tay Mattel, BBurago ph&aacute; sản v&agrave; bị mua lại bởi Maisto v&agrave;o năm 2005. D&ograve;ng sản phẩm chủ lực của BBurago hiện nay l&agrave; d&ograve;ng Ferrari với đa dạng c&aacute;c tỷ lệ từ 1:64 đến 1:18, sau khi mua lại được bản quyền Ferrari v&agrave;o cuối năm 2014.</p>\r\n\r\n<p><strong>- Website:&nbsp;<a href=\"http://www.bburago.com/\">http://www.bburago.com/</a></strong></p>\r\n\r\n<p><strong>- Xuất xứ:&nbsp;</strong>Itaty được h&atilde;ng Maisto mua lại năm 2005</p>\r\n\r\n<p><strong>- D&ograve;ng sản phẩm chủ lực:&nbsp;</strong>M&ocirc; h&igrave;nh &ocirc; t&ocirc;, M&ocirc;t&ocirc;</p>\r\n\r\n<p><strong>- C&aacute;c tỷ lệ phổ biến:&nbsp;</strong>1:64, 1:32, 1:24, 1:18</p>\r\n\r\n<h3><strong>4. Thương hiệu Norev</strong></h3>\r\n\r\n<p><strong><img alt=\"\" src=\"/front_end/img/blog/thuonghieu/5.webbp\" /><img alt=\"\" src=\"/front_end/img/blog/thuonghieu/5.webp\" style=\"height:380px; width:600px\" /></strong></p>\r\n\r\n<p>Norev l&agrave; nh&agrave; sản xuất xe m&ocirc; h&igrave;nh tĩnh đến từ Ph&aacute;p, được th&agrave;nh lập từ năm 1946. Đ&acirc;y l&agrave; thương hiệu chuy&ecirc;n sản xuất m&ocirc; h&igrave;nh của c&aacute;c loại xe đến từ&nbsp;ch&acirc;u &Acirc;u như Mercedes, BMW, Audi, Peugeot, Citroen,... v&agrave; một số &iacute;t c&aacute;c d&ograve;ng xe Ch&acirc;u Mỹ v&agrave; Ch&acirc;u &Aacute;. C&aacute;c mẫu m&ocirc; h&igrave;nh do Norev sản xuất đều c&oacute; bản quyền sản xuất từ c&aacute;c thương hiệu xe thật, được chế t&aacute;c với độ ho&agrave;n thiện cao v&agrave; sắc n&eacute;t cao.&nbsp;</p>\r\n\r\n<p><strong>- Website:&nbsp;<a href=\"http://www.norev.com/en/\">http://www.norev.com/en/</a></strong></p>\r\n\r\n<p><strong>- Xuất xứ:&nbsp;</strong>Ph&aacute;p</p>\r\n\r\n<p><strong>- D&ograve;ng sản phẩm chủ lực:&nbsp;</strong>M&ocirc; h&igrave;nh &ocirc;&nbsp;t&ocirc;</p>\r\n\r\n<p><strong>- C&aacute;c tỷ lệ phổ biến:&nbsp;</strong>1:87,&nbsp;1:64, 1:43, 1:18, 1:12</p>\r\n\r\n<h3><strong>5. Thương hiệu Rastar</strong></h3>\r\n\r\n<p><strong><img alt=\"\" src=\"/front_end/img/blog/thuonghieu/6.webp\" style=\"height:450px; width:600px\" /></strong></p>\r\n\r\n<p>Rastar l&agrave; thương hiệu chuy&ecirc;n sản xuất c&aacute;c loại xe m&ocirc; h&igrave;nh tĩnh v&agrave; xe điều khiển từ xa thuộc c&ocirc;ng ty Xinghui Auto Model Co. Ltd,&nbsp;c&oacute; nh&agrave; m&aacute;y đặt tại khu c&ocirc;ng nghiệp Guangfeng, Chenghai, Shantou, Trung Quốc. Rasta được cung cấp bản quyền sản xuất từ nhiều thương hiệu xe nổi tiếng, xuất khẩu sang 50 quốc gia v&agrave; v&ugrave;ng l&atilde;nh thổ tr&ecirc;n to&agrave;n thế giới.&nbsp;</p>\r\n\r\n<p><strong>- Website:&nbsp;<a href=\"http://www.carmodel.com/trademark/rastar\">http://www.carmodel.com/trademark/rastar</a></strong></p>\r\n\r\n<p><strong>- Xuất xứ:&nbsp;</strong>Trung Quốc</p>\r\n\r\n<p><strong>- D&ograve;ng sản phẩm chủ lực:&nbsp;</strong>M&ocirc; h&igrave;nh &ocirc; t&ocirc;</p>\r\n\r\n<p><strong>- C&aacute;c tỷ lệ phổ biến:</strong>&nbsp;1:18, 1:24</p>\r\n\r\n<h3><strong>6. Thương hiệu&nbsp;Almost Real</strong></h3>\r\n\r\n<p><strong><img alt=\"\" src=\"/front_end/img/blog/thuonghieu/7.webp\" style=\"height:300px; width:600px\" /></strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Almost Real l&agrave; một trong những nh&agrave; sản xuất m&ocirc; h&igrave;nh tĩnh mới du nhập v&agrave;o Việt Nam thời gian gần đ&acirc;y. Được nhiều nh&agrave; sưu tầm săn đ&oacute;n v&agrave; y&ecirc;u th&iacute;ch nhờ c&aacute;c mẫu xe m&ocirc; h&igrave;nh tĩnh ở ph&acirc;n kh&uacute;c cao cấp được trau chuốt cực k&igrave; tỉ mỉ. Những sản phẩm của Almost Real c&oacute; sự sắc n&eacute;t, tinh xảo v&agrave; độ ho&agrave;n thiện rất cao. H&atilde;ng m&ocirc; h&igrave;nh n&agrave;y sở hữu nhiều bản quyền sản xuất m&ocirc; h&igrave;nh từ c&aacute;c thương hiệu xe danh tiếng như Bentley, Mercedes-Benz, Porsche, McLaren, Land Rover, Pagani, Bentley v&agrave; nhiều hơn nữa.</p>\r\n\r\n<p><strong>- Website:&nbsp;<a href=\"https://www.almostrealmodels.com/\">https://www.almostrealmodels.com/</a></strong></p>\r\n\r\n<p><strong>- Xuất xứ:&nbsp;</strong>Trung Quốc</p>\r\n\r\n<p><strong>- D&ograve;ng sản phẩm chủ lực:&nbsp;</strong>M&ocirc; h&igrave;nh &ocirc; t&ocirc;</p>\r\n\r\n<p><strong>- C&aacute;c tỷ lệ phổ biến:</strong>&nbsp;1:43, 1:18.</p>\r\n\r\n<h3><strong>7. Thương hiệu LCD</strong></h3>\r\n\r\n<p><strong><img alt=\"\" src=\"/front_end/img/blog/thuonghieu/8.webp\" style=\"height:395px; width:600px\" /></strong></p>\r\n\r\n<p>LCD l&agrave; thương hiệu m&ocirc; h&igrave;nh cao cấp, chỉ mới nổi tiếng tại Việt Nam thời điểm v&agrave;i năm trở lại đ&acirc;y. Mặc d&ugrave; vậy, nhưng LCD đ&atilde; được rất nhiều nh&agrave; sưu tập ưa chuộng v&igrave; sự tinh xảo v&agrave; sắc n&eacute;t trong từng chi tiết d&ugrave; l&agrave; nhỏ nhất tr&ecirc;n những mẫu m&ocirc; h&igrave;nh do h&atilde;ng n&agrave;y sản xuất. LCD đ&atilde; c&oacute; bản quyền sản xuất của nhiều h&atilde;ng xe &ocirc; t&ocirc; cũng như m&ocirc; t&ocirc; đ&igrave;nh đ&aacute;m tr&ecirc;n thế giới như:&nbsp;Land Rover, Pagani, McLaren, Honda, Suzuki. H&atilde;ng m&ocirc; h&igrave;nh n&agrave;y sở hữu đa dạng d&ograve;ng sản phẩm từ m&ocirc; h&igrave;nh &ocirc; t&ocirc;, m&ocirc; t&ocirc;, đến cả m&aacute;y bay, ở nhiều tỷ lệ kh&aacute;c nhau như&nbsp;1:64, 1:43, 1:18, 1:12, 1:10.</p>\r\n\r\n<p><strong>- Website:&nbsp;<a href=\"http://www.lcdmodel.com/en/\">http://www.lcdmodel.com/en/</a></strong></p>\r\n\r\n<p><strong>- Xuất xứ:&nbsp;</strong>Trung Quốc</p>\r\n\r\n<p><strong>- D&ograve;ng sản phẩm chủ lực:&nbsp;</strong>M&ocirc; h&igrave;nh &ocirc; t&ocirc;, m&ocirc; t&ocirc;, m&aacute;y bay</p>\r\n\r\n<p><strong>- C&aacute;c tỷ lệ phổ biến:</strong>&nbsp;1:64, 1:43, 1:18, 1:12, 1:10</p>\r\n\r\n<h3><strong>8. Thương hiệu MiniChamps</strong></h3>\r\n\r\n<p><strong><img alt=\"\" src=\"/front_end/img/blog/thuonghieu/9.webp\" style=\"height:300px; width:600px\" /></strong></p>\r\n\r\n<p>Minichamp l&agrave; một nh&agrave; sản xuất xe m&ocirc; h&igrave;nh tĩnh nổi tiếng đến từ Đức, c&oacute; c&ocirc;ng ty mẹ l&agrave; Paul&#39;s Model Art GmbH th&agrave;nh lập v&agrave;o năm 1990 tại Aachen. Đ&acirc;y l&agrave; thương hiệu chuy&ecirc;n sản xuất c&oacute; bản quyền ch&iacute;nh h&atilde;ng c&aacute;c mẫu xe m&ocirc; h&igrave;nh ở tỷ lệ 1:43 v&agrave; 1:18, với đa dạng nhiều d&ograve;ng xe đến từ nhiều thương hiệu xe đ&igrave;nh đ&aacute;m như Bentley, Porsche, Mercedes-Benz,...</p>\r\n\r\n<p><strong>- Website:&nbsp;<a href=\"http://www.minichamps.de/index.php?s=en\">http://www.minichamps.de/index.php?s=en</a></strong></p>\r\n\r\n<p><strong>- Xuất xứ:&nbsp;</strong>Đức</p>\r\n\r\n<p><strong>- D&ograve;ng sản phẩm chủ lực:&nbsp;</strong>M&ocirc; h&igrave;nh &ocirc; t&ocirc;</p>\r\n\r\n<p><strong>- C&aacute;c tỷ lệ phổ biến:&nbsp;</strong>1:43,&nbsp;1:18</p>\r\n\r\n<h3><strong>9. Thương hiệu KDW</strong></h3>\r\n\r\n<p><strong><img alt=\"\" src=\"/front_end/img/blog/thuonghieu.10.webp\" /><img alt=\"\" src=\"/front_end/img/blog/thuonghieu/10.webp\" style=\"height:330px; width:600px\" /></strong></p>\r\n\r\n<h3><strong>- Website:&nbsp;<a href=\"http://www.bsntoys.com/En/\">http://www.bsntoys.com/En/</a></strong></h3>\r\n\r\n<p><strong>- Xuất xứ:&nbsp;</strong>Trung Quốc</p>\r\n\r\n<p><strong>- D&ograve;ng sản phẩm chủ lực:&nbsp;</strong>M&ocirc; h&igrave;nh&nbsp;xe c&ocirc;ng tr&igrave;nh v&agrave; một số mẫu m&ocirc; h&igrave;nh &ocirc; t&ocirc;</p>\r\n\r\n<p><strong>- C&aacute;c tỷ lệ phổ biến:&nbsp;</strong>1:50, 1:64, 1:87, 1:35, 1:18, 1:32, 1:24</p>\r\n\r\n<h3><strong>10. Thương hiệu Kyosho</strong></h3>\r\n\r\n<p><strong><img alt=\"\" src=\"/front_end/img/blog/thuonghieu/11.webp\" style=\"height:300px; width:600px\" /></strong></p>\r\n\r\n<p>Kyosho t&ecirc;n gọi đầy đủ l&agrave; Kyosho Corporation l&agrave; một c&ocirc;ng ty sản xuất xe hơi m&ocirc; h&igrave;nh c&oacute; trụ sở tại Tokyo, Nhật Bản ra đời v&agrave;o năm 1963. Thương hiệu hoạt động quốc tế dưới t&ecirc;n KYOSHO, nổi tiếng với c&aacute;c sản phẩm xe hơi m&ocirc; h&igrave;nh tĩnh v&agrave; xe điều kiển R/C cao cấp. Kyosho đ&atilde; c&oacute; bản quyền sản xuất của nhiều thương hiệu xe hơi nổi tiếng tr&ecirc;n thế giới như Audi, Rolls Royce, Bentley,... Được chế t&aacute;c kh&eacute;o l&eacute;o v&agrave; tỉ mỉ từng chi tiết d&ugrave; l&agrave; nhỏ nhất để đạt được độ ho&agrave;n thiện rất cao.</p>\r\n\r\n<p><strong>- Website:&nbsp;<a href=\"http://www.kyosho.com/eng/\">http://www.kyosho.com/eng/</a></strong></p>\r\n\r\n<p><strong>- Xuất xứ:&nbsp;</strong>Nhật Bản</p>\r\n\r\n<p><strong>- D&ograve;ng sản phẩm chủ lực:&nbsp;</strong>M&ocirc; h&igrave;nh &ocirc; t&ocirc;</p>\r\n\r\n<p><strong>- C&aacute;c tỷ lệ phổ biến:&nbsp;</strong>1:18</p>\r\n\r\n<h3><strong>11. Thương Hiệu AUTOart</strong></h3>\r\n\r\n<p><strong><img alt=\"\" src=\"/front_end/img/blog/thuonghieu/12.webp\" style=\"height:600px; width:600px\" /></strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Autoart l&agrave; sản phẩm của&nbsp;C&ocirc;ng ty TNHH AA Collection, c&ocirc;ng ty trước đ&acirc;y thuộc sở hữu của Gateway Global Ltd.được th&agrave;nh lập v&agrave;o năm 1998.&nbsp;Đ&acirc;y l&agrave; thương hi&ecirc;u sản xuất xe m&ocirc; h&igrave;nh cao cấp được&nbsp;nhiều người sưu tầm xe m&ocirc; h&igrave;nh biết đến v&agrave; y&ecirc;u th&iacute;ch nhờ v&agrave;o sự trau chuốt tỉ mỉ từng chi tiết nhỏ v&agrave; lớp sơn tĩnh ho&agrave;n hảo phủ b&ecirc;n ngo&agrave;i, để cho ra đời c&aacute;c mẫu xe m&ocirc; h&igrave;nh c&oacute; độ sắc n&eacute;t v&agrave; ch&acirc;n thật cao. Autoart thường được lấy l&agrave;m chuẩn mực so s&aacute;nh giữa c&aacute;c nh&agrave; sản xuất m&ocirc; h&igrave;nh với nhau. Trước đ&acirc;y Autoart chuy&ecirc;n sản xuất những mẫu m&ocirc; h&igrave;nh bằng chất liệu hợp kim, nhưng thời gian gần đ&acirc;y Autoart cho ra mắt 1 loại chất liệu mới đ&oacute; l&agrave; nhựa Composite.</p>\r\n\r\n<p><strong>- Website:<a href=\"http://www.aa-collection.com/en/\">&nbsp;http://www.aa-collection.com/en/</a></strong></p>\r\n\r\n<p><strong>- Xuất xứ:&nbsp;</strong>Hong Kong</p>\r\n\r\n<p><strong>- D&ograve;ng sản phẩm chủ lực:&nbsp;</strong>M&ocirc; h&igrave;nh &ocirc; t&ocirc;, m&ocirc; t&ocirc;</p>\r\n\r\n<p><strong>- C&aacute;c tỷ lệ phổ biến:&nbsp;</strong>1:43,&nbsp;1:18, 1:12</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Với b&agrave;i viết tr&ecirc;n mong l&agrave; c&oacute; thể đ&atilde; giải đ&aacute;p được thắc mắc &iacute;t nhiều của bạn về c&aacute;c thương hiệu, xuất xứ của c&aacute;c h&atilde;ng xe m&ocirc; h&igrave;nh đang phổ biến tại thị trường Việt Nam hiện nay.</p>\r\n\r\n<p>Ch&uacute;c c&aacute;c bạn t&igrave;m được c&aacute;c mẫu xe m&ocirc; h&igrave;nh như &yacute;. Xin cảm ơn v&igrave; đ&atilde; đọc.</p>', '2022-12-05 06:57:16', NULL),
(3, 'Khung Xe Mô Hình Được Làm Như Thế Nào?', '12.webp', '2022-12-06', '<p><strong>Khung Xe M&ocirc; H&igrave;nh Được L&agrave;m Như Thế N&agrave;o ?</strong></p>\r\n\r\n<p>- Sau khi được sử dụng bản quyền thiết kế của h&atilde;ng sản xuất xe thật. C&aacute;c h&atilde;ng sản xuất m&ocirc; h&igrave;nh bắt tay v&agrave;o c&ocirc;ng đoạn dập khu&ocirc;ng v&agrave; chế t&aacute;c c&aacute;c chi tiết nhỏ. Họ đ&atilde; l&agrave;m như thế n&agrave;o ? B&agrave;i viết n&agrave;y cũng giải th&iacute;ch v&igrave; sao những xe đồ chơi, m&ocirc; h&igrave;nh bằng nhựa, to hơn, điều khiển được nhưng lại c&oacute; mức gi&aacute; thấp hơn&nbsp;<strong>xe m&ocirc; h&igrave;nh&nbsp;</strong>bằng kim loại.</p>\r\n\r\n<p>Phương ph&aacute;p đ&uacute;c diecast: đ&uacute;c từ kim loại.</p>\r\n\r\n<p>Phương ph&aacute;p đ&uacute;c resin: đ&uacute;c từ nhựa.</p>\r\n\r\n<p><img alt=\"\" src=\"/front_end/img/blog/khungxe/1.webp\" style=\"height:535px; width:800px\" /></p>\r\n\r\n<p>Một mẫu xe điều khiển, do đặc th&ugrave; phải sản xuất bằng nhựa để đạt tốc độc cao</p>\r\n\r\n<p><br />\r\nCh&uacute;ng ta đi thẳng v&agrave;o phần khu&ocirc;n để đ&uacute;c một chiếc xe, khoan n&oacute;i đến phần nguy&ecirc;n liệu, lao động...</p>\r\n\r\n<p>Để đ&uacute;c một chiếc&nbsp;<strong>xe m&ocirc; h&igrave;nh tĩnh</strong>&nbsp;bằng kim loại (kẽm) cần c&oacute; một c&aacute;i khu&ocirc;n bằng th&eacute;p. C&ograve;n với xe resin (nhựa) cần người ta cần khu&ocirc;n silicon, cao su.</p>\r\n\r\n<ul>\r\n	<li>- Khu&ocirc;n Kim Loại (diecast):&nbsp;Chi ph&iacute; tạo to&agrave;n bộ khu&ocirc;n cho một mẫu xe đ&uacute;c kim loại kh&aacute; cao. Điển h&igrave;nh cho một mẫu xe 1:18 n&oacute; rơi v&agrave;o khoảng từ 100.000 USD đến 200.000 USD t&ugrave;y thuộc v&agrave;o cấu tạo của xe. Mất một v&agrave;i th&aacute;ng để tạo ra bộ khu&ocirc;n n&agrave;y. Người ta đổ kim loại n&oacute;ng chảy v&agrave;o khu&ocirc;n, sau đ&oacute; sử dụng một m&aacute;y đ&uacute;c &aacute;p lực cao để tạo ra khung xe. Tuổi thọ của một chiếc khu&ocirc;n l&agrave;m từ th&eacute;p với độ bền cao l&agrave; khoảng 1 triệu lần đ&uacute;c kim loại. Để đạt được hiệu quả kinh tế, bắt buộc họ phải l&agrave;m ra số lượng lớn cho mỗi một mẫu xe.&nbsp;Nhưng nếu số lượng của một mẫu được sản xuất ra chỉ khoảng v&agrave;i ngh&igrave;n chiếc, th&igrave; việc sử dụng khu&ocirc;n th&eacute;p để tạo ra sản phẩm lại trở th&agrave;nh đắt đỏ.&nbsp;Đ&acirc;y cũng l&agrave; l&iacute; do v&igrave; sao c&aacute;c xe m&ocirc; h&igrave;nh được sản xuất c&oacute; giới hạn ( Limited ) c&oacute; gi&aacute; th&agrave;nh cao hơn.</li>\r\n	<li><img alt=\"\" src=\"/front_end/img/blog/khungxe/2.webp\" /><img alt=\"\" src=\"/front_end/img/blog/khungxe/2.jpg\" /></li>\r\n	<li>\r\n	<p>- Khu&ocirc;n silicon, cao su (Resin): &nbsp;C&aacute;c mẫu xe bằng nhựa được đ&uacute;c bằng khu&ocirc;n silicon cao su, v&agrave; chi ph&iacute; tạo ra c&aacute;c khu&ocirc;n resin chỉ bằng 1/100 so với khu&ocirc;n th&eacute;p. Gi&aacute; th&agrave;nh chỉ rơi v&agrave;o khoảng từ v&agrave;i trăm USD đến v&agrave;i ngh&igrave;n USD ( khu&ocirc;n th&eacute;p 100.000USD -200.000USD). Mất v&agrave;i ng&agrave;y để tạo ra khu&ocirc;n silicon cao su, so với v&agrave;i th&aacute;ng của khu&ocirc;n th&eacute;p.</p>\r\n\r\n	<p>Khi một mẫu xe thật c&oacute; mặt tr&ecirc;n thị trường, mất khoản v&agrave;i tuần để mẫu xe m&ocirc; h&igrave;nh bằng nhựa được tung ra thị trường. Ngược lại khu&ocirc;n th&eacute;p được chế tạo từ kim loại c&oacute; độ cứng cao, c&aacute;c &quot;hang hốc&quot; trong khu&ocirc;n được chế tạo một c&aacute;ch cẩn thận v&agrave; tốn thời gian ( 6-12 th&aacute;ng), sử dụng nh&acirc;n c&ocirc;ng m&agrave;i giũa chỉnh sửa bằng tay. Khu&ocirc;n th&eacute;p khi ho&agrave;n thiện phải dỡ khu&ocirc;n bằng m&aacute;y v&agrave; trải qua kh&acirc;u đ&aacute;nh b&oacute;ng bằng tay. Điều đ&oacute; giải th&iacute;ch v&igrave; sao&nbsp;<strong>xe m&ocirc; h&igrave;nh</strong>&nbsp;bằng kim loại đường tung ra thị trường chậm hơn so với xe bằng nhựa,</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><img alt=\"\" src=\"/front_end/img/blog/khungxe/3.jpg\" style=\"height:605px; width:800px\" /></p>\r\n\r\n<p>Lợi thế của mẫu xe bằng nhựa l&agrave; mềm, c&aacute;c chi tiết phức tạp dễ d&agrave;ng thể hiện. Ch&iacute;nh v&igrave; vậy n&oacute; được &aacute;p dụng v&agrave;o l&agrave;m nội thất của&nbsp;<strong>xe m&ocirc; h&igrave;nh</strong>.<img alt=\"\" src=\"/front_end/img/blog/khungxe/4.webp\" style=\"height:534px; width:800px\" /></p>\r\n\r\n<p>Nhược điểm của xe c&oacute; khung bằng nhựa &nbsp;l&agrave; vật liệu. N&oacute; c&oacute; cấu tr&uacute;c yếu hơn kim loại. Sau một v&agrave;i năm n&oacute; c&oacute; thể bị biến dạng so với ban đầu. C&aacute;c c&aacute;nh cửa v&agrave; nắp capo sẽ kh&ocirc;ng được chuẩn x&aacute;c nữa, c&oacute; nhiều lỗ kh&iacute; nhỏ xung quanh. Để tr&aacute;nh những vấn đề tr&ecirc;n, đa số c&aacute;c mẫu xe khung nhựa được tạo ra với c&aacute;nh cửa v&agrave; nắp capo kh&ocirc;ng mở được.<br />\r\nĐến c&ocirc;ng đoạn sơn xe, cũng c&oacute; kh&aacute;c biệt lớn giữa resin v&agrave; kẽm. Sơn cần c&oacute; thời gian nung trong l&ograve; để kết lại. Đ&acirc;y l&agrave; một bước cần thiết để đảm bảo cho sơn đạt được độ b&oacute;ng l&aacute;ng chuẩn x&aacute;c. C&ocirc;ng đoạn nung sơn chỉ ứng dụng được với xe kim loại, c&ograve;n xe resin nếu nung dưới sức n&oacute;ng của nhiệt n&oacute; sẽ biến dạng ngay. V&igrave; sơn của xe resin kh&ocirc;ng thể đưa v&agrave;o l&ograve; nung n&ecirc;n n&oacute; cần c&oacute; th&ecirc;m một lớp sơn phủ ngo&agrave;i trong suốt để tạo được độ b&oacute;ng v&agrave; m&agrave;u sắc cần thiết. Trong khi m&agrave;u sắc sơn v&agrave;o xe kim loại cũng giống như sơn v&agrave;o xe thật, th&igrave; sơn ở xe resin tr&ocirc;ng b&oacute;ng lộn hơn. Nhưng ch&iacute;nh chỉ c&oacute; một lớp sơn m&agrave;u n&ecirc;n xe resin nh&igrave;n kh&ocirc;ng c&oacute; độ s&acirc;u v&agrave; cảm gi&aacute;c rắn chắc.<br />\r\n<br />\r\nNếu sử dụng phương ph&aacute;p sơn trực tiếp v&agrave;o th&acirc;n xe th&igrave; sẽ cho ra kết quả đẹp hơn l&agrave; tr&ecirc;n đề can nước, nhưng sẽ l&agrave;m cho gi&aacute; th&agrave;nh xe cao hơn. Cũng như khu&ocirc;n bằng th&eacute;p v&agrave; khu&ocirc;n bằng silicon. Sơn chỉ đem lại hiệu quả kinh tế khi thực hiện với số lượng v&agrave;i ngh&igrave;n chiếc. Đề can nước dễ xước, xuống m&agrave;u sau v&agrave;i năm sử dụng.</p>\r\n\r\n<p><img alt=\"\" src=\"/front_end/img/blog/khungxe/5.webp\" style=\"height:429px; width:800px\" /></p>\r\n\r\n<p>- Ch&uacute;ng t&ocirc;i nhận thấy rất nhiều mẫu xe resin tr&ecirc;n thị trường c&oacute; phần k&iacute;nh chắn gi&oacute; v&agrave; cửa sổ kh&ocirc;ng ho&agrave;n hảo. Ngược lại, phần k&iacute;nh xe bằng nhựa của c&aacute;c mẫu&nbsp;<strong>xe m&ocirc; h&igrave;nh</strong>&nbsp;kim loại lại dễ d&agrave;ng thể hiện được bất cứ độ cong n&agrave;o nhờ kỹ thuật khu&ocirc;n đ&uacute;c. Do khu&ocirc;n đ&uacute;c cho nhựa kh&aacute; đắt đỏ nếu sử dụng với số lượng &iacute;t, n&ecirc;n rất hiếm mẫu xe bằng nhựa sử dụng kỹ thuật n&agrave;y để tạo k&iacute;nh xe.</p>\r\n\r\n<p><img alt=\"\" src=\"/front_end/img/blog/khungxe/6.webp\" /></p>\r\n\r\n<p>- Đối với một số chi tiết thường phải mạ cr&ocirc;m . Để tạo hiệu ứng kim loại ở xe khung nhựa người ta thực hiện phương ph&aacute;p mạ ch&acirc;n kh&ocirc;ng. Nhưng kết quả thường kh&ocirc;ng s&aacute;ng ch&oacute;i như xe thật. Chỉ những&nbsp;<strong>xe m&ocirc; h&igrave;nh</strong>&nbsp;kim loại kẽm v&agrave; nhựa đ&uacute;c n&oacute;ng chảy mới ứng dụng được kỹ thuật &quot;mạ cr&ocirc;m ướt&quot; ,&nbsp;những bộ phận cần mạ cr&ocirc;m sẽ được nh&uacute;ng v&agrave;o một dung dịch a x&iacute;t rồi mới tiếp tục qua c&aacute;c kh&acirc;u xử l&yacute; kh&aacute;c<br />\r\n<br />\r\nM&ocirc; h&igrave;nh xe bằng nhựa nhắm v&agrave;o một đối tượng trẻ em nhỏ kh&aacute;ch h&agrave;ng kh&ocirc;ng quan t&acirc;m đến mẫu m&atilde;, chất lượng d&agrave;i l&acirc;u.<br />\r\n<br />\r\nNgo&agrave;i những mẫu m&ocirc; h&igrave;nh điều khiển ( do đặt th&ugrave; phải bằng nhựa để đạt tốc độ cao), Banmohinhtinh.com sẽ kh&ocirc;ng ph&acirc;n phối&nbsp;<strong>xe m&ocirc; h&igrave;nh tĩnh</strong>&nbsp;bằng nhựa hoặc kh&ocirc;ng đưa n&oacute; trở th&agrave;nh một phần ch&iacute;nh của cửa h&agrave;ng. Ch&uacute;ng t&ocirc;i tin tưởng rằng đ&uacute;c kim loại ch&iacute;nh l&agrave; phương ph&aacute;p v&agrave; vật liệu tốt nhất để tạo ra c&aacute;c mẫu&nbsp;<strong>xe m&ocirc; h&igrave;nh</strong>&nbsp;hấp dẫn, với c&aacute;c chi tiết tốt với gi&aacute; th&agrave;nh chấp nhận được. Với c&aacute;c cấu tr&uacute;c chắc chắn, n&oacute; sẽ mang lại niềm vui l&acirc;u d&agrave;i hơn cho người sưu tập.</p>', '2022-12-05 07:13:15', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `id_users` int(11) NOT NULL,
  `total` float NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1: chưa đặt hàng\r\n2: đã đặt hàng',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_detail`
--

CREATE TABLE `cart_detail` (
  `id` int(11) NOT NULL,
  `id_cart` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `id_users` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `content` text NOT NULL,
  `time` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1: Chờ phê duyệt\r\n2: Đã phê duyệt',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`id`, `id_users`, `id_product`, `content`, `time`, `status`, `updated_at`, `created_at`) VALUES
(2, 10, 4, 'quá đỉnh luôn', '2022-12-13', 1, '2022-12-13 09:30:10', NULL),
(3, 10, 27, 'quá ngon trong tầm giá', '2022-12-13', 1, '2022-12-13 09:48:23', NULL),
(4, 10, 33, 'sản phẩm này nên trải nghiệm', '2022-12-13', 1, '2022-12-13 09:48:55', NULL),
(5, 9, 2, 'sản phẩm này chưng bàn khá đẹp', '2022-12-13', 1, '2022-12-13 09:49:50', NULL),
(6, 9, 29, 'không có tiền thì chơi mô hình trước v', '2022-12-13', 1, '2022-12-13 09:50:20', NULL),
(7, 9, 42, 'đẹp quá anh em', '2022-12-13', 1, '2022-12-13 09:50:51', NULL),
(8, 8, 1, 'siêu phẩm  luôn', '2022-12-13', 1, '2022-12-13 09:51:42', NULL),
(9, 8, 52, 'sản phẩm này đáng để trải nghiệm', '2022-12-13', 1, '2022-12-13 09:52:13', NULL),
(10, 9, 1, 'con này sài bao đẹp', '2022-12-13', 1, '2022-12-13 09:53:41', NULL),
(11, 9, 39, 'quá đẹp luôn', '2022-12-13', 1, '2022-12-13 09:54:08', NULL),
(12, 9, 11, 'sản phẩm này đỉnh', '2022-12-13', 1, '2022-12-13 09:54:52', NULL),
(13, 9, 23, 'đẹp mà k có tiền mua', '2022-12-13', 1, '2022-12-13 09:55:40', NULL),
(14, 9, 5, 'có tiền mua liền', '2022-12-13', 1, '2022-12-13 09:56:06', NULL),
(15, 9, 45, 'đã mua 2 con này quá đỉnh luôn', '2022-12-13', 1, '2022-12-13 09:56:35', NULL),
(16, 8, 2, 'con này đẹp quá', '2022-12-13', 1, '2022-12-13 09:58:15', NULL),
(17, 9, 4, 'sản phẩm này đẹp quá', '2022-12-15', 1, '2022-12-15 03:46:18', NULL),
(18, 10, 2, 'sản phẩm đẹp quá', '2022-12-17', 1, '2022-12-17 02:46:33', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `name_coupon` varchar(20) NOT NULL,
  `value` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1: Chưa sử dụng\r\n2: Đã sử dụng',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `coupons`
--

INSERT INTO `coupons` (`id`, `name_coupon`, `value`, `status`, `updated_at`, `created_at`) VALUES
(1, 'giam30k', 30000, 2, '2022-12-29 01:44:08', NULL),
(2, 'giam50k', 50000, 1, '2022-12-29 08:18:35', NULL),
(3, 'giam60k', 60000, 1, '2023-01-02 06:18:38', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `manufacture`
--

CREATE TABLE `manufacture` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `manufacture`
--

INSERT INTO `manufacture` (`id`, `name`, `image`) VALUES
(1, 'audi', 'audi.png\r\n'),
(2, 'bentley', 'benly.png\r\n'),
(3, 'bmw', 'bmw.png'),
(4, 'bugati', 'bugati.png'),
(5, 'chevrolet', 'chevrolet.png'),
(6, 'ferari', 'ferari.png'),
(7, 'ford', 'ford.png'),
(8, 'honda', 'honda.png'),
(9, 'hyundai', 'hyundai.png'),
(10, 'kia', 'kia.png'),
(11, 'lamborghini', 'lamboghini.png'),
(12, 'lexus', 'lexus.png'),
(13, 'mclaren', 'mclaren.png'),
(14, 'mercedes', 'mec.png'),
(15, 'mitsubisi', 'mit.png'),
(16, 'mini copper', 'mni.png'),
(17, 'nissan', 'nissan.png'),
(18, 'porsche', 'porsche.png'),
(19, 'roll-royce', 'rr.png'),
(20, 'tesla', 'tesla.png'),
(21, 'vin fast', 'vin.png'),
(22, 'toyota', 'toyota.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `id_manufacture` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ratio` varchar(4) NOT NULL,
  `unit_price` float NOT NULL,
  `promotion_price` float NOT NULL,
  `image` varchar(255) NOT NULL,
  `detail` text NOT NULL,
  `description` text NOT NULL,
  `new` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `id_manufacture`, `name`, `ratio`, `unit_price`, `promotion_price`, `image`, `detail`, `description`, `new`, `created_at`, `updated_at`) VALUES
(1, 14, 'Xe mô hình Mercedes G63 V12 1:24 Chezhi', '1:24', 400000, 350000, 'g63.jpg', 'Xe dài 20cm. Khung vỏ hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được cửa, capo, cốp.\r\nXe chạy đà, có đèn và âm thanh.', '<h3>Xe m&ocirc; h&igrave;nh&nbsp;<a href=\"https://trummohinh.com/xe-mo-hinh-mercedes-g65-124-cz/\">Mercedes G63 V12 1:24 Chezhi</a></h3>\r\n\r\n<p>Xem VIDEO m&ocirc; tả sản phẩm tại: https://www.youtube.com/trummohinh</p>\r\n\r\n<p>Chi tiết :&nbsp;<a href=\"https://trummohinh.com/mercedes-benz/\">Xe m&ocirc; h&igrave;nh Mercedes</a>&nbsp;G63 V12 1:24 c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; độc đ&aacute;o cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n.</p>\r\n\r\n<p>Chức năng: Xe mở được cửa, capo, cốp. Xe chạy đ&agrave;, c&oacute; đ&egrave;n v&agrave; &acirc;m thanh.</p>\r\n\r\n<p>K&iacute;ch thước: d&agrave;i 20 cm<br />\r\nH&atilde;ng sản xuất : Chezhi</p>\r\n\r\n<p><em>Xe m&ocirc; h&igrave;nh Mercedes G63 V12 v</em>ới k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>\r\n\r\n<p><img alt=\"\" src=\"/front_end/img/products/g63.jpg\" /></p>', 1, '2022-12-05 03:49:24', NULL),
(2, 1, 'Xe mô hình Audi R8 V10 1:24 Maisto', '1:24', 400000, 0, 'r8.jpg', 'hất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được cửa, nắp capo và cốp trước. Xe chạy đà, có đèn và âm thanh.', '<h3>Xe m&ocirc; h&igrave;nh Audi R8 V10 1:24 Maisto</h3>\r\n\r\n<p>Chất liệu hợp kim si&ecirc;u bền, sơn tĩnh điện cao cấp.<br />\r\nXe mở được cửa, nắp capo v&agrave; cốp sau.</p>\r\n\r\n<p>Xem VIDEO m&ocirc; tả sản phẩm tại:&nbsp;<a href=\"https://www.youtube.com/trummohinh\" target=\"_blank\">https://www.youtube.com/trummohinh</a></p>\r\n\r\n<p>Chi tiết :&nbsp;<a href=\"https://trummohinh.com/audi/\">Xe m&ocirc; h&igrave;nh Audi</a>&nbsp;R8 V10 1:24 Maisto c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; độc đ&aacute;o cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Tỷ lệ 1:24<br />\r\nK&iacute;ch thước: d&agrave;i 20 cm<br />\r\nH&atilde;ng sản xuất : Maisto</p>\r\n\r\n<p><em>Xe m&ocirc; h&igrave;nh Audi R8 V10 1:24 Maisto&nbsp;</em>với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-08 09:41:53', NULL),
(3, 18, 'Mô hình xe Porsche Taycan Turbo S 1:24 Welly', '1:24', 400000, 0, 'taycan_tubo_s.jpg', 'Hàng bản quyền, chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được cửa, capo và cốp (tùy loại). Bánh trước đánh lái được, bánh trước và bánh sau chuyển động được.', '<h3><strong>M&ocirc; h&igrave;nh xe Porsche Taycan Turbo S 1:24 Welly</strong></h3>\r\n\r\n<p>💢 Th&ocirc;ng tin th&ecirc;m</p>\r\n\r\n<p>Porsche Taycan l&agrave; mẫu xe điện Hypercar x&acirc;y dựng tr&ecirc;n nền tảng khung gầm mới J1, k&iacute;ch thước kh&aacute; tương đồng Panamera.</p>\r\n\r\n<p>Phi&ecirc;n bản Taycan 4S trang bị bộ pin 79,2 kWh c&ocirc;ng suất 522 m&atilde; lực v&agrave; m&ocirc;-men xoắn cực đại 640 Nm.</p>\r\n\r\n<p>Hộp số hai tốc độ gắn ở ph&iacute;a sau. Tầm di chuyển của xe đạt 405 km mỗi khi đầy pin.</p>\r\n\r\n<p>Video sp:&nbsp;<a href=\"https://youtube.com/trummohinh\" target=\"_blank\">https://youtube.com/trummohinh</a></p>\r\n\r\n<p>💢 Th&ocirc;ng tin sản phẩm M&ocirc; h&igrave;nh xe Porsche Taycan Turbo S</p>\r\n\r\n<p>🔹 H&atilde;ng sản xuất: Welly</p>\r\n\r\n<p>🔹 Tỉ lệ: 1:24 (nhỏ hơn xe thật 24 lần)</p>\r\n\r\n<p>🔹 M&agrave;u: M&agrave;u trắng</p>\r\n\r\n<p>🔹 K&iacute;ch thước: D&agrave;i x Rộng x Cao (20 x 8 x 5,5 cm)</p>\r\n\r\n<p>🔹 Khối lượng: ~400gr</p>\r\n\r\n<p>🔹 Chất liệu: To&agrave;n bộ phần th&acirc;n vỏ được l&agrave;m bằng kim loại nguy&ecirc;n khối với nước sơn tĩnh điện 3 lớp cực đẹp,</p>\r\n\r\n<p>Gầm xe v&agrave; nội thất bằng nhựa, b&aacute;nh xe bằng cao su cao cấp</p>\r\n\r\n<p>🔹 T&iacute;nh năng:</p>\r\n\r\n<p>✔️ Mở 2 cửa, capo</p>\r\n\r\n<p>✔️ B&aacute;nh xe v&agrave; v&ocirc; lăng quay được</p>\r\n\r\n<p>🔹 Mục đ&iacute;ch sử dụng:</p>\r\n\r\n<p>✔️ Sưu tầm xe m&ocirc; h&igrave;nh</p>\r\n\r\n<p>✔️ Trang tr&iacute;, nội thất</p>\r\n\r\n<p>✔️ Qu&agrave; tặng cho bạn nam, qu&agrave; tặng cho b&eacute; trai, qu&agrave; noel, qu&agrave; sinh nhật</p>\r\n\r\n<p>✔️ T&igrave;m hiểu xe&nbsp;<a href=\"https://trummohinh.com/porsche/\">Porsche</a>&nbsp;Taycan Turbo S qua m&ocirc; h&igrave;nh</p>', 1, '2022-12-05 02:32:06', NULL),
(4, 11, 'Mô hình xe Lamborghini Aventador Roadster Liberty Walk 1:32', '1:32', 250000, 220000, 'roadster.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được 2 cửa, nắp capo và cốp trước. Xe chạy đà, có đèn và nhạc.', '<h3><strong>Xe m&ocirc; h&igrave;nh Lamborghini Aventador Roadster Liberty Walk 1:32 Double Horses</strong></h3>\r\n\r\n<p>Chất liệu hợp kim, sơn tĩnh điện cao cấp.<br />\r\nXe mở được 2 cửa, nắp capo v&agrave; cốp trước. Xe chạy đ&agrave;, c&oacute; đ&egrave;n v&agrave; nhạc.</p>\r\n\r\n<p>Xem video sản phẩm thực tế:&nbsp;<a href=\"https://youtu.be/66SSxQhqCNo\" target=\"_blank\">https://youtu.be/66SSxQhqCNo</a></p>\r\n\r\n<p>Chi tiết : XE M&Ocirc; H&Igrave;NH Lamborghini Aventador Roadster Liberty Walk c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; độc đ&aacute;o cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Chức năng: Xe mở được 2 cửa, nắp capo v&agrave; cốp trước. Xe chạy đ&agrave;, c&oacute; đ&egrave;n v&agrave; nhạc.</p>\r\n\r\n<p>Tỷ lệ 1:32<br />\r\nM&agrave;u sắc: Đen, đỏ, trắng<br />\r\nK&iacute;ch thước: d&agrave;i 15.2 cm x rộng 6.8 cm x cao 4 cm<br />\r\nH&atilde;ng sản xuất : Double Horses</p>\r\n\r\n<p>XE M&Ocirc; H&Igrave;NH Lamborghini Aventador Roadster Liberty Walk với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-04 09:17:00', NULL),
(5, 3, 'Mô hình xe BMW Z4 GT3 1:32 KDW', '1:32', 270000, 250000, 'z4gt3.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được 2 cửa, nắp capo. Xe chạy đà, có đèn và âm thanh.', '<h3><strong>M&ocirc; h&igrave;nh xe BMW Z4 GT3 1:32 KDW</strong></h3>\r\n\r\n<p>Chất liệu hợp kim si&ecirc;u bền, sơn tĩnh điện cao cấp.<br />\r\nXe mở được 2 cửa, nắp capo. Xe chạy đ&agrave;, c&oacute; đ&egrave;n v&agrave; &acirc;m thanh.</p>\r\n\r\n<p>Chi tiết : Xe m&ocirc; h&igrave;nh&nbsp;<a href=\"https://trummohinh.com/xe-mo-hinh-bmw-i8-124-rastar/\">BMW</a>&nbsp;Z4 GT3 1:32 KDW c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; &yacute; nghĩa cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Chức năng: Xe mở được 2 cửa, nắp capo. Xe chạy đ&agrave;, c&oacute; đ&egrave;n v&agrave; &acirc;m thanh.</p>\r\n\r\n<p>Tỷ lệ 1:32<br />\r\nM&agrave;u sắc: Như h&igrave;nh<br />\r\nK&iacute;ch thước: d&agrave;i 15cm</p>\r\n\r\n<p>Xe m&ocirc; h&igrave;nh BMW Z4 GT3 1:32 KDW với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a>&nbsp;v&agrave;&nbsp;<a href=\"https://trummohinh.com/bmw/\">https://trummohinh.com/bmw/</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-04 09:18:43', NULL),
(6, 6, 'Xe mô hình Ferrari Laferrari Red Signature 1:18 Bburago', '1:18', 1500000, 0, 'red_signature.jpg', 'Hàng bản quyền, chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được 2 cửa và capo trước. Bánh trước đánh lái được, bánh trước và bánh sau chuyển động được.', '<h3><strong>Xe m&ocirc; h&igrave;nh&nbsp;<a href=\"https://trummohinh.com/xe-mo-hinh-ferrari-laferrari-red-signature-118-bburago/\">Ferrari Laferrari Red Signature 1:18 Bburago</a></strong></h3>\r\n\r\n<p>H&agrave;ng bản quyền, chất liệu hợp kim si&ecirc;u bền, sơn tĩnh điện cao cấp.<br />\r\nXe mở được 2 cửa v&agrave; capo trước. B&aacute;nh trước đ&aacute;nh l&aacute;i được, b&aacute;nh trước v&agrave; b&aacute;nh sau chuyển động được.</p>\r\n\r\n<p>Chi tiết : Sản phẩm&nbsp;<a href=\"https://trummohinh.com/ferrari/\"><strong>m&ocirc; h&igrave;nh ferrari</strong></a>&nbsp;c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; &yacute; nghĩa cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Chức năng: Xe mở được cửa, capo v&agrave; cốp. B&aacute;nh trước đ&aacute;nh l&aacute;i được, b&aacute;nh trước v&agrave; b&aacute;nh sau chuyển động được.</p>\r\n\r\n<p>Tỷ lệ 1:18<br />\r\nM&agrave;u sắc:<br />\r\nK&iacute;ch thước: d&agrave;i 27 cm<br />\r\nH&atilde;ng sản xuất : Bburago</p>\r\n\r\n<p>Xe m&ocirc; h&igrave;nh với k&iacute;ch thước nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p><a href=\"https://trummohinh.com/mo-hinh-tinh/\">http://TrumMoHinh.com/Mo-Hinh-Tinh</a></p>', 1, '2022-12-04 09:21:43', NULL),
(7, 2, 'Xe mô hình Bentley Continental GT 1:36 MSN', '1:36', 130000, 0, 'continental.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được 2 cửa. Xe chạy đà.', '<h3><strong>Xe m&ocirc; h&igrave;nh&nbsp;<a href=\"https://trummohinh.com/xe-mo-hinh-bentley-continental-gt-136-msn/\">Bentley Continental GT 1:36 MSN</a></strong></h3>\r\n\r\n<p>Chất liệu hợp kim si&ecirc;u bền, sơn tĩnh điện cao cấp.<br />\r\nXe mở được 2 cửa. Xe chạy đ&agrave;.</p>\r\n\r\n<p>Xem video sản phẩm thực tế:</p>\r\n\r\n<p>Chi tiết : Xe m&ocirc; h&igrave;nh Bentley Continental GT&nbsp;c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; &yacute; nghĩa cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Chức năng: Xe mở được 2 cửa. Xe chạy đ&agrave;.</p>\r\n\r\n<p>Tỷ lệ 1:36<br />\r\nM&agrave;u sắc: Đen sần<br />\r\nK&iacute;ch thước: d&agrave;i 12cm<br />\r\nH&atilde;ng sản xuất : MSN</p>\r\n\r\n<p>Xe m&ocirc; h&igrave;nh Bentley Continental GT với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a>&nbsp;v&agrave;&nbsp;<a href=\"https://trummohinh.com/bentley/\">https://trummohinh.com/bentley/</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-04 09:22:40', NULL),
(10, 19, 'Xe mô hình Roll Royce Phantom Extended 1:18 Kyosho', '1:18', 6000000, 0, 'PhantomExtended.jpg', 'Hàng bản quyền, chất liệu hợp kim, sơn tĩnh điện cao cấp.\r\nXe mở được 4 cửa, capo trước. Bánh xe đánh lái được.', '<h3><strong>Xe m&ocirc; h&igrave;nh Roll Royce Phantom Extended 1:18 Kyosho</strong></h3>\r\n\r\n<h3><strong>(Rolls Royce Phantom EWB)</strong></h3>\r\n\r\n<p>Tỷ lệ: 1:18 M&agrave;u sắc: Đen, Xanh bạc</p>\r\n\r\n<p>&ndash; Xe m&ocirc; phỏng theo xe thật v&agrave; thu nhỏ 18 lần (1:18)</p>\r\n\r\n<p>&ndash;&nbsp;<strong>Rolls Royce Phantom</strong>&nbsp;được h&atilde;ng&nbsp;<em>Kyosho</em>&nbsp;thiết kế kh&aacute; chi tiết, sắc n&eacute;t.</p>\r\n\r\n<p>&ndash; Xe mở được 4 cửa, capo trước, cốp sau.</p>\r\n\r\n<p>&ndash; 4 giảm s&oacute;c, v&ocirc; lăng đ&aacute;nh l&aacute;i b&aacute;nh trước.</p>\r\n\r\n<p>&ndash; Nội thất l&oacute;t thảm sang trọng.</p>\r\n\r\n<p>&ndash; C&oacute; thể hạ được tay vịn của ghế sau.</p>\r\n\r\n<p>&ndash; H&agrave;ng ghế trước c&oacute; thể di chuyển tiến l&ugrave;i như xe thật.</p>\r\n\r\n<p>&ndash; Hộc đồ ph&iacute;a trước c&oacute; thể mở ra.</p>\r\n\r\n<p>&ndash; &Ocirc; c&oacute; thể th&aacute;o ra b&ecirc;n cửa.</p>', 1, '2022-12-03 02:50:22', '2022-12-02 19:48:42'),
(11, 5, 'Xe mô hình Chevrolet Camaro SS 1:36 Unk', '1:36', 150000, 130000, 'ChevroletCamaro.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được 2 cửa. Xe chạy đà.', '<h3><strong>Xe m&ocirc; h&igrave;nh Chevrolet Camaro SS 1:36 Unk</strong></h3>\r\n\r\n<p>M&ocirc; h&igrave;nh xe l&agrave; bản m&ocirc; phỏng với tỉ lệ thu nhỏ 36 lần so với xe thật, c&oacute; c&aacute;c đặc điểm:</p>\r\n\r\n<p>&ndash; To&agrave;n bộ khung vỏ xe được l&agrave;m bằng kim loại, sơn tĩnh điện bền đẹp.&nbsp;Nội thất nhựa , lốp cao su.</p>\r\n\r\n<p>&ndash; Xe mở được cửa, cốp trước v&agrave; sau.</p>\r\n\r\n<p>&ndash; Xe chạy b&aacute;nh đ&agrave;.</p>\r\n\r\n<p>&ndash; K&iacute;ch thước: chiều d&agrave;i 13cm</p>\r\n\r\n<p>&ndash; Thiết kế tinh xảo m&ocirc; phỏng y hệt c&aacute;c chi tiết của xe thật như kiểu d&aacute;ng, k&iacute;ch thước, c&aacute;c chi tiết đ&egrave;n, b&aacute;nh xe, nội thất, ghế, v&ocirc; lăng, ống xả&hellip;</p>\r\n\r\n<p>M&ocirc; h&igrave;nh xe Chevrolet Camaro SS ph&ugrave; hợp để l&agrave;m qu&agrave; tặng, đồ trưng b&agrave;y, trang tr&iacute;, sưu tầm, b&agrave;y tr&ecirc;n taplo xe&hellip;</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-03 04:08:49', '2022-12-02 21:03:14'),
(12, 15, 'Mô hình xe Mitsubishi Pajero V97 1:32 Jackiekim', '1:32', 300000, 0, 'MitsubishiPajeroV97.jpg', 'Khung vỏ xe kim loại, nội thất nhựa, lốp cao su.\r\nXe mở được cửa, nắp capo và cốp. Xe chạy đà, có đèn và âm thanh', '<h3><strong>Xe m&ocirc; h&igrave;nh Mitsubishi Pajero V97 1:32 Jackiekim</strong></h3>\r\n\r\n<p>Khung vỏ xe kim loại, nội thất nhựa, lốp cao su.<br />\r\nXe mở được cửa, nắp capo v&agrave; cốp. Xe chạy đ&agrave;, c&oacute; đ&egrave;n v&agrave; &acirc;m thanh.</p>\r\n\r\n<p>Chi tiết : Xe m&ocirc; h&igrave;nh c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; &yacute; nghĩa cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: Đầu xe bằng hợp kim, th&acirc;n xe bằng nhựa.</p>\r\n\r\n<p>Chức năng: Xe mở được cửa, nắp capo v&agrave; cốp. Xe chạy đ&agrave;, c&oacute; đ&egrave;n v&agrave; &acirc;m thanh.</p>\r\n\r\n<p>Tỷ lệ 1:32<br />\r\nK&iacute;ch thước: d&agrave;i 16 cm</p>\r\n\r\n<p>Xe m&ocirc; h&igrave;nh với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-02 21:07:08', '2022-12-02 21:07:08'),
(13, 13, 'Xe mô hình Mclaren 650S 1:36 Unk', '1:36', 130000, 0, 'Mclaren650S.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được 2 cửa. Xe chạy đà.', '<h3><strong>Xe m&ocirc; h&igrave;nh Mclaren 650S 1:36 Unk</strong></h3>\r\n\r\n<p>M&ocirc; h&igrave;nh xe l&agrave; bản m&ocirc; phỏng với tỉ lệ thu nhỏ 36 lần so với xe thật, c&oacute; c&aacute;c đặc điểm:</p>\r\n\r\n<p>&ndash; To&agrave;n bộ khung vỏ xe được l&agrave;m bằng kim loại, sơn tĩnh điện bền đẹp.&nbsp;Nội thất nhựa , lốp cao su.</p>\r\n\r\n<p>&ndash; Xe mở được cửa, cốp trước v&agrave; sau.</p>\r\n\r\n<p>&ndash; Xe chạy b&aacute;nh đ&agrave;.</p>\r\n\r\n<p>&ndash; K&iacute;ch thước: chiều d&agrave;i 13cm</p>\r\n\r\n<p>&ndash; Thiết kế tinh xảo m&ocirc; phỏng y hệt c&aacute;c chi tiết của xe thật như kiểu d&aacute;ng, k&iacute;ch thước, c&aacute;c chi tiết đ&egrave;n, b&aacute;nh xe, nội thất, ghế, v&ocirc; lăng, ống xả&hellip;</p>\r\n\r\n<p>M&ocirc; h&igrave;nh xe Mclaren 650S ph&ugrave; hợp để l&agrave;m qu&agrave; tặng, đồ trưng b&agrave;y, trang tr&iacute;, sưu tầm, b&agrave;y tr&ecirc;n taplo xe&hellip;</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-04 09:33:11', '2022-12-02 21:11:33'),
(14, 4, 'Xe mô hình Bugatti Divo 1:24 Double Horses', '1:24', 400000, 350000, 'BugattiDivo.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nMở cửa, capo. Xe chạy đà; Có đèn và âm thanh.', '<h3><strong>Xe m&ocirc; h&igrave;nh&nbsp;<a href=\"https://trummohinh.com/xe-mo-hinh-bugatti-divo-124-double-horses/\">Bugatti Divo 1:24 Double Horses</a></strong></h3>\r\n\r\n<p>Xem VIDEO m&ocirc; tả sản phẩm tại:&nbsp;<a href=\"https://www.youtube.com/trummohinh\" target=\"_blank\">https://www.youtube.com/trummohinh</a></p>\r\n\r\n<p>M&Ocirc; TẢ SẢN PHẨM:</p>\r\n\r\n<p>Được ch&iacute;nh thức ra mắt v&agrave;o th&aacute;ng 8 năm 2018, Bugatti Divo l&agrave; một biến thể thuộc d&ograve;ng Chiron. Chiếc xe sở hữu một vẻ bề ngo&agrave;i hầm hố với nhiều chi tiết kh&iacute; động học với m&agrave;u sơn x&aacute;m-xanh, đem lại vẻ đẹp kh&aacute;c lạ cho Divo. Chiếc si&ecirc;u xe đến từ nước Ph&aacute;p, Bugatti Divo ra mắt cộng đồng với mức gi&aacute; 5,8 triệu USD được giới hạn sản xuất 40 chiếc.</p>\r\n\r\n<p>Tr&ecirc;n một trang Mobile của Đức, xe được rao b&aacute;n với mức gi&aacute; l&agrave; 7,6 triệu USD chưa bao gồm thuế. Nếu cộng mức thuế tại Đức th&ecirc;m 19% th&igrave; gi&aacute; sẽ sẽ tăng l&ecirc;n đến 9 triệu USD. Mức gi&aacute; n&agrave;y gấp 4 lần chiếc si&ecirc;u xe Veyron v&agrave; gấp đ&ocirc;i si&ecirc;u xe Chiron. Tuy với mức gi&aacute; v&ocirc; c&ugrave;ng đắt đỏ vậy m&agrave; chỉ sau khi c&ocirc;ng bố loạt ảnh teaser, chiếc si&ecirc;u xe n&agrave;y đ&atilde; được đặt h&agrave;ng hết.</p>\r\n\r\n<p>CHI TIẾT SẢN PHẨM:</p>\r\n\r\n<p>*&nbsp; T&ecirc;n Sản Phẩm: Xe m&ocirc; h&igrave;nh Bugati Divo</p>\r\n\r\n<p>*&nbsp; Tỉ Lệ: 1/24 (nhỏ hơn xe thật 24 lần)</p>\r\n\r\n<p>*&nbsp; K&iacute;ch Thước: D&agrave;i 20cm, rộng 9.5cm, cao 5.5cm</p>\r\n\r\n<p>*&nbsp; Chất Liệu: Th&acirc;n xe được đ&uacute;c bằng hợp kim, nội thất nhựa ABS, lốp xe cao su, nước sơn b&oacute;ng.</p>\r\n\r\n<p>*&nbsp; H&atilde;ng sản xuất: Double Horses</p>\r\n\r\n<p>CHỨC NĂNG:</p>\r\n\r\n<p>* Mở cửa v&agrave; capo.</p>\r\n\r\n<p>* Xe chạy đ&agrave;; C&oacute; đ&egrave;n v&agrave; &acirc;m thanh.</p>\r\n\r\n<p><em>Xe m&ocirc; h&igrave;nh Bugatti Divo</em>&nbsp;với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a>&nbsp;v&agrave;&nbsp;<a href=\"https://trummohinh.com/bugatti/\">https://trummohinh.com/bugatti/</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-02 21:13:46', '2022-12-02 21:13:46'),
(15, 17, 'Xe mô hình Nissan X-Trail 1:18 Paudi', '1:18', 2200000, 2100000, 'NissanX-Trail.jpg', 'Hàng bản quyền, chất liệu hợp kim, sơn tĩnh điện cao cấp.\r\nXe mở được 2 cửa, capo trước. Bánh xe đánh lái được.', '<h3><strong>Xe m&ocirc; h&igrave;nh Nissan X-Trail 1:18 Paudi</strong></h3>\r\n\r\n<p>H&agrave;ng bản quyền, chất liệu hợp kim, sơn tĩnh điện cao cấp.<br />\r\nXe mở được 2 cửa, capo trước. B&aacute;nh xe đ&aacute;nh l&aacute;i được.</p>\r\n\r\n<p>Chi tiết : Xe m&ocirc; h&igrave;nh Nissan X-Trail c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; &yacute; nghĩa cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>&nbsp;Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Chức năng: Xe mở được cửa, capo v&agrave; cốp. B&aacute;nh xe đ&aacute;nh l&aacute;i được.</p>\r\n\r\n<p>Tỷ lệ 1:18<br />\r\nK&iacute;ch thước: d&agrave;i 30cm</p>\r\n\r\n<p>Xe m&ocirc; h&igrave;nh Nissan X-Trail với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p><a href=\"https://trummohinh.com/mo-hinh-tinh/\">http://TrumMoHinh.com/</a></p>', 1, '2022-12-02 21:19:10', '2022-12-02 21:19:10'),
(16, 7, 'Xe mô hình Ford F150 1:36 Unk', '1:36', 130000, 0, 'FordF150.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được 2 cửa. Xe chạy đà.', '<h3><strong>Xe m&ocirc; h&igrave;nh Ford F150 1:36 Unk</strong></h3>\r\n\r\n<p>M&ocirc; h&igrave;nh xe l&agrave; bản m&ocirc; phỏng với tỉ lệ thu nhỏ 32 lần so với xe thật, c&oacute; c&aacute;c đặc điểm:</p>\r\n\r\n<p>&ndash; To&agrave;n bộ khung vỏ xe được l&agrave;m bằng kim loại, sơn tĩnh điện bền đẹp.&nbsp;Nội thất nhựa , lốp cao su.</p>\r\n\r\n<p>&ndash; Xe mở được cửa, cốp trước v&agrave; sau.</p>\r\n\r\n<p>&ndash; Xe chạy b&aacute;nh đ&agrave;.</p>\r\n\r\n<p>&ndash; K&iacute;ch thước: chiều d&agrave;i 13cm</p>\r\n\r\n<p>&ndash; Thiết kế tinh xảo m&ocirc; phỏng y hệt c&aacute;c chi tiết của xe thật như kiểu d&aacute;ng, k&iacute;ch thước, c&aacute;c chi tiết đ&egrave;n, b&aacute;nh xe, nội thất, ghế, v&ocirc; lăng, ống xả&hellip;</p>\r\n\r\n<p><a href=\"https://trummohinh.com/ford/\">M&ocirc; h&igrave;nh xe Ford</a>&nbsp;F150 ph&ugrave; hợp để l&agrave;m qu&agrave; tặng, đồ trưng b&agrave;y, trang tr&iacute;, sưu tầm, b&agrave;y tr&ecirc;n taplo xe&hellip;</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-04 09:36:17', '2022-12-02 21:24:28'),
(17, 8, 'Xe mô hình Honda Civic Type R 1:32 Double Horses', '1:32', 250000, 220000, 'HondaCivic.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được 4 cửa, capo trước và cốp sau. Xe chạy đà, có đèn và nhạc.', '<h3>Xe m&ocirc; h&igrave;nh&nbsp;<a href=\"https://trummohinh.com/xe-mo-hinh-honda-civic-type-r-132-double-horses/\">Honda Civic Type R 1:32 Double Horses</a></h3>\r\n\r\n<p>Xem video sản phẩm thực tế:&nbsp;<a href=\"https://youtu.be/cyXBAfac33g\" target=\"_blank\">https://youtu.be/cyXBAfac33g</a></p>\r\n\r\n<p>M&ocirc; h&igrave;nh xe l&agrave; bản m&ocirc; phỏng với tỉ lệ thu nhỏ 32 lần so với xe thật, c&oacute; c&aacute;c đặc điểm:</p>\r\n\r\n<p>&ndash; To&agrave;n bộ khung vỏ xe được l&agrave;m bằng kim loại, sơn tĩnh điện bền đẹp.&nbsp;Nội thất nhựa , lốp cao su.</p>\r\n\r\n<p>&ndash; Xe mở được cửa, cốp trước v&agrave; sau.</p>\r\n\r\n<p>&ndash; Xe chạy b&aacute;nh đ&agrave;, c&oacute; đ&egrave;n v&agrave; &acirc;m thanh.</p>\r\n\r\n<p>&ndash; K&iacute;ch thước: chiều d&agrave;i 15cm</p>\r\n\r\n<p>&ndash; Thiết kế tinh xảo m&ocirc; phỏng y hệt c&aacute;c chi tiết của xe thật như kiểu d&aacute;ng, k&iacute;ch thước, c&aacute;c chi tiết đ&egrave;n, b&aacute;nh xe, nội thất, ghế, v&ocirc; lăng, ống xả&hellip;</p>\r\n\r\n<p>Xe m&ocirc; h&igrave;nh Honda Civic Type R 1:32 Double Horses ph&ugrave; hợp để l&agrave;m qu&agrave; tặng, đồ trưng b&agrave;y, trang tr&iacute;, sưu tầm, b&agrave;y tr&ecirc;n taplo xe&hellip;</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-02 21:27:11', '2022-12-02 21:27:11'),
(18, 12, 'Xe Mô Hình Lexus LX570 Supersport 1:24 CheZhi', '1:24', 350000, 0, 'LexusLX570.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được 4 cửa, capo trước và cốp sau. Xe chạy đà, có đèn và nhạc.', '<h3><strong>XE M&Ocirc; H&Igrave;NH Lexus LX570 Supersport 1:24 CheZhi</strong></h3>\r\n\r\n<p>Chất liệu hợp kim si&ecirc;u bền, sơn tĩnh điện cao cấp.<br />\r\nXe mở được 4 cửa, capo trước v&agrave; cốp sau. Xe chạy đ&agrave;, c&oacute; đ&egrave;n v&agrave; nhạc.</p>\r\n\r\n<p>Xem video sản phẩm thực tế:&nbsp;<a href=\"https://www.youtube.com/watch?v=kezetK1DliI\" target=\"_blank\">https://www.youtube.com/watch?v=kezetK1DliI</a></p>\r\n\r\n<p>Chi tiết :&nbsp;<a href=\"https://trummohinh.com/lexus/\">Lexus</a>&nbsp;LX570 Supersport 1:24 Chezhi c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; &yacute; nghĩa cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Chức năng: mở đươc 4 cửa, capo trước v&agrave; cốp sau, b&aacute;nh trước v&agrave; sau chuyển động được, c&oacute; đ&egrave;n v&agrave; nhạc.</p>\r\n\r\n<p>Tỷ lệ 1:24<br />\r\nM&agrave;u sắc: Đen, trắng<br />\r\nK&iacute;ch thước: d&agrave;i 20.5 cm x rộng 7.2 cm x cao 5.5 cm<br />\r\nH&atilde;ng sản xuất : Chezhi</p>\r\n\r\n<p>Lexus LX570 Supersport 1:24 Chezhi với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-02 21:32:08', '2022-12-02 21:32:08'),
(19, 16, 'Xe mô hình Mini Cooper 1:32 DH', '1:32', 200000, 190000, 'MiniCooper.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được 4 cửa, nắp capo và cốp. Xe chạy đà và có nhạc.', '<h3>Xe m&ocirc; h&igrave;nh&nbsp;<strong><a href=\"https://trummohinh.com/xe-mo-hinh-mini-cooper-132-2/\">Mini Cooper 1:32 DH</a></strong></h3>\r\n\r\n<p>Chất liệu hợp kim si&ecirc;u bền, sơn tĩnh điện cao cấp.<br />\r\nXe mở được 4 cửa, nắp capo v&agrave; cốp. Xe chạy đ&agrave; v&agrave; c&oacute; nhạc.</p>\r\n\r\n<p>Xem video sản phẩm thực tế:</p>\r\n\r\n<p>Chi tiết : Xe m&ocirc; h&igrave;nh Mini Cooper c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; &yacute; nghĩa cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Chức năng: Xe mở được 4 cửa, nắp capo v&agrave; cốp. Xe chạy đ&agrave; v&agrave; c&oacute; nhạc.</p>\r\n\r\n<p>Tỷ lệ 1:32<br />\r\nM&agrave;u sắc: Như h&igrave;nh<br />\r\nK&iacute;ch thước: d&agrave;i 15cm<br />\r\nH&atilde;ng sản xuất :</p>\r\n\r\n<p>Xe m&ocirc; h&igrave;nh Mini Cooper với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-02 21:35:07', '2022-12-02 21:35:07'),
(20, 17, 'Xe mô hình NISSAN GTR R35 1:32 Double Horses', '1:32', 190000, 0, 'NISSANGTR.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được 2 cửa, capo trước và cốp sau. Xe chạy đà, có đèn và nhạc.', '<h3><strong>Xe m&ocirc; h&igrave;nh NISSAN GTR R35 1:32 Double Horses</strong></h3>\r\n\r\n<p>Chất liệu hợp kim si&ecirc;u bền, sơn tĩnh điện cao cấp.<br />\r\nXe mở được 2 cửa, capo trước v&agrave; cốp sau. Xe chạy đ&agrave;, c&oacute; đ&egrave;n v&agrave; nhạc.</p>\r\n\r\n<p>Xem video sản phẩm thực tế: https://youtu.be/sWDHtuBta-k</p>\r\n\r\n<p>Chi tiết : Xe m&ocirc; h&igrave;nh NISSAN GTR c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; &yacute; nghĩa cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Chức năng: Xe mở được 2 cửa, capo trước v&agrave; cốp sau. Xe chạy đ&agrave;, c&oacute; đ&egrave;n v&agrave; nhạc.</p>\r\n\r\n<p>Tỷ lệ 1:32<br />\r\nM&agrave;u sắc: Đen, v&agrave;ng, trắng<br />\r\nK&iacute;ch thước: d&agrave;i 15 cm x rộng 6.8 cm x cao 4 cm<br />\r\nH&atilde;ng sản xuất : Miniauto</p>\r\n\r\n<p>Xe m&ocirc; h&igrave;nh NISSAN GTR với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-02 21:37:32', '2022-12-02 21:37:32'),
(21, 20, 'Mô hình xe Tesla Model X 3 1:24 MN', '1:24', 400000, 360000, 'TeslaModelX3.jpg', 'Hàng bản quyền, chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được cửa, capo và cốp (tùy loại). Xe chạy đà, có đèn âm thanh.', '<h3><strong>M&ocirc; h&igrave;nh xe Tesla Model X 3 1:24 MN</strong></h3>\r\n\r\n<p>💢 Th&ocirc;ng tin th&ecirc;m:</p>\r\n\r\n<p>Chiếc&nbsp;<a href=\"https://giaxenhap.com/suv-la-gi-phan-biet-suv-so-voi-cac-dong-xe-khac/\" target=\"_blank\">SUV</a>&nbsp;chạy điện Tesla Model X của h&atilde;ng xe đến từ thung lũng Silicon, Hoa Kỳ được ph&aacute;t triển dựa tr&ecirc;n nền tảng của chiếc sedan cỡ lớn Tesla Model S</p>\r\n\r\n<p>💢 Th&ocirc;ng tin sản phẩm&nbsp;<a href=\"https://trummohinh.com/mo-hinh-xe-tesla-model-x3-124-mn/\">M&ocirc; h&igrave;nh xe Tesla Model X 1:24 MN</a></p>\r\n\r\n<p>🔹 H&atilde;ng sản xuất: MiniAuto</p>\r\n\r\n<p>🔹 Tỉ lệ: 1:24 (nhỏ hơn xe thật 24 lần)</p>\r\n\r\n<p>🔹 Hộp xốp cao cấp</p>\r\n\r\n<p>🔹 K&iacute;ch thước: D&agrave;i x Rộng x Cao (20 x 12 x 10 cm)</p>\r\n\r\n<p>🔹 Khối lượng: ~600gr</p>\r\n\r\n<p>🔹 Chất liệu: To&agrave;n bộ phần th&acirc;n vỏ được l&agrave;m bằng kim loại nguy&ecirc;n khối với nước sơn tĩnh điện 3 lớp cực đẹp,</p>\r\n\r\n<p>Gầm xe v&agrave; nội thất bằng nhựa, b&aacute;nh xe bằng cao su cao cấp</p>\r\n\r\n<p>🔹 T&iacute;nh năng:</p>\r\n\r\n<p>✔️ 4 cửa mở được, capo, cốp</p>\r\n\r\n<p>✔️ Đ&egrave;n, &acirc;m thanh, pin đi k&egrave;m</p>\r\n\r\n<p>✔️ C&oacute; trớn(C&oacute;t), B&aacute;nh xe đ&aacute;nh l&aacute;i được</p>\r\n\r\n<p>🔹 Mục đ&iacute;ch sử dụng:</p>\r\n\r\n<p>✔️ Sưu tầm xe m&ocirc; h&igrave;nh</p>\r\n\r\n<p>✔️ Trang tr&iacute;, nội thất</p>\r\n\r\n<p>✔️ Qu&agrave; tặng cho bạn nam, qu&agrave; tặng cho b&eacute; trai, qu&agrave; noel, qu&agrave; sinh nhật</p>\r\n\r\n<p>✔️ T&igrave;m hiểu xe Tesla Model X qua m&ocirc; h&igrave;nh</p>', 1, '2022-12-02 21:40:14', '2022-12-02 21:40:14'),
(22, 22, 'Xe mô hình Toyota Land Cruiser 1:24 Double Horses', '1:24', 400000, 350000, 'ToyotaLandCruiser.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được 4 cửa, capo trước và cốp sau.', '<h3>Xe m&ocirc; h&igrave;nh&nbsp;<a href=\"https://trummohinh.com/xe-mo-hinh-toyota-land-cruiser-124-double-horses/\">Toyota Land Cruiser 1:24 Double Horses</a></h3>\r\n\r\n<p>Chất liệu hợp kim si&ecirc;u bền, sơn tĩnh điện cao cấp.<br />\r\nXe mở được 4 cửa, capo trước v&agrave; cốp sau.</p>\r\n\r\n<p>Xem video sản phẩm thực tế:&nbsp;<a href=\"https://www.youtube.com/trummohinh?view_as=subscriber\" target=\"_blank\">https://www.youtube.com/trummohinh?view_as=subscriber</a></p>\r\n\r\n<p>Chi tiết :&nbsp;<a href=\"https://trummohinh.com/toyota/\"><strong>m&ocirc; h&igrave;nh xe &ocirc; t&ocirc; toyota</strong></a>&nbsp;Land Cruiser&nbsp; c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; &yacute; nghĩa cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Chức năng: Xe mở được 4 cửa, capo trước v&agrave; cốp sau.</p>\r\n\r\n<p>Tỷ lệ 1:24<br />\r\nM&agrave;u sắc: Đen, trắng<br />\r\nK&iacute;ch thước: d&agrave;i 20 cm<br />\r\nH&atilde;ng sản xuất: Double Horses</p>\r\n\r\n<p>Xe m&ocirc; h&igrave;nh Toyota Land Cruiser&nbsp;với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-02 21:50:04', '2022-12-02 21:50:04'),
(23, 1, 'Mô hình xe Audi Q5 1:32 JackieKim', '1:32', 300000, 250000, 'AudiQ5.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được cửa, nắp capo và cốp trước. Xe chạy đà, có đèn và âm thanh.', '<h3><strong>M&ocirc; h&igrave;nh xe Audi Q5 1:32 JackieKim</strong></h3>\r\n\r\n<p>M&ocirc; h&igrave;nh xe l&agrave; bản m&ocirc; phỏng với tỉ lệ thu nhỏ 32 lần so với xe thật, c&oacute; c&aacute;c đặc điểm:</p>\r\n\r\n<p>&ndash; To&agrave;n bộ khung vỏ xe được l&agrave;m bằng kim loại, sơn tĩnh điện bền đẹp.&nbsp;Nội thất nhựa , lốp cao su.</p>\r\n\r\n<p>&ndash; Xe mở được cửa, cốp trước v&agrave; sau.</p>\r\n\r\n<p>&ndash; Xe chạy b&aacute;nh đ&agrave;, c&oacute; đ&egrave;n v&agrave; &acirc;m thanh.</p>\r\n\r\n<p>&ndash; K&iacute;ch thước: chiều d&agrave;i 14-16 cm</p>\r\n\r\n<p>&ndash; Thiết kế tinh xảo m&ocirc; phỏng y hệt c&aacute;c chi tiết của xe thật như kiểu d&aacute;ng, k&iacute;ch thước, c&aacute;c chi tiết đ&egrave;n, b&aacute;nh xe, nội thất, ghế, v&ocirc; lăng, ống xả&hellip;</p>\r\n\r\n<p>M&ocirc; h&igrave;nh xe Audi Q5 1:32 JackieKim ph&ugrave; hợp để l&agrave;m qu&agrave; tặng, đồ trưng b&agrave;y, trang tr&iacute;, sưu tầm, b&agrave;y tr&ecirc;n taplo xe&hellip;</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a>&nbsp;v&agrave;&nbsp;<a href=\"https://trummohinh.com/audi/\">https://trummohinh.com/audi/</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-02 22:03:00', '2022-12-02 22:03:00'),
(24, 1, 'Xe mô hình Audi R8 GT Matte Black 1:18 Bburago', '1:18', 1100000, 0, 'AudiR8GT.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được cửa, nắp capo và cốp sau. Bánh xe đánh lái được.', '<h3><strong>Xe m&ocirc; h&igrave;nh Audi R8 GT Matte Black 1:24 Bburago</strong></h3>\r\n\r\n<p>Chất liệu hợp kim si&ecirc;u bền, sơn tĩnh điện cao cấp.<br />\r\nXe mở được cửa, nắp capo v&agrave; cốp sau. B&aacute;nh xe đ&aacute;nh l&aacute;i được.</p>\r\n\r\n<p>Xem VIDEO m&ocirc; tả sản phẩm tại:&nbsp;<a href=\"https://www.youtube.com/trummohinh\" target=\"_blank\">https://www.youtube.com/trummohinh</a></p>\r\n\r\n<p>Chi tiết : Sản phẩm&nbsp;c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; độc đ&aacute;o cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Tỷ lệ 1:18<br />\r\nM&agrave;u sắc: Như h&igrave;nh<br />\r\nK&iacute;ch thước: d&agrave;i 27 cm<br />\r\nH&atilde;ng sản xuất : Bburago</p>\r\n\r\n<p><em>Xe m&ocirc; h&igrave;nh Audi R8 GT&nbsp;</em>với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a>&nbsp;v&agrave;&nbsp;<a href=\"https://trummohinh.com/audi/\">https://trummohinh.com/audi/</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-02 22:05:26', '2022-12-02 22:05:26'),
(25, 2, 'Xe mô hình Bentley Continental GT W12 1:24 XLG', '1:24', 400000, 350000, 'BentleyContinentalGTW12.jpg', 'Hàng bản quyền, chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được 2 cửa và capo trước, cốp. Xe chạy đà, có đèn và âm thanh.', '<h3>Xe m&ocirc; h&igrave;nh&nbsp;<a href=\"https://trummohinh.com/bentley/\">Bentley</a>&nbsp;Continental GT W12 1:24 XLG</h3>\r\n\r\n<p>Review sản phẩm/ Youtube:&nbsp;<a href=\"https://youtube.com/trummohinh\" target=\"_blank\">https://youtube.com/trummohinh</a></p>\r\n\r\n<p>M&ocirc; h&igrave;nh xe l&agrave; bản m&ocirc; phỏng với tỉ lệ thu nhỏ 32 lần so với xe thật, c&oacute; c&aacute;c đặc điểm:</p>\r\n\r\n<p>&ndash; To&agrave;n bộ khung vỏ xe được l&agrave;m bằng kim loại, sơn tĩnh điện bền đẹp.&nbsp;Nội thất nhựa , lốp cao su.</p>\r\n\r\n<p>&ndash; Xe mở được cửa, cốp trước v&agrave; sau.</p>\r\n\r\n<p>&ndash; Xe chạy b&aacute;nh đ&agrave;, c&oacute; đ&egrave;n v&agrave; &acirc;m thanh.</p>\r\n\r\n<p>&ndash; K&iacute;ch thước: chiều d&agrave;i 20 cm</p>\r\n\r\n<p>&ndash; Thiết kế tinh xảo m&ocirc; phỏng y hệt c&aacute;c chi tiết của xe thật như kiểu d&aacute;ng, k&iacute;ch thước, c&aacute;c chi tiết đ&egrave;n, b&aacute;nh xe, nội thất, ghế, v&ocirc; lăng, ống xả&hellip;</p>\r\n\r\n<p>Xe m&ocirc; h&igrave;nh Range Rover Evoque 1:32 Caipo ph&ugrave; hợp để l&agrave;m qu&agrave; tặng, đồ trưng b&agrave;y, trang tr&iacute;, sưu tầm, b&agrave;y tr&ecirc;n taplo xe&hellip;</p>\r\n\r\n<p><a href=\"https://trummohinh.com/mo-hinh-tinh/\">http://TrumMoHinh.com/Mo-Hinh-Tinh</a></p>', 1, '2022-12-02 22:08:53', '2022-12-02 22:08:53'),
(26, 2, 'Xe mô hình Bentley Continental GT3 1:32 Hudawei', '1:32', 300000, 250000, 'BentleyContinentalGT3.jpg', 'Khung vỏ xe kim loại, nội thất nhựa, lốp cao su.\r\nXe mở được cửa, nắp capo và cốp. Xe chạy đà, có đèn và âm thanh', '<h3><strong>Xe m&ocirc; h&igrave;nh Bentley Continental GT3 Racing 1:32 Hudawei</strong></h3>\r\n\r\n<p>Khung vỏ xe kim loại, nội thất nhựa, lốp cao su.<br />\r\nXe mở được cửa, nắp capo v&agrave; cốp. Xe chạy đ&agrave;, c&oacute; đ&egrave;n v&agrave; &acirc;m thanh.</p>\r\n\r\n<p>Chi tiết : Xe m&ocirc; h&igrave;nh c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; &yacute; nghĩa cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: Đầu xe bằng hợp kim, th&acirc;n xe bằng nhựa.</p>\r\n\r\n<p>Chức năng: Xe mở được cửa, nắp capo v&agrave; cốp. Xe chạy đ&agrave;, c&oacute; đ&egrave;n v&agrave; &acirc;m thanh.</p>\r\n\r\n<p>Tỷ lệ 1:32<br />\r\nK&iacute;ch thước: d&agrave;i 16 cm</p>\r\n\r\n<p>Xe m&ocirc; h&igrave;nh với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a>&nbsp;v&agrave;&nbsp;<a href=\"https://trummohinh.com/bentley/\">https://trummohinh.com/bentley/</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-04 10:13:26', '2022-12-02 22:11:43'),
(27, 3, 'Xe mô hình BMW i8 1:24 Rastar', '1:24', 370000, 0, 'BMWi8.jpg', 'Hàng bản quyền, chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được 2 cửa và capo trước. Bánh trước đánh lái được, bánh trước và bánh sau chuyển động được.', '<h3><strong>Xe m&ocirc; h&igrave;nh&nbsp;<a href=\"https://trummohinh.com/xe-mo-hinh-bmw-i8-124-rastar/\">BMW i8 1:24 Rastar</a></strong></h3>\r\n\r\n<p>H&agrave;ng bản quyền, chất liệu hợp kim si&ecirc;u bền, sơn tĩnh điện cao cấp.<br />\r\nXe mở được 2 cửa v&agrave; capo trước. B&aacute;nh trước đ&aacute;nh l&aacute;i được, b&aacute;nh trước v&agrave; b&aacute;nh sau chuyển động được.</p>\r\n\r\n<p>Chi tiết :&nbsp;<a href=\"https://trummohinh.com/xe-mo-hinh-bmw-i8-124-rastar/\">Xe m&ocirc; h&igrave;nh BMW</a>&nbsp;i8 1:24 Rastar c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; &yacute; nghĩa cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Chức năng: Xe mở được 2 cửa v&agrave; capo trước. B&aacute;nh trước đ&aacute;nh l&aacute;i được, b&aacute;nh trước v&agrave; b&aacute;nh sau chuyển động được.</p>\r\n\r\n<p>Tỷ lệ 1:24<br />\r\nM&agrave;u sắc: Đen, đỏ<br />\r\nK&iacute;ch thước: d&agrave;i 20 cm x rộng 7.5 cm x cao 4.5 cm<br />\r\nH&atilde;ng sản xuất : Rastar</p>\r\n\r\n<p>Xe m&ocirc; h&igrave;nh BMW i8 với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p><a href=\"https://trummohinh.com/mo-hinh-tinh/\">http://TrumMoHinh.com/Mo-Hinh-Tinh</a></p>', 1, '2022-12-02 22:16:59', '2022-12-02 22:16:59'),
(28, 4, 'Xe mô hình Bugatti La Voiture Noire 1:32 XHD', '1:18', 190000, 0, 'BugattiLaVoiture.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được 2 cửa, capo trước và đuôi gió. Xe chạy đà, có đèn và nhạc.', '<h3><strong>Xe m&ocirc; h&igrave;nh&nbsp;<a href=\"https://trummohinh.com/xe-mo-hinh-bugatti-la-voiture-noire-132-unk/\">Bugatti La Voiture Noire 1:32 XHD</a></strong></h3>\r\n\r\n<p>Chất liệu hợp kim si&ecirc;u bền, sơn tĩnh điện cao cấp.<br />\r\nXe mở được 2 cửa, capo trước v&agrave; đu&ocirc;i gi&oacute;. Xe chạy đ&agrave;, c&oacute; đ&egrave;n v&agrave; nhạc.</p>\r\n\r\n<p>Xem video sản phẩm thực tế:&nbsp;<a href=\"https://youtu.be/JOlvN1PzXhI\" target=\"_blank\">https://youtu.be/JOlvN1PzXhI</a></p>\r\n\r\n<p>Chi tiết :&nbsp;<a href=\"https://trummohinh.com/bugatti/\">Xe m&ocirc; h&igrave;nh Bugatti</a>&nbsp;La Voiture Noire c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; &yacute; nghĩa cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Chức năng: Xe mở được 2 cửa, capo trước v&agrave; đu&ocirc;i gi&oacute;. Xe chạy đ&agrave;, c&oacute; đ&egrave;n v&agrave; nhạc.</p>\r\n\r\n<p>Tỷ lệ 1:32<br />\r\nM&agrave;u sắc: Như h&igrave;nh<br />\r\nK&iacute;ch thước: d&agrave;i 15.2 cm x rộng 6.8 cm x cao 4 cm<br />\r\nH&atilde;ng sản xuất :&nbsp; UNK</p>\r\n\r\n<p>Xe m&ocirc; h&igrave;nh Bugatti La Voiture Noire với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-08 09:46:48', '2022-12-02 22:19:28');
INSERT INTO `products` (`id`, `id_manufacture`, `name`, `ratio`, `unit_price`, `promotion_price`, `image`, `detail`, `description`, `new`, `created_at`, `updated_at`) VALUES
(29, 4, 'Xe mô hình Pagani Veyron 1:18 Rastar', '1:18', 1000000, 800000, 'PaganiVeyron.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được 2 cửa, nắp capo và cốp sau. Bánh xe đánh lái được.', '<h3><strong>Xe m&ocirc; h&igrave;nh Pagani Veyron 1:18 Rastar</strong></h3>\r\n\r\n<p>Chất liệu hợp kim si&ecirc;u bền, sơn tĩnh điện cao cấp.<br />\r\nXe mở được cửa, nắp capo v&agrave; cốp sau. B&aacute;nh xe đ&aacute;nh l&aacute;i được.</p>\r\n\r\n<p>Xem VIDEO m&ocirc; tả sản phẩm tại:&nbsp;<a href=\"https://www.youtube.com/trummohinh\" target=\"_blank\">https://www.youtube.com/trummohinh</a></p>\r\n\r\n<p>Chi tiết :&nbsp;<em>Xe</em>&nbsp;m&ocirc; h&igrave;nh c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; độc đ&aacute;o cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Tỷ lệ 1:18<br />\r\nM&agrave;u sắc: Như h&igrave;nh<br />\r\nK&iacute;ch thước: d&agrave;i 26 cm<br />\r\nH&atilde;ng sản xuất :</p>\r\n\r\n<p><em>Xe m&ocirc; h&igrave;nh Pagani Veyron&nbsp;</em>sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a>&nbsp;v&agrave;&nbsp;<a href=\"https://trummohinh.com/bugatti/\">https://trummohinh.com/bugatti/</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-02 22:22:16', '2022-12-02 22:22:16'),
(30, 5, 'Xe mô hình Chevrolet Camaro 1:32 Miniauto', '1:32', 220000, 0, 'ChervoletCamaro.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được 2 cửa, capo trước và cốp sau. Xe chạy đà, có đèn và nhạc.', '<h3><strong>Xe m&ocirc; h&igrave;nh&nbsp;<a href=\"https://trummohinh.com/xe-mo-hinh-chevrolet-camaro-132/\">Chevrolet Camaro 1:32 Miniauto</a></strong></h3>\r\n\r\n<p>Chất liệu hợp kim si&ecirc;u bền, sơn tĩnh điện cao cấp.<br />\r\nXe mở được 2 cửa, capo trước v&agrave; cốp sau. Xe chạy đ&agrave;, c&oacute; đ&egrave;n v&agrave; nhạc.</p>\r\n\r\n<p>Xem video sản phẩm thực tế: https://www.youtube.com/watch?v=CEzMmJ9kD1w</p>\r\n\r\n<p>Chi tiết : Xe m&ocirc; h&igrave;nh CHEVROLET CAMARO 1:32 Miniauto c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; &yacute; nghĩa cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Chức năng: Xe mở được 2 cửa, capo trước v&agrave; cốp sau. Xe chạy đ&agrave;, c&oacute; đ&egrave;n v&agrave; nhạc.</p>\r\n\r\n<p>Tỷ lệ 1:32<br />\r\nM&agrave;u sắc: Đen, đỏ, v&agrave;ng<br />\r\nK&iacute;ch thước: d&agrave;i 15.2 cm x rộng 6.8 cm x cao 4 cm<br />\r\nH&atilde;ng sản xuất : Miniauto</p>\r\n\r\n<p>Xe m&ocirc; h&igrave;nh&nbsp;CHEVROLET CAMARO với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-04 09:53:35', '2022-12-03 01:47:07'),
(31, 5, 'Xe mô hình Chevrolet Corvette Stingray Z51 Red 1:18 Maisto Exclusive', '1:18', 1560000, 1500000, 'ChevroletCorvette_Stingray.jpg', 'Hàng bản quyền, chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được 2 cửa và capo trước. Bánh trước đánh lái được, bánh trước và bánh sau chuyển động được.', '<h3><strong>Xe m&ocirc; h&igrave;nh Chevrolet Corvette Stingray Z51 1:18 Maisto Exclusive</strong></h3>\r\n\r\n<p>H&agrave;ng bản quyền, chất liệu hợp kim si&ecirc;u bền, sơn tĩnh điện cao cấp.<br />\r\nXe mở được 2 cửa v&agrave; capo trước. B&aacute;nh trước đ&aacute;nh l&aacute;i được, b&aacute;nh trước v&agrave; b&aacute;nh sau chuyển động được.</p>\r\n\r\n<p>Chi tiết : Xe m&ocirc; h&igrave;nh Chevrolet Corvette Stingray Z51 1:18 Maisto Exclusive c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; &yacute; nghĩa cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Chức năng: Xe mở được cửa, capo v&agrave; cốp. B&aacute;nh trước đ&aacute;nh l&aacute;i được, b&aacute;nh trước v&agrave; b&aacute;nh sau chuyển động được.</p>\r\n\r\n<p>Tỷ lệ 1:18<br />\r\nM&agrave;u sắc:<br />\r\nK&iacute;ch thước: d&agrave;i 28 cm<br />\r\nH&atilde;ng sản xuất : Maisto</p>\r\n\r\n<p>Xe m&ocirc; h&igrave;nh Chevrolet Corvette Stingray Z51 1:18 Maisto Exclusive với k&iacute;ch thước nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p><a href=\"https://trummohinh.com/mo-hinh-tinh/\">http://TrumMoHinh.com/Mo-Hinh-Tinh</a></p>', 1, '2022-12-03 01:50:27', '2022-12-03 01:50:27'),
(32, 5, 'Xe mô hình Chervolet Camaro 1:24 Doube Horses', '1:24', 370000, 0, 'ChervoletCamaro.jpg', 'Hàng bản quyền, chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được 2 cửa và capo trước. Bánh trước đánh lái được, bánh trước và bánh sau chuyển động được.', '<h3><strong>Xe m&ocirc; h&igrave;nh&nbsp;<a href=\"https://trummohinh.com/xe-mo-hinh-chervolet-camaro-124-doube-horses/\">Chervolet Camaro 1:24 DH</a></strong></h3>\r\n\r\n<p>H&agrave;ng bản quyền, chất liệu hợp kim si&ecirc;u bền, sơn tĩnh điện cao cấp.<br />\r\nXe mở được 2 cửa v&agrave; capo trước. B&aacute;nh trước đ&aacute;nh l&aacute;i được, b&aacute;nh trước v&agrave; b&aacute;nh sau chuyển động được.</p>\r\n\r\n<p>Chi tiết : Sản phẩm&nbsp;c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; &yacute; nghĩa cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Chức năng: Xe mở được 2 cửa v&agrave; capo trước. B&aacute;nh trước đ&aacute;nh l&aacute;i được, b&aacute;nh trước v&agrave; b&aacute;nh sau chuyển động được.</p>\r\n\r\n<p>Tỷ lệ 1:24<br />\r\nM&agrave;u sắc:<br />\r\nK&iacute;ch thước: d&agrave;i 20 cm<br />\r\nH&atilde;ng sản xuất : Double Horse</p>\r\n\r\n<p>Xe m&ocirc; h&igrave;nh Chervolet Camaro với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p><a href=\"https://trummohinh.com/mo-hinh-tinh/\">http://TrumMoHinh.com/Mo-Hinh-Tinh</a></p>', 1, '2022-12-04 09:56:30', '2022-12-03 01:53:29'),
(33, 6, 'Xe mô hình Ferrari FXX-K White No.75 1:24 Bburago', '1:24', 650000, 600000, 'Ferrari_FXX-K_White.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được cửa, nắp capo và cốp sau. Bánh xe đánh lái được.', '<h3><strong>Xe m&ocirc; h&igrave;nh&nbsp;<a href=\"https://trummohinh.com/xe-mo-hinh-ferrari-fxx-k-white-124-bburago/\">Ferrari FXX-K White No.75 1:24 Bburago</a></strong></h3>\r\n\r\n<p>Chất liệu hợp kim si&ecirc;u bền, sơn tĩnh điện cao cấp.<br />\r\nXe mở được 2 cửa, nắp capo v&agrave; cốp sau. B&aacute;nh xe đ&aacute;nh l&aacute;i được.</p>\r\n\r\n<p>Xem VIDEO m&ocirc; tả sản phẩm tại:&nbsp;<a href=\"https://www.youtube.com/trummohinh\" target=\"_blank\">https://www.youtube.com/trummohinh</a></p>\r\n\r\n<p>Chi tiết :&nbsp;<em>Xe</em>&nbsp;m&ocirc; h&igrave;nh c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; độc đ&aacute;o cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Tỷ lệ 1:24<br />\r\nM&agrave;u sắc: Như h&igrave;nh<br />\r\nK&iacute;ch thước: d&agrave;i 19cm<br />\r\nH&atilde;ng sản xuất : Bburago</p>\r\n\r\n<p><em>Xe m&ocirc; h&igrave;nh&nbsp;</em>với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a>&nbsp;v&agrave;&nbsp;<a href=\"https://trummohinh.com/ferrari/\">https://trummohinh.com/ferrari/</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-03 01:56:59', '2022-12-03 01:56:59'),
(34, 6, 'Xe mô hình Ferrari FXX Sport 1:32 UNK', '1:32', 190000, 0, 'Ferrari_FXX_Sport.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được 2 cửa, capo trước và cốp. Xe chạy đà, có đèn và nhạc', '<h3><strong>Xe m&ocirc; h&igrave;nh&nbsp;<a href=\"https://trummohinh.com/xe-mo-hinh-ferrari-fxx-sport-132-unk/\">Ferrari FXX Sport tỷ lệ 1:32</a></strong></h3>\r\n\r\n<p>Chất liệu hợp kim si&ecirc;u bền, sơn tĩnh điện cao cấp.<br />\r\nXe mở được 2 cửa, capo trước v&agrave; cốp. Xe chạy đ&agrave;, c&oacute; đ&egrave;n v&agrave; nhạc.</p>\r\n\r\n<p>Xem video sản phẩm thực tế:&nbsp;<a href=\"https://www.youtube.com/trummohinh\" target=\"_blank\">https://www.youtube.com/trummohinh</a></p>\r\n\r\n<p>Chi tiết : Xe&nbsp;<a href=\"https://trummohinh.com/ferrari/\">m&ocirc; h&igrave;nh Ferrari</a>&nbsp;FXX c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; &yacute; nghĩa cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Chức năng: Xe mở được 2 cửa, capo trước v&agrave; cốp. Xe chạy đ&agrave;, c&oacute; đ&egrave;n v&agrave; nhạc.</p>\r\n\r\n<p>Tỷ lệ 1:32<br />\r\nM&agrave;u sắc: Như h&igrave;nh<br />\r\nK&iacute;ch thước: d&agrave;i 15 cm<br />\r\nH&atilde;ng sản xuất : UNK</p>\r\n\r\n<p>Xe m&ocirc; h&igrave;nh Ferrari FXX với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-03 01:59:48', '2022-12-03 01:59:48'),
(35, 7, 'Xe mô hình 2017 Ford GT Red 1:18 Maisto', '1:18', 1200000, 1000000, 'Ford_GT_Red.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\n\r\nXe mở đươc 2 cửa, nắp capo. Bánh trước và sau chuyển động được.', '<h3><strong>Xe m&ocirc; h&igrave;nh 2017&nbsp;<a href=\"https://trummohinh.com/xe-mo-hinh-2017-ford-gt-red-118-maisto/\">Ford GT Red 1:18 Maisto</a></strong></h3>\r\n\r\n<p>Chất liệu hợp kim si&ecirc;u bền, sơn tĩnh điện cao cấp.</p>\r\n\r\n<p>Xe mở đươc 2 cửa, nắp capo. B&aacute;nh trước v&agrave; sau chuyển động được.</p>\r\n\r\n<p><strong>Chi tiết :</strong>&nbsp;Xe m&ocirc; h&igrave;nh 2017 Ford GT c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; &yacute; nghĩa cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p><strong>Chất liệu:</strong>&nbsp;To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p><strong>Chức năng:</strong>&nbsp;Xe mở đươc 2 cửa, nắp capo v&agrave; cốp.</p>\r\n\r\n<p>B&aacute;nh trước v&agrave; sau chuyển động được.</p>\r\n\r\n<p><strong>K&iacute;ch thước:</strong>&nbsp;d&agrave;i 27 cm</p>\r\n\r\n<p><strong>H&atilde;ng sản xuất :</strong>&nbsp;Maisto</p>\r\n\r\n<p>2017 Ford GT với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a>&nbsp;v&agrave;&nbsp;h<a href=\"https://trummohinh.com/ford/\">ttps://trummohinh.com/ford/</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>\r\n\r\n<p><strong>M&ocirc; h&igrave;nh Mercedes SLS 1:18 Maisto được sản xuất c&oacute; bản quyền.</strong></p>', 1, '2022-12-03 02:02:25', '2022-12-03 02:02:25'),
(36, 7, 'Mô hình xe Ford Mustang Harley Edition 1:24 Maisto', '1:24', 400000, 0, 'Ford_Mustang_Harley_Edition.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được 2 cửa, nắp capo. Bánh xe đánh lái được.', '<h3><strong>M&ocirc; h&igrave;nh xe Ford Mustang Harley Edition 1:24 Maisto</strong></h3>\r\n\r\n<p>Chất liệu hợp kim si&ecirc;u bền, sơn tĩnh điện cao cấp.<br />\r\nXe mở được 2 cửa, nắp capo. B&aacute;nh xe đ&aacute;nh l&aacute;i được.</p>\r\n\r\n<p>Chi tiết : Xe m&ocirc; h&igrave;nh Ford Mustang Harley Edition c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; &yacute; nghĩa cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Chức năng: Xe mở được 2 cửa, nắp capo. B&aacute;nh xe đ&aacute;nh l&aacute;i được.</p>\r\n\r\n<p>Tỷ lệ 1:24<br />\r\nM&agrave;u sắc: Như h&igrave;nh<br />\r\nK&iacute;ch thước: d&agrave;i 20cm</p>\r\n\r\n<p>Xe m&ocirc; h&igrave;nh Ford Mustang Harley Edition với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a>&nbsp;v&agrave;&nbsp;h<a href=\"https://trummohinh.com/ford/\">ttps://trummohinh.com/ford/</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-03 02:05:45', '2022-12-03 02:05:45'),
(37, 7, 'Mô hình Ford Mustang cảnh sát 1:32', '1:32', 250000, 0, 'Ford_Mustang_police.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được 4 cửa, nắp capo và cốp. Xe chạy đà, có đèn nhấp nháy và còi hụ.', '<h3><strong>M&ocirc; h&igrave;nh Ford Mustang cảnh s&aacute;t 1:32</strong></h3>\r\n\r\n<p>Chất liệu hợp kim si&ecirc;u bền, sơn tĩnh điện cao cấp.<br />\r\nXe mở được 4 cửa, nắp capo v&agrave; cốp. Xe chạy đ&agrave;, c&oacute; đ&egrave;n nhấp nh&aacute;y v&agrave; &acirc;m thanh.</p>\r\n\r\n<p>Chi tiết : Xe cảnh s&aacute;t 1:32 c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; &yacute; nghĩa cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Chức năng: Xe mở được 4 cửa, nắp capo v&agrave; cốp. Xe chạy đ&agrave;, c&oacute; đ&egrave;n v&agrave; &acirc;m thanh.</p>\r\n\r\n<p>Tỷ lệ 1:32<br />\r\nM&agrave;u sắc: Đỏ, xanh, đen<br />\r\nK&iacute;ch thước: d&agrave;i 15cm</p>\r\n\r\n<p>Ford Mustang 1:32 với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm&nbsp;<a href=\"https://trummohinh.com/xe-mo-hinh-ford-ranger-132-miniauto/\"><strong>xe ford m&ocirc; h&igrave;nh</strong></a>&nbsp;tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-03 02:07:58', '2022-12-03 02:07:58'),
(38, 8, 'Xe mô hình 2018 Acura NSX 1:24 Maisto Custom', '1:24', 450000, 0, 'Acura_NSX.jpg', 'Hàng bản quyền, chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được cửa, capo và cốp (tùy loại). Bánh trước và bánh sau chuyển động được.', '<h3><strong>Xe m&ocirc; h&igrave;nh 2018 Acura NSX 1:24 Maisto Custom</strong></h3>\r\n\r\n<p>H&agrave;ng bản quyền, chất liệu hợp kim si&ecirc;u bền, sơn tĩnh điện cao cấp.<br />\r\nXe mở được cửa, capo v&agrave; cốp (t&ugrave;y loại). B&aacute;nh trước v&agrave; b&aacute;nh sau chuyển động được.</p>\r\n\r\n<p>Chi tiết : Xe m&ocirc; h&igrave;nh 2018 Acura NSX 1:24 Maisto Custom c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; &yacute; nghĩa cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Chức năng: Xe mở được cửa, capo v&agrave; cốp (t&ugrave;y loại). B&aacute;nh trước v&agrave; b&aacute;nh sau chuyển động được.</p>\r\n\r\n<p>Tỷ lệ 1:24<br />\r\nK&iacute;ch thước: d&agrave;i 20 cm<br />\r\nH&atilde;ng sản xuất : Maisto</p>\r\n\r\n<p>Xe m&ocirc; h&igrave;nh 2018 Acura NSX 1:24 Maisto Custom với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>', 1, '2022-12-04 10:01:50', '2022-12-03 02:10:36'),
(39, 11, 'Xe mô hình Lamborghini Aventador LP700 White 1:24 Welly', '1:24', 500000, 400000, 'Aventador_LP700_White.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được 2 cửa. Bánh xe đánh lái được.', '<h3><strong>xe m&ocirc; h&igrave;nh&nbsp;<a href=\"https://trummohinh.com/xe-mo-hinh-lamborghini-aventador-124-welly/\">Lamborghini Aventador 1:24 Welly</a></strong></h3>\r\n\r\n<p>Chất liệu hợp kim si&ecirc;u bền, sơn tĩnh điện cao cấp.<br />\r\nXe mở được 2 cửa. B&aacute;nh xe đ&aacute;nh l&aacute;i được.</p>\r\n\r\n<p>Xem VIDEO m&ocirc; tả sản phẩm tại:&nbsp;<a href=\"https://www.youtube.com/trummohinh\" target=\"_blank\">https://www.youtube.com/trummohinh</a></p>\r\n\r\n<p>Chi tiết :&nbsp;<em>Xe m&ocirc; h&igrave;nh Lamborghini Aventador</em><em>&nbsp;1:24 Welly</em>&nbsp;c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; độc đ&aacute;o cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Hãng Welly là hàng sản xu&acirc;́t xe m&ocirc; hình với ch&acirc;́t lượng nước sơn được đánh giá cao bởi những người chơi l&acirc;u năm, đặc bi&ecirc;̣t hãng Welly thường cho ra các m&ocirc; hình xe có th&ecirc;̉ đánh lái được.<br />\r\nGiá cả của m&ocirc; hình xe Welly bình d&acirc;n nhưng ch&acirc;́t lượng được đánh giá cao bởi sự tỉ mỉ. Welly n&ocirc;̉i ti&ecirc;́ng v&ecirc;̀ làm đèn pha r&acirc;́t đẹp so với các hãng khác.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Chức năng: Xe mở được 2 cửa. B&aacute;nh xe đ&aacute;nh l&aacute;i được. B&aacute;nh trước v&agrave; sau chuyển động được.</p>\r\n\r\n<p>Tỷ lệ 1:24<br />\r\nM&agrave;u sắc: Đen, trắng<br />\r\nK&iacute;ch thước: d&agrave;i 19cm<br />\r\nH&atilde;ng sản xuất : WELLY</p>\r\n\r\n<p><em>Xe m&ocirc; h&igrave;nh Lamborghini Aventador 1:24 Welly</em>&nbsp;với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-03 02:13:45', '2022-12-03 02:13:45'),
(40, 11, 'Xe mô hình Lamborghini Aventador LP700 White 1:18 Welly-Fx', '1:18', 1350000, 1300000, 'Lamborghini_Aventador_LP700_White.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được 2 cửa, nắp capo và cốp sau. Bánh xe đánh lái được.', '<h3><strong>Xe m&ocirc; h&igrave;nh&nbsp;<a href=\"https://trummohinh.com/xe-mo-hinh-lamborghini-aventador-white-118-welly-fx/\">Lamborghini Aventador 1:18 Welly-Fx</a></strong></h3>\r\n\r\n<p>Chất liệu hợp kim si&ecirc;u bền, sơn tĩnh điện cao cấp.<br />\r\nXe mở được cửa, nắp capo v&agrave; cốp sau. B&aacute;nh xe đ&aacute;nh l&aacute;i được.</p>\r\n\r\n<p>Xem VIDEO m&ocirc; tả sản phẩm tại:&nbsp;<a href=\"https://www.youtube.com/trummohinh\" target=\"_blank\">https://www.youtube.com/trummohinh</a></p>\r\n\r\n<p>Chi tiết :&nbsp;<em>Xe</em>&nbsp;m&ocirc; h&igrave;nh c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; độc đ&aacute;o cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Tỷ lệ 1:18<br />\r\nM&agrave;u sắc: Như h&igrave;nh<br />\r\nK&iacute;ch thước: d&agrave;i 26 cm<br />\r\nH&atilde;ng sản xuất :</p>\r\n\r\n<p><em>Xe m&ocirc; h&igrave;nh Lamborghini Aventador&nbsp;</em>sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-03 02:16:19', '2022-12-03 02:16:19'),
(41, 11, 'Xe mô hình Lamborghini Huracan 1:36 Pink MSN', '1:36', 130000, 0, 'Lamborghini_Huracan.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được 2 cửa. Xe chạy đà.', '<h3><strong>Xe m&ocirc; h&igrave;nh&nbsp;<a href=\"https://trummohinh.com/xe-mo-hinh-lambo%E2%80%A6can-136-pink-msn/\">Lamborghini Huracan Lp610 Pink 1:36 MSN</a></strong></h3>\r\n\r\n<p>Chất liệu hợp kim si&ecirc;u bền, sơn tĩnh điện cao cấp.<br />\r\nXe mở được 2 cửa. Xe chạy đ&agrave;.</p>\r\n\r\n<p>Xem video sản phẩm thực tế:</p>\r\n\r\n<p>Chi tiết : Xe m&ocirc; h&igrave;nh Lamborghini Huracan LP610 Pink 1:36 MSN c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; &yacute; nghĩa cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Chức năng: Xe mở được 2 cửa. Xe chạy đ&agrave;.</p>\r\n\r\n<p>Tỷ lệ 1:36<br />\r\nM&agrave;u sắc: Hồng<br />\r\nK&iacute;ch thước: d&agrave;i 12cm<br />\r\nH&atilde;ng sản xuất : MSN</p>\r\n\r\n<p>Xe m&ocirc; h&igrave;nh Lamborghini Huracan LP610 1:36 MSN với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-03 02:20:08', '2022-12-03 02:20:08'),
(42, 12, 'Xe mô hình Lexus LX570 SuperSport 1:18 Weituo', '1:18', 750000, 700000, 'Lexus_LX570_SuperSport.jpg', 'Khung vỏ hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe full kính mở được cửa, capo, cốp.\r\n\r\nXe chạy đà, có đèn và âm thanh.', '<h3><strong>Xe m&ocirc; h&igrave;nh Lexus LX570 Supersport 1:18 Weituo</strong></h3>\r\n\r\n<p>💢 Th&ocirc;ng tin sản phẩm M&ocirc; h&igrave;nh xe Lexus LX570 tỉ lệ 1:18 Weituo</p>\r\n\r\n<p>🔹 Tỉ lệ: 1:18 (nhỏ hơn xe thật 18 lần)</p>\r\n\r\n<p>🔹 M&agrave;u: M&agrave;u trắng, đen</p>\r\n\r\n<p>🔹 K&iacute;ch thước: D&agrave;i x Rộng x Cao (26 x 12 x 10 cm)</p>\r\n\r\n<p>🔹 Khối lượng: ~1000gr</p>\r\n\r\n<p>🔹 Chất liệu: To&agrave;n bộ phần th&acirc;n vỏ được l&agrave;m bằng kim loại nguy&ecirc;n khối với nước sơn tĩnh điện 3 lớp cực đẹp, Gầm xe v&agrave; nội thất bằng nhựa, b&aacute;nh xe bằng cao su cao cấp</p>\r\n\r\n<p>🔹 T&iacute;nh năng:</p>\r\n\r\n<p>✔️ Mở 4 cửa, capo, cốp</p>\r\n\r\n<p>✔️ Đ&egrave;n, &acirc;m thanh, pin đi k&egrave;m</p>\r\n\r\n<p>✔️ C&oacute; trớn(C&oacute;t)</p>\r\n\r\n<p>🔹 Mục đ&iacute;ch sử dụng:</p>\r\n\r\n<p>✔️ Sưu tầm xe m&ocirc; h&igrave;nh</p>\r\n\r\n<p>✔️ Trang tr&iacute;, nội thất</p>\r\n\r\n<p>✔️ Qu&agrave; tặng cho bạn nam, qu&agrave; tặng cho b&eacute; trai, qu&agrave; noel, qu&agrave; sinh nhật</p>\r\n\r\n<p>✔️ T&igrave;m hiểu xe Lexus LX570 qua m&ocirc; h&igrave;nh</p>', 1, '2022-12-03 02:25:05', '2022-12-03 02:25:05'),
(43, 12, 'Xe mô hình Lexus ES300h 1:32 JackieKim', '1:32', 300000, 250000, 'Lexus_ES300h.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được 4 cửa, capo trước và cốp sau. Xe chạy đà, có đèn và nhạc.', '<h3><strong><a href=\"https://trummohinh.com/xe-mo-hinh-lexus-es300h-132-jackiekim/\">Xe m&ocirc; h&igrave;nh Lexus ES300h</a>&nbsp;1:32 JackieKim</strong></h3>\r\n\r\n<p>Chất liệu hợp kim si&ecirc;u bền, sơn tĩnh điện cao cấp.<br />\r\nXe mở được 4 cửa, capo trước v&agrave; cốp sau. Xe chạy đ&agrave;, c&oacute; đ&egrave;n v&agrave; nhạc.</p>\r\n\r\n<p>Xem video sản phẩm thực tế: https://youtu.be/sWDHtuBta-k</p>\r\n\r\n<p>Chi tiết :&nbsp;<a href=\"https://trummohinh.com/lexus/\">Xe m&ocirc; h&igrave;nh Lexus</a>&nbsp;ES300h c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; &yacute; nghĩa cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Chức năng: Xe mở được 4 cửa, capo trước v&agrave; cốp sau. Xe chạy đ&agrave;, c&oacute; đ&egrave;n v&agrave; nhạc.</p>\r\n\r\n<p>Tỷ lệ 1:32<br />\r\nM&agrave;u sắc: Đen, v&agrave;ng, trắng<br />\r\nK&iacute;ch thước: d&agrave;i 15 cm x rộng 6.8 cm x cao 4 cm<br />\r\nH&atilde;ng sản xuất : jackieKim</p>\r\n\r\n<p>Xe m&ocirc; h&igrave;nh Lexus&nbsp;ES300h&nbsp;với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a>&nbsp;v&agrave;&nbsp;<a href=\"https://trummohinh.com/lexus/\">https://trummohinh.com/lexus/</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-03 02:27:47', '2022-12-03 02:27:47'),
(44, 13, 'Xe mô hình McLaren 650S Spider 1:24 Motormax', '1:24', 450000, 399999, 'McLaren_650S_Spider.jpg', 'Hàng bản quyền, chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được 2 cửa và capo trước. Bánh trước đánh lái được, bánh trước và bánh sau chuyển động được.', '<h3><strong>Xe m&ocirc; h&igrave;nh McLaren 650S Spider 1:24 Motormax</strong></h3>\r\n\r\n<p>H&agrave;ng bản quyền, chất liệu hợp kim si&ecirc;u bền, sơn tĩnh điện cao cấp.<br />\r\nXe mở được 2 cửa v&agrave; capo trước. B&aacute;nh trước đ&aacute;nh l&aacute;i được, b&aacute;nh trước v&agrave; b&aacute;nh sau chuyển động được.</p>\r\n\r\n<p>Chi tiết : Sản phẩm McLaren 650S Spider c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; &yacute; nghĩa cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Chức năng: Xe mở được 2 cửa v&agrave; capo trước. B&aacute;nh trước đ&aacute;nh l&aacute;i được, b&aacute;nh trước v&agrave; b&aacute;nh sau chuyển động được.</p>\r\n\r\n<p>Tỷ lệ 1:24<br />\r\nM&agrave;u sắc: Như h&igrave;nh<br />\r\nK&iacute;ch thước: d&agrave;i 20 cm<br />\r\nH&atilde;ng sản xuất : Motormax</p>\r\n\r\n<p>Xe m&ocirc; h&igrave;nh McLaren 650S Spider với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p><a href=\"https://trummohinh.com/mo-hinh-tinh/\">http://TrumMoHinh.com/Mo-Hinh-Tinh</a></p>', 1, '2022-12-03 09:36:31', '2022-12-03 02:30:22'),
(45, 13, 'Mô hình McLaren P1 GTR 1:32 Caipo', '1:32', 300000, 250000, 'McLaren_P1_GTR.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được cửa, nắp capo và cốp. Xe chạy đà, có đèn và âm thanh.', '<h3><strong>M&ocirc; h&igrave;nh&nbsp;<a href=\"https://trummohinh.com/mo-hinh-mclaren-p1-gtr-132-caipo/\">McLaren P1 GTR 1:32 Caipo</a></strong></h3>\r\n\r\n<p>Chất liệu hợp kim si&ecirc;u bền, sơn tĩnh điện cao cấp.<br />\r\nXe mở được cửa, nắp capo v&agrave; cốp. Xe chạy đ&agrave;, c&oacute; đ&egrave;n nhấp nh&aacute;y v&agrave; &acirc;m thanh.</p>\r\n\r\n<p>Chi tiết : Xe m&ocirc; h&igrave;nh c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; &yacute; nghĩa cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Chức năng: Xe mở được cửa, nắp capo v&agrave; cốp. Xe chạy đ&agrave;, c&oacute; đ&egrave;n v&agrave; &acirc;m thanh.</p>\r\n\r\n<p>Tỷ lệ 1:32<br />\r\nM&agrave;u sắc: Như h&igrave;nh<br />\r\nK&iacute;ch thước: d&agrave;i 15 cm</p>\r\n\r\n<p>Xe m&ocirc; h&igrave;nh với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-03 02:33:14', '2022-12-03 02:33:14'),
(46, 14, 'Xe mô hình Mercedes GLK 1:18 GTAutos', '1:18', 1500000, 0, 'Mercedes_GLK.jpg', 'Khung vỏ hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được cửa, capo, cốp.\r\nXe chạy đà, có đèn và âm thanh.', '<h3><strong>Xe m&ocirc; h&igrave;nh Mercedes GLK 1:18 GtAutos</strong></h3>\r\n\r\n<p>Xem VIDEO m&ocirc; tả sản phẩm tại: https://www.youtube.com/trummohinh</p>\r\n\r\n<p>Chi tiết : Xe m&ocirc; h&igrave;nh Mercedes GLK c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; độc đ&aacute;o cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n.</p>\r\n\r\n<p>Chức năng: Xe mở được cửa, capo, cốp. Xe chạy đ&agrave;, c&oacute; đ&egrave;n v&agrave; &acirc;m thanh.</p>\r\n\r\n<p>K&iacute;ch thước: d&agrave;i 28 cm<br />\r\nH&atilde;ng sản xuất : GTAUTOS</p>\r\n\r\n<p><em>Xe m&ocirc; h&igrave;nh Mercedes GLK v</em>ới k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a>&nbsp;v&agrave;&nbsp;<a href=\"https://trummohinh.com/mercedes-benz/\">https://trummohinh.com/mercedes-benz/</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-03 02:39:25', '2022-12-03 02:39:25'),
(47, 14, 'Mô hình xe Mercedes V260 business 1:32 Proswon', '1:32', 300000, 270000, 'Mercedes_V260_business.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được cửa, nắp capo và cốp. Có đèn, âm thanh.', '<h3><strong>M&ocirc; h&igrave;nh xe Mercedes V260 business 1:32 Proswon</strong></h3>\r\n\r\n<p>M&ocirc; h&igrave;nh xe Mercedes V260 business 1:32 l&agrave; bản m&ocirc; phỏng với tỉ lệ thu nhỏ 32 lần so với xe thật, c&oacute; c&aacute;c đặc điểm:</p>\r\n\r\n<p>&ndash; To&agrave;n bộ khung vỏ xe được l&agrave;m bằng kim loại, sơn tĩnh điện bền đẹp.&nbsp;Nội thất nhựa , lốp cao su.</p>\r\n\r\n<p>&ndash; Xe mở được cửa, cốp trước v&agrave; sau.</p>\r\n\r\n<p>&ndash; Xe chạy b&aacute;nh đ&agrave;. C&oacute; đ&egrave;n, &acirc;m thanh.</p>\r\n\r\n<p>&ndash; K&iacute;ch thước: chiều d&agrave;i 14-16 cm</p>\r\n\r\n<p>&ndash; Thiết kế tinh xảo m&ocirc; phỏng y hệt c&aacute;c chi tiết của xe thật như kiểu d&aacute;ng, k&iacute;ch thước, c&aacute;c chi tiết đ&egrave;n, b&aacute;nh xe, nội thất, ghế, v&ocirc; lăng, ống xả&hellip;</p>\r\n\r\n<p>M&ocirc; h&igrave;nh xe Mercedes V260 business 1:32 ph&ugrave; hợp để l&agrave;m qu&agrave; tặng, đồ trưng b&agrave;y, trang tr&iacute;, sưu tầm, b&agrave;y tr&ecirc;n taplo xe&hellip;</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-03 02:41:14', '2022-12-03 02:41:14'),
(48, 14, 'Mô hình xe DHL – Mercedes Sprinter 1:36', '1:36', 200000, 190000, 'Mercedes_Sprinter.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\n\r\nXe mở đươc 2 cửa, cốp sau. Bánh trước và sau chuyển động được. Có đèn và âm thanh.', '<h3><strong>M&ocirc; h&igrave;nh xe DHL Mercedes Sprinter&nbsp;</strong><strong>1:36</strong></h3>\r\n\r\n<p>Chất liệu hợp kim si&ecirc;u bền, sơn tĩnh điện cao cấp.</p>\r\n\r\n<p>Xe mở đươc 2 cửa, cốp sau. B&aacute;nh trước v&agrave; sau chuyển động được.</p>\r\n\r\n<p>Chi tiết : Xe DHL &ndash;&nbsp;<a href=\"https://trummohinh.com/mercedes-benz/\">Mercedes</a>&nbsp;Sprinter 1:36 c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; &yacute; nghĩa cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Chức năng: Xe mở đươc 2 cửa, nắp capo. B&aacute;nh trước v&agrave; sau chuyển động được.</p>\r\n\r\n<p>K&iacute;ch thước: d&agrave;i 15 cm</p>\r\n\r\n<p>H&atilde;ng sản xuất :</p>\r\n\r\n<p>Xe DHL &ndash; Mercedes-Benz Sprinter 1:36 với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-05 02:35:17', '2022-12-03 02:43:36'),
(49, 16, 'Xe mô hình Mini Paceman 1:24 DH', '1:24', 350000, 0, 'Mini_Paceman.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được 2 cửa và nắp capo. Bánh xe đánh lái được.', '<h3><strong>Xe m&ocirc; h&igrave;nh&nbsp;<a href=\"https://trummohinh.com/xe-mo-hinh-mini-paceman-124-dh/\">Mini Paceman 1:24 DH</a></strong></h3>\r\n\r\n<p>Chất liệu hợp kim si&ecirc;u bền, sơn tĩnh điện cao cấp.<br />\r\nXe mở được 2 cửa v&agrave; nắp capo. B&aacute;nh xe đ&aacute;nh l&aacute;i được.</p>\r\n\r\n<p>Xem VIDEO m&ocirc; tả sản phẩm tại:&nbsp;<a href=\"https://www.youtube.com/trummohinh\" target=\"_blank\">https://www.youtube.com/trummohinh</a></p>\r\n\r\n<p>Chi tiết :&nbsp;<em>Xe m&ocirc; h&igrave;nh Mini Paceman&nbsp;</em>c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; độc đ&aacute;o cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Tỷ lệ 1:24<br />\r\nM&agrave;u sắc: Như h&igrave;nh<br />\r\nK&iacute;ch thước: d&agrave;i 20 cm<br />\r\nH&atilde;ng sản xuất : DH</p>\r\n\r\n<p><em>Xe m&ocirc; h&igrave;nh Mini Paceman</em>&nbsp;với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-05 02:35:06', '2022-12-03 02:45:59'),
(50, 17, 'Mô hình xe Nissan GTR Sport 1:24 MiniAuto', '1:24', 350000, 0, 'Nissan_GTR_Sport_MiniAuto.jpg', 'Hàng bản quyền, chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được cửa, capo và cốp (tùy loại). Xe chạy đà, có đèn âm thanh.', '<h3><strong>M&ocirc; h&igrave;nh xe&nbsp;<a href=\"https://trummohinh.com/mo-hinh-xe-nissan-gtr-concept-z-124-chezhi/\">Nissan GTR Sport</a>&nbsp;1:24 MN</strong></h3>\r\n\r\n<p>💢 Th&ocirc;ng tin sản phẩm M&ocirc; h&igrave;nh xe Nissan GTR Sport 1:24 MN</p>\r\n\r\n<p>🔹 H&atilde;ng sản xuất: Miniautp</p>\r\n\r\n<p>🔹 Tỉ lệ: 1:24 (nhỏ hơn xe thật 24 lần)</p>\r\n\r\n<p>🔹 Hộp xốp cao cấp</p>\r\n\r\n<p>🔹 K&iacute;ch thước: D&agrave;i x Rộng x Cao (20 x 7 x 5,5 cm)</p>\r\n\r\n<p>🔹 Khối lượng: ~300gr</p>\r\n\r\n<p>🔹 Chất liệu: To&agrave;n bộ phần th&acirc;n vỏ được l&agrave;m bằng kim loại nguy&ecirc;n khối với nước sơn tĩnh điện 3 lớp cực đẹp,</p>\r\n\r\n<p>Gầm xe v&agrave; nội thất bằng nhựa, b&aacute;nh xe bằng cao su cao cấp</p>\r\n\r\n<p>🔹 T&iacute;nh năng:</p>\r\n\r\n<p>✔️ 4 cửa mở được, capo, cốp</p>\r\n\r\n<p>✔️ Đ&egrave;n, &acirc;m thanh, pin đi k&egrave;m</p>\r\n\r\n<p>✔️ C&oacute; trớn(C&oacute;t)</p>\r\n\r\n<p>🔹 Mục đ&iacute;ch sử dụng:</p>\r\n\r\n<p>✔️ Sưu tầm xe m&ocirc; h&igrave;nh</p>\r\n\r\n<p>✔️ Trang tr&iacute;, nội thất</p>\r\n\r\n<p>✔️ Qu&agrave; tặng cho bạn nam, qu&agrave; tặng cho b&eacute; trai, qu&agrave; noel, qu&agrave; sinh nhật</p>\r\n\r\n<p>✔️ T&igrave;m hiểu xe Nissan GTR Sport qua m&ocirc; h&igrave;nh</p>', 1, '2022-12-03 02:49:04', '2022-12-03 02:49:04'),
(51, 18, 'Xe mô hình Porsche 911 GT3 RS White 1:18 Bburago', '1:18', 1100000, 0, 'Porsche_911_GT3_RS_White.jpg', 'Hàng bản quyền, chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được cửa, capo và cốp (tùy loại). Bánh trước đánh lái được, bánh trước và bánh sau chuyển động được.', '<h3><strong>Xe m&ocirc; h&igrave;nh Porsche 911 GT3 RS White 1:18 Bburago</strong></h3>\r\n\r\n<p>H&agrave;ng bản quyền, chất liệu hợp kim si&ecirc;u bền, sơn tĩnh điện cao cấp.<br />\r\nXe mở được cửa, capo v&agrave; cốp (t&ugrave;y loại). B&aacute;nh trước đ&aacute;nh l&aacute;i được, b&aacute;nh trước v&agrave; b&aacute;nh sau chuyển động được.</p>\r\n\r\n<p>Chi tiết : Porsche 911 GT3 RS White 1:18 Bburago c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; &yacute; nghĩa cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Chức năng: Xe mở được cửa, capo v&agrave; cốp (t&ugrave;y loại). B&aacute;nh trước đ&aacute;nh l&aacute;i được, b&aacute;nh trước v&agrave; b&aacute;nh sau chuyển động được.</p>\r\n\r\n<p>Tỷ lệ 1:18<br />\r\nM&agrave;u sắc: Như ảnh<br />\r\nK&iacute;ch thước: d&agrave;i 27 cm<br />\r\nH&atilde;ng sản xuất : Bburago</p>\r\n\r\n<p>Xe m&ocirc; h&igrave;nh Porsche 911 GT3 RS White 1:18 Bburago với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a>&nbsp;v&agrave;&nbsp;<a href=\"https://trummohinh.com/porsche/\">https://trummohinh.com/porsche/</a></p>\r\n\r\n<p><a href=\"https://trummohinh.com/mo-hinh-tinh/\">http://TrumMoHinh.com/Mo-Hinh-Tinh</a></p>', 1, '2022-12-03 02:51:45', '2022-12-03 02:51:45'),
(52, 18, 'Xe mô hình Porsche Macan 1:32 UNK', '1:32', 190000, 0, 'Porsche_Macan.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được 4 cửa, cốp sau và đuôi gió. Xe chạy đà, có đèn và âm thanh.', '<h3><strong>Xe m&ocirc; h&igrave;nh&nbsp;<a href=\"https://trummohinh.com/xe-mo-hinh-porsche-macan-132-unk/\">Porsche Macan 1:32 UNK</a></strong></h3>\r\n\r\n<p>Chất liệu hợp kim, sơn tĩnh điện cao cấp.<br />\r\nXe mở được 4 cửa, cốp sau v&agrave; đu&ocirc;i gi&oacute;. Xe chạy đ&agrave;, c&oacute; đ&egrave;n v&agrave; nhạc.</p>\r\n\r\n<p>Xem video sản phẩm thực tế:&nbsp;<a href=\"https://youtu.be/66SSxQhqCNo\" target=\"_blank\">https://youtu.be/66SSxQhqCNo</a></p>\r\n\r\n<p>Chi tiết :&nbsp;<a href=\"https://trummohinh.com/porsche/\"><strong>m&ocirc; h&igrave;nh porsche</strong></a>&nbsp;c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; độc đ&aacute;o cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Chức năng: Xe mở được 2 cửa, cốp sau v&agrave; đu&ocirc;i gi&oacute;. Xe chạy đ&agrave;, c&oacute; đ&egrave;n v&agrave; nhạc.</p>\r\n\r\n<p>Tỷ lệ 1:32<br />\r\nM&agrave;u sắc:<br />\r\nK&iacute;ch thước: d&agrave;i 15.2 cm x rộng 6.8 cm x cao 4 cm<br />\r\nH&atilde;ng sản xuất :</p>\r\n\r\n<p>XE M&Ocirc; H&Igrave;NH Porsche Macan với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-03 02:53:49', '2022-12-03 02:53:49'),
(53, 18, 'Mô hình xe Porsche 918 Spyder 1:36 Welly', '1:36', 140000, 130000, 'Porsche_918_Spyder.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được 2 cửa. Xe chạy đà.', '<h3><strong>Xe m&ocirc; h&igrave;nh&nbsp;<a href=\"https://trummohinh.com/xe-mo-hinh-porsche-918-spyder-136-welly/\">Porsche 918 Spyder 1:36 Welly</a></strong></h3>\r\n\r\n<p>Chất liệu hợp kim si&ecirc;u bền, sơn tĩnh điện cao cấp.<br />\r\nXe mở được 2 cửa. Xe chạy đ&agrave;.</p>\r\n\r\n<p>Xem video sản phẩm thực tế:</p>\r\n\r\n<p>Chi tiết :&nbsp;<a href=\"https://trummohinh.com/porsche/\">Xe m&ocirc; h&igrave;nh Porsche</a>&nbsp;918 Spyder 1:36 Welly c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; &yacute; nghĩa cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Chức năng: Xe mở được 2 cửa. Xe chạy đ&agrave;.</p>\r\n\r\n<p>Tỷ lệ 1:36<br />\r\nM&agrave;u sắc: Như h&igrave;nh<br />\r\nK&iacute;ch thước: d&agrave;i 12cm<br />\r\nH&atilde;ng sản xuất : Welly</p>\r\n\r\n<p>Xe m&ocirc; h&igrave;nh Porsche 918 Spyder 1:36 Welly với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-03 02:55:04', '2022-12-03 02:55:04');
INSERT INTO `products` (`id`, `id_manufacture`, `name`, `ratio`, `unit_price`, `promotion_price`, `image`, `detail`, `description`, `new`, `created_at`, `updated_at`) VALUES
(54, 19, 'Xe Mô Hình Rolls Royce Phantom VIII 1:24 Mansory', '1:24', 400000, 350000, 'Rolls_Royce_Phantom_VIII.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được 4 cửa, capo trước và cốp sau.\r\n\r\nXe chạy đà, có đèn và nhạc.\r\n\r\nBánh xe đánh lái được\r\n\r\nTặng kèm thêm Logo trong suốt', '<h2><strong>Xe M&ocirc; H&igrave;nh Rolls Royce Phantom VIII 1:24 Mansory</strong></h2>\r\n\r\n<p>💢 Th&ocirc;ng tin sản phẩm&nbsp;<a href=\"https://trummohinh.com/xe-mo-hinh-rolls-royce-phantom-viii-124-chezhi/\">M&ocirc; h&igrave;nh xe Rolls Royce Phantom</a>&nbsp;VIII 1:24 Mansory</p>\r\n\r\n<p>🔹 H&atilde;ng sản xuất: MANSORY</p>\r\n\r\n<p>🔹 Tỉ lệ: 1:24 (nhỏ hơn xe thật 24 lần)</p>\r\n\r\n<p>🔹 M&agrave;u: M&agrave;u trắng pha đen, đen pha bạc, trắng pha xanh</p>\r\n\r\n<p>🔹 Hộp xốp cao cấp</p>\r\n\r\n<p>🔹 K&iacute;ch thước: D&agrave;i x Rộng x Cao (20 x 7 x 5,5 cm)</p>\r\n\r\n<p>🔹 Khối lượng: ~500gr</p>\r\n\r\n<p>🔹 Chất liệu: To&agrave;n bộ phần th&acirc;n vỏ được l&agrave;m bằng kim loại nguy&ecirc;n khối với nước sơn tĩnh điện 3 lớp cực đẹp, Gầm xe v&agrave; nội thất bằng nhựa, b&aacute;nh xe bằng cao su cao cấp</p>\r\n\r\n<p>🔹 T&iacute;nh năng:</p>\r\n\r\n<p>✔️ 2 cửa mở được, capo, cốp</p>\r\n\r\n<p>✔️ Đ&egrave;n, &acirc;m thanh, pin đi k&egrave;m</p>\r\n\r\n<p>✔️ C&oacute; trớn(C&oacute;t) ✔️ B&aacute;nh xe đ&aacute;nh l&aacute;i được</p>\r\n\r\n<p>✔️ Gồm 2 Logo m&agrave;u bạc v&agrave; trong suốt để thay thế</p>\r\n\r\n<p>✔️ C&oacute; d&ugrave; k&eacute;o b&ecirc;n h&ocirc;ng xe (kh&ocirc;ng bật ra được)</p>\r\n\r\n<p>🔹 Mục đ&iacute;ch sử dụng:</p>\r\n\r\n<p>✔️ Sưu tầm xe m&ocirc; h&igrave;nh</p>\r\n\r\n<p>✔️ Trang tr&iacute;, nội thất</p>\r\n\r\n<p>✔️ Qu&agrave; tặng cho bạn nam, qu&agrave; tặng cho b&eacute; trai, qu&agrave; noel, qu&agrave; sinh nhật</p>\r\n\r\n<p>✔️ T&igrave;m hiểu xe Rolls Royce Phantom VIII qua m&ocirc; h&igrave;nh</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-03 02:58:10', '2022-12-03 02:58:10'),
(55, 20, 'Xe mô hình TESLA MODEL S 1:32 Proswon', '1:32', 190000, 0, 'TESLA_MODEL_S.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được 4 cửa, capo trước và cốp sau. Xe chạy đà, có đèn và nhạc.', '<h3><strong>Xe m&ocirc; h&igrave;nh TESLA MODEL S 1:32 Proswon</strong></h3>\r\n\r\n<p>Chất liệu hợp kim si&ecirc;u bền, sơn tĩnh điện cao cấp.<br />\r\nXe mở được 4 cửa, capo trước v&agrave; cốp sau. Xe chạy đ&agrave;, c&oacute; đ&egrave;n v&agrave; nhạc.</p>\r\n\r\n<p>Xem video sản phẩm thực tế:</p>\r\n\r\n<p>Chi tiết : Xe m&ocirc; h&igrave;nh TESLA MODEL S 1:32 c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; &yacute; nghĩa cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Chức năng: Xe mở được 4 cửa, capo trước v&agrave; cốp sau. Xe chạy đ&agrave;, c&oacute; đ&egrave;n v&agrave; nhạc.</p>\r\n\r\n<p>Tỷ lệ 1:32<br />\r\nM&agrave;u sắc: Đen, đỏ, v&agrave;ng<br />\r\nK&iacute;ch thước: d&agrave;i 15.2 cm x rộng 6.8 cm x cao 4 cm<br />\r\nH&atilde;ng sản xuất : Miniauto</p>\r\n\r\n<p>Xe m&ocirc; h&igrave;nh&nbsp;TESLA MODEL S với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-03 03:01:00', '2022-12-03 03:01:00'),
(56, 22, 'Mô hình Toyota Land Cruiser Prado 1:18 WEITUO', '1:18', 700000, 0, 'Toyota_Land_Cruiser_Prado.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\nXe mở được cửa, nắp capo và cốp.\r\n\r\nXe chạy đà, có đèn và âm thanh, CÓ THỂ BẤM KÈN TỪ VÔ LĂNG', '<h3><strong>M&ocirc; h&igrave;nh Toyota Land Cruiser Prado 1:18 WEITUO</strong></h3>\r\n\r\n<p>Xe m&ocirc; h&igrave;nh Toyota Landcruiser Prado 1:18 Weituo</p>\r\n\r\n<p>💢 Th&ocirc;ng tin sản phẩm M&ocirc; h&igrave;nh xe Toyota Landcruiser Prado 1:18 Weituo</p>\r\n\r\n<p>🔹 Tỉ lệ: 1:18 (nhỏ hơn xe thật 18 lần)</p>\r\n\r\n<p>🔹 M&agrave;u: M&agrave;u trắng, đen</p>\r\n\r\n<p>🔹 K&iacute;ch thước: D&agrave;i x Rộng x Cao (27 x 12 x 10 cm)</p>\r\n\r\n<p>🔹 Khối lượng: ~800gr</p>\r\n\r\n<p>🔹 Chất liệu: To&agrave;n bộ phần th&acirc;n vỏ được l&agrave;m bằng kim loại nguy&ecirc;n khối với nước sơn tĩnh điện 3 lớp cực đẹp, Gầm xe v&agrave; nội thất bằng nhựa, b&aacute;nh xe bằng cao su cao cấp</p>\r\n\r\n<p>🔹 T&iacute;nh năng:</p>\r\n\r\n<p>✔️ Mở 4 cửa, capo, cốp</p>\r\n\r\n<p>✔️ Đ&egrave;n, &acirc;m thanh, pin đi k&egrave;m, c&oacute; thể BẤM K&Egrave;N XE TR&Ecirc;N V&Ocirc; LĂNG</p>\r\n\r\n<p>✔️ C&oacute; trớn(C&oacute;t)</p>\r\n\r\n<p>🔹 Mục đ&iacute;ch sử dụng:</p>\r\n\r\n<p>✔️ Sưu tầm xe m&ocirc; h&igrave;nh</p>\r\n\r\n<p>✔️ Trang tr&iacute;, nội thất</p>\r\n\r\n<p>✔️ Qu&agrave; tặng cho bạn nam, qu&agrave; tặng cho b&eacute; trai, qu&agrave; noel, qu&agrave; sinh nhật</p>\r\n\r\n<p>✔️ T&igrave;m hiểu xe Toyota Prado qua m&ocirc; h&igrave;nh</p>', 1, '2022-12-03 03:04:21', '2022-12-03 03:04:21'),
(57, 22, 'Mô hình xe khách 29 chỗ Toyta Coaster 1:32', '1:32', 220000, 0, 'Toyota_29cho.jpg', 'Chất liệu hợp kim siêu bền, sơn tĩnh điện cao cấp.\r\n\r\nXe mở đươc 2 cửa, cốp sau. Bánh trước và sau chuyển động được. Có đèn và âm thanh', '<h3><strong>M&ocirc; h&igrave;nh xe kh&aacute;ch&nbsp;29 chỗ&nbsp;<a href=\"https://trummohinh.com/mo-hinh-xe-29-cho-toyta-coaster-32/\">Toyta Coaster 1:32</a></strong></h3>\r\n\r\n<p>Chất liệu hợp kim si&ecirc;u bền, sơn tĩnh điện cao cấp.</p>\r\n\r\n<p>Xe mở đươc 2 cửa, cốp sau. B&aacute;nh trước v&agrave; sau chuyển động được. C&oacute; đ&egrave;n v&agrave; &acirc;m thanh.</p>\r\n\r\n<p>Chi tiết :&nbsp;<a href=\"https://trummohinh.com/xe-cont/\">Xe kh&aacute;ch 29 chỗ</a>&nbsp;Toyta Coaster c&oacute; thiết kế như thật với những đường n&eacute;t m&ocirc; phỏng chi tiết, xe được sơn tĩnh điện tinh tế rất ph&ugrave; hợp để trưng b&agrave;y ở ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m việc, showroom&hellip; l&agrave; m&oacute;n qu&agrave; &yacute; nghĩa cho đối t&aacute;c, người th&acirc;n, trẻ nhỏ.</p>\r\n\r\n<p>Chất liệu: To&agrave;n bộ khung xe được đ&uacute;c bằng kim loại, nội thất xe bằng nhựa , lốp xe được l&agrave;m bằng cao su tự nhi&ecirc;n, c&aacute;c chi tiết ống xả v&agrave; lưới tản nhiệt được xi b&oacute;ng.</p>\r\n\r\n<p>Chức năng: Xe mở đươc 2 cửa, nắp capo. B&aacute;nh trước v&agrave; sau chuyển động được.</p>\r\n\r\n<p>K&iacute;ch thước: d&agrave;i 17 cm</p>\r\n\r\n<p>H&atilde;ng sản xuất :</p>\r\n\r\n<p>Xe 29 chỗ Toyta Coaster với k&iacute;ch cỡ nhỏ nhắn sẽ trở th&agrave;nh một m&oacute;n sưu tập th&uacute; vị trong ph&ograve;ng của bạn.</p>\r\n\r\n<p>Xem th&ecirc;m sản phẩm&nbsp;<a href=\"https://trummohinh.com/toyota/\"><strong>m&ocirc; h&igrave;nh xe toyota</strong></a>&nbsp;tại&nbsp;<a href=\"https://trummohinh.com/\" target=\"_blank\">https://TrumMoHinh.com</a></p>\r\n\r\n<p>Cập nhật th&ocirc;ng tin sản phẩm mới, ưu đại tại:&nbsp;<a href=\"https://facebook.com/TrumMoHinh\" target=\"_blank\">https://facebook.com/TrumMoHinh</a></p>', 1, '2022-12-03 03:10:06', '2022-12-03 03:10:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products_image`
--

CREATE TABLE `products_image` (
  `id` int(11) NOT NULL,
  `id_product` int(11) DEFAULT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `products_image`
--

INSERT INTO `products_image` (`id`, `id_product`, `image`) VALUES
(275, 1, 'g63_1.jpg'),
(276, 1, 'g63_2.jpg'),
(277, 1, 'g63_3.jpg'),
(278, 1, 'g63_4.jpg'),
(279, 2, 'r8_1.jpg'),
(280, 2, 'r8_2.jpg'),
(281, 2, 'r8_3.jpg'),
(282, 2, 'r8_4.jpg'),
(283, 3, 'taycan_tubo_s_1.jpg'),
(284, 3, 'taycan_tubo_s2.jpg'),
(285, 3, 'taycan_tubo_s3.jpg'),
(286, 3, 'taycan_tubo_s4.jpg'),
(287, 4, 'roadster_1.jpg'),
(288, 4, 'roadster_2.jpg'),
(289, 4, 'roadster_3.jpg'),
(290, 4, 'roadster_4.jpg'),
(291, 5, 'z4gt3_1.jpg'),
(292, 5, 'z4gt3_2.jpg'),
(293, 5, 'z4gt3_3.jpg'),
(294, 5, 'z4gt3_4.jpg'),
(295, 6, 'red_signature_1.jpg'),
(296, 6, 'red_signature_2.jpg'),
(297, 6, 'red_signature_3.jpg'),
(298, 6, 'red_signature_4.jpg'),
(299, 7, 'continental_1.jpg'),
(300, 7, 'continental_2.jpg'),
(301, 7, 'continental_3.jpg'),
(302, 7, 'continental_4.jpg'),
(303, 10, 'Phantom Extended_4.jpg'),
(304, 10, 'PhantomExtended_1.jpg'),
(305, 10, 'PhantomExtended_2.jpg'),
(306, 10, 'PhantomExtended_3.jpg'),
(307, 11, 'ChevroletCamaro_1.jpg'),
(308, 11, 'ChevroletCamaro_2.jpg'),
(309, 11, 'ChevroletCamaro_3.jpg'),
(310, 11, 'ChevroletCamaro_4.jpg'),
(311, 12, 'MitsubishiPajeroV97_1.jpg'),
(312, 12, 'MitsubishiPajeroV97_3.jpg'),
(313, 12, 'MitsubishiPajeroV97_4.jpg'),
(314, 12, 'MitsubishiPajeroV97_5.jpg'),
(315, 13, 'Mclaren650S_1.jpg'),
(316, 13, 'Mclaren650S_2.jpg'),
(317, 13, 'Mclaren650S_3.jpg'),
(318, 13, 'Mclaren650S_4.jpg'),
(319, 14, 'BugattiDivo_1.jpg'),
(320, 14, 'BugattiDivo_2.jpg'),
(321, 14, 'BugattiDivo_3.jpg'),
(322, 14, 'BugattiDivo_4.jpg'),
(323, 15, 'NissanX-Trail_1.jpg'),
(324, 15, 'NissanX-Trail_2.jpg'),
(325, 15, 'NissanX-Trail_3.jpg'),
(326, 15, 'NissanX-Trail_4.jpg'),
(327, 16, 'FordF150_1.jpg'),
(328, 16, 'FordF150_2.jpg'),
(329, 16, 'FordF150_3.jpg'),
(330, 16, 'FordF150_4.jpg'),
(331, 17, 'HondaCivic _1.jpg'),
(332, 17, 'HondaCivic _2.jpg'),
(333, 17, 'HondaCivic _3.jpg'),
(334, 17, 'HondaCivic _4.jpg'),
(335, 18, 'LexusLX570_1.jpg'),
(336, 18, 'LexusLX570_2.jpg'),
(337, 18, 'LexusLX570_3.jpg'),
(338, 18, 'LexusLX570_4.jpg'),
(339, 19, 'MiniCooper _1.jpg'),
(340, 19, 'MiniCooper _2.jpg'),
(341, 19, 'MiniCooper _3.jpg'),
(342, 19, 'MiniCooper _4.jpg'),
(343, 20, 'NISSANGTR_1.jpg'),
(344, 20, 'NISSANGTR_2.jpg'),
(345, 20, 'NISSANGTR_3.jpg'),
(346, 20, 'NISSANGTR_4.jpg'),
(347, 21, 'TeslaModelX3_1.jpg'),
(348, 21, 'TeslaModelX3_2.jpg'),
(349, 21, 'TeslaModelX3_3.jpg'),
(350, 21, 'TeslaModelX3_4.jpg'),
(351, 22, 'ToyotaLandCruiser_1.jpg'),
(352, 22, 'ToyotaLandCruiser_2.jpg'),
(353, 22, 'ToyotaLandCruiser_3.jpg'),
(354, 22, 'ToyotaLandCruiser_4.jpg'),
(355, 23, 'AudiQ5_1.jpg'),
(356, 23, 'AudiQ5_2.jpg'),
(357, 23, 'AudiQ5_3.jpg'),
(358, 23, 'AudiQ5_4.jpg'),
(359, 24, 'AudiR8GT_1.jpg'),
(360, 24, 'AudiR8GT_2.jpg'),
(361, 25, 'BentleyContinentalGTW12_1.jpg'),
(362, 25, 'BentleyContinentalGTW12_2.jpg'),
(363, 25, 'BentleyContinentalGTW12_3.jpg'),
(364, 25, 'BentleyContinentalGTW12_4.jpg'),
(365, 26, 'BentleyContinentalGT3 _1.jpg'),
(366, 26, 'BentleyContinentalGT3 _2.jpg'),
(367, 26, 'BentleyContinentalGT3 _3.jpg'),
(368, 26, 'BentleyContinentalGT3 _4.jpg'),
(369, 27, 'BMWi8_1.jpeg'),
(370, 27, 'BMWi8_2.jpg'),
(371, 27, 'BMWi8_3.jpg'),
(372, 27, 'BMWi8_4.jpeg'),
(373, 28, 'BugattiLaVoiture _1.jpg'),
(374, 28, 'BugattiLaVoiture _2.jpg'),
(375, 28, 'BugattiLaVoiture _3.jpg'),
(376, 28, 'BugattiLaVoiture _4.jpg'),
(377, 29, 'PaganiVeyron_1.jpg'),
(378, 29, 'PaganiVeyron_2.jpg'),
(379, 29, 'PaganiVeyron_3.jpg'),
(380, 29, 'PaganiVeyron_4.jpg'),
(381, 30, 'ChervoletCamaro_1.jpg'),
(382, 30, 'ChervoletCamaro_2.jpg'),
(383, 30, 'ChervoletCamaro_3.jpg'),
(384, 30, 'ChervoletCamaro_4.jpg'),
(385, 31, 'ChevroletCorvette_Stingray_1.jpg'),
(386, 31, 'ChevroletCorvette_Stingray_2.jpg'),
(387, 31, 'ChevroletCorvette_Stingray_3.jpg'),
(388, 31, 'ChevroletCorvette_Stingray_4.jpg'),
(389, 31, 'ChevroletCorvette_Stingray_5.jpg'),
(390, 32, 'ChervoletCamaro_3.jpg'),
(391, 32, 'ChervoletCamaro_4.jpg'),
(392, 32, 'ChevroletCamaro _1.jpg'),
(393, 32, 'ChevroletCamaro _2.jpg'),
(394, 33, 'Ferrari_FXX-K_White_1.jpg'),
(395, 33, 'Ferrari_FXX-K_White_2.jpg'),
(396, 33, 'Ferrari_FXX-K_White_3.jpg'),
(397, 33, 'Ferrari_FXX-K_White_4.jpg'),
(398, 33, 'Ferrari_FXX-K_White_5.jpg'),
(399, 33, 'Ferrari_FXX-K_White_6.jpg'),
(400, 34, 'Ferrari_FXX_Sport_1.jpg'),
(401, 34, 'Ferrari_FXX_Sport_2.jpg'),
(402, 34, 'Ferrari_FXX_Sport_3.jpg'),
(403, 34, 'Ferrari_FXX_Sport_4.jpg'),
(404, 34, 'Ferrari_FXX_Sport_5.jpg'),
(405, 35, 'Ford_GT_Red _1.jpg'),
(406, 35, 'Ford_GT_Red _2.jpg'),
(407, 35, 'Ford_GT_Red _3.jpg'),
(408, 35, 'Ford_GT_Red _4.jpg'),
(409, 35, 'Ford_GT_Red _5.jpg'),
(410, 35, 'Ford_GT_Red _6.jpg'),
(411, 36, 'Ford_Mustang_Harley_Edition_1.jpg'),
(412, 36, 'Ford_Mustang_Harley_Edition_2.jpg'),
(413, 36, 'Ford_Mustang_Harley_Edition_3.jpg'),
(414, 36, 'Ford_Mustang_Harley_Edition_4.jpg'),
(415, 36, 'Ford_Mustang_Harley_Edition_5.jpg'),
(416, 36, 'Ford_Mustang_Harley_Edition_6.jpg'),
(417, 36, 'Ford_Mustang_Harley_Edition_7.jpg'),
(418, 37, 'Ford_Mustang_police.jpg'),
(419, 37, 'Ford_Mustang_police_1.jpg'),
(420, 37, 'Ford_Mustang_police_2.jpg'),
(421, 37, 'Ford_Mustang_police_3.jpg'),
(422, 37, 'Ford_Mustang_police_4.jpg'),
(423, 38, 'Acura_NSX_1.jpg'),
(424, 38, 'Acura_NSX_2.jpg'),
(425, 38, 'Acura_NSX_3.jpg'),
(426, 38, 'Acura_NSX_4.jpg'),
(427, 38, 'Acura_NSX_5.jpg'),
(428, 39, 'Aventador_LP700_White_1.jpg'),
(429, 39, 'Aventador_LP700_White_2.jpg'),
(430, 39, 'Aventador_LP700_White_3.jpg'),
(431, 39, 'Aventador_LP700_White_4.jpg'),
(432, 40, 'Lamborghini_Aventador_LP700_White_1.jpg'),
(433, 40, 'Lamborghini_Aventador_LP700_White_2.jpg'),
(434, 40, 'Lamborghini_Aventador_LP700_White_3.jpg'),
(435, 40, 'Lamborghini_Aventador_LP700_White_4.jpg'),
(436, 41, 'Lamborghini_Huracan _1.jpg'),
(437, 41, 'Lamborghini_Huracan _2.jpg'),
(438, 41, 'Lamborghini_Huracan _3.jpg'),
(439, 41, 'Lamborghini_Huracan _4.jpg'),
(440, 41, 'Lamborghini_Huracan _5.jpg'),
(441, 41, 'Lamborghini_Huracan _6.jpg'),
(442, 42, 'Lexus_LX570_SuperSport_1.jpg'),
(443, 42, 'Lexus_LX570_SuperSport_2.jpg'),
(444, 42, 'Lexus_LX570_SuperSport_3.jpg'),
(445, 42, 'Lexus_LX570_SuperSport_4.jpg'),
(446, 42, 'Lexus_LX570_SuperSport_5.jpg'),
(447, 42, 'Lexus_LX570_SuperSport_6.jpg'),
(448, 43, 'Lexus_ES300h _2.jpg'),
(449, 43, 'Lexus_ES300h _3.jpg'),
(450, 43, 'Lexus_ES300h _4.jpg'),
(451, 43, 'Lexus_ES300h _5.jpg'),
(452, 43, 'Lexus_ES300h_1.jpg'),
(453, 44, 'McLaren_650S_Spider_1.jpg'),
(454, 44, 'McLaren_650S_Spider_2.jpg'),
(455, 44, 'McLaren_650S_Spider_3.jpg'),
(456, 44, 'McLaren_650S_Spider_4.jpg'),
(457, 45, 'McLaren_P1_GTR_1.jpg'),
(458, 45, 'McLaren_P1_GTR_2.jpg'),
(459, 45, 'McLaren_P1_GTR_3.jpg'),
(460, 45, 'McLaren_P1_GTR_4.jpg'),
(461, 46, 'Mercedes_GLK_1.jpg'),
(462, 46, 'Mercedes_GLK_2.jpg'),
(463, 46, 'Mercedes_GLK_3.jpg'),
(464, 46, 'Mercedes_GLK_4.jpg'),
(465, 46, 'Mercedes_GLK_5.jpg'),
(466, 47, 'Mercedes_V260_business_1.jpg'),
(467, 47, 'Mercedes_V260_business_2.jpg'),
(468, 47, 'Mercedes_V260_business_3.jpg'),
(469, 48, 'Mercedes_Sprinter _2.jpg'),
(470, 48, 'Mercedes_Sprinter _3.jpg'),
(471, 48, 'Mercedes_Sprinter _4.jpg'),
(472, 48, 'Mercedes_Sprinter _5.jpg'),
(473, 48, 'Mercedes_Sprinter _6.jpg'),
(474, 48, 'Mercedes_Sprinter_1.jpg'),
(475, 49, 'Mini_Paceman_1.jpg'),
(476, 49, 'Mini_Paceman_2.jpg'),
(477, 49, 'Mini_Paceman_3.jpg'),
(478, 49, 'Mini_Paceman_4.jpg'),
(479, 50, 'Nissan_GTR_Sport_MiniAuto_1.jpg'),
(480, 50, 'Nissan_GTR_Sport_MiniAuto_2.jpg'),
(481, 50, 'Nissan_GTR_Sport_MiniAuto_3.jpg'),
(482, 50, 'Nissan_GTR_Sport_MiniAuto_4.jpg'),
(483, 50, 'Nissan_GTR_Sport_MiniAuto_5.jpg'),
(484, 51, 'Porsche_911_GT3_RS_White_1.jpg'),
(485, 51, 'Porsche_911_GT3_RS_White_2.jpg'),
(486, 51, 'Porsche_911_GT3_RS_White_3.jpg'),
(487, 51, 'Porsche_911_GT3_RS_White_4.jpg'),
(488, 52, 'Porsche_Macan_1.jpg'),
(489, 52, 'Porsche_Macan_2.jpg'),
(490, 52, 'Porsche_Macan_3.jpg'),
(491, 52, 'Porsche_Macan_5.jpg'),
(492, 53, 'Porsche_918_Spyder_1.jpg'),
(493, 54, 'Rolls_Royce_Phantom_VIII_1.jpg'),
(494, 54, 'Rolls_Royce_Phantom_VIII_2.png'),
(495, 54, 'Rolls_Royce_Phantom_VIII_3.png'),
(496, 54, 'Rolls_Royce_Phantom_VIII_4.jpg'),
(497, 54, 'Rolls_Royce_Phantom_VIII_5.jpg'),
(498, 54, 'Rolls_Royce_Phantom_VIII_6.jpg'),
(499, 54, 'Rolls_Royce_Phantom_VIII_6.png'),
(500, 55, 'TESLA_MODEL_S _1.jpg'),
(501, 55, 'TESLA_MODEL_S_2.jpg'),
(502, 55, 'TESLA_MODEL_S_3.jpg'),
(503, 55, 'TESLA_MODEL_S_4.jpg'),
(504, 55, 'TESLA_MODEL_S_5.jpg'),
(505, 55, 'TESLA_MODEL_S_6.jpg'),
(506, 56, 'Toyota_Land_Cruiser_Prado _1.jpg'),
(507, 56, 'Toyota_Land_Cruiser_Prado_2.jpg'),
(508, 56, 'Toyota_Land_Cruiser_Prado_3.jpg'),
(509, 56, 'Toyota_Land_Cruiser_Prado_4.jpg'),
(510, 56, 'Toyota_Land_Cruiser_Prado_5.jpg'),
(511, 57, 'Toyota_29cho_1.jpg'),
(512, 57, 'Toyota_29cho_2.jpg'),
(513, 57, 'Toyota_29cho_3.jpg'),
(514, 57, 'Toyota_29cho_4.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products_like`
--

CREATE TABLE `products_like` (
  `id` int(11) NOT NULL,
  `id_users` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `products_like`
--

INSERT INTO `products_like` (`id`, `id_users`, `id_product`, `updated_at`, `created_at`) VALUES
(6, 1, 2, '2022-11-30 01:14:31', '2022-11-30 01:14:31'),
(7, 9, 4, '2022-12-06 23:28:37', '2022-12-06 23:28:37'),
(8, 9, 2, '2022-12-06 23:29:31', '2022-12-06 23:29:31'),
(9, 9, 6, '2022-12-06 23:30:19', '2022-12-06 23:30:19'),
(10, 9, 7, '2022-12-06 23:35:17', '2022-12-06 23:35:17'),
(11, 9, 10, '2022-12-08 00:40:53', '2022-12-08 00:40:53'),
(12, 10, 4, '2022-12-13 00:57:56', '2022-12-13 00:57:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `address` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `image` varchar(50) NOT NULL,
  `level` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1: user\r\n2: admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `phone`, `address`, `date`, `image`, `level`) VALUES
(1, 'Ngô văn Hải Trường', 'truongngo.050902@gmail.com', '$2y$10$jTJtHcW.mkH0JjElvf0jge7.tAec3UvFjW81JOEufuk0ksUyIE.iO', '0388549606', 'QUảng Nam', '2022-08-05', '', 2),
(8, 'Ngô Văn Thắng', 't78021915@gmail.com', '$2y$10$l/9exTuEtVx5aZ.JKds9Yeb0x5zJHjYwPK7n.RC5WuN4sbBMuGPi.', '0388549606', 'Hà Lam Thăng Bình Quảng Nam', '2022-12-04', 'd1.jpg', 1),
(9, 'Ngô Văn Hải Trường', '20c0142@danavtc.edu.vn', '$2y$10$l/9exTuEtVx5aZ.JKds9Yeb0x5zJHjYwPK7n.RC5WuN4sbBMuGPi.', '0123456789', 'TT Hà Lam, H.Thăng Bình, T.Quảng Nam', '2022-11-09', '3.jpg', 1),
(10, 'Trần viết thái', 'tranvietthai20023107@gmail.com', '$2y$10$3UdV1XE4m1afhBS5GBgwHu/XJSfk5tI.aSSrmBiGc9.ISpJVtAgcy', '0123456789', 'đà nẵng', '2022-11-08', 'thai.jpg', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_users` (`id_users`),
  ADD KEY `id_coupon` (`id_coupon`);

--
-- Chỉ mục cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bill` (`id_bill`),
  ADD KEY `id_product` (`id_product`);

--
-- Chỉ mục cho bảng `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_users` (`id_users`);

--
-- Chỉ mục cho bảng `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cart` (`id_cart`),
  ADD KEY `id_product` (`id_product`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_users` (`id_users`),
  ADD KEY `id_product` (`id_product`);

--
-- Chỉ mục cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `manufacture`
--
ALTER TABLE `manufacture`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_manufacture` (`id_manufacture`);

--
-- Chỉ mục cho bảng `products_image`
--
ALTER TABLE `products_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`);

--
-- Chỉ mục cho bảng `products_like`
--
ALTER TABLE `products_like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_users` (`id_users`),
  ADD KEY `id_product` (`id_product`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT cho bảng `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;

--
-- AUTO_INCREMENT cho bảng `cart_detail`
--
ALTER TABLE `cart_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=356;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `manufacture`
--
ALTER TABLE `manufacture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT cho bảng `products_image`
--
ALTER TABLE `products_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=525;

--
-- AUTO_INCREMENT cho bảng `products_like`
--
ALTER TABLE `products_like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `bills_ibfk_2` FOREIGN KEY (`id_coupon`) REFERENCES `coupons` (`id`);

--
-- Các ràng buộc cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD CONSTRAINT `bill_detail_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `bill_detail_ibfk_2` FOREIGN KEY (`id_bill`) REFERENCES `bills` (`id`);

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD CONSTRAINT `cart_detail_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `cart_detail_ibfk_2` FOREIGN KEY (`id_cart`) REFERENCES `cart` (`id`);

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_manufacture`) REFERENCES `manufacture` (`id`);

--
-- Các ràng buộc cho bảng `products_image`
--
ALTER TABLE `products_image`
  ADD CONSTRAINT `products_image_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `products_like`
--
ALTER TABLE `products_like`
  ADD CONSTRAINT `products_like_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `products_like_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
