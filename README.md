# Order Management Database

## Description

Ce projet consiste à créer un modèle relationnel de gestion des commandes en utilisant **SQL Server**. En intégrant les différentes contraintes mentionnées.

## Structure du projet

Le projet repose sur **trois tables relationnelles** :

### **1️ CUSTOMER (Client)**

| Nom de colonne | Type de données | Contraintes |
| -------------- | --------------- | ----------- |
| Customer_id    | VARCHAR(20)     | PRIMARY KEY |
| Customer_Name  | VARCHAR(20)     | NOT NULL    |
| Customer_Tcl   | NUMERIC         |             |

### **2️ PRODUCT (Produit)**

| Nom de colonne | Type de données | Contraintes              |
| -------------- | --------------- | ------------------------ |
| Product_id     | VARCHAR(20)     | PRIMARY KEY              |
| Product_Name   | VARCHAR(20)     | NOT NULL                 |
| Price          | NUMERIC         | CHECK (Price > 0)        |
| Category       | VARCHAR(20)     | (Ajoutée après création) |

### **3️ ORDERS**

| Nom de colonne | Type de données | Contraintes                                  |
| -------------- | --------------- | -------------------------------------------- |
| Customer_id    | VARCHAR(20)     | FOREIGN KEY REFERENCES CUSTOMER(Customer_id) |
| Product_id     | VARCHAR(20)     | FOREIGN KEY REFERENCES PRODUCT(Product_id)   |
| Quantity       | NUMERIC         | NOT NULL                                     |
| Total_Amount   | NUMERIC         | CHECK (Total_Amount > 0)                     |
| Order_Date     | DATE            | DEFAULT GETDATE() (Ajoutée après création)   |

## Étapes d'exécution

### 1️ Création de la base de données

```sql
CREATE DATABASE OrderManagement;
GO
USE OrderManagement;
GO
```

### 2️ Création des tables

```sql
CREATE TABLE CUSTOMER (
    Customer_id VARCHAR(20) PRIMARY KEY,
    Customer_Name VARCHAR(20) NOT NULL,
    Customer_Tcl NUMERIC
);
GO

CREATE TABLE PRODUCT (
    Product_id VARCHAR(20) PRIMARY KEY,
    Product_Name VARCHAR(20) NOT NULL,
    Price NUMERIC CHECK (Price > 0)
);
GO

CREATE TABLE ORDERS (
    Customer_id VARCHAR(20),
    Product_id VARCHAR(20),
    Quantity NUMERIC NOT NULL,
    Total_Amount NUMERIC CHECK (Total_Amount > 0),
    PRIMARY KEY (Customer_id, Product_id),
    FOREIGN KEY (Customer_id) REFERENCES CUSTOMER(Customer_id),
    FOREIGN KEY (Product_id) REFERENCES PRODUCT(Product_id)
);
GO
```

### 3️ Modification des tables

Ajout des colonnes **Category** et **Order_Date** :

```sql
ALTER TABLE PRODUCT
ADD Category VARCHAR(20);
GO

ALTER TABLE ORDERS
ADD Order_Date DATE DEFAULT GETDATE();
GO
```

### 4️ Vérification des tables

```sql
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE';
GO
```

---

## **Auteur:**

_BENIE SYLVESTRE -_
