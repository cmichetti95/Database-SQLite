--- 23-04-2021 17:19:13
--- CreateQueries.txt
CREATE TABLE ACCOUNT (
    Account_ID int NOT NULL,
    Email varchar(30) NOT NULL,
    Profile_Pic image,
    Fname varchar(25) NOT NULL,
    Lname varchar(25) NOT NULL,
    PRIMARY KEY (Account_ID)
);

CREATE TABLE BUYER (
    Buyer_ID int NOT NULL,
    Address varchar(50) NOT NULL,
    Num_Items int,
    FOREIGN KEY (Buyer_ID) REFERENCES ACCOUNT(Account_ID)
    FOREIGN KEY (Num_Items) REFERENCES ORDER1(Order_ID)
);

CREATE TABLE BUYERHISTORY (
    Buyer_ID int NOT NULL,
    Order_ID int NOT NULL,
    FOREIGN KEY (Buyer_ID) REFERENCES ACCOUNT(Account_ID)
    FOREIGN KEY (Order_ID) REFERENCES ORDER1(Order_ID)
);

CREATE TABLE SELLER (
    Seller_ID int NOT NULL,
    Money_Made int NOT NULL,
    Inventory_size int NOT NULL,
    Karma int NOT NULL,
    FOREIGN KEY (Seller_ID) REFERENCES ACCOUNT(Account_ID)
);

CREATE TABLE SELLERPRODUCTS (
    Seller_ID int NOT NULL,
    P_ID int NOT NULL,
    FOREIGN KEY (Seller_ID) REFERENCES ACCOUNT(Account_ID)
    FOREIGN KEY (P_ID) REFERENCES PRODUCT(P_ID)
);

CREATE TABLE SELLERSTORES (
    Seller_ID int NOT NULL,
    Store_ID int NOT NULL,
    FOREIGN KEY (Seller_ID) REFERENCES ACCOUNT(Account_ID)
    FOREIGN KEY (Store_ID) REFERENCES STORE(Store_ID)
);

CREATE TABLE STORE (
    Store_ID int NOT NULL,
    Owner_ID int NOT NULL,
    Name varchar(50) NOT NULL,
    Description varchar(150),
    Logo image,
    Num_Sales int NOT NULL,
    Date_Opened varchar(15) NOT NULL,
    PRIMARY KEY (Store_ID)
    FOREIGN KEY (Owner_ID) REFERENCES ACCOUNT(Account_ID)
);

CREATE TABLE STORELIST (
    Store_ID int NOT NULL,
    Product_ID int NOT NULL,
    FOREIGN KEY (Store_ID) REFERENCES STORE(Store_ID)
    FOREIGN KEY (Product_ID) REFERENCES PRODUCT(P_ID)
);

CREATE TABLE PRODUCT (
    P_ID int NOT NULL,
    Pname varchar(25) NOT NULL,
    Str_ID int NOT NULL,
    File_Type varchar(10) NOT NULL,
    Cost int NOT NULL,
    Description varchar(150),
    Size varchar(10) NOT NULL,
    Units_sold int NOT NULL,
    Pictures image,
    PRIMARY KEY (P_ID)
    FOREIGN KEY (Str_ID) REFERENCES STORE(Store_ID)
);

CREATE TABLE ORDER1 (
    Order_ID int NOT NULL,
    B_ID int NOT NULL,
    Num_Items int NOT NULL,
    Price int NOT NULL,
    Pdate varchar(15) NOT NULL,
    PRIMARY KEY (Order_ID)
    FOREIGN KEY (B_ID) REFERENCES ACCOUNT(Account_ID)
);

CREATE TABLE ORDERSELLERS (
    Order_ID int NOT NULL,
    S_ID int NOT NULL,
    FOREIGN KEY (S_ID) REFERENCES STORE(Store_ID)
    FOREIGN KEY (Order_ID) REFERENCES ORDER1(Order_ID)
);

CREATE TABLE ORDERPRODUCTS (
    Order_ID int NOT NULL,
    P_ID int NOT NULL,
    FOREIGN KEY (P_ID) REFERENCES PRODUCT(P_ID)
    FOREIGN KEY (Order_ID) REFERENCES ORDER1(Order_ID)
);

CREATE TABLE PAYMENT (
    Transaction_ID int NOT NULL,
    Ord_ID int NOT NULL,
    PRIMARY KEY (Transaction_ID)
    FOREIGN KEY (Ord_ID) REFERENCES ORDER1(Order_ID)
);

CREATE TABLE PAYMENTTYPES (
    Transaction_ID int NOT NULL,
    Payment_Type varchar(25) NOT NULL,
    FOREIGN KEY (Transaction_ID) REFERENCES PAYMENT(Order_ID)
);


CREATE TABLE FEEDBACK (
    B_ID int NOT NULL,
    P_ID int NOT NULL,
    Rating int NOT NULL,
    Review varchar(255),
    FOREIGN KEY (B_ID) REFERENCES ACCOUNT(Account_ID)
    FOREIGN KEY (P_ID) REFERENCES PRODUCT(P_ID)
);

CREATE TABLE TRENDING (
    T_ID int NOT NULL,
    Str_ID int NOT NULL,
    P_ID int NOT NULL,
    PRIMARY KEY (T_ID)
    FOREIGN KEY (Str_ID) REFERENCES STORE(Store_ID)
    FOREIGN KEY (P_ID) REFERENCES PRODUCT(P_ID)
);

CREATE TABLE MSGING_SYSTEM (
    Acct1_ID int NOT NULL,
    ACCT2_ID int NOT NULL,
    Text_Chat varchar(255),
    Chat_history varchar(255),
    FOREIGN KEY (Acct1_ID) REFERENCES ACCOUNT(Account_ID)
    FOREIGN KEY (ACCT2_ID) REFERENCES ACCOUNT(Account_ID)
);

--- 23-04-2021 17:19:22
--- InsertQueries.txt

INSERT INTO ACCOUNT (Account_ID, Email, Profile_Pic, Fname, Lname)
VALUES
        ('1485304', 'osmith342@gmail.com', '', 'Olivia', 'Smith'),
        ('9841584', 'wjohn122@gmail.com', '', 'Liam', 'Johnson'),
        ('6424641', 'williamsemma234@gmail.com', '', 'Emma', 'Williams'),
        ('6957435', 'jones32@gmail.com', '', 'Ava', 'Jones'),
        ('9247020', 'ngarcia444@gmail.com', '', 'Samuel', 'Garcia'),
        ('5385230', 'miller234@gmail.com', '', 'Sophia', 'Miller'),
        ('2262416', 'isadavis9@gmail.com', '', 'Isabella', 'Davis'),     
        ('9431235', 'wilsonnn567@gmail.com', '', 'William', 'Wilson'),     
        ('1231985', 'lee333@gmail.com', '', 'Charlotte', 'Lee'),     
        ('4418579', 'thomasNoah00@gmail.com', '', 'Noah', 'Thomas'),     
        ('2323547', 'lewisa2@gmail.com', '', 'Amelia', 'Lewis'),     
        ('9509123', 'scottm449@gmail.com', '', 'Mia', 'Scott'),     
        ('8636787', 'rodseb376@gmail.com', '', 'Sebastian', 'Rodriguez'),     
        ('3742023', 'brownabigal21@gmail.com', '', 'Abigail', 'Brown'),     
        ('3604133', 'clark1990@gmail.com', '', 'Emily', 'Clark'),     
        ('4784946', 'ramirez97@gmail.com', '', 'Daniel', 'Ramirez'),     
        ('2589595', 'ethan1980white@gmail.com', '', 'Ethan', 'White'),     
        ('6425758', 'green44@gmail.com', '', 'Camila', 'Green'),     
        ('1525605', 'youngisaac49@gmail.com', '', 'Isaac', 'Young'),     
        ('1186508', 'baker678@gmail.com', '', 'Avery', 'Baker');   
        
INSERT INTO BUYER (Buyer_ID, Address, Num_Items)
VALUES
        ('1485304', '5011  Marshville Road', '2'),
        ('9841584', '1884  Harry Place', '2'),
        ('6424641', '3073  Cambridge Drive', '1'),
        ('6957435', '1955  Pickens Way', '1'),
        ('9247020', '4044  Parkview Drive', '1'),
        ('5385230', '2285  Hickory Ridge Drive', '0'),
        ('2262416', '564  Sweetwood Drive', '0'),    
        ('9431235', '1546  Rosewood Court', '0'),
        ('1231985', '608  Deans Lane', '0'),   
        ('4418579', '2109  Glendale Avenue', '0'),   
        ('2323547', '1723  Armory Road', '0'),    
        ('9509123', '2615  Hart Ridge Road', '0'),    
        ('8636787', '4960  Northwest Boulevard', '0'),    
        ('3742023', '3101  Lucky Duck Drive', '0'),    
        ('3604133', '257  Byers Lane', '0');    
             
INSERT INTO BUYERHISTORY (Buyer_ID, Order_ID)
VALUES
        ('1485304', '3132971'),
        ('1485304', '3132972'),
        ('9841584', '6683836'),
        ('6424641', '4042109'),
        ('6957435', '8218788'),
        ('9247020', '9138981'),
        ('9841584', '9156102');         

INSERT INTO SELLER (Seller_ID, Money_Made, Inventory_size, Karma)
VALUES     
        ('5385230', '0', '1', '4'),
        ('2262416', '0', '1', '4'),    
        ('9431235', '18', '2', '3'),   
        ('1231985', '1', '4', '4'),  
        ('4418579', '9', '2', '4'),
        ('2323547', '0', '1', '4'),   
        ('9509123', '0', '0', '1'),  
        ('8636787', '0', '2', '4'),   
        ('3742023', '0', '0', '4'),
        ('3604133', '12', '3', '4'),
        ('4784946', '0', '1', '4'),
        ('2589595', '0', '1', '4'),
        ('6425758', '0', '1', '4'),
        ('1525605', '3', '3', '2'),
        ('1186508', '12', '4', '3');
        
INSERT INTO SELLERPRODUCTS (Seller_ID, P_ID)
VALUES
        ('5385230','4881373'),    
        ('2262416','4458068'),   
        ('9431235','3050714'),
        ('9431235','1953576'),
        ('1231985','1458451'),
        ('1231985','1458452'),
        ('1231985','1458453'),
        ('1231985','1458454'),
        ('4418579','3924439'),
        ('4418579','7019580'),
        ('2323547','7019581'),
        ('8636787','8998962'),
        ('8636787','8998963'), 
        ('3604133','2948203'),
        ('3604133','2948204'),
        ('3604133','2948206'),
        ('4784946','5381923'),       
        ('2589595','8968277'),       
        ('6425758','1471125'),     
        ('1525605','3384413'),
        ('1525605','3384416'),
        ('1525605','3384419'),
        ('1186508','4931685'),
        ('1186508','9885771'),
        ('1186508','1409725'),
        ('1186508','1673759');
        
INSERT INTO SELLERSTORES (Seller_ID, Store_ID)
VALUES 
        ('5385230', '2611109'),
        ('2262416', '5989949'),
        ('9431235', '7615283'),
        ('1231985', '4668118'),
        ('4418579', '1589545'),
        ('2323547', '3312855'),
        ('9509123', '5379371'),
        ('8636787', '6065229'),
        ('3742023', '7373666'),
        ('3604133', '6049367'),   
        ('4784946', '2321423'),
        ('2589595', '2641996'),
        ('6425758', '3379919'),
        ('1525605', '1439855'),
        ('1186508', '9710868');

INSERT INTO STORE (Store_ID, Owner_ID, Name, Description, Logo, Num_Sales, Date_Opened)
VALUES
        ('2611109', '5385230', 'Brainstorm File', '', '', '0', '6/9/2020'),
        ('5989949', '2262416', 'File Formula', '', '', '0', '8/13/2020'),    
        ('7615283', '9431235', 'Zip Create', '', '', '2', '8/28/2020'),   
        ('4668118', '1231985', 'Natura Zip', '', '', '1', '10/2/2020'),  
        ('1589545', '4418579', 'Savage File', '', '', '1', '11/10/2020'),
        ('3312855', '2323547', 'Theme Image', '', '', '0', '2/22/2020'),   
        ('5379371', '9509123', 'Image Mate', '', '', '0', '6/4/2020'),  
        ('6065229', '8636787', 'Fair Zip', '', '', '0', '7/1/2020'),   
        ('7373666', '3742023', 'Portable Pdf', '', '', '0', '9/8/2020'),
        ('6049367', '3604133', 'TrueBlue Zip', '', '', '1', '10/20/2020'),
        ('2321423', '4784946', 'Mainstream Store', '', '', '0', '2/7/2020'),
        ('2641996', '2589595', 'Quick Image', '', '', '0', '9/7/2020'),
        ('3379919', '6425758', 'Red Pdfs', '', '', '0', '9/16/2020'),
        ('1439855', '1525605', 'Certified Store', '', '', '3', '11/5/2020'),
        ('9710868', '1186508', 'Store Top', '', '', '1', '11/8/2020');
        
INSERT INTO STORELIST (Store_ID, Product_ID)
VALUES
        ('2611109', '4881373'),        
        ('5989949', '4458068'),          
        ('7615283', '3050714'),
        ('7615283', '1953576'),        
        ('4668118', '1458451'),
        ('4668118', '1458452'), 
        ('4668118', '1458453'), 
        ('4668118', '1458454'), 
        ('1589545', '3924439'),
        ('1589545', '7019580'),
        ('3312855', '7019581'),         
        ('6065229', '8998962'),        
        ('6065229', '8998963'),        
        ('6049367', '2948203'),
        ('6049367', '2948204'),
        ('6049367', '2948206'),
        ('2321423', '5381923'),        
        ('2641996', '8968277'),        
        ('3379919', '1471125'),        
        ('1439855', '3384413'),
        ('1439855', '3384416'),
        ('1439855', '3384419'),
        ('9710868', '4931685'),
        ('9710868', '9885771'),
        ('9710868', '1409725'),
        ('9710868', '1673759');
        
INSERT INTO PRODUCT (P_ID, Pname, Str_ID, File_Type, Cost, Description, Size, Units_sold, Pictures)
VALUES     
        ('4881373', 'City', '2611109', '.png', '4', 'Photos of cities.', '65 KB', '0', ''),        
        ('4458068', 'Menus', '5989949', '.pdf', '11', 'list of menu options.', '42 KB', '0', ''),        
        ('3050714', 'Pet', '7615283', '.jpeg', '10', 'Images of different pets.', '8 MB', '2', ''),    
        ('1953576', 'Allergies', '7615283', '.pdf', '21', 'Information on allergies on the product Pet.', '42 KB', '0', ''),           
        ('1458451', 'Library', '4668118', '.zip', '9', 'List of books.', '4 GB', '1', ''),
        ('1458452', 'Library2', '4668118', '.zip', '12', 'List of books part two.', '5 GB', '0', ''),  
        ('1458453', 'Library3', '4668118', '.zip', '5', 'List of books part three.', '5 GB', '0', ''),
        ('1458454', 'Library3N', '4668118', '.zip', '22', 'List of books part three newest version.', '5 GB', '0', ''),    
        ('3924439', 'Course 2019', '1589545', '.zip', '8', 'Course material from a past chemistry class.', '4 GB', '1', ''),
        ('7019580', 'Medicine List', '1589545', '.pdf', '7', 'list of medicines from Course 2019 and ingredients.', '16 MB', '0', ''),        
        ('7019581', 'Ducks', '3312855', '.png', '9', 'ducks.', '65 KB', '0', ''),      
        ('8998962', 'Mods', '6065229', '.zip', '8', 'Mods for a game.', '4 GB', '0', ''),
        ('8998963', 'Mods2', '6065229', '.zip', '18', 'Mods for a game.', '4 GB', '0', ''),          
        ('2948203', 'Custom Content', '6049367', '.zip', '6', 'Created custom content for a game.', '6 GB', '1', ''),
        ('2948204', 'Custom Content2', '6049367', '.zip', '4', 'Created custom content for a game.', '6 GB', '0', ''),
        ('2948206', 'Custom Content3', '6049367', '.zip', '4', 'Created custom content for a game.', '6 GB', '0', ''),
        ('5381923', 'Course 2020', '2321423', '.zip', '10', 'Materials from a past class.', '2 GB', '0', ''),        
        ('8968277', 'Rain', '2641996', '.png', '16', '', '65 KB', '0', ''),        
        ('1471125', 'Immunizations', '3379919', '.pdf', '7', 'Immuzations and their ingredients, sideffects, etc.', '39 KB', '0', ''),        
        ('3384413', 'Test Example', '1439855', '.pdf', '14', 'Test from a past class.', '10 KB', '3', ''),
        ('3384416', 'Test Example2', '1439855', '.pdf', '8', 'Test from a past class.', '10 KB', '0', ''),
        ('3384419', 'Fimal Example', '1439855', '.pdf', '8', 'Final from a past class.', '10 KB', '0', ''),
        ('4931685', 'School Supplies', '9710868', '.pdf','6', '', '100 KB', '1', ''),
        ('9885771', 'Letters', '9710868', '.zip', '32', '', '2 GB', '0', ''),
        ('1409725', 'Learning', '9710868', '.zip', '5', '', '4 GB', '0', ''),
        ('1673759', 'Lecture 2018', '9710868', '.pdf', '9', '', '78 KB', '0', '');       

INSERT INTO ORDER1 (Order_ID, B_ID, Num_Items, Price, Pdate)
VALUES
        ('3132971', '1485304', '3', '30', '1/1/2021'),
        ('3132972', '1485304', '1', '14', '1/19/2021'),
        ('6683836', '9841584', '1', '14', '1/10/2021'),
        ('4042109', '6424641', '1', '6', '1/12/2021'),
        ('8218788', '6957435', '1', '8', '1/19/2021'),
        ('9138981', '9247020', '1', '9', '3/11/2021'),
        ('9156102', '9841584', '1', '10', '1/11/2021');     

INSERT INTO ORDERSELLERS (Order_ID, S_ID)
VALUES
        ('3132971', '1186508'),
        ('3132971', '9431235'),
        ('3132971', '1525605'),
        ('3132972', '1525605'),
        ('6683836', '1525605'),
        ('4042109', '3604133'),
        ('8218788', '4418579'),
        ('9138981', '1231985'),
        ('9156102', '9431235');

        
INSERT INTO ORDERPRODUCTS (Order_ID,P_ID)
VALUES
        ('3132971', '4931685'),
        ('3132971', '3050714'),
        ('3132971', '3384413'),
        ('3132972', '3384413'),
        ('6683836', '3384413'),
        ('4042109', '2948203'),
        ('8218788', '3924439'),
        ('9138981', '1458451'),
        ('9156102', '3050714');    
        
INSERT INTO PAYMENT (Transaction_ID, Ord_ID)
VALUES
        ('874795501', '3132971'),
        ('974795502', '3132972'),
        ('485018788', '6683836'),
        ('166063095', '4042109'),
        ('703722251', '8218788'),
        ('997251465', '9138981'),
        ('566593072', '9156102');
        
INSERT INTO PAYMENTTYPES (Transaction_ID, Payment_Type)
VALUES
        ('874795501', 'Credit Card'),
        ('974795502', 'PayPal'),
        ('485018788', 'Credit Card'),
        ('166063095', 'PayPal'),
        ('703722251', 'Credit Card'),
        ('997251465', 'Credit Card'),
        ('566593072', 'Credit Card');

INSERT INTO FEEDBACK (B_ID, P_ID, Review, Rating)
VALUES
        ('1485304', '4931685', '', '5'),
        ('1485304', '3050714', '', '4'),
        ('1485304', '3384413', '', '4'),
        ('9841584', '3384413', '', '5'),
        ('6424641', '2948203', '', '3'),
        ('6957435', '3924439', '', '1'),
        ('9247020', '1458451', '', '2'),
        ('9841584', '3050714', '', '2');        

INSERT INTO TRENDING (T_ID, Str_ID, P_ID)
VALUES
        ('134199', '9710868', '4931685'),
        ('674794', '1439855', '3384413'),
        ('268769', '6049367', '2948204'),
        ('761779', '1589545', '7019580'),    
        ('307157', '4668118', '1458454');   

INSERT INTO MSGING_SYSTEM (Acct1_ID, ACCT2_ID, Text_Chat, Chat_history)
VALUES
        ('1485304', '1186508', '', 'hi,hi,thiswillbeanexampleofachathistory'),
        ('9841584', '1525605', '', ''),
        ('6424641', '6425758', '', ''),
        ('6957435', '2589595', '', ''),
        ('9247020', '4784946', '', ''),
        ('5385230', '3604133', '', '');

