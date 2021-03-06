SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE IF NOT EXISTS 'posts'(
	`post_id` int(11) NOT NULL AUTO_INCREMENT,
	`created_date` datetime DEFAULT NOW() NULL,
	`live_date` datetime DEFAULT NULL,
	`take_down_date` datetime DEFAULT NULL,
	`post_content` MEDIUMTEXT() DEFAULT NULL,
	`user_id_created_by` int(11) NOT NULL, 
	`user_id_last_update` int(11) NOT NULL, 
	`last_updated_at` TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, --I added this to our DB schema
    PRIMARY KEY (post_id),
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
	`role_description` text() NOT NULL,
	PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `comments`(
	`commment_id` int(11) NOT NULL AUTO_INCREMENT,
	`comment_content` MEDIUMTEXT() DEFAULT NULL, 
	`commmenter_name` varchar(50) DEFAULT "anonymous",
	`post_id` int(11) NOT NULL, 
	PRIMARY KEY (`comment_id`),
	KEY (`post_id`) 					
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `post_hashtag_bridge`(
	`user_id` int(11) NOT NULL,
	`hashtag_id` int(11) NOT NULL,
	KEY (`user_id`),
	KEY (`hash_tag_id`)
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
 	`page_content` MEDIUMTEXT default NULL,
 	PRIMARY KEY (`static_page_id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

  CREATE TABLE IF NOT EXISTS `images`(
  	`image_id` int(11) NOT NULL AUTO_INCREMENT,
  	`image_name` varchar(60) NOT NULL,
  	`image_type` varchar(10) NOT NULL,
  	`image_data` mediumblob NOT NULL
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

ALTER TABLE `post_hastag_bridge`
	ADD CONSTRAINT `post_hashtag_idfk_1` FOREIGN KEY (`user_id`) REFERENCES
	`users`(`user_id`) ON DELETE NO ACTION,
	ADD CONSTRAINT `post_hashtag_idfk_2` FOREIGN KEY (`hashtag_id`) REFERENCES
	`hashtags`(`hastag_id`) ON DELETE NO ACTION;

ALTER TABLE `posts`
	ADD CONSTRAINT `posts_fk1` FOREIGN KEY (`user_id_created_by`) REFERENCES
	`users` (`user_id`) ON DELETE NO ACTION,
		ADD CONSTRAINT `posts_fk2` FOREIGN KEY (`user_id_last_update`) REFERENCES
	`users` (`user_id`) ON DELETE NO ACTION;

ALTER TABLE `users`
	ADD CONSTRAINT `users_fk1` FOREIGN KEY (`role_id`) REFERENCES
	`roles` (`role_id`) ON DELETE NO ACTION;
