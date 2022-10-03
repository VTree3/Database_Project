USE flex_phone

SELECT * FROM phone
SELECT * FROM phone_brand
SELECT * FROM customer
SELECT * FROM staff
SELECT * FROM vendor
SELECT * FROM sales_header
SELECT * FROM sales_details
SELECT * FROM purchase_header
SELECT * FROM purchase_details

--simulate transaction
--purchase transaction
INSERT INTO purchase_header VALUES
('PH016', 'ST002', 'VE002', '2021-03-04')

INSERT INTO purchase_details VALUES
('PH016', 'PO002', 2),
('PH016', 'PO003', 3)

--sales transaction
INSERT INTO sales_header VALUES
('SH016','ST002','CU003','2021-03-22')

INSERT INTO sales_details VALUES
('SH016','PO002',2),
('SH016','PO005',1)
