 CREATE TABLE IF NOT EXISTS `users` (   
     `user_id` int(11) NOT NULL AUTO_INCREMENT,   
     `username` varchar(20) NOT NULL,   
     `password` varchar(20) NOT NULL,   
     `enabled` tinyint(1) NOT NULL,   
     PRIMARY KEY (`user_id`),  
     KEY `username` (`username`)
 ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3;


 INSERT INTO `users` (
     `user_id`, 
     `username`, 
     `password`, 
     `enabled`) VALUES (1, 'test', 'password', 1), (2, 'test2', 'password', 1);


CREATE TABLE IF NOT EXISTS `authorities` ( 
    `username` varchar(20) NOT NULL,   
    `authority` varchar(20) NOT NULL,   
    KEY `username` (`username`)
	) ENGINE=InnoDB DEFAULT CHARSET=latin1;


 INSERT INTO `authorities` (
     `username`, `authority`) VALUES ('test', 'ROLE_ADMIN'), ('test', 'ROLE_USER'), ('test2', 'ROLE_USER');


 ALTER TABLE `authorities`   ADD CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`);