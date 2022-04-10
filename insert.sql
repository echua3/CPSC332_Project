/*  insert.sql
    Epiphany Chua
    echua@csu.fullerton.edu
*/
/* After that implement your schema in SQL. You should also include SQL statements to insert data into the tables. The data should have no table be empty and should include at least:
5 items
5 customers
2 expiration dates for a single item
3 employees
3 departments
2 orders
*/
INSERT INTO SUPPLIER
VALUES 
    ('SUP001', 'REP 1', '0001112222'), 
    ('SUP002', 'REP 2', '0001112223'),
    ('SUP003', 'REP 3', '0001112224');

INSERT INTO DEPARTMENT
VALUES 
    ('Fruit', 'Produce'),
    ('Vegetable', 'Produce'),
    ('Fish', 'Seafood'),
    ('Bread', 'Bakery'),
    ('Cake', 'Bakery');

INSERT INTO EMPLOYEE
VALUES 
    ('EMPF01', 'Amy', 'Apples', '1', 'Fruit'), 
    ('EMPB01', 'Bob', 'Baker', '1', 'Bread'), 
    ('EMPC01', 'Cat', 'Cupcake', '1', 'Cake'), 
    ('EMPFI1', 'Dylan', 'Daggartooth', '1', 'Fish'),
    ('EMPV01', 'Earl', 'Edamame', '1', 'Vegetable'),
    ('EMPF02', 'Flyn', 'Fuji', '0', 'Fruit'),
    ('EMPB02', 'Gal', 'Grain', '0', 'Bread');

INSERT INTO SUPERVISES
VALUES 
    ('Fruit', 'EMPF01'),
    ('Vegetable', 'EMPV01'),
    ('Fish', 'EMPFI1'),
    ('Bread', 'EMPB01'),
    ('Cake', 'EMPC01');

INSERT INTO ITEM
VALUES 
    ('APPLE1', 50, 1.99, 1.29, 0.99, 25, 'Fruit', 'SUP001'), 
    ('APPLE2', 40, 2.99, 1.99, 1.50, 20, 'Fruit', 'SUP001'),
    ('WHITE1', 25, 2.99, 0.99, 0.50, 10, 'Bread', 'SUP002'),
    ('WHEAT1', 30, 3.99, 1.50, 1.99, 7, 'Bread', 'SUP002'),
    ('SALMON1', 10, 5.99, 3.99, 2.50, 4, 'Fish', 'SUP003'),
    ('CARROT1', 50, 1.99, 1.00, 0.30, 20, 'Vegetable', 'SUP001'),
    ('VANILLA1', 5, 10.99, 5.99, 3.99, 2, 'Cake', 'SUP002');  

INSERT INTO LOCATION
VALUES 
    (1, 'right', 1, 1, 0, 'APPLE1'),
    (1, 'right', 1, 1, 1, 'APPLE2'),
    (1, 'left', 1, 1, 2, 'CARROT1'),
    (2, 'right', 1, 1, 0, 'WHITE1'),
    (2, 'right', 1, 1, 1, 'WHEAT1'),
    (2, 'right', 1, 1, 3, 'WHITE1'),
    (2, 'left', 1, 1, 1, 'VANILLA1'),
    (3, 'left', 3, 3, 2, 'SALMON1');

INSERT INTO EXPIRATION
VALUES 
    ('APPLE1', "2022-04-29"),
    ('APPLE1', "2022-04-30"), 
    ('APPLE2', "2022-04-25"),
    ('WHITE1', "2022-04-15"),
    ('WHEAT1', "2022-04-16"),
    ('SALMON1', "2022-04-14"),
    ('CARROT1', "2022-05-20"),
    ('VANILLA1', "2022-04-17");  

INSERT INTO DELIVERY
VALUES 
    ('DELV01', "2022-04-29", 50, 1),
    ('DELV02', "2022-04-30", 45, 2), 
    ('DELV03', "2022-04-25", 50, 1),
    ('DELV04', "2022-04-15", 30, 3);

INSERT INTO `ORDER`
VALUES 
    ('APPLE1', 4, "2022-04-10", 'yes', 'DELV01'),
    ('WHITE1', 2, "2022-04-10", 'yes', 'DELV01'),
    ('APPLE1', 10, "2022-04-11", 'no', NULL),
    ('VANILLA1', 1, "2022-04-10", 'yes', 'DELV02');

INSERT INTO CUSTOMER
VALUES 
    ('0000000000', 'JOHN CUSTOMER'),
    ('1111111111', 'JAMES CUSTOMER'),
    ('2222222222', 'JACK CUSTOMER'),
    ('3333333333', 'JULIA CUSTOMER'),
    ('4444444444', 'JOANE CUSTOMER'),
    ('5555555555', 'JAMIE CUSTOMER');
