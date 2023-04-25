-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th2 21, 2023 lúc 05:32 PM
-- Phiên bản máy phục vụ: 10.4.25-MariaDB
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `medisure`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `authority`
--

CREATE TABLE `authority` (
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `authority`
--

INSERT INTO `authority` (`name`) VALUES
('ROLE_ADMIN'),
('ROLE_DOCTOR'),
('ROLE_USER');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `detail_invoice`
--

CREATE TABLE `detail_invoice` (
  `id` bigint(20) NOT NULL,
  `invoice_id` bigint(20) DEFAULT NULL,
  `medical_process_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `doctors`
--

CREATE TABLE `doctors` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `fulll_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `specialist_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `doctors`
--

INSERT INTO `doctors` (`id`, `address`, `description`, `fulll_name`, `phone`, `specialist_id`, `user_id`) VALUES
(3, 'Cần thơ', NULL, 'hoàng mạnh tuấn', '093748233', 1, 3),
(4, 'Cần thơ', NULL, 'hoàng tuấn hùng', '09217831', 4, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoice`
--

CREATE TABLE `invoice` (
  `id` bigint(20) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `schedule_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `medical_process`
--

CREATE TABLE `medical_process` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `process_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `patient_record`
--

CREATE TABLE `patient_record` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `fulll_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `specialist_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `patient_record`
--

INSERT INTO `patient_record` (`id`, `address`, `description`, `fulll_name`, `phone`, `specialist_id`, `user_id`) VALUES
(1, 'hà nội', 'ho nhiều, chữa nhiều không khỏi', 'trần thị lan', '097821323', 1, 2),
(2, 'Tp Hồ Chí Minh', 'ho nhiều, chữa nhiều không khỏi', 'Nguyễn Ngọc Nhẫn', '09278322', 4, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `requests`
--

CREATE TABLE `requests` (
  `id` bigint(20) NOT NULL,
  `active_date` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `patient_record_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `specialization` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `schedules_as`
--

CREATE TABLE `schedules_as` (
  `id` bigint(20) NOT NULL,
  `booking_date` date DEFAULT NULL,
  `booking_time` time DEFAULT NULL,
  `medicines` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `doctor_id` bigint(20) DEFAULT NULL,
  `patient_record_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `schedules_as`
--

INSERT INTO `schedules_as` (`id`, `booking_date`, `booking_time`, `medicines`, `note`, `doctor_id`, `patient_record_id`) VALUES
(3, '2023-02-23', '09:00:00', NULL, NULL, 3, 1),
(5, '2023-02-27', '10:00:00', NULL, NULL, 3, 1),
(6, '2023-02-27', '09:00:00', NULL, NULL, 3, 1),
(7, '2023-02-27', '11:00:00', NULL, NULL, 3, 2),
(8, '2023-02-27', '11:00:00', NULL, NULL, 4, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `specialist`
--

CREATE TABLE `specialist` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `specialist`
--

INSERT INTO `specialist` (`id`, `name`) VALUES
(1, 'Cardiology Department'),
(2, 'Dermatology Department'),
(3, 'Endocrinology Department'),
(4, 'Ent – Eye – Odontology Department'),
(5, 'Gastroenterology Department'),
(6, 'Maternity Unit'),
(7, 'Neurology Department');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `activation_key` varchar(255) DEFAULT NULL,
  `actived` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_key` varchar(255) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `activation_key`, `actived`, `created_date`, `email`, `password`, `remember_key`, `sex`, `username`) VALUES
(1, NULL, 1, '2023-02-21 22:24:19', 'admin@gmail.com', '$2a$10$54Y5FJcv56/kA3Q9joFaAulVBFemfCz6FmfmnM/9Up1DwUgK5cmeO', NULL, NULL, 'admin'),
(2, NULL, 1, '2023-02-21 22:30:04', 'lantt@gmail.com', '$2a$10$OaEMhJ6WvYFlCdL7qsReeuNp9nfTsgKV0XBvpw.GMDqDBy0VsTnmG', NULL, NULL, 'lantt'),
(3, NULL, 1, '2023-02-21 22:32:41', 'tuanhm@gmail.com', '$2a$10$8Glo/eqoBPGA8CJQgaz/I.lpwLHzjHXwTN9t6vNOrlwCsrOeBwG/K', NULL, NULL, 'tuanhm'),
(4, NULL, 1, '2023-02-21 22:55:28', 'nguyenngocnhan2104@gmail.com', '$2a$10$6Jy9xaizpEEEiRbablzfEOTo0JhnRC7fIfgz7g5eqg2UvVAX3tCLS', NULL, 0, 'nhannt'),
(5, NULL, 1, '2023-02-21 23:02:55', 'hungmh@gmail.com', '$2a$10$li/xP82VtvgHeWo5KS6n5eU/OLxCHuefCCu7ccJMmfTa0kMlQ1A9W', NULL, 1, 'hungmh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_authority`
--

CREATE TABLE `user_authority` (
  `user_id` bigint(20) NOT NULL,
  `authority_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user_authority`
--

INSERT INTO `user_authority` (`user_id`, `authority_name`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_USER'),
(3, 'ROLE_DOCTOR'),
(4, 'ROLE_USER'),
(5, 'ROLE_DOCTOR');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `authority`
--
ALTER TABLE `authority`
  ADD PRIMARY KEY (`name`);

--
-- Chỉ mục cho bảng `detail_invoice`
--
ALTER TABLE `detail_invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKmt3tg7l0sp2hj0hyrglrmlbxr` (`invoice_id`),
  ADD KEY `FK8kn0u5spisf6f9x17gnjuayqc` (`medical_process_id`);

--
-- Chỉ mục cho bảng `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKpe805shixe4h39ty7mktc99l9` (`specialist_id`),
  ADD KEY `FK1kdokdbkomgra23x78ttur43p` (`user_id`);

--
-- Chỉ mục cho bảng `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKrn85j4orttpce4n7ltsarurhc` (`schedule_id`);

--
-- Chỉ mục cho bảng `medical_process`
--
ALTER TABLE `medical_process`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `patient_record`
--
ALTER TABLE `patient_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKet73j9jgpy8pseupwtaccxsb7` (`specialist_id`),
  ADD KEY `FK5biuumfh2h15hcw6cn0nqjxml` (`user_id`);

--
-- Chỉ mục cho bảng `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK8uaas49do848tochg1oaiku7j` (`patient_record_id`);

--
-- Chỉ mục cho bảng `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `schedules_as`
--
ALTER TABLE `schedules_as`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK6bh8wawg76kbtiar24klntwqf` (`doctor_id`),
  ADD KEY `FKe2i9rnm79u1ii8on4cmgd7bs1` (`patient_record_id`);

--
-- Chỉ mục cho bảng `specialist`
--
ALTER TABLE `specialist`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user_authority`
--
ALTER TABLE `user_authority`
  ADD PRIMARY KEY (`user_id`,`authority_name`),
  ADD KEY `FK6ktglpl5mjosa283rvken2py5` (`authority_name`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `detail_invoice`
--
ALTER TABLE `detail_invoice`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `medical_process`
--
ALTER TABLE `medical_process`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `patient_record`
--
ALTER TABLE `patient_record`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `requests`
--
ALTER TABLE `requests`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `schedules_as`
--
ALTER TABLE `schedules_as`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `specialist`
--
ALTER TABLE `specialist`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `detail_invoice`
--
ALTER TABLE `detail_invoice`
  ADD CONSTRAINT `FK8kn0u5spisf6f9x17gnjuayqc` FOREIGN KEY (`medical_process_id`) REFERENCES `medical_process` (`id`),
  ADD CONSTRAINT `FKmt3tg7l0sp2hj0hyrglrmlbxr` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`);

--
-- Các ràng buộc cho bảng `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `FK1kdokdbkomgra23x78ttur43p` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKpe805shixe4h39ty7mktc99l9` FOREIGN KEY (`specialist_id`) REFERENCES `specialist` (`id`);

--
-- Các ràng buộc cho bảng `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `FKrn85j4orttpce4n7ltsarurhc` FOREIGN KEY (`schedule_id`) REFERENCES `schedules_as` (`id`);

--
-- Các ràng buộc cho bảng `patient_record`
--
ALTER TABLE `patient_record`
  ADD CONSTRAINT `FK5biuumfh2h15hcw6cn0nqjxml` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKet73j9jgpy8pseupwtaccxsb7` FOREIGN KEY (`specialist_id`) REFERENCES `specialist` (`id`);

--
-- Các ràng buộc cho bảng `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `FK8uaas49do848tochg1oaiku7j` FOREIGN KEY (`patient_record_id`) REFERENCES `patient_record` (`id`);

--
-- Các ràng buộc cho bảng `schedules_as`
--
ALTER TABLE `schedules_as`
  ADD CONSTRAINT `FK6bh8wawg76kbtiar24klntwqf` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  ADD CONSTRAINT `FKe2i9rnm79u1ii8on4cmgd7bs1` FOREIGN KEY (`patient_record_id`) REFERENCES `patient_record` (`id`);

--
-- Các ràng buộc cho bảng `user_authority`
--
ALTER TABLE `user_authority`
  ADD CONSTRAINT `FK6ktglpl5mjosa283rvken2py5` FOREIGN KEY (`authority_name`) REFERENCES `authority` (`name`),
  ADD CONSTRAINT `FKpqlsjpkybgos9w2svcri7j8xy` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
