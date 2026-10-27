USE TechHealthDb;
GO

BEGIN TRANSACTION;
INSERT INTO [dbo].[Customers] (user_id, age, gender, city, state, country, occupation, income_bracket, registration_date, subscription_type)
VALUES ('TH052', 28, 'F', 'Nashville', 'TN', 'USA', 'Content Writer', '50K-75K', GETDATE(), 'Basic');

IF @@ROWCOUNT = 0
BEGIN
    Print 'Customer1 insert failed';
    ROLLBACK TRANSACTION;
    RETURN;
END


SAVE TRANSACTION Savepoint_AfterCx1;

INSERT INTO [dbo].[Customers] (user_id, age, gender, city, state, country, occupation, income_bracket, registration_date, subscription_type)
VALUES ('TH053', 40, 'M', 'Edinburgh', NULL, 'UK', 'Business Consultant', '100K-150K', GETDATE(), 'Premium');

IF @@ROWCOUNT = 0
BEGIN
    PRINT 'Cx2 insert failed. Rolling back to previous SavePoint_AfterCx1';
    ROLLBACK TRANSACTION Savepoint_AfterCx1;
END


SAVE TRANSACTION Savepoint_AfterCx2;

INSERT INTO [dbo].[Customers] (user_id, age, gender, city, state, country, occupation, income_bracket, registration_date, subscription_type)
VALUES ('TH054', 35, 'F', 'Auckland', NULL, 'NZ', 'Marketing Specialist', '75K-100K', GETDATE(), 'Premium');

IF @@ROWCOUNT = 0
BEGIN
    PRINT 'Cx3 insert failed. Rolling back to previous SavePoint_AfterCx2.';
    ROLLBACK TRANSACTION Savepoint_AfterCx2;
END


IF @@TRANCOUNT > 0
    BEGIN
        COMMIT TRANSACTION;
        PRINT '3 customers info added successfully.';
    END
    ELSE
    BEGIN
        PRINT 'No active transactions to commit.';
    END
GO
