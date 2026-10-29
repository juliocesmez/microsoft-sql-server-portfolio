# 🛠️ Microsoft SQL Server Certification Portfolio

This repository consolidates the production-grade laboratory work and business intelligence pipelines completed for the **SQL Server Fundamentals** & **Data Manipulation and Transactions in SQL Server** certification curriculum by Microsoft.

## 📜 Verified Credential
* **Credential Issuer:** Microsoft
* **Learning Infrastructure Platform:** Coursera
* **Official Verification:** [Click here to view my verified certification status]([PASTE_YOUR_COURSERA_LINK_HERE](https://www.coursera.org/account/accomplishments/verify/5SF3XVKHZ3J2))

---

## 📂 Portfolio Directory Mapping

- microsoft-sql-server-portfolio

master_README.md (Root Master Dashboard)

LICENSE (Open-Source Asset Protection)

-- Project-1-Invoicing-Analysis/  
proj1_clear_queries.sql (Analytical script files)

-- Project-2-Transaction-Management/  
01_customer_inserts.sql (Demographic transaction script)

02_sales_inserts.sql (Revenue logging transaction script)


      
```

---

## 📊 Project 1: SQL View Optimization and Invoicing Analysis

### 📋 Overview & Objectives
This phase addresses database modularity and reporting layer optimization within the `Chinook DB` ecosystem. It focuses on the implementation and structural alteration of database views to parse nested transactional schemas into high-value business intelligence assets.

### 🛠️ Core Engineering Highlights
* **Relational Modularity:** Decoupling physical table structures from end-user reporting requirements via logical database views.
* **Complex Data Aggregations:** Utilizing multi-table `JOIN` statements and granular `GROUP BY` operations to compute run-time summaries.
* **Object Lifecycle Integrity:** Executing automated structure adjustments with `ALTER VIEW` and cleanup routines with `DROP VIEW` commands.

### 💡 Strategic Business Value Derived
* **High-Value Client Retention:** Isolates individual client transaction volumes via `View_CustomerInvoices` to help marketing teams prioritize retention initiatives for top spenders (80/20 Rule).
* **Global Market Distribution Mapping:** Aggregates raw global invoice line items via `View_InvoiceDetails` to isolate strong cross-border geographic markets.
* **B2B Pipeline Shift:** Dynamically restructures schemas via metadata alterations to extract metrics exclusively for corporate business clients.

👉 **[Explore Project 1 Scripts & Deep-Dive Notes](./Project-1-Invoicing-Analysis/)**

---

## 🔄 Project 2: Database Transaction Management & Integrity Control

### 📋 Overview & Objectives
This phase targets strict backend system reliability and fault-tolerant ingestion pipelines inside the custom `TechHealthDb` healthcare framework. It showcases professional-grade transaction scaffolding designed to completely block database corruption during data updates.

### 🛠️ Core Engineering Highlights
* **Explicit Transaction Scaffolding:** Wrapping data injection jobs in robust `BEGIN TRANSACTION` block handlers.
* **Named Savepoint Interventions:** Deploying fine-grained `SAVE TRANSACTION` safe zones to allow partial batch saves without total script failure.
* **System Status Validation:** Interrogating runtime engine metrics via `@@ROWCOUNT` and `@@TRANCOUNT` to prevent orphaned locks.

### 💡 Strategic Business Value Derived
* **Demographic Segmentation:** Validates client profiles at insertion, noting pricing tier match across international demographics.
* **ARR Contract Tracking:** Identifies billing frequency, highlighting upfront annual subscription lengths.
* **Volume Discount Automation:** Tracks rule-based discount adjustments for corporate accounts versus retail clients.

👉 **[Explore Project 2 Scripts & Deep-Dive Notes](./Project-2-Transaction-Management/)**

---

## 🚀 Environment Setup & Local Deployment
1. Open your chosen database container tool (**Microsoft SQL Server Management Studio** or **Azure Data Studio**).
2. Ensure connection parameters point toward an active SQL Server instance.
3. For Project 1, pull down the standardized public `Chinook` dataset. For Project 2, verify your database host context matches `TechHealthDb`.
4. Run the underlying scripts sequentially inside their respective project directories.
