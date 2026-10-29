# 📊 SQL View Optimization and Invoicing Analysis (Chinook DB)

## 📋 Project Description
This project is part of my hands-on training in data analysis. It focuses on the design, alteration, and querying of **SQL Views** to simplify complex business reporting operations, simulate analytical aggregations of customer performance, and conduct global revenue analysis.

The project demonstrates core competencies in:
* Relational database modularity using logical views.
* Complex multi-table operations (`JOIN`) and advanced aggregations (`SUM`, `COUNT`, `GROUP BY`).
* Database object lifecycle management (`CREATE`, `ALTER`, `DROP`).

---

## 🛠️ Key Technologies and Concepts
* **Language:** SQL (T-SQL / MS SQL Server)
* **Advanced Features:** Database Views, Aggregate Functions, Null Filtering, Dynamic Sorting.

---

## 🔍 SQL Queries and Business Use Cases

### 1. Customer Invoicing Analysis (View Creation)
**Objective:** Consolidate transaction volume and cumulative expenditure for individual customers to identify high-value users.

```sql
-- Creating the analytical customer view
CREATE VIEW View_CustomerInvoices AS
SELECT 
    c.FirstName AS [Customer Name],
    c.LastName AS [Customer Last Name],
    COUNT(i.InvoiceId) AS [Total number of invoices],
    SUM(i.total) AS [Total spent]
FROM Customer c
JOIN Invoice i ON c.customerid = i.CustomerId
GROUP BY c.FirstName, c.LastName;

-- Business Query: Top 10 customers by cumulative spending
SELECT TOP 10 [Customer Name], [Total spent]
FROM View_CustomerInvoices
ORDER BY [Total spent] DESC;
```

### 2. Detailed Breakdown of International Sales
**Objective:** Analyze global invoicing at the invoice line-item level and aggregate total revenue in reverse alphabetical order by billing country.

```sql
-- Creating a view with multiple joins (Invoices + Line Item Details)
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

-- Business Query: Total spent aggregated by country
SELECT 
    [Billing Country],
    SUM([Unit Price]) AS [Total Amount Spent] 
FROM View_InvoiceDetails
GROUP BY [Billing Country]
ORDER BY [Billing Country] DESC;
```

### 3. B2B Business Pivoting (Schema Alteration)
**Objective:** Modify the existing view using `ALTER VIEW` to pivot the analysis from individual customers to corporate metrics (B2B), explicitly filtering out non-institutional records (`NULL`).

```sql
-- Altering the view for corporate B2B metrics
ALTER VIEW View_CustomerInvoices AS
SELECT 
    c.company AS [Cx Company Name],
    COUNT(i.invoiceid) AS [Total Number of invoices],
    SUM(i.Total) AS [Total Amount Spent by Company]
FROM Customer c 
JOIN invoice i ON i.CustomerId = c.CustomerId
WHERE c.Company IS NOT NULL
GROUP BY c.Company;

-- Business Query: Corporate performance ordered by highest revenue generated
SELECT * FROM View_CustomerInvoices
ORDER BY [Total Amount Spent by Company] DESC;
```

---

## 🧽 Lifecycle Management and System Testing
Adhering to data engineering best practices, a safe deletion of the logical object is executed once the maintenance and analysis window closes, verifying its successful removal from the system catalog.

```sql
-- Dropping the view to release system catalog resources
DROP VIEW View_CustomerInvoices;

-- Assurance Test (Verifying that the object no longer exists)
SELECT * FROM view_customerinvoices;
```

**Console System Output (Successful Validation):**
```text
Msg 208, Level 16, State 1, Line 1
Invalid object name 'view_customerinvoices'.
Total execution time: 00:00:00
```
*(Note: Error `Msg 208` explicitly confirms that the view was successfully removed from the database).*

---

## 💡 Key Takeaways and Business Value

Following the execution of analytical queries on the optimized views, the following strategic insights were extracted for executive decision-making:

1. **High-Value Customer Segmentation (The Pareto Principle / 80-20 Rule):** 
The *Top 10 Customers* report driven by the `View_CustomerInvoices` view allows marketing teams to instantly pinpoint the VIP user segment. Identifying who drives the highest cumulative spend and transaction volume enables organizations to build high-retention loyalty programs tailored to safeguard primary revenue streams.

2. **International Expansion Opportunities:** 
By aggregating cumulative expenditure by billing country via the `View_InvoiceDetails` view, the business gains a clear geographic breakdown of its revenue. This clarifies which foreign markets are responding best and where local pricing strategies, logistics, or distribution channels may need optimization.

3. **Strategic B2B Business Model Transition:** 
The structural change applied via `ALTER VIEW` cleanses retail noise by filtering out non-corporate values (`NULL` values in the *Company* column). This provides executive leadership with a clean financial dashboard dedicated exclusively to the corporate account sector, where clients traditionally hold higher contract values and longer lifecycles.
