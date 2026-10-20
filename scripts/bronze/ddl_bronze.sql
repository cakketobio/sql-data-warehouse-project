
USE DataWarehouse;
GO

CREATE OR ALTER PROCEDURE bronze.load_bronze
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @start_time DATETIME;
    DECLARE @end_time DATETIME;
    DECLARE @total_start_time DATETIME;
    DECLARE @total_end_time DATETIME;

    BEGIN TRY
        BEGIN TRANSACTION;

        SET @total_start_time = GETDATE();

        PRINT '========================================';
        PRINT '   INICIANDO CARGA DA CAMADA BRONZE';
        PRINT '========================================';

        -- 1. CRM - Clientes
        PRINT 'Carregando crm_cust_info...';

        SET @start_time = GETDATE();

        TRUNCATE TABLE bronze.crm_cust_info;

        BULK INSERT bronze.crm_cust_info
        FROM 'C:\Users\andra\Downloads\cust_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT '>> Inicio: '
            + CONVERT(NVARCHAR(19), @start_time, 120);
        PRINT '>> Fim: '
            + CONVERT(NVARCHAR(19), @end_time, 120);
        PRINT '>> Duracao: '
            + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(20))
            + ' segundos';
        PRINT '----------------------------------------';


        -- 2. CRM - Produtos
        PRINT 'Carregando crm_prd_info...';

        SET @start_time = GETDATE();

        TRUNCATE TABLE bronze.crm_prd_info;

        BULK INSERT bronze.crm_prd_info
        FROM 'C:\Users\andra\Downloads\prd_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT '>> Inicio: '
            + CONVERT(NVARCHAR(19), @start_time, 120);
        PRINT '>> Fim: '
            + CONVERT(NVARCHAR(19), @end_time, 120);
        PRINT '>> Duracao: '
            + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(20))
            + ' segundos';
        PRINT '----------------------------------------';


        -- 3. CRM - Vendas
        PRINT 'Carregando crm_sales_details...';

        SET @start_time = GETDATE();

        TRUNCATE TABLE bronze.crm_sales_details;

        BULK INSERT bronze.crm_sales_details
        FROM 'C:\Users\andra\Downloads\sales_details.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT '>> Inicio: '
            + CONVERT(NVARCHAR(19), @start_time, 120);
        PRINT '>> Fim: '
            + CONVERT(NVARCHAR(19), @end_time, 120);
        PRINT '>> Duracao: '
            + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(20))
            + ' segundos';
        PRINT '----------------------------------------';


        -- 4. ERP - Localizacao
        PRINT 'Carregando erp_loc_a101...';

        SET @start_time = GETDATE();

        TRUNCATE TABLE bronze.erp_loc_a101;

        BULK INSERT bronze.erp_loc_a101
        FROM 'C:\Users\andra\Downloads\LOC_A101.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT '>> Inicio: '
            + CONVERT(NVARCHAR(19), @start_time, 120);
        PRINT '>> Fim: '
            + CONVERT(NVARCHAR(19), @end_time, 120);
        PRINT '>> Duracao: '
            + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(20))
            + ' segundos';
        PRINT '----------------------------------------';


        -- 5. ERP - Clientes
        PRINT 'Carregando erp_cust_az12...';

        SET @start_time = GETDATE();

        TRUNCATE TABLE bronze.erp_cust_az12;

        BULK INSERT bronze.erp_cust_az12
        FROM 'C:\Users\andra\Downloads\CUST_AZ12.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT '>> Inicio: '
            + CONVERT(NVARCHAR(19), @start_time, 120);
        PRINT '>> Fim: '
            + CONVERT(NVARCHAR(19), @end_time, 120);
        PRINT '>> Duracao: '
            + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(20))
            + ' segundos';
        PRINT '----------------------------------------';


        -- 6. ERP - Categorias de produtos
        PRINT 'Carregando erp_px_cat_g1v2...';

        SET @start_time = GETDATE();

        TRUNCATE TABLE bronze.erp_px_cat_g1v2;

        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'C:\Users\andra\Downloads\PX_CAT_G1V2.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT '>> Inicio: '
            + CONVERT(NVARCHAR(19), @start_time, 120);
        PRINT '>> Fim: '
            + CONVERT(NVARCHAR(19), @end_time, 120);
        PRINT '>> Duracao: '
            + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(20))
            + ' segundos';
        PRINT '----------------------------------------';


        -- Finalizacao da transacao
        COMMIT TRANSACTION;

        -- Calculo do tempo total da carga
        SET @total_end_time = GETDATE();

        PRINT '========================================';
        PRINT '   RESUMO DA CARGA DA CAMADA BRONZE';
        PRINT '========================================';

        PRINT 'Inicio da carga: '
            + CONVERT(NVARCHAR(19), @total_start_time, 120);

        PRINT 'Fim da carga: '
            + CONVERT(NVARCHAR(19), @total_end_time, 120);

        PRINT 'Duracao total: '
            + CAST(
                DATEDIFF(SECOND, @total_start_time, @total_end_time)
                AS NVARCHAR(20)
              )
            + ' segundos';

        PRINT '========================================';
        PRINT ' CARGA DA CAMADA BRONZE CONCLUIDA!';
        PRINT '========================================';

    END TRY
    BEGIN CATCH

        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        PRINT 'ERRO durante a carga da camada Bronze!';
        PRINT ERROR_MESSAGE();

        THROW;

    END CATCH;
END;
GO
