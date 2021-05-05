-- drop database if exist
DROP DATABASE IF EXISTS `sltwelfare`;


-- create new database
CREATE DATABASE `sltwelfare`;
USE `sltwelfare`;


-- set max allowed packet size
set global max_allowed_packet = 64000000;


-- table definitions
CREATE TABLE `approvedbenefitstatus`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(25) NULL
);

CREATE TABLE `approvedloanrequeststatus`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(25) NULL
);

CREATE TABLE `benefitrequeststatus`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(25) NULL
);

CREATE TABLE `benefitstatus`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(12) NULL
);

CREATE TABLE `civilstatus`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(15) NULL
);

CREATE TABLE `designation`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(20) NULL
);

CREATE TABLE `endorsedbenefitstatus`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(25) NULL
);

CREATE TABLE `endorsedloanrequeststatus`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(25) NULL
);

CREATE TABLE `gender`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(6) NULL
);

CREATE TABLE `guarantedloanrequeststatus`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(25) NULL
);

CREATE TABLE `loanpaymentstatus`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(25) NULL
);

CREATE TABLE `loanrequeststatus`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(25) NULL
);

CREATE TABLE `membercategory`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(20) NULL
);

CREATE TABLE `memberfeestatus`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(10) NULL
);

CREATE TABLE `memberstatus`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(20) NULL
);

CREATE TABLE `nametitle`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(10) NULL
);

CREATE TABLE `approvedbenefit`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `code` CHAR(10) NOT NULL,
    `endorsedbenefit_id` INT NOT NULL,
    `approveddate` DATE NOT NULL,
    `document` CHAR(36) NULL,
    `amount` DECIMAL(10,2) NOT NULL,
    `description` TEXT NULL,
    `approvedbenefitstatus_id` INT NOT NULL,
    `tocreation` DATETIME NULL,
    `creator_id` INT NOT NULL
);

CREATE TABLE `approvedloanrequest`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `code` CHAR(10) NOT NULL,
    `endorsedloanrequest_id` INT NOT NULL,
    `approveddate` DATE NOT NULL,
    `amount` DECIMAL(10,2) NOT NULL,
    `duration` INT(3) NOT NULL,
    `description` TEXT NULL,
    `approvedloanrequeststatus_id` INT NOT NULL,
    `tocreation` DATETIME NULL,
    `creator_id` INT NOT NULL
);

CREATE TABLE `benefit`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `code` CHAR(8) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `amount` DECIMAL(10,2) NOT NULL,
    `description` TEXT NULL,
    `benefitstatus_id` INT NOT NULL,
    `tocreation` DATETIME NULL,
    `creator_id` INT NOT NULL
);

CREATE TABLE `benefitpayment`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `code` CHAR(10) NOT NULL,
    `approvedbenefit_id` INT NOT NULL,
    `amount` DECIMAL(10,2) NOT NULL,
    `paiddate` DATE NULL,
    `description` TEXT NULL,
    `tocreation` DATETIME NULL,
    `creator_id` INT NOT NULL
);

CREATE TABLE `benefitrequest`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `code` CHAR(10) NOT NULL,
    `welfaremember_id` INT NOT NULL,
    `benefit_id` INT NOT NULL,
    `dorequesed` DATE NOT NULL,
    `document` CHAR(36) NULL,
    `amount` DECIMAL(10,2) NULL,
    `description` TEXT NULL,
    `benefitrequeststatus_id` INT NOT NULL,
    `tocreation` DATETIME NULL,
    `creator_id` INT NOT NULL
);

CREATE TABLE `endorsedbenefit`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `code` CHAR(10) NOT NULL,
    `benefitrequest_id` INT NOT NULL,
    `endorseddate` DATE NOT NULL,
    `document` CHAR(36) NULL,
    `amount` DECIMAL(10,2) NOT NULL,
    `description` TEXT NULL,
    `endorsedbenefitstatus_id` INT NOT NULL,
    `tocreation` DATETIME NULL,
    `creator_id` INT NOT NULL
);

CREATE TABLE `endorsedloanrequest`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `code` CHAR(10) NOT NULL,
    `guarantedloanrequest_id` INT NOT NULL,
    `endorseddate` DATE NOT NULL,
    `amount` DECIMAL(10,2) NOT NULL,
    `duration` INT(3) NOT NULL,
    `description` TEXT NULL,
    `endorsedloanrequeststatus_id` INT NOT NULL,
    `tocreation` DATETIME NULL,
    `creator_id` INT NOT NULL
);

CREATE TABLE `eventincome`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `welfareevent_id` INT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `amount` DECIMAL(10,2) NULL,
    `description` TEXT NULL
);

CREATE TABLE `moneysponsorship`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `welfareevent_id` INT NOT NULL,
    `sponsor` VARCHAR(255) NOT NULL,
    `amount` DECIMAL(10,2) NULL
);

CREATE TABLE `othersponsorship`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `welfareevent_id` INT NOT NULL,
    `sponsor` VARCHAR(255) NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `description` TEXT NULL
);

CREATE TABLE `eventexpense`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `welfareevent_id` INT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `amount` DECIMAL(10,2) NULL,
    `invoice` CHAR(36) NULL,
    `description` TEXT NULL
);

CREATE TABLE `welfareevent`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `code` CHAR(10) NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `date` DATE NOT NULL,
    `description` TEXT NULL,
    `tocreation` DATETIME NULL,
    `creator_id` INT NOT NULL
);

CREATE TABLE `guarantedloanrequest`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `code` CHAR(10) NOT NULL,
    `loanrequest_id` INT NOT NULL,
    `guaranteeddate` DATE NOT NULL,
    `amount` DECIMAL(10,2) NOT NULL,
    `duration` INT(3) NOT NULL,
    `description` TEXT NULL,
    `guarantedloanrequeststatus_id` INT NOT NULL,
    `tocreation` DATETIME NULL,
    `creator_id` INT NOT NULL
);

CREATE TABLE `loanpayment`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `code` CHAR(10) NOT NULL,
    `approvedloanrequest_id` INT NOT NULL,
    `date` DATE NOT NULL,
    `amount` DECIMAL(10,2) NOT NULL,
    `duration` INT(3) NOT NULL,
    `interestrate` DECIMAL(5,2) NOT NULL,
    `interest` DECIMAL(10,2) NOT NULL,
    `balance` DECIMAL(10,2) NULL,
    `maturitydate` DATE NULL,
    `description` TEXT NULL,
    `loanpaymentstatus_id` INT NOT NULL,
    `tocreation` DATETIME NULL,
    `creator_id` INT NOT NULL
);

CREATE TABLE `loanrepayment`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `code` CHAR(11) NOT NULL,
    `loanpayment_id` INT NOT NULL,
    `amount` DECIMAL(10,2) NOT NULL,
    `paiddate` DATE NOT NULL,
    `description` TEXT NULL,
    `tocreation` DATETIME NULL,
    `creator_id` INT NOT NULL
);

CREATE TABLE `loanrequest`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `code` CHAR(10) NOT NULL,
    `welfaremember_id` INT NOT NULL,
    `guarantor_id` INT NOT NULL,
    `requestdate` DATE NOT NULL,
    `amount` DECIMAL(10,2) NOT NULL,
    `duration` INT(3) NOT NULL,
    `reason` VARCHAR(255) NULL,
    `description` TEXT NULL,
    `loanrequeststatus_id` INT NOT NULL,
    `tocreation` DATETIME NULL,
    `creator_id` INT NOT NULL
);

CREATE TABLE `welfaremember`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `code` CHAR(8) NOT NULL,
    `membercategory_id` INT NOT NULL,
    `nametitle_id` INT NOT NULL,
    `callingname` VARCHAR(255) NOT NULL,
    `fullname` VARCHAR(255) NOT NULL,
    `civilstatus_id` INT NOT NULL,
    `dobirth` DATE NOT NULL,
    `gender_id` INT NOT NULL,
    `nic` VARCHAR(12) NOT NULL,
    `photo` CHAR(36) NULL,
    `mobile` CHAR(10) NOT NULL,
    `land` CHAR(10) NULL,
    `email` VARCHAR(255) NULL,
    `address` TEXT NOT NULL,
    `designation_id` INT NOT NULL,
    `dojoined` DATE NOT NULL,
    `allowloanrequest` TINYINT NULL DEFAULT true,
    `description` TEXT NULL,
    `memberstatus_id` INT NOT NULL,
    `tocreation` DATETIME NULL,
    `creator_id` INT NOT NULL
);

CREATE TABLE `memberesignation`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `code` CHAR(8) NOT NULL,
    `welfaremember_id` INT NOT NULL,
    `reason` VARCHAR(255) NOT NULL,
    `withdrawalamount` DECIMAL(10,2) NULL,
    `document` CHAR(36) NULL,
    `description` TEXT NULL,
    `tocreation` DATETIME NULL,
    `creator_id` INT NOT NULL
);

CREATE TABLE `memberfee`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `code` CHAR(10) NOT NULL,
    `welfaremember_id` INT NOT NULL,
    `amount` DECIMAL(10,2) NOT NULL,
    `duedate` DATE NOT NULL,
    `paiddate` DATE NULL,
    `description` TEXT NULL,
    `memberfeestatus_id` INT NOT NULL,
    `tocreation` DATETIME NULL,
    `creator_id` INT NOT NULL
);

CREATE TABLE `user`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(50) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `status` VARCHAR(20) NOT NULL,
    `tocreation` DATETIME NULL,
    `tolocked` DATETIME NULL,
    `failedattempts` INT NULL DEFAULT 0,
    `creator_id` INT NULL,
    `photo` CHAR(36) NULL,
    `welfaremember_id` INT NULL
);

CREATE TABLE `userrole`(
    `user_id` INT NOT NULL,
    `role_id` INT NOT NULL
);

CREATE TABLE `role`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `tocreation` DATETIME NULL,
    `creator_id` INT NOT NULL
);

CREATE TABLE `systemmodule`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL
);

CREATE TABLE `usecase`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `task` VARCHAR(255) NOT NULL,
    `systemmodule_id` INT NOT NULL
);

CREATE TABLE `roleusecase`(
    `role_id` INT NOT NULL,
    `usecase_id` INT NOT NULL
);

CREATE TABLE `notification`(
    `id` CHAR(36) NOT NULL,
    `dosend` DATETIME NOT NULL,
    `dodelivered` DATETIME NULL,
    `doread` DATETIME NULL,
    `message` TEXT NOT NULL,
    `user_id` INT NOT NULL
);

CREATE TABLE `token`(
    `id` CHAR(36) NOT NULL,
    `tocreation` DATETIME NULL,
    `toexpiration` DATETIME NULL,
    `ip` VARCHAR(100) NULL,
    `status` VARCHAR(20) NULL,
    `user_id` INT NOT NULL
);

CREATE TABLE `servicelog`(
    `id` CHAR(36) NOT NULL,
    `method` VARCHAR(10) NULL,
    `responsecode` INT NULL,
    `ip` VARCHAR(100) NULL,
    `torequest` DATETIME NULL,
    `url` TEXT NULL,
    `handler` VARCHAR(255) NULL,
    `token_id` CHAR(36) NULL
);

CREATE TABLE `file`(
    `id` CHAR(36) NOT NULL,
    `file` MEDIUMBLOB NULL,
    `thumbnail` MEDIUMBLOB NULL,
    `filemimetype` VARCHAR(255) NULL,
    `thumbnailmimetype` VARCHAR(255) NULL,
    `filesize` INT NULL,
    `originalname` VARCHAR(255) NULL,
    `tocreation` DATETIME NULL,
    `isused` TINYINT NULL DEFAULT 0
);



-- primary key definitions
ALTER TABLE `userrole` ADD CONSTRAINT pk_userrole PRIMARY KEY (`user_id`,`role_id`);
ALTER TABLE `roleusecase` ADD CONSTRAINT pk_roleusecase PRIMARY KEY (`role_id`,`usecase_id`);
ALTER TABLE `notification` ADD CONSTRAINT pk_notification PRIMARY KEY (`id`);
ALTER TABLE `token` ADD CONSTRAINT pk_token PRIMARY KEY (`id`);
ALTER TABLE `servicelog` ADD CONSTRAINT pk_servicelog PRIMARY KEY (`id`);
ALTER TABLE `file` ADD CONSTRAINT pk_file PRIMARY KEY (`id`);


-- unique key definitions
ALTER TABLE `approvedbenefit` ADD CONSTRAINT unique_approvedbenefit_code UNIQUE (`code`);
ALTER TABLE `approvedbenefit` ADD CONSTRAINT unique_approvedbenefit_endorsedbenefit_id UNIQUE (`endorsedbenefit_id`);
ALTER TABLE `approvedloanrequest` ADD CONSTRAINT unique_approvedloanrequest_code UNIQUE (`code`);
ALTER TABLE `approvedloanrequest` ADD CONSTRAINT unique_approvedloanrequest_endorsedloanrequest_id UNIQUE (`endorsedloanrequest_id`);
ALTER TABLE `benefit` ADD CONSTRAINT unique_benefit_code UNIQUE (`code`);
ALTER TABLE `benefit` ADD CONSTRAINT unique_benefit_name UNIQUE (`name`);
ALTER TABLE `benefitpayment` ADD CONSTRAINT unique_benefitpayment_code UNIQUE (`code`);
ALTER TABLE `benefitpayment` ADD CONSTRAINT unique_benefitpayment_approvedbenefit_id UNIQUE (`approvedbenefit_id`);
ALTER TABLE `benefitrequest` ADD CONSTRAINT unique_benefitrequest_code UNIQUE (`code`);
ALTER TABLE `endorsedbenefit` ADD CONSTRAINT unique_endorsedbenefit_code UNIQUE (`code`);
ALTER TABLE `endorsedbenefit` ADD CONSTRAINT unique_endorsedbenefit_benefitrequest_id UNIQUE (`benefitrequest_id`);
ALTER TABLE `endorsedloanrequest` ADD CONSTRAINT unique_endorsedloanrequest_code UNIQUE (`code`);
ALTER TABLE `endorsedloanrequest` ADD CONSTRAINT unique_endorsedloanrequest_guarantedloanrequest_id UNIQUE (`guarantedloanrequest_id`);
ALTER TABLE `welfareevent` ADD CONSTRAINT unique_welfareevent_code UNIQUE (`code`);
ALTER TABLE `welfareevent` ADD CONSTRAINT unique_welfareevent_title UNIQUE (`title`);
ALTER TABLE `guarantedloanrequest` ADD CONSTRAINT unique_guarantedloanrequest_code UNIQUE (`code`);
ALTER TABLE `guarantedloanrequest` ADD CONSTRAINT unique_guarantedloanrequest_loanrequest_id UNIQUE (`loanrequest_id`);
ALTER TABLE `loanpayment` ADD CONSTRAINT unique_loanpayment_code UNIQUE (`code`);
ALTER TABLE `loanpayment` ADD CONSTRAINT unique_loanpayment_approvedloanrequest_id UNIQUE (`approvedloanrequest_id`);
ALTER TABLE `loanrepayment` ADD CONSTRAINT unique_loanrepayment_code UNIQUE (`code`);
ALTER TABLE `loanrequest` ADD CONSTRAINT unique_loanrequest_code UNIQUE (`code`);
ALTER TABLE `welfaremember` ADD CONSTRAINT unique_welfaremember_code UNIQUE (`code`);
ALTER TABLE `welfaremember` ADD CONSTRAINT unique_welfaremember_nic UNIQUE (`nic`);
ALTER TABLE `welfaremember` ADD CONSTRAINT unique_welfaremember_mobile UNIQUE (`mobile`);
ALTER TABLE `welfaremember` ADD CONSTRAINT unique_welfaremember_email UNIQUE (`email`);
ALTER TABLE `memberesignation` ADD CONSTRAINT unique_memberesignation_code UNIQUE (`code`);
ALTER TABLE `memberesignation` ADD CONSTRAINT unique_memberesignation_welfaremember_id UNIQUE (`welfaremember_id`);
ALTER TABLE `memberfee` ADD CONSTRAINT unique_memberfee_code UNIQUE (`code`);
ALTER TABLE `user` ADD CONSTRAINT unique_user_welfaremember_id UNIQUE (`welfaremember_id`);
ALTER TABLE `user` ADD CONSTRAINT unique_user_username UNIQUE (`username`);
ALTER TABLE `role` ADD CONSTRAINT unique_role_name UNIQUE (`name`);


-- foreign key definitions
ALTER TABLE `approvedbenefit` ADD CONSTRAINT f_approvedbenefit_endorsedbenefit_id_fr_endorsedbenefit_id FOREIGN KEY (`endorsedbenefit_id`) REFERENCES `endorsedbenefit`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `approvedbenefit` ADD CONSTRAINT f_approvedbenefit_approvedbenefitstatus_id_fr_approvedbenefitst FOREIGN KEY (`approvedbenefitstatus_id`) REFERENCES `approvedbenefitstatus`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `approvedbenefit` ADD CONSTRAINT f_approvedbenefit_creator_id_fr_user_id FOREIGN KEY (`creator_id`) REFERENCES `user`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `approvedloanrequest` ADD CONSTRAINT f_approvedloanrequest_endorsedloanrequest_id_fr_endorsedloanreq FOREIGN KEY (`endorsedloanrequest_id`) REFERENCES `endorsedloanrequest`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `approvedloanrequest` ADD CONSTRAINT f_approvedloanrequest_approvedloanrequeststatus_id_fr_approvedl FOREIGN KEY (`approvedloanrequeststatus_id`) REFERENCES `approvedloanrequeststatus`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `approvedloanrequest` ADD CONSTRAINT f_approvedloanrequest_creator_id_fr_user_id FOREIGN KEY (`creator_id`) REFERENCES `user`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `benefit` ADD CONSTRAINT f_benefit_benefitstatus_id_fr_benefitstatus_id FOREIGN KEY (`benefitstatus_id`) REFERENCES `benefitstatus`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `benefit` ADD CONSTRAINT f_benefit_creator_id_fr_user_id FOREIGN KEY (`creator_id`) REFERENCES `user`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `benefitpayment` ADD CONSTRAINT f_benefitpayment_approvedbenefit_id_fr_approvedbenefit_id FOREIGN KEY (`approvedbenefit_id`) REFERENCES `approvedbenefit`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `benefitpayment` ADD CONSTRAINT f_benefitpayment_creator_id_fr_user_id FOREIGN KEY (`creator_id`) REFERENCES `user`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `benefitrequest` ADD CONSTRAINT f_benefitrequest_welfaremember_id_fr_welfaremember_id FOREIGN KEY (`welfaremember_id`) REFERENCES `welfaremember`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `benefitrequest` ADD CONSTRAINT f_benefitrequest_benefit_id_fr_benefit_id FOREIGN KEY (`benefit_id`) REFERENCES `benefit`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `benefitrequest` ADD CONSTRAINT f_benefitrequest_benefitrequeststatus_id_fr_benefitrequeststatu FOREIGN KEY (`benefitrequeststatus_id`) REFERENCES `benefitrequeststatus`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `benefitrequest` ADD CONSTRAINT f_benefitrequest_creator_id_fr_user_id FOREIGN KEY (`creator_id`) REFERENCES `user`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `endorsedbenefit` ADD CONSTRAINT f_endorsedbenefit_benefitrequest_id_fr_benefitrequest_id FOREIGN KEY (`benefitrequest_id`) REFERENCES `benefitrequest`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `endorsedbenefit` ADD CONSTRAINT f_endorsedbenefit_endorsedbenefitstatus_id_fr_endorsedbenefitst FOREIGN KEY (`endorsedbenefitstatus_id`) REFERENCES `endorsedbenefitstatus`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `endorsedbenefit` ADD CONSTRAINT f_endorsedbenefit_creator_id_fr_user_id FOREIGN KEY (`creator_id`) REFERENCES `user`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `endorsedloanrequest` ADD CONSTRAINT f_endorsedloanrequest_guarantedloanrequest_id_fr_guarantedloanr FOREIGN KEY (`guarantedloanrequest_id`) REFERENCES `guarantedloanrequest`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `endorsedloanrequest` ADD CONSTRAINT f_endorsedloanrequest_endorsedloanrequeststatus_id_fr_endorsedl FOREIGN KEY (`endorsedloanrequeststatus_id`) REFERENCES `endorsedloanrequeststatus`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `endorsedloanrequest` ADD CONSTRAINT f_endorsedloanrequest_creator_id_fr_user_id FOREIGN KEY (`creator_id`) REFERENCES `user`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `eventincome` ADD CONSTRAINT f_eventincome_welfareevent_id_fr_welfareevent_id FOREIGN KEY (`welfareevent_id`) REFERENCES `welfareevent`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `moneysponsorship` ADD CONSTRAINT f_moneysponsorship_welfareevent_id_fr_welfareevent_id FOREIGN KEY (`welfareevent_id`) REFERENCES `welfareevent`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `othersponsorship` ADD CONSTRAINT f_othersponsorship_welfareevent_id_fr_welfareevent_id FOREIGN KEY (`welfareevent_id`) REFERENCES `welfareevent`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `eventexpense` ADD CONSTRAINT f_eventexpense_welfareevent_id_fr_welfareevent_id FOREIGN KEY (`welfareevent_id`) REFERENCES `welfareevent`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `welfareevent` ADD CONSTRAINT f_welfareevent_creator_id_fr_user_id FOREIGN KEY (`creator_id`) REFERENCES `user`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `guarantedloanrequest` ADD CONSTRAINT f_guarantedloanrequest_loanrequest_id_fr_loanrequest_id FOREIGN KEY (`loanrequest_id`) REFERENCES `loanrequest`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `guarantedloanrequest` ADD CONSTRAINT f_guarantedloanrequest_guarantedloanrequeststatus_id_fr_guarant FOREIGN KEY (`guarantedloanrequeststatus_id`) REFERENCES `guarantedloanrequeststatus`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `guarantedloanrequest` ADD CONSTRAINT f_guarantedloanrequest_creator_id_fr_user_id FOREIGN KEY (`creator_id`) REFERENCES `user`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `loanpayment` ADD CONSTRAINT f_loanpayment_approvedloanrequest_id_fr_approvedloanrequest_id FOREIGN KEY (`approvedloanrequest_id`) REFERENCES `approvedloanrequest`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `loanpayment` ADD CONSTRAINT f_loanpayment_loanpaymentstatus_id_fr_loanpaymentstatus_id FOREIGN KEY (`loanpaymentstatus_id`) REFERENCES `loanpaymentstatus`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `loanpayment` ADD CONSTRAINT f_loanpayment_creator_id_fr_user_id FOREIGN KEY (`creator_id`) REFERENCES `user`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `loanrepayment` ADD CONSTRAINT f_loanrepayment_loanpayment_id_fr_loanpayment_id FOREIGN KEY (`loanpayment_id`) REFERENCES `loanpayment`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `loanrepayment` ADD CONSTRAINT f_loanrepayment_creator_id_fr_user_id FOREIGN KEY (`creator_id`) REFERENCES `user`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `loanrequest` ADD CONSTRAINT f_loanrequest_welfaremember_id_fr_welfaremember_id FOREIGN KEY (`welfaremember_id`) REFERENCES `welfaremember`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `loanrequest` ADD CONSTRAINT f_loanrequest_guarantor_id_fr_welfaremember_id FOREIGN KEY (`guarantor_id`) REFERENCES `welfaremember`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `loanrequest` ADD CONSTRAINT f_loanrequest_loanrequeststatus_id_fr_loanrequeststatus_id FOREIGN KEY (`loanrequeststatus_id`) REFERENCES `loanrequeststatus`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `loanrequest` ADD CONSTRAINT f_loanrequest_creator_id_fr_user_id FOREIGN KEY (`creator_id`) REFERENCES `user`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `welfaremember` ADD CONSTRAINT f_welfaremember_membercategory_id_fr_membercategory_id FOREIGN KEY (`membercategory_id`) REFERENCES `membercategory`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `welfaremember` ADD CONSTRAINT f_welfaremember_nametitle_id_fr_nametitle_id FOREIGN KEY (`nametitle_id`) REFERENCES `nametitle`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `welfaremember` ADD CONSTRAINT f_welfaremember_civilstatus_id_fr_civilstatus_id FOREIGN KEY (`civilstatus_id`) REFERENCES `civilstatus`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `welfaremember` ADD CONSTRAINT f_welfaremember_gender_id_fr_gender_id FOREIGN KEY (`gender_id`) REFERENCES `gender`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `welfaremember` ADD CONSTRAINT f_welfaremember_designation_id_fr_designation_id FOREIGN KEY (`designation_id`) REFERENCES `designation`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `welfaremember` ADD CONSTRAINT f_welfaremember_memberstatus_id_fr_memberstatus_id FOREIGN KEY (`memberstatus_id`) REFERENCES `memberstatus`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `welfaremember` ADD CONSTRAINT f_welfaremember_creator_id_fr_user_id FOREIGN KEY (`creator_id`) REFERENCES `user`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `memberesignation` ADD CONSTRAINT f_memberesignation_welfaremember_id_fr_welfaremember_id FOREIGN KEY (`welfaremember_id`) REFERENCES `welfaremember`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `memberesignation` ADD CONSTRAINT f_memberesignation_creator_id_fr_user_id FOREIGN KEY (`creator_id`) REFERENCES `user`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `memberfee` ADD CONSTRAINT f_memberfee_welfaremember_id_fr_welfaremember_id FOREIGN KEY (`welfaremember_id`) REFERENCES `welfaremember`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `memberfee` ADD CONSTRAINT f_memberfee_memberfeestatus_id_fr_memberfeestatus_id FOREIGN KEY (`memberfeestatus_id`) REFERENCES `memberfeestatus`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `memberfee` ADD CONSTRAINT f_memberfee_creator_id_fr_user_id FOREIGN KEY (`creator_id`) REFERENCES `user`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `user` ADD CONSTRAINT f_user_welfaremember_id_fr_welfaremember_id FOREIGN KEY (`welfaremember_id`) REFERENCES `welfaremember`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `user` ADD CONSTRAINT f_user_creator_id_fr_user_id FOREIGN KEY (`creator_id`) REFERENCES `user`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `userrole` ADD CONSTRAINT f_userrole_user_id_fr_user_id FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `userrole` ADD CONSTRAINT f_userrole_role_id_fr_role_id FOREIGN KEY (`role_id`) REFERENCES `role`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `role` ADD CONSTRAINT f_role_creator_id_fr_user_id FOREIGN KEY (`creator_id`) REFERENCES `user`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `roleusecase` ADD CONSTRAINT f_roleusecase_role_id_fr_role_id FOREIGN KEY (`role_id`) REFERENCES `role`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `roleusecase` ADD CONSTRAINT f_roleusecase_usecase_id_fr_usecase_id FOREIGN KEY (`usecase_id`) REFERENCES `usecase`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `usecase` ADD CONSTRAINT f_usecase_systemmodule_id_fr_systemmodule_id FOREIGN KEY (`systemmodule_id`) REFERENCES `systemmodule`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `notification` ADD CONSTRAINT f_notification_user_id_fr_user_id FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `token` ADD CONSTRAINT f_token_user_id_fr_user_id FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `servicelog` ADD CONSTRAINT f_servicelog_token_id_fr_token_id FOREIGN KEY (`token_id`) REFERENCES `token`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT;
