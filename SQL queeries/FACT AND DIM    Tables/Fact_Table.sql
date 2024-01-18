USE gravity_books_DWH;
GO

IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'fact_book_sales')
  DROP TABLE fact_book_sales;

CREATE TABLE fact_book_sales
  (
     fact_Transaction_PK_SK INT NOT NULL IDENTITY(1, 1), -- Surrogate key
     customer_FK           INT NOT NULL,                -- surrogate key as a foreign key
     book_FK               INT NOT NULL,                -- surrogate key as a foreign key
     shipping_FK           INT NOT NULL,                -- surrogate key as a foreign key
     date_FK               INT NOT NULL,                -- surrogate key as a foreign key
     price                 INT,                         -- Measure
     shipping_cost         INT,                         -- Measure
     CONSTRAINT pk_Fact_book_sales PRIMARY KEY CLUSTERED (fact_Transaction_PK_SK),
     CONSTRAINT fk_dim_customer FOREIGN KEY (customer_FK) REFERENCES dim_customer(customer_id_SK), 
     CONSTRAINT fk_dim_book FOREIGN KEY (book_FK) REFERENCES dim_book(book_id_SK),                
     CONSTRAINT fk_dim_shipping FOREIGN KEY (shipping_FK) REFERENCES dim_shipping(shipping_id_SK), 
     CONSTRAINT fk_dim_date FOREIGN KEY (date_FK) REFERENCES DimDate(DateSK)
  );

-- Create Indexes on foreign keys

-- Create Indexes for Customer key
IF EXISTS (SELECT *
           FROM   sys.indexes
           WHERE  NAME = 'fact_book_sales_dim_customer'
                  AND object_id = OBJECT_ID('fact_book_sales'))
  DROP INDEX fact_book_sales.fact_book_sales_dim_customer;

CREATE INDEX fact_book_sales_dim_customer
ON fact_book_sales(customer_FK);

-- Create Indexes for book key
IF EXISTS (SELECT *
           FROM   sys.indexes
           WHERE  NAME = 'fact_sales_dim_book'
                  AND object_id = OBJECT_ID('fact_book_sales'))
  DROP INDEX fact_book_sales.fact_sales_dim_book;

CREATE INDEX fact_sales_dim_book
ON fact_book_sales(book_FK);

-- Create Indexes for Order Date key
IF EXISTS (SELECT *
           FROM   sys.indexes
           WHERE  NAME = 'fact_sales_dim_date'
                  AND object_id = OBJECT_ID('fact_book_sales'))
  DROP INDEX fact_book_sales.fact_sales_dim_date;

CREATE INDEX fact_sales_dim_date
ON fact_book_sales(date_FK);
