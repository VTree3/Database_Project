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

DELETE FROM customer
DELETE FROM phone_brand
DELETE FROM vendor
DELETE FROM staff

--fill data
INSERT INTO phone_brand VALUES 
('PB001', 'Health Point'),
('PB002', 'Attack'),
('PB003', 'Defense'),
('PB004', 'Energy Recharge'),
('PB005', 'Elemental Mastery'),
('PB006', 'Physical Damage Bonus'),
('PB007', 'Elemental Damage Bonus'),
('PB008', 'Critical Rate'),
('PB009', 'Critical Damage'),
('PB010', 'Healing Bonus')

INSERT INTO phone VALUES
('PO001', 'PB002', 'Gladiators Finale', 1250000),
('PO002', 'PB005', 'Archaic Petra', 2250000),
('PO003', 'PB009', 'Crimson Witch of Flames', 1700000),
('PO004', 'PB002', 'Berserker', 850000),
('PO005', 'PB010', 'Heart of Depth', 3520000),
('PO006', 'PB003', 'Ocean-Hued Clam', 1570000),
('PO007', 'PB001', 'Blizzard Strayer', 2640000),
('PO008', 'PB010', 'Emblem of Severed Fate', 3160000),
('PO009', 'PB006', 'Husk of Opulent Dreams', 1250000),
('PO010', 'PB002', 'Noblesse Oblige', 1200000)

INSERT INTO customer VALUES 
('CU001', 'Mona', 'donate_mora@sunib.edu','1994-12-27','Female','+6291382870045','Mondstadt'),
('CU002', 'Razor', 'what_is_email@sunib.edu','2000-09-09','Male','+6291398754215','Mondstadt'),
('CU003', 'Venti', 'im_not_a_god@bluejack.com','2007-06-16','Male','+6291378456210','Mondstadt'),
('CU004', 'Zhongli', 'buy_everything@sunib.edu','1985-12-31','Male','+6261378454274','Liyue'),
('CU005', 'Kaedehara Kazuha', 'wandering_flute@bluejack.com','1999-10-29','Male','+6271357845168','Inazuma'),
('CU006', 'Xiao', 'almond_tofu@bluejack.com','1994-04-17','Male','+6271348974514','Liyue'),
('CU007', 'Klee', 'where_is_jean@bluejack.com','2011-07-27','Female','+6291345216254','Mondstadt'),
('CU008', 'Childe', 'bank_of_mora@sunib.edu','1998-06-20','Male','+6251387954210','Snezhnaya'),
('CU009', 'Prinzessin der Verurteilung', 'von_luftschlos_marfidort@bluejack.com', '2001-09-28', 'Female','+6291378954125', 'Mondstadt'),
('CU010', 'Bennett', 'bouken_da_bouken@sunib.edu','2000-02-29','Male','+6291387854625','Mondstadt')

INSERT INTO staff VALUES
('ST001', 'Thoma', 'house_keeping_101@sunib.edu', '1990-01-09', 'Male', '+6261324082020', 'Inazuma', '13000000'),
('ST002', 'Kujou Sara', 'all_hail_raiden_sama@bluejack.com', '1995-07-14', 'Female', '+6261344532100', 'Inazuma', '7000000'),
('ST003', 'Kaeya', 'kooreh@sunib.edu', '1989-11-30', 'Male', '+6291233211010', 'Mondstadt', '12000000'),
('ST004', 'Keqing', 'keq_the_catgirl@sunib.edu','2000-11-20', 'Female', '+6271219876942', 'Liyue', '20000000'),
('ST005', 'Ganyu', 'qingxin_lover_69@bluejack.com', '1997-12-02', 'Female', '+6271242042069', 'Liyue', '25000000'),
('ST006', 'Jean', 'Jean_favonius@bluejack.com', '1994-03-14','Female', '+6291234561123', 'Mondstadt', '15000000'),
('ST007', 'Noelle', 'favonius_maid_noelle@bluejack.com', '2004-03-21','Female', '+6291251086240', 'Mondstadt', '5000000'),
('ST008', 'Lisa', 'big_personality_librarian@sunib.edu', '1994-06-09', 'Female', '+6291232452230', 'Mondstadt', '8000000'),
('ST009', 'Rosaria', 'sisters_pls_let_me_go@sunib.edu', '1995-01-24', 'Female', '+6291259602130', 'Mondstadt', '4000000'),
('ST010', 'Qiqi', 'coconut_milk_give@bluejack.com', '1960-03-03', 'Female', '+6271233405812', 'Liyue', '100000')

INSERT INTO vendor VALUES
('VE001', 'Ningguang', 'liyue_qixing@bluejack.com', '+6271390201180', 'Liyue'),
('VE002', 'Raiden Shogun', 'inazuma_eternity@sunib.edu', '+6261312082390', 'Inazuma'),
('VE003', 'Eula', 'i_will_remember_this_grudge@bluejack.com', '+6291351230230', 'Mondstadt'),
('VE004', 'Diluc', 'batman_mondstadt@sunib.edu', '+6291323135503', 'Mondstadt'),
('VE005', 'Ayaka', 'traveller_simp@bluejack.com', '+6261322234230', 'Inazuma'),
('VE006', 'Hu Tao', 'booking_peti_mati@sunib.edu', '+6271355402309', 'Liyue'),
('VE007', 'Albedo', 'alchemist_dragonspine@bluejack.com', '+6291323942301', 'Mondstadt'),
('VE008', 'Kokomi', 'ikan_cupang_enthusiast@sunib.edu', '+6261382302100', 'Inazuma'),
('VE009', 'Yoimiya', 'fireworks_come_buy@bluejack.com', '+6261399912333', 'Inazuma'),
('VE010', 'Xiangling', 'top_tier_dps_btw@sunib.edu', '+6261311324490', 'Liyue')

INSERT INTO sales_header VALUES
('SH001','ST001','CU008','2021-03-12'),
('SH002','ST002','CU003','2021-03-12'),
('SH003','ST003','CU002','2021-03-12'),
('SH004','ST004','CU004','2021-03-13'),
('SH005','ST005','CU002','2021-03-14'),
('SH006','ST006','CU010','2021-03-16'),
('SH007','ST007','CU009','2021-03-17'),
('SH008','ST008','CU008','2021-03-17'),
('SH009','ST009','CU007','2021-03-17'),
('SH010','ST010','CU006','2021-03-18'),
('SH011','ST007','CU005','2021-03-18'),
('SH012','ST002','CU004','2021-03-19'),
('SH013','ST007','CU005','2021-03-20'),
('SH014','ST005','CU005','2021-03-21'),
('SH015','ST007','CU005','2021-03-21')

INSERT INTO sales_details VALUES
('SH001','PO008',4),
('SH001','PO009',1),
('SH002','PO007',1),
('SH002','PO004',3),
('SH003','PO002',5),
('SH003','PO004',3),
('SH004','PO003',1),
('SH005','PO001',2),
('SH005','PO005',1),
('SH006','PO007',2),
('SH006','PO008',2),
('SH006','PO010',1),
('SH007','PO004',2),
('SH008','PO001',1),
('SH008','PO004',3),
('SH009','PO005',2),
('SH010','PO004',2),
('SH010','PO001',4),
('SH010','PO002',3),
('SH011','PO003',1),
('SH011','PO010',1),
('SH012','PO003',2),
('SH013','PO010',1),
('SH014','PO010',1),
('SH015','PO010',2)

INSERT INTO purchase_header VALUES
('PH001', 'ST001', 'VE006', '2021-02-20'),
('PH002', 'ST010', 'VE003', '2021-02-20'),
('PH003', 'ST002', 'VE005', '2021-02-20'),
('PH004', 'ST007', 'VE010', '2021-02-21'),
('PH005', 'ST004', 'VE002', '2021-02-23'),
('PH006', 'ST006', 'VE001', '2021-02-23'),
('PH007', 'ST003', 'VE009', '2021-02-24'),
('PH008', 'ST005', 'VE004', '2021-02-24'),
('PH009', 'ST009', 'VE008', '2021-02-24'),
('PH010', 'ST008', 'VE007', '2021-02-25'),
('PH011', 'ST003', 'VE001', '2021-03-01'),
('PH012', 'ST005', 'VE009', '2021-03-01'),
('PH013', 'ST009', 'VE002', '2021-03-02'),
('PH014', 'ST008', 'VE004', '2021-03-03'),
('PH015', 'ST005', 'VE006', '2021-03-03')

INSERT INTO purchase_details VALUES
('PH001', 'PO001', 4),
('PH002', 'PO004', 13),
('PH003', 'PO002', 13),
('PH004', 'PO005', 20),
('PH005', 'PO003', 19),
('PH006', 'PO009', 11),
('PH007', 'PO010', 12),
('PH008', 'PO006', 10),
('PH009', 'PO007', 11),
('PH010', 'PO008', 18),
('PH011', 'PO009', 20),
('PH012', 'PO002', 10),
('PH013', 'PO001', 18),
('PH014', 'PO007', 19),
('PH015', 'PO004', 20),
('PH005', 'PO008', 21),
('PH009', 'PO002', 10),
('PH006', 'PO001', 21),
('PH002', 'PO006', 18),
('PH010', 'PO001', 10),
('PH001', 'PO003', 29), 
('PH007', 'PO007', 12),
('PH008', 'PO002', 20),
('PH015', 'PO002', 3),
('PH012', 'PO001', 6)