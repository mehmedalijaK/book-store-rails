# Ruby on Rails backend for Book Store 

This project is a comprehensive management system for a book store. It allows administrators to manage books, authors, categories, and orders. Additionally, logged-in users can create orders containing books with quantities.

## Features

- **Book Management:**
  - Admins can create, update and delete books.
- **Author Management:**
  - Admins can create, update and delete authors.
  - Books can be associated with authors
- **Category Management:**
  - Admins can create, update and delete categories.
  - Books can be assigned to specific categories.
- **Order Management:**
  - Logged-in users can create orders containing books with quantities.
  - Admins can change the status of orders.

## User Roles

- **Admin:**
  - Can perform all CRUD operations on books, authors, categories, and orders.
- **Logged-in User:**
  - Can create orders containing books with quantities, also can list all books, categories and authors.
- **Visitors:**
  - Can see list all books, categories and authors.

## Routes

### Books

- **GET /api/v1/books**: Retrieve all books
- **GET /api/v1/books/:id**: Retrieve a specific book
- **POST /api/v1/books**: Create a new book
- **PUT /api/v1/books/:id**: Update a book
- **PUT /api/v1/books/:id/update_price**: Update the price of a book
- **DELETE /api/v1/books/:id**: Delete a book

### Categories

- **GET /api/v1/categories**: Retrieve all categories
- **GET /api/v1/categories/:id**: Retrieve a specific category
- **POST /api/v1/categories**: Create a new category
- **PUT /api/v1/categories/:id**: Update a category
- **DELETE /api/v1/categories/:id**: Delete a category

### Authors

- **GET /api/v1/authors**: Retrieve all authors
- **GET /api/v1/authors/:id**: Retrieve a specific author
- **POST /api/v1/authors**: Create a new author
- **PUT /api/v1/authors/:id**: Update an author
- **DELETE /api/v1/authors/:id**: Delete an author

### Orders

- **GET /api/v1/orders**: Retrieve all orders
- **GET /api/v1/orders/:id**: Retrieve a specific order
- **POST /api/v1/orders**: Create a new order
- **PUT /api/v1/orders/:id**: Update an order
- **PUT /api/v1/orders/:id/update_status**: Update the status of an order

### Authentication Service

- **POST /auth/v1/login**: User login
- **POST /auth/v1/register**: User registration