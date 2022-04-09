
CREATE TABLE SUPPLIER(
    ID                  VARCHAR(30)     NOT NULL UNIQUE,
    Representative      VARCHAR(30),
    Phone_Number        VARCHAR(10),  
    PRIMARY KEY(ID)
);

CREATE TABLE DEPARTMENT(
    Name                VARCHAR(30)     NOT NULL UNIQUE,
    Section             VARCHAR(30),
    PRIMARY KEY(Name)
);


CREATE TABLE EMPLOYEE(
    ID                  VARCHAR(30)     NOT NULL UNIQUE,
    First_Name          VARCHAR(30),
    Last_Name           VARCHAR(30),
    Permission_Level    ENUM('0', '1'),
    Department_Name     VARCHAR(30),
    PRIMARY KEY(ID), 
    FOREIGN KEY(Department_Name) REFERENCES DEPARTMENT(Name)
);

CREATE TABLE SUPERVISES(
    Department_Name     VARCHAR(30)     NOT NULL,
    Employee_ID         VARCHAR(30)     NOT NULL,
    PRIMARY KEY(Department_Name, Employee_ID),
    FOREIGN KEY(Department_Name) REFERENCES DEPARTMENT(Name),
    FOREIGN KEY(Employee_ID) REFERENCES EMPLOYEE(ID)
);

CREATE TABLE ITEM(
    UPC                 VARCHAR(30)     NOT NULL UNIQUE,
    Restock_Amount      INT,
    Price               DECIMAL(10, 2),
    Interim_Price       DECIMAL(10, 2),
    Wholesale_Price     DECIMAL(10, 2),
    Current_Stock       INT,
    Department_Name     VARCHAR(30),
    Supplier_ID         VARCHAR(30),
    PRIMARY KEY(UPC), 
    FOREIGN KEY(Department_Name) REFERENCES DEPARTMENT(Name),
    FOREIGN KEY(Supplier_ID) REFERENCES SUPPLIER(ID)
);

CREATE TABLE LOCATION(
    Aisle_Number            INT         NOT NULL,
    Aisle_Side              INT         NOT NULL,
    Section_Number          INT         NOT NULL,
    Shelf_Number            INT         NOT NULL,
    Number_of_Items_Down    INT         NOT NULL,
    Item_UPC       INT,
    PRIMARY KEY(Aisle_Number, Aisle_Side, Section_Number, Shelf_Number, Number_of_Items_Down, Item_UPC), 
    FOREIGN KEY(Item_UPC) REFERENCES ITEM(UPC),
    CONSTRAINT item_location UNIQUE(Aisle_Number, Aisle_Side, Section_Number, Shelf_Number, Number_of_Items_Down)
);

CREATE TABLE EXPIRATION(
    Item_UPC            VARCHAR(30)     NOT NULL,
    Expiration_Date     DATE            NOT NULL,
    PRIMARY KEY(Item_UPC, Expiration_Date),
    FOREIGN KEY(Item_UPC) REFERENCES ITEM(UPC)
);

CREATE TABLE DELIVERY(
    ID                  VARCHAR(30)     NOT NULL UNIQUE,
    Arrival_Date        DATE,
    Pallet_Amount       INT, 
    Truck_Number        INT, 
    PRIMARY KEY(ID)
);

CREATE TABLE ORDER(
    Item_UPC            VARCHAR(30)     NOT NULL,
    Amount_of_Item      INT             NOT NULL,
    Order_Date          DATE            NOT NULL, 
    Delivery_Status     INT             NOT NULL, 
    Delivery_ID         VARCHAR(30)     NOT NULL;
    PRIMARY KEY(Item_UPC, Amount_of_Item, Order_Date, Delivery_Status),
    FOREIGN KEY(Item_UPC) REFERENCES ITEM(UPC),
    FOREIGN KEY(Delivery_ID) REFERENCES DELIVERY(ID),
    CONSTRAINT order_info UNIQUE(Item_UPC, Amount_of_Item, Order_Date, Delivery_Status)
);

CREATE TABLE CUSTOMER(
    Phone_Number        VARCHAR(10)     NOT NULL UNIQUE,
    Name                VARCHAR(30),
    PRIMARY KEY(Phone_Number, Name)
);

CREATE TABLE PURCHASE(
    Item_UPC            VARCHAR(30)     NOT NULL,
    Transaction_ID      INT             NOT NULL,
    Customer_Phone_Number          DATE            NOT NULL, 
    Number_Bought     INT             NOT NULL, 
    Price_Paid         VARCHAR(30)     NOT NULL;
    PRIMARY KEY(Item_UPC, Transaction_ID, Customer_Phone_Number),
    FOREIGN KEY(Item_UPC) REFERENCES ITEM(UPC),
    FOREIGN KEY(Transaction_ID) REFERENCES TRANSACTION(ID),
    FOREIGN KEY(Customer_Phone_Number) REFERENCES CUSTOMER(Phone_Number),
    CONSTRAINT order_info UNIQUE(Item_UPC, Amount_of_Item, Order_Date, Delivery_Status)
);