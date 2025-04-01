-- Création de la base de données (si elle n'existe pas déjà)
CREATE DATABASE OrderManagement;
GO

-- Sélection de la base de données
USE OrderManagement;
GO

-- Création de la table CUSTOMER, Identifiant unique du client, Nom du client, Valeur numérique
CREATE TABLE CUSTOMER (
    Customer_id VARCHAR(20) PRIMARY KEY,
    Customer_Name VARCHAR(20) NOT NULL,
    Customer_Tcl NUMERIC
);
GO

-- Création de la table PRODUCT, Identifiant unique du produit, Nom du produit, Prix du produit
CREATE TABLE PRODUCT (
    Product_id VARCHAR(20) PRIMARY KEY,
    Product_Name VARCHAR(20) NOT NULL,
    Price NUMERIC CHECK (Price > 0)
);
GO

-- Création de la table ORDERS, Référence vers le client, Référence vers le produit, Quantité commandée, Montant total, Date de commande avec la date du jour par défaut, Clé primaire composite
CREATE TABLE ORDERS (
    Customer_id VARCHAR(20),
    Product_id VARCHAR(20),
    Quantity NUMERIC NOT NULL,
    Total_Amount NUMERIC CHECK (Total_Amount > 0),
    Order_Date DATE DEFAULT GETDATE(),
    PRIMARY KEY (Customer_id, Product_id),
    FOREIGN KEY (Customer_id) REFERENCES CUSTOMER(Customer_id),
    FOREIGN KEY (Product_id) REFERENCES PRODUCT(Product_id)
);
GO

-- Ajout de la colonne Catégorie à la table PRODUCT
ALTER TABLE PRODUCT
ADD Category VARCHAR(20);
GO
