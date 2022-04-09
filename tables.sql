
CREATE TABLE SUPPLIER(
    ID                  VARCHAR(30)     NOT NULL,
    Representative      VARCHAR(30),
    Phone_Number        VARCHAR(10),  
    PRIMARY KEY(ID)
);

CREATE TABLE DELIVERY(
    ID                  VARCHAR(30)     NOT NULL,
    Arrival_Date        DATE,
    Pallet_Amount       INT, 
    Truck_Number        INT, 
    PRIMARY KEY(ID)
);

CREATE TABLE EMPLOYEE(
    ID                  VARCHAR(30)     NOT NULL,
    First_Name          VARCHAR(30),
    Last_Name           VARCHAR(30),
    Permission_Level    INT,
    Department_Name     VARCHAR(30),
    PRIMARY KEY(ID), 
    FOREIGN KEY(Department_Name) REFERENCES DEPARTMENT(Name)
);

CREATE TABLE DEPARTMENT(
    Name                VARCHAR(30)     NOT NULL,
    Section             VARCHAR(30),
    Supervisor_ID       VARCHAR(30)     NOT NULL,  
    PRIMARY KEY(Name),
    FOREIGN KEY(Supervisor_ID) REFERENCES EMPLOYEE(ID)
);

CREATE TABLE ITEM(
    UPC                 VARCHAR(30)     NOT NULL,
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
    Aisle_Number            INT             NOT NULL,
    Aisle_Side              INT             NOT NULL,
    Section_Number          INT             NOT NULL,
    Shelf_Number            INT             NOT NULL,
    Number_of_Items_Down    INT             NOT NULL,
    Item_UPC       INT,
    PRIMARY KEY(UPC), 
    FOREIGN KEY(Department_Name) REFERENCES DEPARTMENT(Name),
    FOREIGN KEY(Supplier_ID) REFERENCES SUPPLIER(ID)
);