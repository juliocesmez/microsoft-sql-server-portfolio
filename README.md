# TechHealthDb Transaction Management & Data Insertion Project

## 📌 Project Overview
This project demonstrates advanced **T-SQL transaction control, error handling, and robust data integrity management** within Microsoft SQL Server for a healthcare technology platform (`TechHealthDb`). 

The repository showcases scripts designed to safely insert customer demographic data and sales records. It utilizes explicit transactions, named savepoints, and validation checks using system functions (`@@ROWCOUNT` and `@@TRANCOUNT`) to prevent data corruption and ensure "all-or-nothing" execution.

---

## 🛠️ Key Technical Skills Demonstrated
*   **Explicit Transaction Control:** Initializing operations with `BEGIN TRANSACTION` and explicitly finalizing with `COMMIT` or `ROLLBACK`.
*   **Error Resiliency (Savepoints):** Implementing `SAVE TRANSACTION` to establish fallback points, preventing entire batches from failing due to a single non-critical row error.
*   **System Functions:** Using `@@ROWCOUNT` to dynamically check the success of preceding operations and `@@TRANCOUNT` to prevent orphaned transactions.
*   **Data Architecture:** Working with foreign keys, structured demographics, internationalization (`NULL` handling for states outside the US), and tier-based pricing structures.

---

## 📂 Repository Contents

### 1. Customer Demographics Ingestion (`scripts/01_customer_inserts.sql`)
*   Inserts three distinct global customer personas (Basic and Premium tiers).
*   Implements named savepoints (`Savepoint_AfterCx1`, `Savepoint_AfterCx2`).
*   Ensures that if an upstream user profile fails insertion, downstream data points roll back to the last secure state before verifying the final transaction status.

### 2. Revenue & Sales Tracking (`scripts/02_sales_inserts.sql`)
*   Tracks volume-based subscription purchases (Enterprise and Premium contracts).
*   Enforces transaction state checks using `@@ROWCOUNT` after evaluating complex relational attributes like discount structures, product IDs, and assigned sales representatives.

---

## 📈 Simulated Business Insights Derived from the Data
Though designed as transactional ingestion scripts, the hardcoded schema and records model real-world business scenarios:

### 👥 Customer Segmentation & Persona Alignment
*   **Premium Tier Validation:** High-earning corporate professionals (e.g., a Business Consultant in the UK earning \$100K-\$150K) show early product-market fit with the **Premium** tier.
*   **Price Sensitivity:** Younger, creative-class demographics (e.g., a Content Writer in the US earning \$50K-\$75K) lean toward the **Basic** tier.

### 💰 Monetization & Contract Strategy
*   **Upfront Commitments:** Both individual and enterprise transactions demonstrate single-invoice purchases of `12 units`. This signifies a successful strategic push toward securing **Annual Recurring Revenue (ARR)** over unpredictable monthly invoicing.
*   **Volume Discount Incentives:** The data showcases automated price modeling—rewarding a 12-user Enterprise contract with a **15% volume discount**, while an individual retail user receives a **10% commitment discount**.

---

## 🚀 How to Run the Scripts
1. Ensure you have access to a SQL Server Instance.
2. Ensure the database context is set up by verifying the existence of the `TechHealthDb` database, alongside tables for `[dbo].[Customers]` and `[dbo].[Sales]`.
3. Open Microsoft SQL Server Management Studio (SSMS) or Azure Data Studio.
4. Execute the scripts in sequence from the `scripts/` directory.
