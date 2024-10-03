-------------------craete login table----------------------------------------------------------------------
CREATE TABLE login_details(
	user_name int NOT NULL,
	password VARCHAR(6) NOT NULL,
	PRIMARY KEY(user_name)
);

insert into chef values(1,'chef1'),(2,'chef2'),(3,'chef3'),(4,'chef4'),(5,'chef5'),(6,'serve1'),(7,'serve2'),(8,'serve3'),(9,'serve4'),
	(10,'serve5'),(11,'serve6'),(12,'serve7'),(13,'supervisor1');
	




-------------------create employee table---------------------------------------------------------------------

CREATE TABLE employee (
  emp_id  serial,
  emp_fname VARCHAR(10) NOT NULL,
  emp_lname VARCHAR(10) NOT NULL,
  designation VARCHAR(10) NOT NULL,
  address VARCHAR(50) DEFAULT NULL,
  city VARCHAR(10) DEFAULT NULL,
  state VARCHAR(20) DEFAULT NULL,
  pincode VARCHAR(6) DEFAULT NULL,
  contact_no VARCHAR(13) DEFAULT NULL,
  emp_salary FLOAT NOT NULL,
  hiring_date DATE NOT NULL,
  age INT NOT NULL,
	PRIMARY KEY (emp_id),
  check (age>=18)
);

insert into employee(emp_fname,emp_lname,designation,address,city,
					 state,pincode,contact_no,emp_salary ,hiring_date,age)
values 
('John','Smith','chef','St101','Mumbai','Maharastra','400001','1235965789',50000,'2019-05-07',25),
('Emily', 'Taylor', 'chef', 'St105', 'Kolkata', 'West Bengal', '700001', '9012345678', 38000, '2020-11-20', 23),
('Michael', 'Clark', 'chef', 'St106', 'Hyderabad', 'Telangana', '500001', '7891234560', 55000, '2019-08-05', 27),
('Sarah', 'Anderson', 'chef', 'St107', 'Pune', 'Maharashtra', '411001', '8901234567', 40000, '2021-02-28', 26),
('David', 'Martinez', 'chef', 'St108', 'Jaipur', 'Rajasthan', '302001', '6789012345', 72000, '2017-12-10', 32),
('Emma', 'White', 'server', 'St109', 'Ahmedabad', 'Gujarat', '380001', '5678901234', 47000, '2018-06-15', 29),
('Daniel', 'Garcia', 'server', 'St110', 'Lucknow', 'Uttar Pradesh', '226001', '4567890123', 36000, '2019-04-03', 24),
('Sophia', 'Smith', 'server', 'St111', 'Chandigarh', 'Punjab', '160001', '1234567890', 38000, '2020-10-15', 26),
('Oliver', 'Johnson', 'server', 'St112', 'Guwahati', 'Assam', '781001', '2345678901', 38000, '2019-09-25', 29),
('Isabella', 'Williams', 'server', 'St113', 'Dehradun', 'Uttarakhand', '248001', '3456789012', 38000, '2021-03-30', 25),
('William', 'Brown', 'server', 'St114', 'Bhopal', 'Madhya Pradesh', '462001', '4567890123', 38000, '2020-07-08', 28),
('Mia', 'Jones', 'server', 'St115', 'Raipur', 'Chhattisgarh', '492001', '5678901234', 38000, '2018-12-12', 31),
('Megha','C','supervisor','st102','Banglore','karnataka','123456','93923083',100000,'2018-01-01',24);

select * from employee;
---------------------------------------------------------------------------------------------------------------------------------
	
------------------------categories------------------------------------------------
	
CREATE TABLE categories (
  category_id serial,
  category_name VARCHAR(20) NOT NULL,
	PRIMARY KEY (category_id)
);

insert into categories(category_name) values ('Soup'),('Salad'),('Starter'),
('Main Course'), 
('Desserts'), 
('Curries'), 
('Biryani'), 
('Tandoori Dishes'), 
('Chaats'), 
('Dosas');

select * from categories;

----------------------------------------------------------------------------------------------------------

------------------------------chef-----------------------------------------------------------------------

CREATE TABLE chef (
  chef_id int NOT NULL,
  category_id int NOT NULL,
  bonus int DEFAULT 0 ,
  PRIMARY KEY (chef_id,category_id),
  FOREIGN KEY (category_id) REFERENCES categories (category_id),
  FOREIGN KEY (chef_id) REFERENCES employee (emp_id)	,
  check (bonus>=0)
);

insert into chef(chef_id,category_id) values 
(1,2),(2,5),(3,9),(4,4),(5,10),(1,1),(2,6),(3,7),(4,8),(5,3);

select * from chef;

--------------------------------------------------------------------------------------------------

-------------------------customer-----------------------------------------------------------------

CREATE TABLE customer (
  cust_id serial,
  cust_fname VARCHAR(15) NOT NULL,
  cust_lname VARCHAR(15) DEFAULT NULL,
  contact_no VARCHAR(13) DEFAULT NULL,
  email_id VARCHAR(30) DEFAULT NULL,
  PRIMARY KEY (cust_id)
);

--------------------------------------------------------------------------------------------------

-------------------------------------food----------------------------------------------------------
create TABLE food (
  food_id serial,
  food_name VARCHAR(100) NOT NULL unique,
  price INT NOT NULL,
  total_order int default 0,
  prep_time TIME DEFAULT NULL,
  spice_level INT DEFAULT NULL,
  food_description VARCHAR(100) DEFAULT NULL,
  category_id int NOT NULL,
   PRIMARY KEY (food_id),
   FOREIGN KEY (category_id) REFERENCES categories (category_id),
   check (price>0),
   check (prep_time>'00:00:00')
);

INSERT INTO food(food_name, price, prep_time, spice_level, food_description, category_id)
VALUES 
('Tomato Soup', 110, '00:15:00', 3, 'Classic tomato soup served with croutons', 1),
('Caesar Salad', 170, '00:10:00', 3, 'Fresh romaine lettuce, croutons, parmesan cheese, and Caesar dressing', 2),
('Garlic Bread', 90, '00:05:00', 3, 'Toasted bread slices brushed with garlic butter', 3),
('Lasagna', 280, '01:00:00', 5, 'Layers of pasta, meat sauce, and cheese baked to perfection', 4),
('Chocolate Cake', 140, '00:30:00', 3, 'Rich and moist chocolate cake with chocolate ganache', 5),
('Chicken Curry', 220, '00:45:00', 5, 'Tender chicken pieces cooked in a flavorful curry sauce', 6),
('Hyderabadi Biryani', 250, '01:15:00', 5, 'Fragrant basmati rice cooked with tender meat and aromatic spices', 7),
('Tandoori Chicken', 200, '01:00:00', 5, 'Chicken marinated in yogurt and spices, cooked in a tandoor', 8),
('Pani Puri', 70, '00:20:00', 8, 'Crispy hollow puris filled with spicy tamarind water', 9),
('Masala Dosa', 100, '00:30:00', 5, 'Thin crepe made from fermented rice and lentil batter, filled with spicy potato filling', 10);

INSERT INTO food(food_name, price, prep_time, spice_level, food_description, category_id)
VALUES 
('Manchow Soup', 120, '00:20:00', 6, 'Spicy Indo-Chinese soup with vegetables and noodles', 1),
('Greek Salad', 200, '00:15:00', 3, 'Fresh salad with tomatoes, cucumbers, olives, and feta cheese', 2),
('Bruschetta', 150, '00:10:00', 3, 'Toasted bread topped with diced tomatoes, basil, garlic, and olive oil', 3),
('Butter Chicken', 300, '01:00:00', 7, 'Tender chicken cooked in a rich tomato and butter sauce', 4),
('Rasgulla', 100, '00:45:00', 3, 'Soft and spongy Indian sweet made from chhena and sugar syrup', 5),
('Paneer Tikka Masala', 250, '00:50:00', 6, 'Grilled paneer cubes in a creamy tomato-based sauce', 6),
('Mutton Biryani', 280, '01:30:00', 7, 'Fragrant rice cooked with tender mutton pieces and aromatic spices', 7),
('Fish Tandoori', 320, '01:15:00', 7, 'Fish marinated in yogurt and spices, cooked in a tandoor', 8),
('Aloo Tikki Chaat', 80, '00:25:00', 8, 'Potato patties served with spicy chutneys and yogurt', 9),
('Mysore Masala Dosa', 150, '00:35:00', 6, 'Crispy dosa filled with spicy potato filling and served with chutney', 10);

INSERT INTO food(food_name, price, prep_time, spice_level, food_description, category_id)
VALUES 
('Sweet Corn Soup', 100, '00:15:00', 3, 'Creamy soup made with sweet corn and vegetables', 1),
('Cobb Salad', 180, '00:15:00', 3, 'Salad with mixed greens, bacon, avocado, eggs, and blue cheese', 2),
('Cheese Garlic Bread', 120, '00:10:00', 3, 'Toasted bread topped with garlic butter and melted cheese', 3),
('Palak Paneer', 250, '00:45:00', 6, 'Paneer cubes cooked in a creamy spinach gravy', 4),
('Gulab Jamun', 80, '00:30:00', 3, 'Deep-fried dumplings made of milk solids, soaked in sugar syrup', 5),
('Chole Masala', 200, '00:40:00', 6, 'Chickpeas cooked in a spicy and tangy tomato-based gravy', 6),
('Vegetable Biryani', 220, '01:00:00', 6, 'Fragrant rice cooked with mixed vegetables and aromatic spices', 7),
('Chicken Tikka', 280, '01:00:00', 7, 'Boneless chicken marinated in yogurt and spices, cooked in a tandoor', 8),
('Bhel Puri', 70, '00:20:00', 8, 'Savory snack made with puffed rice, vegetables, and tangy chutneys', 9),
('Rava Masala Dosa', 130, '00:40:00', 6, 'Semolina dosa filled with spicy potato filling and served with chutney', 10);

select * from food;

--------------------------------------------------------------------------------------------------------------------------

-------------------------dining supervison--------------------------------------------------------------------------------

CREATE TABLE dining_supervison (
  table_id VARCHAR(8) NOT NULL,
  capacity INT NOT NULL,
  booking_stat VARCHAR(10) DEFAULT NULL,
  booking_time TIME DEFAULT 00:00:00.000000,
  emp_id int DEFAULT NULL,
  cust_id VARCHAR(8) DEFAULT NULL,
  PRIMARY KEY (table_id),
  FOREIGN KEY (emp_id) REFERENCES employee,
  check (capacity>0)
);



INSERT INTO dining_supervison (table_id, capacity, booking_stat, emp_id)
VALUES 
('T1', 2, 'not_booked', 6),
('T2', 4, 'not_booked', 7),
('T3', 6, 'not_booked', 8),
('T4', 8, 'not_booked', 9),
('T5', 2, 'not_booked', 10),
('T6', 4, 'not_booked', 11),
('T7', 6, 'not_booked', 12),
('T8', 8, 'not_booked', 6),
('T9', 2, 'not_booked', 7),
('T10', 4, 'not_booked', 8),
('T11', 6, 'not_booked', 9),
('T12', 8, 'not_booked', 10),
('T13', 2, 'not_booked', 11),
('T14', 4, 'not_booked', 12);

select * from dining_supervison 

--------------------------------------------------------------------------------------------------------

------------------------------------ordered details-----------------------------------------------------
	
CREATE TABLE order_details (
order_id serial ,
  cust_id int NOT NULL,
  order_date DATE DEFAULT NULL,
  table_id VARCHAR(8) NOT NULL,
   PRIMARY KEY (order_id),
   FOREIGN KEY (table_id) REFERENCES dining_supervison (table_id),
   FOREIGN KEY (cust_id) REFERENCES customer
);

select * from order_details;

-------------------------------------------------------------------------------------------------------

-----------------------order items---------------------------------------------------------------

create TABLE order_items (
  serial_no serial ,
  order_id INT NOT NULL,
  food_id int NOT NULL,
  discount int default 0,
  quantity INT NOT NULL,
  amount int default 0,
  start_time TIME ,
  end_time TIME ,
   PRIMARY KEY (serial_no),
   FOREIGN KEY (food_id) REFERENCES food,
	FOREIGN KEY (order_id) REFERENCES order_details,
   check (quantity >0)
);

select * from order_items;

------------------serve_status----------------------------------------------------------------------
CREATE TABLE serve_status (
  serial_no INT NOT NULL,
  chef_id int,
  status VARCHAR(10) DEFAULT 'No',
	PRIMARY KEY (serial_no),
	FOREIGN KEY (chef_id) REFERENCES employee(emp_id)	
);
select * from serve_status;

-------------------------------------------------------------------------------------------------------

-----------------------------bill-----------------------------------------------------------------------
	
CREATE TABLE bill (
  bill_no serial,
  total_amount BIGINT DEFAULT 0,
  tax FLOAT DEFAULT NULL,
  discount FLOAT DEFAULT 0.0,
  net_amount BIGINT NOT NULL,
  table_id VARCHAR(8) NOT NULL,
  cust_id int NOT NULL,
  order_id INT NOT NULL,
   PRIMARY KEY (bill_no),
   FOREIGN KEY (table_id) REFERENCES dining_supervison (table_id),
   FOREIGN KEY (cust_id) REFERENCES customer (cust_id),
   check (total_amount >0),
   check (discount >=0)
);

select * from bill;

-------------------------------------------------------------------------------------------------

-------------------------------payment-----------------------------------------------------------

CREATE TABLE payment (
  date_of_payment DATE DEFAULT NULL,
  payment_id serial,
  payment_mode VARCHAR(10) DEFAULT NULL,
  bill_no INT DEFAULT NULL,
	PRIMARY KEY (payment_id),
	FOREIGN KEY (bill_no) REFERENCES bill
);

select * from payment;

-------------------------------------------------------------------------------------------------------------

---------------------------price increase--------------------------------------------------------------------

CREATE TABLE price_change (
  food_id int NOT NULL,
  cur_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  before_value INT DEFAULT NULL,
  after_value INT DEFAULT NULL,
  PRIMARY KEY (cur_date, food_id),
  FOREIGN KEY (food_id) REFERENCES food
);

select * from price_change;

---------------------------------------------------------------------------------------------------------------

---------------------------------------FUNCTIONS---------------------------------------------------------------

---function to get latest customer_id---

CREATE OR REPLACE FUNCTION GetLastcustomer()
RETURNS INTEGER AS $$
DECLARE
    last_pk INTEGER;
BEGIN
    SELECT currval('customer_cust_id_seq') INTO last_pk;
    RETURN last_pk;
END;
$$ LANGUAGE plpgsql;

select * from GetLastcustomer();

------------------------------------------

---function for table allocation---

CREATE OR REPLACE PROCEDURE Table_allocation(custid INT,members INT)
AS $$
DECLARE
    f record;
    t int;
BEGIN
    t := 0;
    FOR f IN SELECT capacity, table_id, booking_stat FROM dining_supervison LOOP
        IF (f.booking_stat = 'not_booked' AND f.capacity >= members) THEN
            UPDATE dining_supervison SET booking_stat = 'booked', booking_time = CURRENT_TIME, cust_id = custid WHERE table_id = f.table_id;
            t := 1;
            RAISE NOTICE 'Table allocated = %', f.table_id;
            RAISE NOTICE 'Booked Successfully';
            INSERT INTO order_details(cust_id, order_date, table_id) VALUES (custid, CURRENT_DATE, f.table_id);
            EXIT;
        END IF;
    END LOOP;
    
    IF (t = 0) THEN
        RAISE NOTICE 'No suitable table found';
    END IF;
END;
$$ LANGUAGE plpgsql;

call Table_allocation(5,4);

------------------------------------------

---function to get latest table_id---

CREATE or replace FUNCTION GetLasttableid()
RETURNS varchar AS
$$
DECLARE
    last_pk varchar;
BEGIN
    SELECT table_id INTO last_pk
    FROM dining_supervison
    ORDER BY booking_time DESC
    LIMIT 1;
    RETURN last_pk;
END;
$$ LANGUAGE plpgsql;
select * from dining_supervison;
select * from GetLasttableid();
------------------------------------

---function to get latest order_id---

CREATE FUNCTION GetLastorderid()
RETURNS INTEGER AS
$$
DECLARE
    last_pk INTEGER;
BEGIN
    SELECT order_id INTO last_pk
    FROM order_details
    ORDER BY order_id DESC
    LIMIT 1;
    
    RETURN last_pk;
END;
$$ LANGUAGE plpgsql;

select * from GetLastorderid();

------------------------------------

---function to insert order_items by server---

CREATE OR REPLACE PROCEDURE insert_oi(orderid int,foodid int , quant int )
 AS $$
BEGIN
    insert into order_items (order_id, food_id, quantity,start_time) values (orderid,foodid,quant,CURRENT_time);
	
END;
$$ LANGUAGE plpgsql;

call insert_oi(4,1,2);
call insert_oi(4,2,2);
call insert_oi(4,3,2);
------------------------------------

--serve status getting updated Done by chef

create or replace procedure chef_serve(sno int) as $$
DECLARE
sid int;
BEGIN
update serve_status set status = 'Yes' where serial_no = sno;
END;
$$ LANGUAGE plpgsql;

call chef_serve(5);
call chef_serve(6);
call chef_serve(7);

---------------------------------------------

---generating bill by supervisor---

CREATE OR REPLACE PROCEDURE bill(oid INT, pm varchar)  AS $$
DECLARE 
  na INT; 
  tot_amount INT;
  tax float;
  disc float;
  tid VARCHAR(8);
  cid int;
  billno int;
BEGIN
  SELECT cust_id INTO cid FROM order_details WHERE order_id = oid;
  select table_id into tid from order_details WHERE order_id = oid;
  SELECT SUM(amount) into tot_amount FROM order_items WHERE order_id = oid GROUP BY order_id;
  SELECT SUM(discount) into disc FROM order_items WHERE order_id = oid GROUP BY order_id;
  tax := tot_amount* 0.18;
  na := tot_amount + tax - disc;
  insert into bill (total_amount,tax,discount,net_amount,table_id,cust_id,order_id) values (tot_amount,tax,disc,na,tid,cid,oid);
  select bill_no into billno from bill where order_id = oid;
  update payment set payment_mode = pm where bill_no=billno; 
  
END;
$$ LANGUAGE plpgsql;

call bill(4,'gpay');
select * from bill;

-------------------------------

---function for price change---

CREATE OR REPLACE FUNCTION adjust_price(p_food_id INT, p_quantity INT) RETURNS VOID AS $$
DECLARE
    total_ordered_quantity INT;
    price_change_factor NUMERIC;
    old_price INT;
    new_price INT;
BEGIN
    SELECT price INTO old_price FROM food WHERE food_id = p_food_id;
    SELECT COALESCE(SUM(oi.quantity), 0) INTO total_ordered_quantity FROM order_items oi
    JOIN order_details od ON oi.order_id = od.order_id WHERE oi.food_id = p_food_id
    AND date_trunc('month', od.order_date) = date_trunc('month', CURRENT_DATE);

    IF total_ordered_quantity > p_quantity THEN
        price_change_factor := 1.05; -- Increase price by 5%
        RAISE NOTICE 'Price for food_id % is being incremented.', p_food_id;
    ELSE
        price_change_factor := 0.95; -- Decrease price by 5%
        RAISE NOTICE 'Price for food_id % is being decremented.', p_food_id;
    END IF;

    new_price := ROUND(old_price * price_change_factor);

    UPDATE food SET price = new_price WHERE food_id = p_food_id;
    RAISE NOTICE 'Old price: %, New price: %', old_price, new_price;
    
    INSERT INTO price_change (food_id, before_value, after_value)
    VALUES (p_food_id, old_price, new_price);
END;
$$ LANGUAGE plpgsql;

SELECT * from adjust_price(1, 10);

--------------------------------------------



--------------------------------------TRIGGER AND THEIR RESPECTIVE FUNCTIONS---------------------------------------------


---To get notice for customer_id when new cusomer added---

CREATE OR REPLACE FUNCTION get_custid() RETURNS TRIGGER AS $$
BEGIN
raise notice 'Customer id = %',New.cust_id;
return NULL;
END;
$$ LANGUAGE plpgsql;

create or replace trigger generate_custid
after insert on customer
for each row
execute function get_custid();

------------------------------------------------------

---To get notice for order_id when new cusomer added---

CREATE OR REPLACE FUNCTION get_oid() RETURNS TRIGGER AS $$
BEGIN
raise notice 'order id = % for customer = % ',new.order_id,New.cust_id;
return NULL;
END;
$$ LANGUAGE plpgsql;

create or replace trigger generate_oid
after insert on order_details
for each row
execute function get_oid();

-------------------------------------------------------

---To calculate amount for ordered item in order_items---

CREATE OR REPLACE PROCEDURE cal_amount(foodid INT, quant INT,sno int) AS $$
DECLARE
    p INT;
BEGIN
    SELECT price INTO p FROM food WHERE food_id = foodid;
    -- Update only the newly inserted row in order_items
    UPDATE order_items SET amount = p * quant WHERE serial_no = sno;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION calc_amount() RETURNS TRIGGER AS $$
BEGIN
    CALL cal_amount(NEW.food_id, NEW.quantity,NEW.serial_no);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER calc_amount_trigger
AFTER INSERT ON order_items
FOR EACH ROW
EXECUTE FUNCTION calc_amount();

---------------------------------------------------------------


---This updates the food table in total orders till now--------


CREATE OR REPLACE PROCEDURE tot_quant(foodid INT, quant INT) AS $$
BEGIN
    UPDATE food SET total_order = total_order + quant WHERE food_id = foodid;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION total_quant() RETURNS TRIGGER AS $$
BEGIN
    CALL tot_quant(NEW.food_id, NEW.quantity);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER total_quant_trigger
AFTER INSERT ON order_items
FOR EACH ROW
EXECUTE FUNCTION total_quant();

---------------------------------------------------

---Allocating chef for each food_item---

CREATE OR REPLACE PROCEDURE allocate_chef(sno INT, foodid INT) AS $$
DECLARE
    cid INT;
BEGIN
    -- Retrieve the chef_id based on the category_id of the food
    SELECT chef_id INTO cid
    FROM chef
    INNER JOIN food ON chef.category_id = food.category_id
    WHERE food.food_id = foodid;

    -- Insert the allocation into serve_status
    INSERT INTO serve_status (serial_no, chef_id, status)
    VALUES (sno, cid, 'No');
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION into_serve_stat() RETURNS TRIGGER AS $$
BEGIN
    CALL allocate_chef(NEW.serial_no, NEW.food_id);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE or replace TRIGGER into_serve_stat_trigger
AFTER INSERT ON order_items
FOR EACH ROW
EXECUTE PROCEDURE into_serve_stat();

-----------------------------------------------------------

---creating trigger for discount calculation by checking serve time---

CREATE OR REPLACE PROCEDURE end_time_disc(sno INT, cid INT) AS $$
DECLARE
    start_time1 TIME;
    end_time1 TIME;
    prep_time1 INTERVAL;
	foodid int;
BEGIN
    -- Update the end time in the order_items table
    UPDATE order_items SET end_time = CURRENT_TIME
    WHERE serial_no = sno;
    
    -- Retrieve start_time, end_time, and prep_time,foodid
	SELECT food_id INTO foodid FROM order_items WHERE serial_no = sno;
    SELECT start_time INTO start_time1 FROM order_items WHERE serial_no = sno;
    SELECT end_time INTO end_time1 FROM order_items WHERE serial_no = sno;
    SELECT prep_time INTO prep_time1 FROM food WHERE food_id = foodid;
	
    -- Check if the difference between end_time and start_time is greater than prep_time plus 20 minutes
    IF (end_time1 - start_time1 > prep_time1 + INTERVAL '20 minutes') THEN
        -- Apply discount if the condition is met
        UPDATE order_items SET discount = 0.05 * amount WHERE serial_no = sno;
    ELSE
        -- Otherwise, update chef bonus
        UPDATE chef SET bonus = bonus + 2 WHERE chef_id = cid;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_serve_stat() RETURNS TRIGGER AS $$
BEGIN
    CALL end_time_disc(NEW.serial_no, NEW.chef_id);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE or replace TRIGGER update_serve_stat_trigger
before UPDATE ON serve_status
FOR EACH ROW
EXECUTE FUNCTION update_serve_stat();

-----------------------------------------------------------------

---Trigger to insert payment record after an insertion into the bill table---

CREATE OR REPLACE FUNCTION insert_into_payment() RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO payment (date_of_payment, bill_no) VALUES (CURRENT_DATE, NEW.bill_no);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE or replace TRIGGER insert_into_payment_trigger
AFTER INSERT ON bill
FOR EACH ROW
EXECUTE FUNCTION insert_into_payment();

-------------------------------------------------------------

---Trigger to update the dining_supervison table after an bill is done---

CREATE OR REPLACE FUNCTION update_dining_supervison() RETURNS TRIGGER AS $$
BEGIN
    UPDATE dining_supervison
    SET booking_stat = 'not_booked'
    WHERE table_id = NEW.table_id;
    RETURN NEW; 
END;
$$ LANGUAGE plpgsql;

CREATE or replace TRIGGER update_dining_supervison_trigger
AFTER INSERT ON bill
FOR EACH ROW
EXECUTE FUNCTION update_dining_supervison();

--------------------------------------------------------------------------

--------------------------------------CREATING ROLES--------------------------------------------------------------------------------

select rolname from pg_roles
	
create role chef
login
password 'chef123';

create role server
login
password 'server123';

create role dining_supervisor
login
password 'dining_supervisor123';

create role manager
login
password 'manager123';

create role customer
login
password 'customer123';


-------------------------------GRANT PRIVILAGE TO ROLES----------------------------------------

---granting all privileges to manager---
grant all
on all tables 
in schema "public"
to manager;

---granting privileges to chef---
grant update on serve_status to chef;
grant select on chef,food to chef;
grant select on serve_status to chef;
grant update,select on serve_status to chef;
grant update,select on order_items to chef;
grant update ,select on chef to chef;

-- grantong privileges to server
grant select on food , order_details, dining_supervison,serve_status to server;
grant all on order_items to server;
grant usage, select on sequence order_items_serial_no_seq TO server;
grant select on chef to server;
grant insert on serve_status to server;
grant insert on food to server;
grant update on food to server;

-- granting privileges to dining_supervisor

grant all on dining_supervison , bill , payment to dining_supervisor;
grant select on order_details,order_items to dining_supervisor;
grant insert on order_details to dining_supervisor;
grant all on customer to dining_supervisor;
GRANT USAGE, SELECT ON SEQUENCE customer_cust_id_seq TO dining_supervisor;
GRANT USAGE, SELECT ON SEQUENCE order_details_order_id_seq TO dining_supervisor;
GRANT USAGE, SELECT ON SEQUENCE bill_bill_no_seq TO dining_supervisor;
GRANT USAGE, SELECT ON SEQUENCE payment_payment_id_seq TO dining_supervisor;


-- granting privileges to customer
grant select on food to customer;


--------------CHECKING ROLES AND PRIVILEGES----------
select grantee,privilege_type from information_schema.role_table_grants
where table_name = 'serve_status'
---------------------------------------------------
	
-------------------------------------------VIEWS------------------------------------------------------------
	
---for displaying food detail---
	
create view display_food as (select food_id,food_name,food_description from food order by food_id);
select * from display_food

---food made by chef---

create view chef_food as ( SELECT order_items.order_id,food.food_name,CONCAT(employee.emp_fname, ' ', employee.emp_lname) AS chef_name
FROM serve_status
INNER JOIN order_items ON serve_status.serial_no = order_items.serial_no
INNER JOIN food ON order_items.food_id = food.food_id
INNER JOIN employee ON employee.emp_id = serve_status.chef_id
INNER JOIN order_details ON order_items.order_id = order_details.order_id
Where order_details.order_date = CURRENT_DATE
ORDER BY order_items.start_time ASC );

select * from chef_food;

---chef not served food-----

create view notserved_food as ( SELECT serve_status.chef_id,
food.food_name,order_items.quantity,serve_status.serial_no
FROM serve_status
INNER JOIN order_items ON serve_status.serial_no = order_items.serial_no
INNER JOIN food ON order_items.food_id = food.food_id
INNER JOIN order_details ON order_items.order_id = order_details.order_id
WHERE serve_status.status LIKE 'No'
AND order_details.order_date = CURRENT_DATE
ORDER BY order_items.start_time ASC
);

select * from notserved_food;

---view for revenue by date-----

CREATE VIEW orders_revenue_by_date AS(
SELECT order_date, COUNT(order_details.order_id) AS total_orders, SUM(net_amount) AS total_revenue
FROM order_details
JOIN bill ON order_details.order_id = bill.order_id
GROUP BY order_date );

select * from orders_revenue_by_date;

---view for top food items---

CREATE VIEW top_selling_food_items AS(
SELECT f.food_id, f.food_name, COALESCE(SUM(oi.quantity), 0) AS total_orders
FROM food f
LEFT JOIN order_items oi ON f.food_id = oi.food_id
GROUP BY f.food_id, f.food_name
ORDER BY total_orders DESC
LIMIT 5 );

select * from top_selling_food_items;

select * from order_items;
---view for top food itemms in each category---

CREATE OR REPLACE VIEW top_selling_foods_per_category AS (
SELECT f.food_id,f.food_name,f.total_order,c.category_name,
ROW_NUMBER() OVER (PARTITION BY f.category_id ORDER BY f.total_order DESC) AS rank
FROM food f
INNER JOIN categories c ON f.category_id = c.category_id
);

create or replace view output_for_top_each_cat as (SELECT food_id,food_name,total_order,category_name
FROM top_selling_foods_per_category
WHERE rank <= 1 and total_order>=1);

select * from output_for_top_each_cat;


----------------------------------INDEXES----------------------------------------

---creating BTREE for food on price---

CREATE INDEX idx_food_price ON food  USING BTREE (price);

--q1
CREATE OR REPLACE FUNCTION get_food_between_prices(min_price INT, max_price INT)
RETURNS TABLE (food_id INT, food_name VARCHAR(100), price INT, food_description VARCHAR(100))
AS $$
BEGIN
    RETURN QUERY
    SELECT f.food_id, f.food_name, f.price, f.food_description
    FROM food f
    WHERE f.price BETWEEN min_price AND max_price;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM get_food_between_prices(100, 200);

--q2
SELECT food_id, food_name, price, food_description
FROM food
ORDER BY price ASC;


---creating HASH for categories on category_name---

CREATE INDEX idx_categories_category_name_hash ON categories USING HASH (category_name);

--q1

CREATE OR REPLACE FUNCTION get_foods_by_category(p_category_name VARCHAR(20))
RETURNS TABLE (food_id INT, food_name VARCHAR(100), price INT, total_order INT, prep_time TIME, spice_level INT, food_description VARCHAR(100))
AS $$
BEGIN
    RETURN QUERY
    SELECT f.food_id, f.food_name, f.price, f.total_order, f.prep_time, f.spice_level, f.food_description
    FROM food f
    JOIN categories c ON f.category_id = c.category_id
    WHERE c.category_name = p_category_name;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM get_foods_by_category('Soup');



---create hash index on payment and btree index ---

-- Hash index on date_of_payment column in payment table
CREATE INDEX idx_payment_date_of_payment_hash ON payment USING HASH (date_of_payment);

-- B-tree index on net_amount column in bill table
CREATE INDEX idx_bill_net_amount_btree ON bill USING BTREE (net_amount);

---q1--
DROP FUNCTION get_orders_by_price_and_paymentmode(price_value NUMERIC, payment_mode_param VARCHAR(10))
	
CREATE OR REPLACE FUNCTION get_orders_by_price_and_paymentmode(price_value NUMERIC, payment_mode_param VARCHAR(10))
RETURNS TABLE (order_id INT, bill_id INT, net_amount NUMERIC) AS $$
BEGIN
    RETURN QUERY
    SELECT b.order_id, b.bill_no, b.net_amount::NUMERIC FROM bill b
    JOIN payment p ON b.bill_no = p.bill_no
    WHERE p.date_of_payment = CURRENT_DATE AND p.payment_mode = payment_mode_param AND b.net_amount > price_value;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM get_orders_by_price_and_paymentmode(100, 'gpay');


--q2--

SELECT order_date, COUNT(order_details.order_id) AS total_orders, SUM(bill.net_amount) AS total_revenue
FROM order_details JOIN bill ON order_details.order_id = bill.order_id
WHERE order_details.order_date = CURRENT_DATE
GROUP BY order_date;


--index 4--

CREATE EXTENSION IF NOT EXISTS pg_trgm;
CREATE INDEX idx_food_description_gin ON food USING gin (food_description gin_trgm_ops);

--q1--
SELECT * FROM food WHERE food_description ILIKE '%rice%';
--q2--
SELECT * FROM food WHERE food_description ILIKE '%chicken%'

--------------------------------------------------------------------------------------------------------------------------------
SELECT tgname, tgtype FROM pg_trigger WHERE tgrelid = 'order_items'::regclass;
SELECT tgname, tgtype FROM pg_trigger WHERE tgrelid = 'serve_status'::regclass;
drop trigger into_serve_stat_trigger_update on serve_status


----------------------------------FLOW CHECK-----------------------

insert into customer(cust_fname,cust_lname,contact_no ,email_id) values ('anusha','chapati','9392308319','anushac@gmail.com');

select * from customer;
  
call Table_allocation(4,2);

select * from order_details

--
call insert_oi (3,4,2);
call insert_oi (3,1,5);
select * from food;
select * from serve_status
select * from order_items
--
call chef_serve(1)
call chef_serve(2)
call bill(3,'g_pay')
select * from bill
select * from dining_supervison
select * from payment

----- to get bill--

CREATE OR REPLACE FUNCTION get_bills_and_payments(order_id_input INTEGER)
RETURNS TABLE (
    bill_no INTEGER,
    bill_amount NUMERIC,
    payment_no INTEGER,
    payment_amount NUMERIC
) AS $$
BEGIN
    RETURN QUERY
    SELECT *
    FROM bill b
    INNER JOIN payment p ON p.bill_no = b.bill_no
    WHERE b.order_id = order_id_input;
END;
$$ LANGUAGE plpgsql;


---TO GET BILL DETAILS---

CREATE OR REPLACE FUNCTION get_bills_and_payments(order_id_input INTEGER)
RETURNS TABLE (
    bill_no INTEGER,
    total_amount BIGINT,
    tax FLOAT,
    discount FLOAT,
    net_amount BIGINT,
    table_id VARCHAR(8),
    cust_id INT,
    payment_date DATE,
    payment_id int,
    payment_mode VARCHAR(10)
) AS $$
BEGIN
    RETURN QUERY
    SELECT b.bill_no, b.total_amount, b.tax, b.discount, b.net_amount, b.table_id, b.cust_id,
           p.date_of_payment, p.payment_id, p.payment_mode
    FROM bill b
    INNER JOIN payment p ON p.bill_no = b.bill_no
    WHERE b.order_id = order_id_input;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM get_bills_and_payments(4);

