CREATE TABLE `tweets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tweet_time` datetime NOT NULL,
  `tweet` text NOT NULL,
  `favorite_count` int(11) NOT NULL DEFAULT '0',
  `retweet_count` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(255) NOT NULL DEFAULT '',
  `tweet_url` varchar(255) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `tweet_id` varchar(255) NOT NULL DEFAULT '',
  `tweet_point` int(11) NOT NULL,
  `user_image` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;