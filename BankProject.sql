use bankproject;

CREATE TABLE `logins` (
  `ID` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB ;

--
-- Dumping data for table `logins`
--

INSERT INTO `logins` (`ID`, `username`, `password`) VALUES
(1, 'hugh mcgovern', '123456'),
(2, 'John Malone', 'Betty');

-- --------------------------------------------------------


--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `ID` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `balance` int(10) NOT NULL
) ENGINE=InnoDB ;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`ID`, `firstname`, `lastname`, `address`, `balance`) VALUES
(103, 'Bobby', 'Ewing', 'South Fork south', 5678),
(108, 'Yanni', 'Zao', 'Bejing', 50500),
(112, 'Patricia', 'Smith', 'Belfast', 52500),
(135, 'Darren', 'Gillespie', 'London', 3050),
(141, 'Eric', 'Bond', 'Kensington', 1000),
(144, 'Jerome', 'Lepine', 'Lyon', 42250),
(159, 'Simon ', 'Reeve', 'London', 2300);

-- --------------------------------------------------------


-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `TransID` int(10) UNSIGNED NOT NULL,
  `Date` datetime NOT NULL DEFAULT current_timestamp(),
  `ReferenceID` int(10) NOT NULL,
  `Reference` varchar(255) NOT NULL,
  `Debit` int(10) NOT NULL,
  `Credit` int(10) NOT NULL,
  `Balance` int(10) NOT NULL
) ENGINE=InnoDB ;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`TransID`, `Date`, `ReferenceID`, `Reference`, `Debit`, `Credit`, `Balance`) VALUES
(1, '2020-12-28 10:37:50', 144, 'Transfer from 144', 100, 0, 400),
(2, '2020-12-28 10:37:50', 103, 'Transfer to 103', 0, 100, 1700),
(3, '2020-12-28 10:39:21', 144, 'Withdrawal from 144', 50, 0, 350),
(4, '2020-12-28 10:39:50', 144, 'Deposit to 144', 0, 50, 400),
(5, '2020-12-28 10:59:19', 144, 'Withdrawal from 144', 50, 0, 350),
(6, '2020-12-28 10:59:54', 103, 'Transfer from 103', 700, 0, 1000),
(11, '2020-12-28 13:56:40', 145, 'Deposit to 145', 0, 50, 550),
(12, '2020-12-28 13:58:13', 145, 'Withdrawal from 145', 50, 0, 500),
(13, '2020-12-28 14:00:31', 144, 'Transfer from 144', 500, 0, 550),
(15, '2020-12-28 15:20:07', 145, 'Withdrawal from 145', 50, 0, 450),
(25, '2020-12-28 18:35:34', 112, 'Withdrawal from 112', 50, 0, 450),
(26, '2020-12-28 18:45:25', 108, 'Withdrawal from 108', 50, 0, 950),
(28, '2020-12-28 20:24:53', 103, 'Deposit to 103', 0, 5, 1005),
(30, '2020-12-29 13:20:02', 108, 'Transfer to 108', 0, 5, 955),
(33, '2020-12-29 16:51:01', 108, 'Withdrawal from 108', 55, 0, 900),
(34, '2020-12-29 17:03:48', 146, 'Withdrawal from 146', 50, 0, 900),
(35, '2020-12-29 17:48:01', 135, 'Deposit to 135', 0, 50, 550),
(36, '2020-12-29 22:09:15', 103, 'Transfer from 103', 500, 0, 500),
(37, '2020-12-29 22:09:15', 108, 'Transfer to 108', 0, 500, 1400),
(38, '2020-12-30 11:31:51', 143, 'Deposit to 143', 0, 50, 550),
(39, '2021-06-14 16:49:44', 103, 'Withdrawal from 103', 100, 0, 400),
(40, '2021-06-14 16:50:23', 103, 'Deposit to 103', 0, 50, 450),
(41, '2021-06-14 16:53:47', 103, 'Transfer from 103', 50, 0, 400),
(42, '2021-06-14 16:53:47', 108, 'Transfer to 108', 0, 50, 1450),
(43, '2021-06-14 19:36:42', 144, 'Withdrawal from 144', 75, 0, 425),
(44, '2021-06-14 19:37:18', 144, 'Transfer from 144', 75, 0, 350),
(45, '2021-06-14 19:37:18', 103, 'Transfer to 103', 0, 75, 475),
(46, '2021-10-11 20:08:14', 103, 'Withdrawal from 103', 75, 0, 400),
(47, '2021-12-05 21:13:31', 108, 'Withdrawal from 108', 50, 0, 1400),
(48, '2022-04-07 18:51:32', 112, 'Withdrawal from 112', 5758, 0, -5308),
(49, '2022-04-07 18:55:26', 112, 'Deposit to 112', 0, 5308, 0),
(50, '2022-09-08 20:12:54', 108, 'Withdrawal from 108', 400, 0, 1000),
(51, '2022-09-09 12:50:44', 103, 'Withdrawal from 103', 200, 0, 200),
(52, '2024-10-17 21:02:40', 103, 'Withdrawal from 103', 75, 0, 125),
(53, '2024-11-04 14:19:33', 103, 'Deposit to 103', 0, 55000, 55125),
(54, '2024-11-04 20:18:55', 103, 'Withdrawal from 103', 30000, 0, 25125),
(55, '2024-11-04 20:19:37', 112, 'Deposit to 112', 0, 2500, 2500),
(56, '2024-11-04 20:20:44', 103, 'Transfer from 103', 5300, 0, 19825),
(58, '2024-11-05 10:49:12', 103, 'Withdrawal from 103', 9825, 0, 10000),
(59, '2024-12-13 18:42:25', 108, 'Deposit to 108', 0, 55000, 56000),
(60, '2024-12-15 19:45:18', 135, 'Deposit to 135', 0, 7500, 8050),
(61, '2025-01-31 19:36:54', 150, 'Deposit to 150', 0, 5000, 5456),
(62, '2025-01-31 19:54:25', 157, 'Withdrawal from 157', 1000, 0, 4000),
(63, '2025-01-31 20:03:48', 147, 'Transfer from 147', 4000, 0, 4300),
(64, '2025-01-31 20:03:48', 157, 'Transfer to 157', 0, 4000, 8000),
(65, '2025-01-31 20:04:11', 147, 'Deposit to 147', 0, 500, 4800),
(66, '2025-01-31 20:17:44', 144, 'Deposit to 144', 0, 5000, 5350),
(67, '2025-01-31 20:22:24', 144, 'Withdrawal from 144', 200, 0, 5150),
(68, '2025-01-31 20:51:25', 141, 'Deposit to 141', 0, 800, 1100),
(69, '2025-01-31 21:00:44', 144, 'Withdrawal from 144', 150, 0, 5000),
(70, '2025-02-01 07:25:13', 144, 'Withdrawal from 144', 500, 0, 4500),
(71, '2025-02-01 07:26:07', 144, 'Transfer from 144', 500, 0, 4000),
(72, '2025-02-01 07:26:07', 141, 'Transfer to 141', 0, 500, 1600),
(73, '2025-02-01 08:19:04', 144, 'Withdrawal from 144', 1750, 0, 2250),
(74, '2025-02-01 12:07:01', 135, 'Deposit to 135', 0, 75000, 83050),
(75, '2025-02-01 15:37:35', 135, 'Withdrawal from 135', 40000, 0, 43050),
(76, '2025-02-01 15:38:44', 135, 'Transfer from 135', 40000, 0, 3050),
(77, '2025-02-01 15:38:44', 144, 'Transfer to 144', 0, 40000, 42250),
(78, '2025-02-01 15:51:11', 141, 'Withdrawal from 141', 600, 0, 1000),
(79, '2025-02-01 16:23:36', 103, 'Transfer from 103', 5000, 0, 5000),
(80, '2025-02-01 16:23:36', 108, 'Transfer to 108', 0, 5000, 61000),
(81, '2025-02-01 19:18:59', 108, 'Deposit to 108', 0, 82000, 143000),
(82, '2025-02-02 15:31:07', 108, 'Withdrawal from 108', 43000, 0, 100000),
(83, '2025-02-02 15:32:24', 108, 'Transfer from 108', 50000, 0, 50000),
(84, '2025-02-02 15:32:24', 112, 'Transfer to 112', 0, 50000, 52500),
(85, '2025-02-08 10:28:49', 103, 'Withdrawal from 103', 2500, 0, 2500),
(86, '2025-02-08 10:37:11', 103, 'Deposit to 103', 0, 100, 2600),
(87, '2025-02-08 20:19:58', 103, 'Withdrawal from 103', 542, 0, 2058),
(88, '2025-02-19 14:51:09', 103, 'Withdrawal from 103', 50, 0, 700),
(89, '2025-02-25 16:58:27', 103, 'Withdrawal from 103', 200, 0, 500),
(90, '2025-02-25 16:59:39', 103, 'Deposit to 103', 0, 300, 800),
(91, '2025-03-01 11:21:48', 103, 'Deposit to 103', 0, 200, 1000),
(92, '2025-03-07 15:01:57', 103, 'Withdrawal from 103', 500, 0, 500),
(93, '2025-03-07 15:08:12', 103, 'Transfer from 103', 500, 0, 0),
(94, '2025-03-07 15:08:12', 108, 'Transfer to 108', 0, 500, 50500),
(95, '2025-03-14 15:24:29', 103, 'Deposit to 103', 0, 5678, 5678);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `logins`
--
ALTER TABLE `logins`
  ADD PRIMARY KEY (`ID`);


-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`ID`);

--

-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`TransID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `TransID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;
--