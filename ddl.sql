DROP DATABASE flex_phone

--create
CREATE DATABASE flex_phone

GO
USE flex_phone
GO

CREATE TABLE staff(
    staff_id CHAR(5) PRIMARY KEY CHECK (staff_id LIKE 'ST[0-9][0-9][0-9]'),
    staff_name VARCHAR(255) NOT NULL,
    staff_email VARCHAR(255) CHECK(staff_email LIKE '%@bluejack.com' OR staff_email LIKE '%@sunib.edu') NOT NULL,
    staff_dob DATE CHECK(YEAR(staff_dob)>=1960) NOT NULL,
    staff_gender VARCHAR(20) CHECK(staff_gender LIKE 'Male' OR staff_gender LIKE 'Female') NOT NULL,
    staff_phone VARCHAR(15) NOT NULL,
    staff_address VARCHAR(255) NOT NULL,
    staff_salary INT,
)

CREATE TABLE customer(
    customer_id CHAR(5) PRIMARY KEY CHECK (customer_id LIKE 'CU[0-9][0-9][0-9]'),
    customer_name VARCHAR(255) NOT NULL CHECK(LEN(customer_name) >= 3),
    customer_email VARCHAR(255) NOT NULL CHECK(customer_email LIKE '%@bluejack.com' OR customer_email LIKE '%@sunib.edu'),
    customer_dob DATE NOT NULL,
    customer_gender VARCHAR(20) NOT NULL CHECK(customer_gender LIKE 'Male' OR customer_gender LIKE 'Female'),
    customer_phone VARCHAR(15) NOT NULL,
    customer_address VARCHAR(255) NOT NULL
)

CREATE TABLE vendor(
    vendor_id CHAR(5) PRIMARY KEY CHECK (vendor_id LIKE 'VE[0-9][0-9][0-9]'),
    vendor_name VARCHAR(255) NOT NULL,
    vendor_email VARCHAR(255) NOT NULL CHECK(vendor_email LIKE '%@bluejack.com' OR vendor_email LIKE '%@sunib.edu'),
    vendor_phone VARCHAR(15) NOT NULL,
    vendor_address VARCHAR(255) NOT NULL
)

CREATE TABLE phone_brand(
	phone_brand_id CHAR(5) PRIMARY KEY CHECK (phone_brand_id LIKE 'PB[0-9][0-9][0-9]'),
	phone_brand_name VARCHAR(255) NOT NULL
)

CREATE TABLE phone(
	phone_id CHAR(5) PRIMARY KEY CHECK (phone_id LIKE 'PO[0-9][0-9][0-9]'),
	phone_brand_id CHAR(5) FOREIGN KEY REFERENCES phone_brand(phone_brand_id) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	phone_name VARCHAR(255) NOT NULL,
	phone_price INT CHECK (phone_price BETWEEN 100000 AND 40000000)
)

CREATE TABLE purchase_header(
	purchase_id CHAR(5) PRIMARY KEY CHECK (purchase_id LIKE 'PH[0-9][0-9][0-9]'),
	staff_id CHAR(5) FOREIGN KEY REFERENCES staff(staff_id) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	vendor_id CHAR(5) FOREIGN KEY REFERENCES vendor(vendor_id) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	transaction_date DATE NOT NULL
)

CREATE TABLE purchase_details(
	purchase_id CHAR(5) FOREIGN KEY REFERENCES purchase_header(purchase_id) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	phone_id CHAR(5) FOREIGN KEY REFERENCES phone(phone_id) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	quantity INT NOT NULL,
	CONSTRAINT purchase_composite PRIMARY KEY(purchase_id, phone_id)
)

CREATE TABLE sales_header(
    sales_id CHAR(5) PRIMARY KEY CHECK (sales_id LIKE 'SH[0-9][0-9][0-9]'),
    staff_id CHAR(5) FOREIGN KEY REFERENCES staff(staff_id) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    customer_id CHAR(5) FOREIGN KEY REFERENCES customer(customer_id) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    transaction_date DATE NOT NULL
)

CREATE TABLE sales_details(
    sales_id CHAR(5) FOREIGN KEY REFERENCES sales_header(sales_id) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    phone_id CHAR(5) FOREIGN KEY REFERENCES phone(phone_id) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    quantity INT NOT NULL,
    CONSTRAINT sales_composite PRIMARY KEY(sales_id, phone_id)
)