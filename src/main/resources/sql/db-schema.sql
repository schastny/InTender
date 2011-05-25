-- Время создания: Май 25 2011 г., 15:53

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

CREATE TABLE IF NOT EXISTS `articles` (
  `id` varchar(255) NOT NULL,
  `body` text,
  `title` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `divisions` (
  `id` int(11) NOT NULL auto_increment,
  `address` varchar(255) default NULL,
  `contacts` varchar(255) default NULL,
  `description` text,
  `fullTitle` varchar(255) default NULL,
  `managerEmail` varchar(255) default NULL,
  `title` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `tenders` (
  `id` int(11) NOT NULL auto_increment,
  `attachedDocName` varchar(255) default NULL,
  `publishDate` datetime default NULL,
  `title` varchar(255) default NULL,
  `division` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKD5B4F3FF2EBD34B7` (`division`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) default NULL,
  `role` varchar(255) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
