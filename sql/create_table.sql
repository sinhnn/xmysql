
CREATE DATABASE `snnbot` /*!40100 DEFAULT CHARACTER SET latin1 */;
CREATE TABLE `snnbot.proxy` (
  `id` varchar(255) NOT NULL, -- full proxy string
  `country` varchar(45) DEFAULT NULL,
  `scheme` varchar(45) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `port` varchar(45) DEFAULT NULL,
  `__from` varchar(255) DEFAULT NULL, -- JSON
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `snnbot.user` (
  `id` int(11) NOT NULL,
  `browser` varchar(45) DEFAULT NULL COMMENT 'typeof browser: chrome or firefox',
  `pc` varchar(255) DEFAULT NULL COMMENT 'LAN IP of PC',
  `user_data_dir` text DEFAULT NULL COMMENT 'chrome --usr-data-dir',
  `proxy_server` text DEFAULT NULL COMMENT 'chrome --proxy-server',
  `country` varchar(45) DEFAULT NULL,
  `accounts` TEXT DEFAULT NULL COMMENT 'chrome passwords.csv',
  PRIMARY KEY (`id`),
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `snnbot.fbuser` (
  `id` varchar(45) NOT NULL,
  `userid` int(11) DEFAULT NULL COMMENT 'link to user table',
  -- add more specific fbuser information
  PRIMARY KEY (`id`),
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `snnbot.gguser` (
  `id` varchar(45) NOT NULL,
  `userid` int(11) DEFAULT NULL COMMENT 'link to user table',
  -- add more specific fbuser information
  PRIMARY KEY (`id`),
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `snnbot.channel` (
  `id` varchar(45) NOT NULL,
  `url` TEXT,
  `domain` varchar(45) DEFAULT NULL,
  `tags` varchar(45) DEFAULT NULL,
  `upload_timestamp` int(12) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `users` JSON DEFAULT [],
  `convert_in` TEXT DEFAULT NULL COMMENT "convert command to clean video",
  `convert_out` TEXT DEFAULT NULL COMMENT "convert command to add channel signature to video",
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `snnbot.video` (
  `id` int(16) NOT NULL,
  `url` TEXT DEFAULT NULL,
  `domain` varchar(45) DEFAULT NULL,
  `channel_id` varchar(45) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `localpath` text DEFAULT NULL COMMENT 'local path in NAS',
  `uploaded_timestamp` int(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `snnbot.uploaded_video` (
  `id` int(11) NOT NULL,
  `url` TEXT DEFAULT NULL,
  `__from` text DEFAULT NULL COMMENT "source video url",
  `channel` varchar(45) DEFAULT NULL COMMENT "where to upload",
  `description` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `localpath` text DEFAULT NULL COMMENT 'local path in PC',
  `uploaded_timestamp` varchar(45) DEFAULT NULL,
  `uploaded_by` varchar(45) DEFAULT NULL COMMENT 'user who uploaed video'
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
