-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-12-09 07:17:06
-- 服务器版本： 5.7.11
-- PHP Version: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zsmdb`
--

-- --------------------------------------------------------

--
-- 表的结构 `clothes`
--

CREATE TABLE `clothes` (
  `sid` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `jiage` int(5) NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `clothes`
--

INSERT INTO `clothes` (`sid`, `jiage`, `type`) VALUES
('s1', 102, 'shangyi'),
('s2', 120, 'shangyi'),
('s3', 110, 'shangyi'),
('s4', 180, 'shangyi'),
('s5', 198, 'shangyi');

-- --------------------------------------------------------

--
-- 表的结构 `notes`
--

CREATE TABLE `notes` (
  `sid` int(5) NOT NULL,
  `title` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `notes`
--

INSERT INTO `notes` (`sid`, `title`, `user`, `content`, `date`) VALUES
(1, '书摘：年轻时的钱钟书', '灯下读书人', '世间有一种人外表温软，但内心实则十分强悍，钱钟书即是一例。钱钟书字默存，据说，是因为他小时候口无遮拦、常得罪人，为此父亲钱基博特地为他改字“默存”，意思是告诫他缄默无言、存念于心。钱钟书表面看着是一个谦虚、温和的人，其实不然，他骨子里有传统士人的那种倔强与狂狷。', '2017-12-07'),
(2, ' 硅谷10家明星初创公司是如何倒掉的 ', ' 灯下读书人 ', ' 近日，美国网站商业内幕（Business Insider）盘点了2017年死掉的10家硅谷明星初创公司，它们获得的风险投资额总计高达16.95亿美元，但它们没能挺过2017年。\r\n　　这些公司里，有红极一时的智能可穿戴设备品牌Jawbone，也有争议不断的果汁机公司Joicero，引发多起重大校园霸凌与威胁案件的匿名社交平台Yik Yak。 ', '2017-12-08');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `sid` int(5) NOT NULL COMMENT '编号',
  `name` varchar(10) CHARACTER SET utf8 NOT NULL COMMENT '姓名',
  `email` varchar(25) CHARACTER SET utf8 NOT NULL COMMENT '电子邮箱'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户表';

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`sid`, `name`, `email`) VALUES
(1001, '张大山', 'zds@163.cm'),
(1002, '李晓丽', 'lxs@abc.com'),
(1003, '王晓丽', 'wxl@163.com'),
(1004, '赵志坚', 'zzj@abc.com'),
(1005, ' 江飞燕 ', ' jfy@123.com '),
(1006, ' 凤凰传奇 ', ' fh@123.com '),
(1007, ' 战狼 ', ' zn@123.com ');

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE `users` (
  `name` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `psw` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `usersex` varchar(2) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`name`, `psw`, `email`, `mobile`, `usersex`) VALUES
('abcabc', 'abcabc', 'abc@abc.com', '12345678901', '男');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
