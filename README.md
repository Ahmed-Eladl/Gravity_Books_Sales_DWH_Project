# Gravity_Books_Sales_Project
![15-WilliamChrisantandSonsOldFloridaBookShop-photobyWilliamChrisant-7077d9a8033a4ac692689380e2dad7bc](https://github.com/Ahmed-Eladl/Gravity_Books_Sales_Project/assets/88304019/982c2d5f-fbe8-49e9-9492-e6bb252b6cb8)

## Table of Contents
- [Introduction](#introduction)
- [Project Phases](#project-phases)
- [Data Source](#data-source)
- [Technologies Used](#technologies-used)
- [Getting Started](#getting-started)
- [ETL Phase](#etl-phase)
- [Analysis Phase](#analysis-phase)

## Introduction
Welcome to the Gravity Books Sales End-to-End Project repository. This project is an exemplary demonstration of a complete data warehousing solution, encompassing the Extract, Transform, Load (ETL) phase, and analysis phase with SQL Server Analysis Services (SSAS).

## Project Phases
1. **ETL (Extract, Transform, Load)**: In this phase, data is extracted from a transactional database called "Gravity Book Sales," transformed to meet data warehousing requirements, and loaded into a structured data warehouse.
2. **Analysis**: The data is modeled and structured for efficient querying and analysis using SQL Server Analysis Services (SSAS).

## Data Source
The source dataset for this project is the "Gravity Book Sales" database, which can be found [here](`https://github.com/bbrumm/databasestar/tree/main/sample_databases/sample_db_gravity/gravity_sqlserver)`. This transactional database serves as the foundation for the end-to-end project.

## Technologies Used
- SQL Server Integration Services (SSIS)
- SQL Server Analysis Services (SSAS)

## Getting Started
To explore and replicate the project, follow these steps:
1. Clone this repository to your local machine.
2. [Download and install SQL Server](https://www.microsoft.com/en-us/sql-server/sql-server-downloads) if not already installed.
3. Follow the instructions in the respective folders for each project phase (ETL, Analysis) to set up and execute the code.

## ETL Phase


* DDL statements of table creation and the DWH Schema
  
  * Customer Dimension
    
    ![DDL Customer Dim](![CUTOMER_DIM](https://github.com/Ahmed-Eladl/Gravity_Books_Sales_Project/assets/88304019/abe8f537-e4da-45d7-aeb6-62c50eefe3d0))


    
  * Book Dimension
    
    ![DDL Book Dim](![BOOK DIM](https://github.com/Ahmed-Eladl/Gravity_Books_Sales_Project/assets/88304019/3feaf48a-d3d9-4f75-92e6-b69a6f6b6d80))


    
   * Order Dimension
     
    ![DDL Shipping Dim](![ORDER_DIM](https://github.com/Ahmed-Eladl/Gravity_Books_Sales_Project/assets/88304019/75a9741a-2df0-4c11-9813-cb2761fd3b9b))


  
   * Date Dimension
     
    ![DDL Date Dim](![DIM_DATE](https://github.com/Ahmed-Eladl/Gravity_Books_Sales_Project/assets/88304019/34cf3adb-9c75-4654-a1cc-3a22c4881f94))

   * Fact Table
     
    ![DDL Fact table](![FACT_BOOK_SALES](https://github.com/Ahmed-Eladl/Gravity_Books_Sales_Project/assets/88304019/44fb4bf2-5d7a-42c0-8bbb-eade8ffd62f3))




* Detailed instructions for the ETL phase can be found in the [ETL folder](/ETL).

   * Customer Dimension
   
    ![ETL Customer Dim](![ETL_Dim_Customer](https://github.com/Ahmed-Eladl/Gravity_Books_Sales_Project/assets/88304019/fcd294ad-3a9c-4c01-93d1-1e4d281bf4fb))


   * Book Dimension
   
    ![ETL Book Dim](![ETL_Dim_Book](https://github.com/Ahmed-Eladl/Gravity_Books_Sales_Project/assets/88304019/7f4bf0ef-c240-4897-b36c-8e468e1116cc))


   * Order Dimension
   
    ![ETL Shipping Dim](![ETL_Dim_Order](https://github.com/Ahmed-Eladl/Gravity_Books_Sales_Project/assets/88304019/d6e46b85-760f-4599-a2ff-96c4862bafc3))


   * Fact Table Full Load
   
    ![ETL Fact Table Full Load](![FACT_TABLE_ETL_DATA_FLOW](https://github.com/Ahmed-Eladl/Gravity_Books_Sales_Project/assets/88304019/4094ac38-4dfc-422e-babb-604f3b599a53))


## Analysis Phase
To explore the analysis phase, refer to the [Analysis folder](/Analysis).

This project harnesses the power of SQL Server Analysis Services (SSAS) for advanced data modeling and analysis. In particular, we've employed the Tabular mode of OLAP (Online Analytical Processing) to create efficient data models that cater to our analytical needs.

- **Cube Scema:**    ![SSAS OLAP](![SSAS_CUBE](![CUBE_SCHEMA](https://github.com/Ahmed-Eladl/Gravity_Books_Sales_Project/assets/88304019/80c98d0f-daac-4a96-80d7-78884bdff3c1))


    ![SSAS OLAP](![SSAS_CUBE](https://github.com/Ahmed-Eladl/Gravity_Books_Sales_Project/assets/88304019/dc6b3238-297e-4a82-942c-9ce0e6da81b9))

