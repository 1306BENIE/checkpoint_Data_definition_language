-- Création de la base de données (si nécessaire)
CREATE DATABASE OrderManagement;

-- Sélection de la base de données
USE OrderManagement;

-- Création de la table CUSTOMER, Identifiant unique du client, Nom du client, Valeur numérique
CREATE TABLE CUSTOMER (
    Customer_id VARCHAR2(20) PRIMARY KEY,
    Customer_Name VARCHAR2(20) NOT NULL,
    Customer_Tcl NUMBER
);

-- Création de la table PRODUCT, Identifiant unique du produit, Nom du produit, Prix du produit
CREATE TABLE PRODUCT (
    Product_id VARCHAR2(20) PRIMARY KEY,
    Product_Name VARCHAR2(20) NOT NULL,
    Price NUMBER CHECK (Price > 0)
);

-- Création de la table ORDERS, Référence vers le client, Référence vers le produit, Quantité commandée, Montant total, Clé primaire composite
CREATE TABLE ORDERS (
    Customer_id VARCHAR2(20),
    Product_id VARCHAR2(20),
    Quantity NUMBER NOT NULL,
    Total_Amount NUMBER CHECK (Total_Amount > 0),
    PRIMARY KEY (Customer_id, Product_id),     -- 
    FOREIGN KEY (Customer_id) REFERENCES CUSTOMER(Customer_id),
    FOREIGN KEY (Product_id) REFERENCES PRODUCT(Product_id)
);

-- Ajout de la colonne Catégorie à la table PRODUCT
ALTER TABLE PRODUCT
ADD Category VARCHAR2(20);

-- Ajout de la colonne Order_Date à la table ORDERS avec une valeur par défaut
ALTER TABLE ORDERS
ADD Order_Date DATE DEFAULT SYSDATE;

