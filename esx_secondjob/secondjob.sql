USE `essentialmode`;

ALTER TABLE `users`
	ADD COLUMN `job2` varchar(255) NULL DEFAULT 'unemployed2' AFTER `job_grade`,
	ADD COLUMN `job_grade2` INT NULL DEFAULT 0 AFTER `job2`
;

CREATE TABLE `jobs2` (
	`name` varchar(50) NOT NULL,
	`label` varchar(255) DEFAULT NULL,

	PRIMARY KEY (`name`)
);

INSERT INTO `jobs2` VALUES ('unemployed2','Arbeitslos');


CREATE TABLE `job_grades2` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`job_name` varchar(255) DEFAULT NULL,
	`grade` int(11) NOT NULL,
	`name` varchar(255) NOT NULL,
	`label` varchar(255) NOT NULL,
	`salary` int(11) NOT NULL,
	`skin_male` longtext NOT NULL,
	`skin_female` longtext NOT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `job_grades2` VALUES (1,'unemployed2',0,'rsa','Los Angeles',5,'{}','{}')
;



