CREATE DATABASE  Cafeteria_Sena;
USE Cafeteria_Sena;

CREATE TABLE User(

    id int PRIMARY KEY,
    name varchar not null,
    email varchar unique not null,
    phone Varchar (12),
    password varchar  not null
);

CREATE TABLE order(
    id int PRIMARY KEY,
    user_id int,
    total decimal(10,2),
    FOREIGN KEY (user_id) REFERENCES User(id)
);

CREATE TABLE Categories(
    id int PRIMARY KEY,
    name varchar not null
);

CREATE TABLE Product(
    code int PRIMARY KEY,
    name varchar not null,
    price Decimal(10,2),
    categories_id int,
    state boolean,
    FOREIGN KEY (categories_id) REFERENCES Categories(id)
);

CREATE TABLE order_Product(
    order_id int,
    product_code int,
    amount int,
    FOREIGN KEY (order_id) REFERENCES order(id),
    FOREIGN KEY (product_code) REFERENCES Product(code)
);

CREATE TABLE payment(
    id int PRIMARY KEY,
    order_id int,
    method varchar not null,
    state boolean,
    date date,
    FOREIGN KEY (order_id) REFERENCES order(id)
);