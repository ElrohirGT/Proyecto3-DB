CREATE TABLE SHIPPER (
	id NUMBER PRIMARY KEY,
	name nvarchar2(20) NOT NULL
);

CREATE TABLE CATEGORY (
id NUMBER PRIMARY KEY,
name nvarchar2(20) NOT NULL,
description nvarchar2(256) NOT NULL
);

CREATE TABLE CUSTOMER (
	id nvarchar2(12) PRIMARY KEY,
	companyName nvarchar2(64) NOT null,
	contactName nvarchar2(64) NOT null,
	title nvarchar2(64) NOT null,
	city nvarchar2(64) NOT null,
	country nvarchar2(64) NOT null
);

CREATE TABLE EMPLOYEE (
	id NUMBER PRIMARY KEY,
	name nvarchar2(64) NOT NULL,
	title nvarchar2(64) NOT NULL,
	city nvarchar2(64) NOT NULL,
	country nvarchar2(64) NOT NULL,
	reportsTo NUMBER
);

CREATE TABLE product (
	id NUMBER PRIMARY KEY,
	category NUMBER NOT NULL,
	name nvarchar2(64) NOT NULL,
	quantityPerUnit nvarchar2(64) NOT NULL,
	unitPrice BINARY_FLOAT NOT NULL,
	discontinued NUMBER(1,0) NOT NULL,
	
	CONSTRAINT fk_product_category FOREIGN KEY (CATEGORY) REFERENCES CATEGORY(id)
);

CREATE TABLE SHOP_ORDER (
	id NUMBER PRIMARY KEY,
	customer nvarchar2(12) NOT NULL,
	employee NUMBER NOT NULL,
	shipper NUMBER,
	orderDate DATE NOT NULL,
	requiredDate DATE NOT NULL,
	shippedDate DATE,
	freight BINARY_FLOAT NOT NULL,
	
	CONSTRAINT fk_order_customer FOREIGN KEY (customer) REFERENCES CUSTOMER(id),
	CONSTRAINT fk_order_employee FOREIGN KEY (employee) REFERENCES EMPLOYEE(id),
	CONSTRAINT fk_order_shipper FOREIGN KEY (shipper) REFERENCES SHIPPER(id)
);

CREATE TABLE SHOP_ORDER_DETAILS (
	shop_order NUMBER NOT NULL,
	product NUMBER NOT NULL,
	unitPrice BINARY_FLOAT NOT NULL,
	quantity NUMBER NOT NULL,
	discount BINARY_FLOAT NOT NULL,
	
	CONSTRAINT fk_shop_order_details_shop_order FOREIGN KEY (shop_order) REFERENCES SHOP_ORDER(id),
	CONSTRAINT fk_shop_order_details_product FOREIGN KEY (product) REFERENCES PRODUCT(id)
);
