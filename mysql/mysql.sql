CREATE TABLE IF NOT EXISTS `stp_dao_v2`.`event_historical_data` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `update_time` TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `event_type` VARCHAR(45) NOT NULL,
    `address` VARCHAR(44) NOT NULL,
    `topic0` VARCHAR(66) NOT NULL,
    `topic1` VARCHAR(66) NOT NULL,
    `topic2` VARCHAR(66) NOT NULL,
    `topic3` VARCHAR(66) NOT NULL,
    `data` VARCHAR(514) NOT NULL,
    `block_number` VARCHAR(66) NOT NULL,
    `time_stamp` VARCHAR(66) NOT NULL,
    `gas_price` VARCHAR(66) NOT NULL,
    `gas_used` VARCHAR(66) NOT NULL,
    `log_index` VARCHAR(66) NOT NULL,
    `transaction_hash` VARCHAR(66) NOT NULL,
    `transaction_index` VARCHAR(66) NOT NULL,
    `chain_id` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `index_event_type` (`event_type` ASC),
    INDEX `index_address` (`address` ASC),
    INDEX `index_topic0` (`topic0` ASC),
    INDEX `index_topic1` (`topic1` ASC),
    INDEX `index_topic2` (`topic2` ASC),
    INDEX `index_topic3` (`topic3` ASC),
    INDEX `index_block_number` (`block_number` ASC),
    INDEX `index_chain_id` (`chain_id` ASC));

CREATE TABLE IF NOT EXISTS `stp_dao_v2`.`scan_task` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `update_time` TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `event_type` VARCHAR(45) NOT NULL,
    `address` VARCHAR(44) NOT NULL,
    `last_block_number` INT UNSIGNED NOT NULL,
    `rest_parameter` VARCHAR(514) NOT NULL,
    `chain_id` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `index_address` (`address` ASC),
    INDEX `index_event_type` (`event_type` ASC),
    INDEX `index_chain_id` (`chain_id` ASC));


CREATE TABLE IF NOT EXISTS `stp_dao_v2`.`tb_nonce`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `update_time` TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `account` VARCHAR(128) NOT NULL UNIQUE,
    `nonce` VARCHAR(128) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `stp_dao_v2`.`tb_dao` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,	
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,	
  `update_time` TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,	
    `dao_logo` VARCHAR(500) NOT NULL,
    `dao_name` VARCHAR(30) NOT NULL,
    `dao_address`  VARCHAR(128) NOT NULL,
    `creator` VARCHAR(128) NOT NULL,
    `handle` VARCHAR(30) NOT NULL,
    `description` VARCHAR(500) NOT NULL,
    `chain_id` INT NOT NULL,
    `token_address` VARCHAR(128) NOT NULL,
    `proposal_threshold` DECIMAL(65,0) UNSIGNED NOT NULL,
    `voting_quorum` DECIMAL(65,0) UNSIGNED NOT NULL,
    `voting_period` INT NOT NULL,
    `voting_type` VARCHAR(128) NOT NULL,
	`twitter` VARCHAR(128),
	`github` VARCHAR(128),
	`discord` VARCHAR(128),
	`update_bool` bool,
  PRIMARY KEY (`id`),
  INDEX `dao_address` (`dao_address` ASC),
  INDEX `creator` (`creator` ASC)
);

CREATE TABLE IF NOT EXISTS `stp_dao_v2`.`tb_category`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `update_time` TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `category_name` VARCHAR(30) NOT NULL UNIQUE,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `stp_dao_v2`.`tb_dao_category`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `update_time` TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `dao_id` INT UNSIGNED NOT NULL,
    `category_id` INT UNSIGNED NOT NULL,
    FOREIGN KEY (dao_id) REFERENCES tb_dao(id) ON UPDATE CASCADE,
    FOREIGN KEY (category_id) REFERENCES tb_category(id) ON UPDATE CASCADE,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `stp_dao_v2`.`tb_member` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `dao_address` VARCHAR(128) NOT NULL,
  `chain_id` INT NOT NULL,
  `account` VARCHAR(128) NOT NULL,
  `join_switch` INT NOT NULL,
  INDEX `dao_address` (`dao_address` ASC),
  INDEX `account` (`account` ASC),
  INDEX `chain_id` (`chain_id` ASC),
  UNIQUE INDEX `unique_index_chain_id_dao_address_account` (`chain_id` ASC, `dao_address` ASC, `account` ASC),
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `stp_dao_v2`.`tb_admin` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
`dao_address` VARCHAR(128) NOT NULL,
`chain_id` INT NOT NULL,
`account` VARCHAR(128) NOT NULL,
`account_level` VARCHAR(128),
INDEX `dao_address` (`dao_address` ASC),
INDEX `account` (`account` ASC),
INDEX `chain_id` (`chain_id` ASC),
UNIQUE INDEX `unique_index_chain_id_dao_address_account` (`chain_id` ASC, `dao_address` ASC, `account` ASC),
PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `stp_dao_v2`.`tb_holder_data` (
 `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
 `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `update_time` TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 `token_address` VARCHAR(44) NOT NULL,
 `holder_address` VARCHAR(66) NOT NULL,
 `balance` DECIMAL(65,0) UNSIGNED NOT NULL,
 `chain_id` INT UNSIGNED NOT NULL,
 PRIMARY KEY (`id`),
 INDEX `index_token_address` (`token_address` ASC),
 INDEX `index_holder_address` (`holder_address` ASC),
 UNIQUE INDEX `unique_index_chain_id_token_address_holder_address` (`chain_id` ASC, `token_address` ASC, `holder_address` ASC),
 INDEX `index_chain_id` (`chain_id` ASC),
 INDEX `index_balance` (`balance` DESC)
);

CREATE TABLE IF NOT EXISTS `stp_dao_v2`.`error_info` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
`title` VARCHAR(512) NOT NULL,
`content` TEXT NOT NULL,
`func` VARCHAR(128) NOT NULL,
`params` VARCHAR(512) NOT NULL,
PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `stp_dao_v2`.`tb_account` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
`account` VARCHAR(128) NOT NULL UNIQUE,
`account_logo` VARCHAR(128),
`nickname` VARCHAR(128),
`introduction` VARCHAR(200),
`twitter` VARCHAR(128),
`github` VARCHAR(128),
PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `stp_dao_v2`.`tb_proposal_info` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `uuid` VARCHAR(36) NOT NULL,
  `content` TEXT NOT NULL,
  PRIMARY KEY (`id`)
);

# CREATE TABLE IF NOT EXISTS `stp_dao_v2`.`tb_proposal` (
#   `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
#   `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
#   `update_time` TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
# 	`dao_id` INT NOT NULL,
# 	`title` VARCHAR(128) NOT NULL,
# 	`content` MEDIUMTEXT NOT NULL,
# 	`start_time` INT NOT NULL,
# 	`end_time` INT NOT NULL,
# 	`voting_type` VARCHAR(128) NOT NULL,
# 	INDEX `dao_id` (`dao_id` ASC),
# 	PRIMARY KEY (`id`)
# );
#
# CREATE TABLE IF NOT EXISTS `stp_dao_v2`.`tb_options` (
#   `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
#   `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
#   `update_time` TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
# 	`proposal_id` INT NOT NULL,
# 	`voting_options` VARCHAR(128) NOT NULL,
# 	INDEX `proposal_id` (`proposal_id` ASC),
# 	PRIMARY KEY (`id`)
# );
#
# CREATE TABLE IF NOT EXISTS `stp_dao_v2`.`tb_voting_records` (
#   `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
#   `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
#   `update_time` TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
# 	`dao_id` INT NOT NULL,
# 	`proposal_id` INT NOT NULL,
# 	`option_id` INT NOT NULL,
# 	`account` VARCHAR(128) NOT NULL,
# 	`votes` DECIMAL(65,0) UNSIGNED NOT NULL,
# 	INDEX `dao_id` (`dao_id` ASC),
# 	INDEX `proposal_id` (`proposal_id` ASC),
# 	INDEX `option_id` (`option_id` ASC),
# 	PRIMARY KEY (`id`)
# );
#
# CREATE TABLE IF NOT EXISTS `stp_dao_v2`.`tb_token_list` (
#   `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
#   `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
#   `update_time` TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
# 	`token_logo` VARCHAR(128) NOT NULL,
# 	`token` VARCHAR(128) NOT NULL,
# 	`network` VARCHAR(128) NOT NULL,
# 	`contract` VARCHAR(128) NOT NULL,
# 	`total_supply` VARCHAR(128) NOT NULL,
# 	`transfers` INT NOT NULL,
# 	`holders` INT NOT NULL,
# 	PRIMARY KEY (`id`)
# );
#
# CREATE TABLE IF NOT EXISTS `stp_dao_v2`.`tb_airdrop` (
#   `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
#   `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
#   `update_time` TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
# 	`network` VARCHAR(128) NOT NULL,
# 	`token` VARCHAR(128) NOT NULL,
# 	`airdrop_amount` VARCHAR(128) NOT NULL,
# 	`start_time` INT NOT NULL,
# 	`end_time` INT NOT NULL,
# 	`airdrop_address_file` VARCHAR(128) NOT NULL,
# 	PRIMARY KEY (`id`)
# );
#
# CREATE TABLE IF NOT EXISTS `stp_dao_v2`.`tb_sale` (
#   `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
#   `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
#   `update_time` TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
# 	`token` VARCHAR(128) NOT NULL,
# 	`network` VARCHAR(128) NOT NULL,
# 	`receiving_tokens` VARCHAR(128) NOT NULL,
# 	`offering_amount` DECIMAL(65,0) UNSIGNED NOT NULL,
# 	`price` DECIMAL(65,0) UNSIGNED NOT NULL,
# 	`pledge_limit` VARCHAR(128),
# 	`start_time` INT NOT NULL,
# 	`end_time` INT NOT NULL,
# 	`sale_description` VARCHAR(200),
# 	PRIMARY KEY (`id`)
# );