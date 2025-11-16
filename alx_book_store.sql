-- ALX Book Store schema
-- Tables: AUTHORS, BOOKS, CUSTOMERS, ORDERS, ORDER_DETAILS

CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

DROP TABLE IF EXISTS `order_details`;
DROP TABLE IF EXISTS `orders`;
DROP TABLE IF EXISTS `books`;
DROP TABLE IF EXISTS `authors`;
DROP TABLE IF EXISTS `customers`;

CREATE TABLE `Authors` (
	`author_id` INT NOT NULL AUTO_INCREMENT,
	`author_name` VARCHAR(215) NOT NULL,
	PRIMARY KEY (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `books` (
	`book_id` INT NOT NULL AUTO_INCREMENT,
	`title` VARCHAR(130) NOT NULL,
	`author_id` INT NOT NULL,
	`price` DOUBLE NOT NULL DEFAULT 0,
	`publication_date` DATE,
	PRIMARY KEY (`book_id`),
	INDEX `idx_books_author` (`author_id`),
	CONSTRAINT `fk_books_author` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `customers` (
	`customer_id` INT NOT NULL AUTO_INCREMENT,
	`customer_name` VARCHAR(215) NOT NULL,
	`email` VARCHAR(215) NOT NULL UNIQUE,
	`address` TEXT,
	PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `orders` (
	`order_id` INT NOT NULL AUTO_INCREMENT,
	`customer_id` INT NOT NULL,
	`order_date` DATE NOT NULL,
	PRIMARY KEY (`order_id`),
	INDEX `idx_orders_customer` (`customer_id`),
	CONSTRAINT `fk_orders_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `order_details` (
	`orderdetailid` INT NOT NULL AUTO_INCREMENT,
	`order_id` INT NOT NULL,
	`book_id` INT NOT NULL,
	`quantity` DOUBLE NOT NULL DEFAULT 1,
	PRIMARY KEY (`orderdetailid`),
	INDEX `idx_orderdetails_order` (`order_id`),
	INDEX `idx_orderdetails_book` (`book_id`),
	CONSTRAINT `fk_orderdetails_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT `fk_orderdetails_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- End of schema
