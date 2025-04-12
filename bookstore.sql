
-- Creating the database: bookStoreDB and its related 15 tables

CREATE DATABASE bookStoreDB;
USE bookstoredb;

CREATE TABLE country(
    countryID INT PRIMARY KEY,
    countryName VARCHAR(100)
);

CREATE TABLE address_status(
    address_statusID INT AUTO_INCREMENT PRIMARY KEY,
    statusName VARCHAR(100) NOT NULL
);

CREATE TABLE publisher(
    publisherID INT PRIMARY KEY,
    publisherName VARCHAR(100)
);

CREATE TABLE author(
    authorID INT PRIMARY KEY,
    authorName VARCHAR(100)
);

CREATE TABLE book_language(
    languageID INT PRIMARY KEY,
    languageName VARCHAR(100)
);

CREATE TABLE shipping_method(
    shipping_methodID INT AUTO_INCREMENT PRIMARY KEY,
    methodName VARCHAR(50),
    cost DECIMAL(10, 3)
);

CREATE TABLE order_status(
    order_statusID INT AUTO_INCREMENT PRIMARY KEY,
    statusName VARCHAR(100)
);

CREATE TABLE customer(
    customerID INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(20),
    lastName VARCHAR(20),
    email VARCHAR(50)
);

CREATE TABLE address(
    addressID INT AUTO_INCREMENT PRIMARY KEY,
    countryID INT,
    street VARCHAR(100),
    city VARCHAR(100),
    FOREIGN KEY (countryID) REFERENCES country(countryID)
);

CREATE TABLE book(
    bookID INT AUTO_INCREMENT PRIMARY KEY,
    publisherID INT,
    languageID INT,
    title VARCHAR(100),
    isbn VARCHAR(100),
    publishYear INT,
    price DECIMAL(10,2),
    FOREIGN KEY (publisherID) REFERENCES publisher(publisherID),
    FOREIGN KEY (languageID) REFERENCES book_language(languageID)
);

CREATE TABLE customer_address(
    customerID INT,
    addressID INT,
    address_statusID INT,
    PRIMARY KEY (customerID, addressID),
    FOREIGN KEY (customerID) REFERENCES customer(customerID),
    FOREIGN KEY (addressID) REFERENCES address(addressID),
    FOREIGN KEY (address_statusID) REFERENCES address_status(address_statusID)
);

CREATE TABLE book_author(
    bookID INT,
    authorID INT,
    PRIMARY KEY (bookID, authorID),
    FOREIGN KEY (bookID) REFERENCES book(bookID),
    FOREIGN KEY (authorID) REFERENCES author(authorID)
);

CREATE TABLE cust_order(
    orderID INT AUTO_INCREMENT PRIMARY KEY,
    customerID INT,
    shipping_methodID INT,
    order_statusID INT,
    orderDate DATE,
    FOREIGN KEY (customerID) REFERENCES customer(customerID),
    FOREIGN KEY (shipping_methodID) REFERENCES shipping_method(shipping_methodID),
    FOREIGN KEY (order_statusID) REFERENCES order_status(order_statusID)
);

CREATE TABLE order_line(
    order_lineID INT AUTO_INCREMENT PRIMARY KEY,
    orderID INT,
    bookID INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (orderID) REFERENCES cust_order(orderID),
    FOREIGN KEY (bookID) REFERENCES book(bookID)
);

CREATE TABLE order_history(
    historyID INT AUTO_INCREMENT PRIMARY KEY,
    orderID INT,
    order_statusID INT,
    changeDate DATE,
    FOREIGN KEY (orderID) REFERENCES cust_order(orderID),
    FOREIGN KEY (order_statusID) REFERENCES order_status(order_statusID)
);



-- adding data to the customer table. 

insert into customer
Values(1, "Mary", "Magdala", "MaryMagdala@gmail.com");
insert into customer (firstname, lastname, email)
Values
('Abel','Colleen','AbelColleen@gmail.com'),
('Abel','James','AbelJames@gmail.com'),
('Abel','Karina','AbelKarina@gmail.com'),
('Abel','William','AbelWilliam@gmail.com'),
('Allen','Peter','AllenPeter@gmail.com'),
('Altman','Mary','AltmanMary@gmail.com'),
('Ambrose','Bob','AmbroseBob@gmail.com'),
('Bally','Barry','BallyBarry@gmail.com'),
('Banks','Jacqueline','BanksJacqueline@gmail.com'),
('Barber','Mary','BarberMary@gmail.com'),
('Binga','Erin','BingaErin@gmail.com'),
('Binga','Frieda','BingaFrieda@gmail.com'),
('Binga','Teri','BingaTeri@gmail.com'),
('Bowers','Melanie','BowersMelanie@gmail.com'),
('Briscoll','Doug','BriscollDoug@gmail.com'),
('Brown','Geoff','BrownGeoff@gmail.com'),
('BSaleshoff','Tim','BSaleshoffTim@gmail.com'),
('Califano','Theresa','CalifanoTheresa@gmail.com'),
('Calvin','Marianne','CalvinMarianne@gmail.com'),
('Chen','Shing','ChenShing@gmail.com'),
('Connors','Greg','ConnorsGreg@gmail.com'),
('Cuffaro','Robert','CuffaroRobert@gmail.com'),
('Culbert','Frank','CulbertFrank@gmail.com'),
('Dandrow','Shirley','DandrowShirley@gmail.com'),
('Davidson','Anne','DavidsonAnne@gmail.com'),
('Davies','Lance','DaviesLance@gmail.com'),
('DeVinney','Kristen','DeVinneyKristen@gmail.com'),
('Drake','Susan','DrakeSusan@gmail.com'),
('EarnhSales','Kyle','EarnhSalesKyle@gmail.com'),
('Feldsott','George','FeldsottGeorge@gmail.com'),
('Gibbs','Richard','GibbsRichard@gmail.com'),
('Gorski','George','GorskiGeorge@gmail.com'),
('Halal','Cheryl','HalalCheryl@gmail.com'),
('Hayes','Ted','HayesTed@gmail.com'),
('Hill','Carol','HillCarol@gmail.com'),
('Hillen','Brooks','HillenBrooks@gmail.com'),
('Hinkelman','Brad','HinkelmanBrad@gmail.com'),
('Hoffman','Paul','HoffmanPaul@gmail.com'),
('Howard','Bradley','HowardBradley@gmail.com'),
('Hume','Chris','HumeChris@gmail.com'),
('Jacobs','John','JacobsJohn@gmail.com'),
('Kim','Sung','KimSung@gmail.com'),
('Kling','Sara','KlingSara@gmail.com'),
('Kramer','Dean','KramerDean@gmail.com'),
('Lewis','Michael','LewisMichael@gmail.com'),
('Lillie','Christina','LillieChristina@gmail.com'),
('Maccaluso','Joshua','MaccalusoJoshua@gmail.com'),
('MacFall','Jeri Lynn','MacFallJeri Lynn@gmail.com'),
('Mallory','Fred','MalloryFred@gmail.com'),
('Masters','Todd','MastersTodd@gmail.com'),
('Mayron','Kathy','MayronKathy@gmail.com'),
('Mazza','Dominick','MazzaDominick@gmail.com'),
('McDonald','Jerry','McDonaldJerry@gmail.com'),
('Miller','Theresa','MillerTheresa@gmail.com'),
('MSalesin','Paul','MSalesinPaul@gmail.com'),
('Murray','Robert','MurrayRobert@gmail.com'),
('Ness','Theodore','NessTheodore@gmail.com'),
('Owens','Alice','OwensAlice@gmail.com'),
('Parker','Joanne','ParkerJoanne@gmail.com'),
('Paterson','Henry','PatersonHenry@gmail.com'),
('Petty','Sue','PettySue@gmail.com'),
('Reagan','Laura','ReaganLaura@gmail.com'),
('Reed','Chris','ReedChris@gmail.com'),
('Reese','Donald','ReeseDonald@gmail.com'),
('Rich','James','RichJames@gmail.com'),
('Richardson','Michael','RichardsonMichael@gmail.com'),
('Robinson','Paula','RobinsonPaula@gmail.com'),
('Rose','Seth','RoseSeth@gmail.com'),
('Simmons','Lynne','SimmonsLynne@gmail.com'),
('Simpson','Bill','SimpsonBill@gmail.com'),
('Singer','Steve','SingerSteve@gmail.com'),
('Sloan','Grace','SloanGrace@gmail.com'),
('Smith','Brian','SmithBrian@gmail.com'),
('Smith','Julia','SmithJulia@gmail.com'),
('Smith','Katie','SmithKatie@gmail.com'),
('Smith','Kim','SmithKim@gmail.com'),
('Snyder','Jennifer','SnyderJennifer@gmail.com'),
('Steadman','Molly','SteadmanMolly@gmail.com'),
('StewSales','Helen','StewSalesHelen@gmail.com'),
('Strong','Jeffrey','StrongJeffrey@gmail.com'),
('Sullivan','Lorrie','SullivanLorrie@gmail.com'),
('Swayne','Harry','SwayneHarry@gmail.com'),
('Switzer','Maria','SwitzerMaria@gmail.com'),
('Taylor','Holly','TaylorHolly@gmail.com'),
('Thomas','Greg','ThomasGreg@gmail.com'),
('Tooley','Amy','TooleyAmy@gmail.com'),
('Trelly','Edward','TrellyEdward@gmail.com'),
('Tucker','Carol','TuckerCarol@gmail.com'),
('Wheeler','Bill','WheelerBill@gmail.com'),
('Whitney','Sam','WhitneySam@gmail.com'),
('Williams','Esther','WilliamsEsther@gmail.com'),
('Willis','Sean','WillisSean@gmail.com'),
('Winger','Lindsey','WingerLindsey@gmail.com'),
('Winters','Jane','WintersJane@gmail.com');


-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Inserting values into the tables
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- Insert into the country table
INSERT INTO country (countryID, countryName) VALUES
(1, 'South Africa'),
(2, 'Kenya'),
(3, 'Ghana'),
(4, 'Nigeria'),
(5, 'USA'),
(6, 'UK'),
(7, 'Germany'),
(8, 'France');


-- Insert into the book table
INSERT INTO book (title, isbn, publishYear, price) VALUES
('To Kill a Mockingbird', '9780061120084', 1960, 14.99),
('1984', '9780451524935', 1949, 9.99),
('The Great Gatsby', '9780743273565', 1925, 10.99),
('Pride and Prejudice', '9780141439518', 1813, 8.99),
('The Catcher in the Rye', '9780316769488', 1951, 11.99),
('The Hobbit', '9780547928227', 1937, 13.50),
('Harry Potter and the Sorcerer''s Stone', '9780590353427', 1997, 12.99),
('The Alchemist', '9780062315007', 1988, 16.00),
('The Da Vinci Code', '9780307474278', 2003, 15.95),
('The Kite Runner', '9781594631931', 2003, 13.95),
('The Book Thief', '9780375842207', 2005, 12.50),
('Life of Pi', '9780156027328', 2001, 11.00),
('A Game of Thrones', '9780553593716', 1996, 18.00),
('Gone Girl', '9780307588371', 2012, 14.50),
('The Hunger Games', '9780439023481', 2008, 10.99),
('The Fault in Our Stars', '9780525478812', 2012, 11.99),
('The Girl with the Dragon Tattoo', '9780307949486', 2005, 14.95),
('The Road', '9780307387899', 2006, 13.00),
('Beloved', '9781400033416', 1987, 12.00),
('The Shining', '9780307743657', 1977, 15.00);