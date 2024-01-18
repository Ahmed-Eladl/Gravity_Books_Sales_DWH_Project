USE gravity_books_DWH;
GO

-- Drop foreign Keys if exists
IF EXISTS (SELECT *
           FROM   sys.foreign_keys
           WHERE  NAME = 'fk_fact_book_sales_dim_customer'
                  AND parent_object_id = OBJECT_ID('fact_book_sales'))
  ALTER TABLE fact_book_sales
    DROP CONSTRAINT fk_fact_book_sales_dim_customer;
GO

-- Drop and create the table
IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'dim_customer')
	DROP TABLE dim_customer;
GO

CREATE TABLE dim_customer
  (
     customer_id_SK     INT NOT NULL IDENTITY(1, 1),             -- Surrogate key
     customer_id_BK     INT NOT NULL,                            -- Business key
     first_name         NVARCHAR(150),
     last_name          NVARCHAR(150),
     email              NVARCHAR(200),
     status_id_BK       INT NOT NULL,
     address_status     NVARCHAR(30),
     address_id_BK      INT NOT NULL,
     street_number      NVARCHAR(10),
     street_name        NVARCHAR(200),
     city               NVARCHAR(100),
     Country_id_BK      INT NOT NULL,
     country_name       NVARCHAR(200),
     is_current         TINYINT NOT NULL DEFAULT (1),            -- SCD
     start_date         DATETIME NOT NULL DEFAULT (GETDATE()),   -- SCD
     end_date           DATETIME NULL,                           -- SCD
     CONSTRAINT pk_dim_customer PRIMARY KEY CLUSTERED (customer_id_SK)
  );

-- Create Foreign Keys
IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'fact_book_sales'
                  AND type = 'u')
  ALTER TABLE fact_book_sales
    ADD CONSTRAINT fk_fact_book_sales_dim_customer FOREIGN KEY (customer_FK)
    REFERENCES dim_customer(customer_id_SK);
GO

-- Create Indexes
IF EXISTS (SELECT *
           FROM   sys.indexes
           WHERE  NAME = 'dim_customer_customer_id'
                  AND object_id = OBJECT_ID('dim_customer'))
  DROP INDEX dim_customer.dim_customer_customer_id;
GO

CREATE INDEX dim_customer_customer_id
ON dim_customer(customer_id_BK);

IF EXISTS (SELECT *
           FROM   sys.indexes
           WHERE  NAME = 'dim_customer_city'
                  AND object_id = OBJECT_ID('dim_customer'))
  DROP INDEX dim_customer.dim_customer_city;
GO

CREATE INDEX dim_customer_city
ON dim_customer(city);
