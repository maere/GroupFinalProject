SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE IF NOT EXISTS `posts`(
	`post_id` int(11) NOT NULL AUTO_INCREMENT,
	`created_date` datetime NOT NULL,
	`live_date` datetime NULL,
	`take_down_date` datetime NULL,
	`post_content` MEDIUMTEXT NULL,
	`last_updated_at` datetime NULL, 
	`user_id_created_by` int(11) NOT NULL, 
	`user_id_last_update` int(11) NOT NULL, 
    PRIMARY KEY (`post_id`),
    KEY `user_id_created_by` (`user_id_created_by`), 
    KEY `user_id_last_update`(`user_id_last_update`)
    ) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `users`(
	`user_id` int(11) NOT NULL AUTO_INCREMENT,
	`user_name` varchar(40) NOT NULL UNIQUE, 
	`password` varchar(25) NOT NULL,
	`role_id` int(11) NOT NULL, 
	PRIMARY KEY (`user_id`),
	KEY (`role_id`) 					
)  ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `roles`(
	`role_id` int(11) NOT NULL AUTO_INCREMENT,
	`role_title` varchar(100) NOT NULL,
	`role_description` varchar(512) NOT NULL,
	PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `comments`(
	`comment_id` int(11) NOT NULL AUTO_INCREMENT,
	`comment_content` MEDIUMTEXT NULL, 
	`commenter_name` varchar(50) DEFAULT 'anonymous',
	`post_id` int(11) NOT NULL, 
	PRIMARY KEY (`comment_id`),
	KEY (`post_id`) 					
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `post_hashtag_bridge`(
	`post_id` int(11) NOT NULL,
	`hashtag_id` int(11) NOT NULL,
	KEY (`post_id`),
	KEY (`hashtag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `hashtags`(
	`hashtag_id` int(11) NOT NULL AUTO_INCREMENT,
	`hashtag_name`  varchar(50) NOT NULL,
	PRIMARY KEY (`hashtag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `post_category_bridge`(
	`category_id` int(11) NOT NULL,
	`post_id` int(11) NOT NULL,
	KEY (`category_id`),
	KEY (`post_id`)
)  ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `categories`(
	`category_id` int(11) NOT NULL AUTO_INCREMENT,
	`category_title` varchar(50) NOT NULL, 
	`description` varchar(255),
	PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

 -- disconnected tables  are `staticPages' and `images'
 CREATE TABLE IF NOT EXISTS `static_pages`(
 	`static_page_id` int(11) NOT NULL AUTO_INCREMENT,
 	`page_title` varchar(50) NOT NULL,
 	`page_content` MEDIUMTEXT NULL,
 	PRIMARY KEY (`static_page_id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

  CREATE TABLE IF NOT EXISTS `images`(
  	`image_id` int(11) NOT NULL AUTO_INCREMENT,
  	`image_name` varchar(60) NOT NULL,
  	`image_type` varchar(10) NOT NULL,
  	`image_data` mediumblob NOT NULL,
  	PRIMARY KEY (`image_id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- constraints

 ALTER TABLE `comments`
	ADD CONSTRAINT `comments_fk1` FOREIGN KEY (`post_id`) REFERENCES
		`posts` (`post_id`) ON DELETE NO ACTION;

ALTER TABLE `post_category_bridge`
	ADD CONSTRAINT `post_category_idfk_1` FOREIGN KEY (`category_id`) REFERENCES
	`categories`(`category_id`) ON DELETE NO ACTION,
	ADD CONSTRAINT `post_category_idfk_2` FOREIGN KEY (`post_id`) REFERENCES
	`posts`(`post_id`) ON DELETE NO ACTION;

ALTER TABLE `post_hashtag_bridge`
	ADD CONSTRAINT `post_hashtag_idfk_1` FOREIGN KEY (`post_id`) REFERENCES
	`posts`(`post_id`) ON DELETE NO ACTION,
	ADD CONSTRAINT `post_hashtag_idfk_2` FOREIGN KEY (`hashtag_id`) REFERENCES
	`hashtags`(`hashtag_id`) ON DELETE NO ACTION;

ALTER TABLE `posts`
	ADD CONSTRAINT `posts_fk1` FOREIGN KEY (`user_id_created_by`) REFERENCES
	`users` (`user_id`) ON DELETE NO ACTION,
		ADD CONSTRAINT `posts_fk2` FOREIGN KEY (`user_id_last_update`) REFERENCES
	`users` (`user_id`) ON DELETE NO ACTION;

ALTER TABLE `users`
	ADD CONSTRAINT `users_fk1` FOREIGN KEY (`role_id`) REFERENCES
	`roles` (`role_id`) ON DELETE NO ACTION;

-- CREATE TRIGGER post_insert BEFORE INSERT ON `posts`
    -- FOR EACH ROW SET NEW.startdate = NOW(), NEW.lastdate = NOW();

-- ALTER TABLE `posts` 
	-- ADD CONSTRAINT
    -- `created_date` DEFAULT NOW() FOR `created_date`;