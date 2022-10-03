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

--1
SELECT
	[Customer ID] = CONCAT('Customer',CAST(RIGHT(c.customer_id,3) AS INT)),
	[Customer Name] = c.customer_name,
	[Customer Gender] = c.customer_gender,
	[Total Spent] = SUM(sd.quantity * p.phone_price)
FROM customer c, sales_header sh, sales_details sd, phone p
WHERE c.customer_id = sh.customer_id 
	AND sd.sales_id = sh.sales_id 
	AND p.phone_id = sd.phone_id
GROUP BY c.customer_id, c.customer_name, c.customer_gender

--2
SELECT
	[Staff ID] = s.staff_id,
	[Staff Name] = SUBSTRING(s.staff_name, 1, CHARINDEX(' ', s.staff_name) - 1),
	[Customer Count] = COUNT(s.staff_id)
FROM staff s, sales_header sh
WHERE s.staff_name LIKE ('% %') AND s.staff_id = sh.staff_id
GROUP BY s.staff_id, s.staff_name

--3 
SELECT
	[Customer ID] = CONCAT('Customer',CAST(RIGHT(c.customer_id,3) AS INT)),
	[Customer Name] = c.customer_name,
	[Phone Brand] = pb.phone_brand_name,
	[Total Spending] = SUM(sd.quantity * p.phone_price)
FROM customer c, phone p, sales_header sh, sales_details sd, phone_brand pb
WHERE c.customer_name LIKE ('% %') 
	AND c.customer_id = sh.customer_id
	AND sh.sales_id = sd.sales_id
	AND sd.phone_id = p.phone_id
	AND pb.phone_brand_id = p.phone_brand_id
GROUP BY c.customer_id, c.customer_name, pb.phone_brand_name
HAVING COUNT(*) > 3

--4
SELECT
	s.staff_id,
	[Staff Email] = CONCAT(SUBSTRING(s.staff_email, 1, CHARINDEX('@', s.staff_email) - 1),'@Ymail.com'),
	phone_brand_name,
	[Total Selling] = SUM(sd.quantity * p.phone_price)
FROM staff s, sales_header sh, sales_details sd, phone p, phone_brand pb
WHERE s.staff_id = sh.staff_id AND
	sh.sales_id = sd.sales_id AND
	sd.phone_id = p.phone_id AND
	p.phone_brand_id = pb.phone_brand_id
GROUP BY s.staff_id, staff_email, phone_brand_name
HAVING COUNT(p.phone_id) > 2
ORDER BY s.staff_id ASC

--5
SELECT
	staff_email,
	staff_gender,
	[staff DOB] = CONVERT(VARCHAR,staff_dob,106),
	[Salary] = CONCAT('Rp.',CAST(staff_salary as VARCHAR)+',00')
FROM staff, (SELECT Average = AVG(staff_salary) FROM staff) AS alias
WHERE YEAR(GETDATE()) - YEAR(staff_dob) >= 30 AND staff_salary > alias.Average

--6
SELECT
	s.staff_id,
	staff_name,
	[Staff Phone] = REPLACE(staff_phone,'+62','08'),
	[Total Selling] = CONCAT('Rp.',CAST(SUM(p.phone_price * sd.quantity) as VARCHAR)+',00')
FROM staff s, sales_header sh, sales_details sd, phone p, (SELECT [Total Selling] = SUM(p.phone_price * sd.quantity) FROM sales_details sd, phone p WHERE sd.phone_id = p.phone_id) as alias
WHERE s.staff_id = sh.staff_id AND
	sh.sales_id = sd.sales_id AND
	sd.phone_id = p.phone_id AND
	s.staff_gender LIKE 'Male' AND
	alias.[Total Selling] BETWEEN 10000000 AND 100000000 
GROUP BY s.staff_id, staff_name, staff_phone

--7
SELECT
	[Staff Id] = CONCAT('Staff No',CAST(RIGHT(s.staff_id,3) AS INT)),
	s.staff_name,
	[Staff Email] = CONCAT(SUBSTRING(s.staff_email, 1, CHARINDEX('@', s.staff_email) - 1),'@gmail.com'),
	[Staff DOB] = CONVERT(VARCHAR,staff_dob,103),
	[Customer count] = COUNT(*)
FROM staff s, sales_header sh, customer c
WHERE s.staff_id = sh.staff_id AND 
	c.customer_id = sh.customer_id 
GROUP BY s.staff_id, s.staff_name, s.staff_email, s.staff_dob
HAVING COUNT(*) = 
	(SELECT MAX(alias.customer_count) FROM 
		(SELECT [customer_count] = COUNT(sh.customer_id) 
			FROM staff s, sales_header sh, customer c 
			WHERE s.staff_id = sh.staff_id AND 
				c.customer_id = sh.customer_id 
			GROUP BY s.staff_id, s.staff_name, s.staff_email, s.staff_dob) AS alias)

--8
SELECT 
	pb.phone_brand_id,
	phone_brand_name,
	c.customer_id,
	customer_name,
	[Customer email] = CONCAT(SUBSTRING(customer_email, 1, CHARINDEX('@', customer_email) - 1),'@Gmail.com'),
	[Qty] = SUM(quantity)
FROM phone p, customer c, sales_header sh, sales_details sd, phone_brand pb
WHERE c.customer_id = sh.customer_id AND
	sd.sales_id = sh.sales_id AND
	sd.phone_id = p.phone_id AND
	p.phone_brand_id = pb.phone_brand_id AND
	customer_email LIKE '%bluejack.com' AND
	RIGHT(c.customer_id,1)%2 = 0
GROUP BY pb.phone_brand_id, phone_brand_name, c.customer_id, customer_name, customer_email
HAVING SUM(quantity) = 
	(SELECT MAX(alias.qty_count) FROM 
		(SELECT [qty_count] = SUM(quantity) 
			FROM phone p, customer c, sales_header sh, sales_details sd, phone_brand pb
			WHERE c.customer_id = sh.customer_id AND
				sd.sales_id = sh.sales_id AND
				sd.phone_id = p.phone_id AND
				p.phone_brand_id = pb.phone_brand_id
			GROUP BY pb.phone_brand_id, phone_brand_name, c.customer_id, customer_name, customer_email) AS alias)
ORDER BY pb.phone_brand_id ASC

--9 
CREATE VIEW Vendor_Brand_Transaction_View AS 
SELECT 
	[VendorID] = CONCAT('Vendor',CAST(RIGHT(v.vendor_id,3) AS INT)),
	v.vendor_name,
	[Vendor phone] = REPLACE(v.vendor_phone,'+62','08'),
	pb.phone_brand_name,
	[Transaction Count] = COUNT(*),
	[Transaction Total] = SUM(p.phone_price * quantity)
FROM vendor v, purchase_details pd, purchase_header ph, phone p, phone_brand pb
WHERE v.vendor_id = ph.vendor_id AND
	ph.purchase_id = pd.purchase_id AND
	pd.phone_id = p.phone_id AND
	p.phone_brand_id = pb.phone_brand_id
GROUP BY v.vendor_id, v.vendor_name, v.vendor_phone, pb.phone_brand_name

SELECT * FROM Vendor_Brand_Transaction_View
DROP VIEW Vendor_Brand_Transaction_View

--10
CREATE VIEW Staff_Selling_View AS 
SELECT 
	s.staff_id,
	s.staff_name,
	[Sold Phone Count] = CONCAT(COUNT(*),'pc(s)'),
	[Total Transaction] = CONCAT('Rp.',CAST(SUM(quantity * p.phone_price) as VARCHAR)+',00') ,
	[Count Brand] = COUNT(DISTINCT p.phone_brand_id)
FROM staff s, sales_header sh, sales_details sd, phone p, phone_brand pb
WHERE s.staff_id = sh.staff_id AND
	sh.sales_id = sd.sales_id AND
	p.phone_id = sd.phone_id AND
	pb.phone_brand_id = p.phone_brand_id AND
	s.staff_email LIKE '%@bluejack.com'
GROUP BY s.staff_id, s.staff_name

SELECT * FROM Staff_Selling_View
DROP VIEW Staff_Selling_View