DROP DATABASE IF EXISTS aliexpress;
CREATE DATABASE aliexpress;
USE aliexpress;

DROP TABLE IF EXISTS sellers;
CREATE TABLE sellers (
	id SERIAL PRIMARY KEY, -- SERIAL =  UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    firstname VARCHAR(50),
    lastname VARCHAR(50) COMMENT 'Фамиль', -- COMMENT на случай, если имя неочевидное
    email VARCHAR(120) UNIQUE,
    phone BIGINT, 
    created_at DATETIME DEFAULT NOW(),
    country VARCHAR(50)
);


DROP TABLE IF EXISTS buyers;
CREATE TABLE buyers (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    email VARCHAR(120) UNIQUE,
    phone BIGINT, 
    created_at DATETIME DEFAULT NOW(),
    country VARCHAR(50)
    
);

DROP TABLE IF EXISTS product_category;
CREATE TABLE product_category (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    name VARCHAR(50)  
);


DROP TABLE IF EXISTS category_section;
CREATE TABLE category_section (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
	product_category_id BIGINT UNSIGNED NOT null,
	FOREIGN KEY (product_category_id) REFERENCES product_category(id),
    name VARCHAR(50)  
);


DROP TABLE IF EXISTS photos;
CREATE TABLE photos (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    url VARCHAR(100)  
);

DROP TABLE IF EXISTS things;
CREATE TABLE things (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
	product_category_id BIGINT UNSIGNED NOT null,
	category_section_id BIGINT UNSIGNED NOT null,
	seller_id BIGINT UNSIGNED NOT null,
	name VARCHAR(50), 
	FOREIGN KEY (seller_id) REFERENCES sellers(id),
	FOREIGN KEY (product_category_id) REFERENCES product_category(id),
	FOREIGN KEY (category_section_id) REFERENCES category_section(id),
	description TEXT
	
);

DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
	id SERIAL PRIMARY KEY,
	from_user_id BIGINT UNSIGNED NOT NULL,
    to_user_id BIGINT UNSIGNED NOT NULL,
    body TEXT,
    created_at DATETIME DEFAULT NOW(), 
    INDEX messages_from_user_id (from_user_id),
    INDEX messages_to_user_id (to_user_id)
    -- FOREIGN KEY (from_user_id) REFERENCES (sellers(id),buyers(id)),
    -- FOREIGN KEY (to_user_id) REFERENCES (sellers(id),buyers(id))
);


DROP TABLE IF EXISTS likes;
CREATE TABLE likes(
	id SERIAL PRIMARY KEY,
    buyer_id BIGINT UNSIGNED NOT NULL,
    thing_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW(),
    FOREIGN KEY (buyer_id) REFERENCES buyers(id),
    FOREIGN KEY (thing_id) REFERENCES things(id)
);


DROP TABLE IF EXISTS reviews;
CREATE TABLE reviews(
	id SERIAL PRIMARY KEY,
    buyer_id BIGINT UNSIGNED NOT NULL,
    thing_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW(),
    rating ENUM('1', '2', '3', '4', '5'),
    body TEXT,
    FOREIGN KEY (buyer_id) REFERENCES buyers(id),
    FOREIGN KEY (thing_id) REFERENCES things(id)
);

DROP TABLE IF EXISTS products;
CREATE TABLE products(
	id SERIAL PRIMARY KEY,
    thing_id BIGINT UNSIGNED NOT NULL,
    color VARCHAR(50),
    'size' VARCHAR(50),
    quantity VARCHAR(50),
    photo_id BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY (photo_id) REFERENCES photos(id),
    FOREIGN KEY (thing_id) REFERENCES things(id)
);


DROP TABLE IF EXISTS products;
CREATE TABLE products(
	id SERIAL PRIMARY KEY,
    thing_id BIGINT UNSIGNED NOT NULL,
    color VARCHAR(50),
    'size' VARCHAR(50),
    quantity VARCHAR(50),
    photo_id BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY (photo_id) REFERENCES photos(id),
    FOREIGN KEY (thing_id) REFERENCES things(id)
);

DROP TABLE IF EXISTS price;
CREATE TABLE price(
	id SERIAL PRIMARY KEY,
    thing_id BIGINT UNSIGNED NOT NULL,
    start_of_discount DATETIME,
    end_of_discount DATETIME,
    discount_percentage FLOAT,
    product_price FLOAT,
    product_price_discount FLOAT,

    FOREIGN KEY (thing_id) REFERENCES things(id)
);



DROP TABLE IF EXISTS shopping_basket;
CREATE TABLE shopping_basket(
	id SERIAL PRIMARY KEY,
	buyer_id BIGINT UNSIGNED NOT NULL,
    product_id BIGINT UNSIGNED NOT NULL,
    quantity VARCHAR(50),
    status ENUM('added_to_cart', 'paid', 'awaiting_delivery', 'delivered'),
    FOREIGN KEY (buyer_id) REFERENCES buyers(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);







