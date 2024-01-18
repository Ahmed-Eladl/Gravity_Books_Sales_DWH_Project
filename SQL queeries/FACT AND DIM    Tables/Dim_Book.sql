USE gravity_books_DWH;
-- Drop foreign Keys if exists
IF EXISTS (SELECT *
           FROM   sys.foreign_keys
           WHERE  NAME = 'fk_dim_book'
                  AND parent_object_id = OBJECT_ID('fact_book_sales'))
  ALTER TABLE fact_book_sales
    DROP CONSTRAINT fk_dim_book;

-- Drop and create the table
IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'dim_book')
	DROP TABLE dim_book;
GO

CREATE TABLE dim_book
  (
     book_id_SK            INT NOT NULL IDENTITY(1, 1),             -- Surrogate key
     book_id_BK            INT NOT NULL,                            -- Business key
     title                  NVARCHAR(400),
     isBn13                 NVARCHAR(50),
     language_id_BK        INT NOT NULL, 
     language_code         NVARCHAR(8),
     language_name         NVARCHAR(50),
     num_pages             INT,
     publish_id_BK         INT NOT NULL, 
     publication_date      DATE,
     publisher_name        NVARCHAR(400),
     author_id_BK          INT NOT NULL,
     author_name           NVARCHAR(400),
     start_date            DATETIME NOT NULL DEFAULT (GETDATE()),   -- SCD
     end_date              DATETIME NULL,                           -- SCD
     is_current            TINYINT NOT NULL DEFAULT (1),           -- SCD
     CONSTRAINT pk_dim_book PRIMARY KEY CLUSTERED (book_id_SK)
  );

-- Create Foreign Keys
IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'fact_book_sales'
                  AND type = 'u')
  ALTER TABLE fact_book_sales
    ADD CONSTRAINT fk_fact_book_sales_dim_book FOREIGN KEY (book_FK) 
    REFERENCES dim_book(book_id_SK);
GO

-- Create Indexes
IF EXISTS (SELECT *
           FROM   sys.indexes
           WHERE  NAME = 'dim_book_book_id'
                  AND object_id = OBJECT_ID('dim_book'))
	DROP INDEX dim_book.dim_book_book_id;
GO

CREATE INDEX dim_book_book_id
ON dim_book(book_id_BK);

IF EXISTS (SELECT *
           FROM   sys.indexes
           WHERE  NAME = 'dim_book_title'
                  AND object_id = OBJECT_ID('dim_book'))
	DROP INDEX dim_book.dim_book_title;
GO

CREATE INDEX dim_book_title
ON dim_book(title);
