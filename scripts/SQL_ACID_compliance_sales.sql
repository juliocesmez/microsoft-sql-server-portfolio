USE TechHealthDb;
GO


BEGIN TRANSACTION;
    INSERT INTO [dbo].[Sales] (sale_id, user_id, sale_date, product_id, product_name,
    product_category, unit_price, quantity, discount_applied,
    payment_method, subscription_plan, sales_channel, region, sales_rep_id)
    VALUES (
    'S056', 'TH036', GETDATE(), 'SUB-003', 'Enterprise Subscription', 'Subscription',
    24.99, 12, 15.0, 'Bank Transfer', 'Enterprise', 'Retail', 'West', 'REP003'
);

IF @@ROWCOUNT = 0
BEGIN
    PRINT 'Insert of Sale1 failed.';
    ROLLBACK TRANSACTION;
    RETURN;
END


SAVE TRANSACTION Savepoint_AfterSale1;

    INSERT INTO [dbo].[Sales] (sale_id, user_id, sale_date, product_id, product_name,
    product_category, unit_price, quantity, discount_applied,
    payment_method, subscription_plan, sales_channel, region, sales_rep_id)
    VALUES (
    'S057', 'TH038', GETDATE(), 'SUB-001', 'Premium Subscription', 'Subscription',
    14.99, 12, 10.0, 'PayPal', 'Premium', 'Retail', 'South', 'REP004'
);

IF @@ROWCOUNT = 0 
BEGIN 
    PRINT 'Insert of Sale2 failed.'
    ROLLBACK TRANSACTION Savepoint_AfterSale1;
END

IF @@TRANCOUNT > 0
    BEGIN
        COMMIT TRANSACTION;
        PRINT 'Sales added successfully.';
    END
ELSE
    BEGIN
        PRINT 'No open transactions to commit.';
    END
GO