
-- Creating the database: bookStoreDB and its related 15 tables

CREATE DATABASE bookStoreDB;
USE bookStoreDB;

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

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                      Inserting data into the tables
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- 1. Insert into the country table
INSERT INTO country (countryID, countryName) VALUES
(1, 'South Africa'),
(2, 'Kenya'),
(3, 'Ghana'),
(4, 'Nigeria'),
(5, 'USA'),
(6, 'UK'),
(7, 'Germany'),
(8, 'France');


-- 2. Insert into the address status table
INSERT INTO address_status (statusName) VALUES
('Home'),
('Work'),
('Billing'),
('Shipping'),
('Other');


-- 3. Insert into the publisher table
INSERT INTO publisher (publisherID, publisherName) VALUES
(1, 'Harper Perennial Modern Classics'),
(2, 'Signet Classics'),
(3, 'Scribner'),
(4, 'Penguin Classics'),
(5, 'Little, Brown and Company'),
(6, 'Mariner Books'),
(7, 'Scholastic'),
(8, 'HarperOne'),
(9, 'Anchor Books'),
(10, 'Riverhead Books'),
(11, 'Knopf Books for Young Readers'),
(12, 'Harvest Books'),
(13, 'Bantam Books'),
(14, 'Broadway Books'),
(15, 'Scholastic Press'),
(16, 'Dutton Books'),
(17, 'Vintage Crime/Black Lizard'),
(18, 'Vintage'),
(19, 'Vintage International'),
(20, 'Anchor');

-- 4. Insert into author table
INSERT INTO author (authorID, authorName) VALUES
(1, 'Harper Lee'),
(2, 'George Orwell'),
(3, 'F. Scott Fitzgerald'),
(4, 'Jane Austen'),
(5, 'J.D. Salinger'),
(6, 'J.R.R. Tolkien'),
(7, 'J.K. Rowling'),
(8, 'Paulo Coelho'),
(9, 'Dan Brown'),
(10, 'Khaled Hosseini'),
(11, 'Markus Zusak'),
(12, 'Yann Martel'),
(13, 'George R.R. Martin'),
(14, 'Gillian Flynn'),
(15, 'Suzanne Collins'),
(16, 'John Green'),
(17, 'Stieg Larsson'),
(18, 'Cormac McCarthy'),
(19, 'Toni Morrison'),
(20, 'Stephen King');


-- 5. Insert into the book language table
INSERT INTO book_language (languageID, languageName) VALUES
(1, 'English'),
(2, 'French'),
(3, 'Spanish'),
(4, 'German'),
(5, 'Afrikaans');


-- 6. Insert into shipping method table
INSERT INTO shipping_method (methodName, cost) VALUES
('Standard Shipping', 5.00),
('Express Shipping', 15.00),
('Overnight Shipping', 25.00);

-- 7. Insert into order status table
INSERT INTO order_status (statusName) VALUES
('Pending'),
('Shipped'),
('Delivered'),
('Cancelled'),
('Returned');

-- 8. Insert into the customer table
INSERT INTO customer (firstname, lastname, email)
VALUES
("Mary", "Magdala", "MaryMagdala@gmail.com"),
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


-- 9. Insert into the address table
INSERT INTO address (countryID, street, city) VALUES
(1, '123 Long Street', 'Cape Town'),       -- South Africa
(2, '456 Moi Avenue', 'Nairobi'),          -- Kenya
(3, '78 Independence Ave', 'Accra'),       -- Ghana
(4, '21 Bourdillon Road', 'Lagos'),        -- Nigeria
(5, '100 Main Street', 'New York'),        -- USA
(6, '11 Downing Street', 'London'),        -- UK
(7, '99 Königstraße', 'Berlin'),           -- Germany
(8, '22 Rue de Rivoli', 'Paris');          -- France

-- 10. Insert into the book table
INSERT INTO book (bookID, publisherID, languageID, title, isbn, publishYear, price) VALUES
(1, 1, 1, 'To Kill a Mockingbird', '9780061120084', 1960, 14.99),
(2, 2, 1, '1984', '9780451524935', 1949, 9.99),
(3, 3, 1, 'The Great Gatsby', '9780743273565', 1925, 10.99),
(4, 4, 1, 'Pride and Prejudice', '9780141439518', 1813, 8.99),
(5, 5, 1, 'The Catcher in the Rye', '9780316769488', 1951, 11.99),
(6, 6, 1, 'The Hobbit', '9780547928227', 1937, 13.50),
(7, 7, 1, 'Harry Potter and the Sorcerer''s Stone', '9780590353427', 1997, 12.99),
(8, 8, 1, 'The Alchemist', '9780062315007', 1988, 16.00),
(9, 9, 1, 'The Da Vinci Code', '9780307474278', 2003, 15.95),
(10, 10, 1, 'The Kite Runner', '9781594631931', 2003, 13.95),
(11, 11, 1, 'The Book Thief', '9780375842207', 2005, 12.50),
(12, 12, 1, 'Life of Pi', '9780156027328', 2001, 11.00),
(13, 13, 1, 'A Game of Thrones', '9780553593716', 1996, 18.00),
(14, 14, 1, 'Gone Girl', '9780307588371', 2012, 14.50),
(15, 15, 1, 'The Hunger Games', '9780439023481', 2008, 10.99),
(16, 16, 1, 'The Fault in Our Stars', '9780525478812', 2012, 11.99),
(17, 17, 1, 'The Girl with the Dragon Tattoo', '9780307949486', 2005, 14.95),
(18, 18, 1, 'The Road', '9780307387899', 2006, 13.00),
(19, 19, 1, 'Beloved', '9781400033416', 1987, 12.00),
(20, 20, 1, 'The Shining', '9780307743657', 1977, 15.00);


-- 11. insert into the customer_address table
INSERT INTO customer_address (customerID, addressID, address_statusID) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 1),
(7, 7, 2),
(8, 8, 3);


-- 12. Insert into the book_author table
INSERT INTO book_author (bookID, authorID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);