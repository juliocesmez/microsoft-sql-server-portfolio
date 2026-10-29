-- =========================================================================
-- PROJECT: SQL View Optimization and Invoicing Analysis (Chinook DB)
-- DESCRIPTION: Clean and optimized SQL script for the laboratory work.
-- AUTHOR: Julio C.
-- DATE: October 2026
-- =========================================================================

-- -------------------------------------------------------------------------
-- 1. CUSTOMER INVOICING ANALYSIS (VIEW CREATION)
-- Objective: Consolidate transaction volume and cumulative spend per customer.
-- -------------------------------------------------------------------------

CREATE VIEW View_CustomerInvoices AS
SELECT 
    c.FirstName AS [Customer Name],
    c.LastName AS [Customer Last Name],
    COUNT(i.InvoiceId) AS [Total number of invoices],
    SUM(i.total) AS [Total spent]
FROM Customer c
JOIN Invoice i ON c.customerid = i.CustomerId
GROUP BY c.FirstName, c.LastName;
GO

-- Business Query: Top 10 customers by cumulative spending
SELECT TOP 10 [Customer Name], [Total spent]
FROM View_CustomerInvoices
ORDER BY [Total spent] DESC;
GO


-- -------------------------------------------------------------------------
-- 2. DETAILED BREAKDOWN OF INTERNATIONAL SALES
-- Objective: Analyze line-item invoice data grouped by country.
-- -------------------------------------------------------------------------

CREATE VIEW View_InvoiceDetails AS
SELECT 
    i.InvoiceId AS [Invoice ID],
    i.invoicedate AS [Invoice Date],
    i.billingcountry AS [Billing Country],
    il.trackid AS [Track ID],
    il.unitprice AS [Unit Price],
    SUM(il.Quantity) AS [Qty of track purchased]
FROM invoice i 
JOIN invoiceline il ON i.InvoiceId = il.InvoiceId
JOIN track t ON il.TrackId = t.TrackId
GROUP BY i.InvoiceId, i.InvoiceDate, i.BillingCountry, il.TrackId, il.UnitPrice;
GO

-- Business Query: Total spent per country in reverse alphabetical order
SELECT 
    [Billing Country],
    SUM([Unit Price]) AS [Total Amount Spent] 
FROM View_InvoiceDetails
GROUP BY [Billing Country]
ORDER BY [Billing Country] DESC;
GO


-- -------------------------------------------------------------------------
-- 3. B2B BUSINESS PIVOTING (SCHEMA ALTERATION)
-- Objective: Redesign the view to reflect corporate revenue (excluding NULLs).
-- -------------------------------------------------------------------------

ALTER VIEW View_CustomerInvoices AS
SELECT 
    c.company AS [Cx Company Name],
    COUNT(i.invoiceid) AS [Total Number of invoices],
    SUM(i.Total) AS [Total Amount Spent by Company]
FROM Customer c 
JOIN invoice i ON i.CustomerId = c.CustomerId
WHERE c.Company IS NOT NULL
GROUP BY c.Company;
GO

-- Business Query: Corporate B2B metrics performance
SELECT * FROM View_CustomerInvoices
ORDER BY [Total Amount Spent by Company] DESC;
GO


-- -------------------------------------------------------------------------
-- 4. LIFECYCLE MANAGEMENT AND SYSTEM TESTING
-- Objective: Safely remove the logical object and perform a final audit.
-- -------------------------------------------------------------------------

-- Dropping the view to release system catalog resources
DROP VIEW View_CustomerInvoices;
GO

-- Assurance Test (Expected to return a Msg 208 invalid object error)
SELECT * FROM view_customerinvoices;
GO

