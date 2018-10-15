USE `essentialmode`;

ALTER TABLE `users`
	ADD COLUMN `job2` varchar(255) NULL DEFAULT 'unemployed2' AFTER `job_grade`,
	ADD COLUMN `job_grade2` INT NULL DEFAULT 0 AFTER `job2`
;

----insert in jobs
INSERT INTO `jobs` VALUES ('unemployed2','Arbeitslos');


---just with your sql you are not following steps as it is described 

---- Why create a job_grade table ?
CREATE TABLE `jobs2` (
	`name` varchar(50) NOT NULL,
	`label` varchar(255) DEFAULT NULL,

	PRIMARY KEY (`name`)
);



---- Why create a job_grade table delete that?
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
---- Why create a job_grade table delete that?
INSERT INTO `job_grades2` VALUES (1,'unemployed2',0,'rsa','Los Angeles',5,'{}','{}')
;



