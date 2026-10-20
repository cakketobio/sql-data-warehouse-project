IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NULL
BEGIN
    CREATE TABLE bronze.crm_cust_info (
        cst_id             INT,
        cst_key            NVARCHAR(50),
        cst_firstname      NVARCHAR(50),
        cst_lastname       NVARCHAR(50),
        cst_marital_status NVARCHAR(50),
        cst_gndr           NVARCHAR(50),
        cst_create_date    DATE
    );
END;
GO

-- ==========================================
-- CRM: prd_info.csv
-- Informações dos produtos
-- ==========================================
IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NULL
BEGIN
    CREATE TABLE bronze.crm_prd_info (
        prd_id       INT,
        prd_key      NVARCHAR(50),
        prd_nm       NVARCHAR(50),
        prd_cost     INT,
        prd_line     NVARCHAR(50),
        prd_start_dt DATETIME,
        prd_end_dt   DATETIME
    );
END;
GO

-- ==========================================
-- CRM: sales_details.csv
-- Detalhes das vendas
-- ==========================================
IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NULL
BEGIN
    CREATE TABLE bronze.crm_sales_details (
        sls_ord_num  NVARCHAR(50),
        sls_prd_key  NVARCHAR(50),
        sls_cust_id  INT,
        sls_order_dt INT,
        sls_ship_dt  INT,
        sls_due_dt   INT,
        sls_sales    INT,
        sls_quantity INT,
        sls_price    INT
    );
END;
GO

-- ==========================================
-- ERP: LOC_A101.csv
-- Localização dos clientes
-- ==========================================
IF OBJECT_ID('bronze.erp_loc_a101', 'U') IS NULL
BEGIN
    CREATE TABLE bronze.erp_loc_a101 (
        cid   NVARCHAR(50),
        cntry NVARCHAR(50)
    );
END;
GO

-- ==========================================
-- ERP: CUST_AZ12.csv
-- Dados adicionais dos clientes
-- ==========================================
IF OBJECT_ID('bronze.erp_cust_az12', 'U') IS NULL
BEGIN
    CREATE TABLE bronze.erp_cust_az12 (
        cid   NVARCHAR(50),
        bdate DATE,
        gen   NVARCHAR(50)
    );
END;
GO

-- ==========================================
-- ERP: PX_CAT_G1V2.csv
-- Categorias e subcategorias dos produtos
-- ==========================================
IF OBJECT_ID('bronze.erp_px_cat_g1v2', 'U') IS NULL
BEGIN
    CREATE TABLE bronze.erp_px_cat_g1v2 (
        id          NVARCHAR(50),
        cat         NVARCHAR(50),
        subcat      NVARCHAR(50),
        maintenance NVARCHAR(50)
    );
END;
GO

-- ==========================================
-- Verificar as tabelas criadas
-- ==========================================
SELECT
    s.name AS esquema,
    t.name AS tabela
FROM sys.tables AS t
INNER JOIN sys.schemas AS s
    ON t.schema_id = s.schema_id
WHERE s.name = 'bronze'
ORDER BY t.name;
GO
