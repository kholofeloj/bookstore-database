
# 📘 **Bookstore Database Overview**


## 🎯Goal of the Project 

Building a relational database that stores information about the bookstore's operations, including books, authors, customers, orders, shipping and more.

The database efficiently stores all necessary data and allows for quick Retrieval and Analysis.

<br/>
<br/>
<br/>

# **What Each Part of the Code Does**


## Database Creation

<br/>

```
CREATE DATABASE bookStoreDB;
USE bookStoreDB;
```
<br/>

- Creates new dabase named `bookStoreDB` and sets it as the active database for the rest of the operations.

<br/>
<br/>


## Reference Tables

These tables store basic, reusable values:

- `country`: List of countries used in addresses.
- `adress_status`: Defines the type of a customer's address (e.g. Home, work).
- `book_language`: Languages in which books are available.
- `shipping_method`: shipping options with associated costs.
- `order_status`: Tracks the order progress.

<br/>

## Entity Tables

These define main participants in the bookstore system:

- `customer`: Holds customer information.
- `author`: Contains details of book authors.
- `publisher`: Stores publishers of books.
- `book`: Central table for all book information including title, price, publisher, and language.

<br/>
<br/>


## Relational Tables

- `address`: links customers to a location in a specific country.
- `customer_address`: connects customers to their addresses ith a status (e.g. Home/Work)
- `book_author`: Handles many-to-many relationship between books and authors.
- `cust_order`: represents a customer's order, linking to status and shipping method.
- `order_line`: contains items in each order (books, quantity, and the price).
- `order_history`: logs the history of status changes for each order (e.g. when it was shipped)

<br/>
<br/>
<br/>


## **Data Insertion**

`INSERT INTO` statement populate the tables with data:
- Countries, authors, publishers, and books are added.
- Customer data includes names and emails.
- Relationships between customers and addresses are created.
- Book-author and book-publisher links are defined.

<br/>
<br/>
<br/>


## **Usage**

The schema allows a bookstore to:

- Track customer purchases
- Link books to multiple authors
- Maintain historical order status changes
- Handle multi-address customers
- Offer various shipping methods with costs







---
<br/>
<br/>
<br/>

# **Authors**

- Kholofelo Mocheko
- Enock Otieno
- Chard Odhiambo

---
