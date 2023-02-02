-- phpMyAdmin SQL Dump
-- version 2.11.2.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017 年 01 月 23 日 01:35
-- 服务器版本: 5.0.45
-- PHP 版本: 5.2.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- 数据库: `zsmdb`
--

-- --------------------------------------------------------

--
-- 表的结构 `clothes`
--

CREATE TABLE `clothes` (
  `sid` varchar(5) collate utf8_unicode_ci NOT NULL,
  `jiage` int(3) NOT NULL,
  `type` varchar(10) collate utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 导出表中的数据 `clothes`
--

INSERT INTO `clothes` (`sid`, `jiage`, `type`) VALUES
('s1', 102, 'shangyi'),
('s2', 120, 'shangyi'),
('s3', 110, 'shangyi'),
('s4', 180, 'shangyi'),
('s5', 198, 'shangyi');
