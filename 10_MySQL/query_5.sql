-- 5a. You cannot locate the schema of the address table. Which query would you use to re-create it?



CREATE TABLE new_address(
address_id INTEGER (20) PRIMARY KEY NOT NULL AUTO_INCREMENT ,
address VARCHAR(100) NOT NULL,
address2 VARCHAR (150),
district VARCHAR (150),
city_id INTEGER (20),
postal_code INTEGER(10),
location BLOB,
 last_update DATETIME,
-- FOREIGN KEY (city_id) REFERENCES city(city_id)
-- FOREIGN KEY (city_id) REFERENCES city(city_id)
CONSTRAINT FK_addresscity FOREIGN KEY (city_id)
    REFERENCES city(city_id)
);

SELECT * FROM new_address;