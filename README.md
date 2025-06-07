# SQL-for-Data-Analysis


# 📄 README – Task 3: SQL for Data Analysis

**Dataset:**  Superstore

## ✅ Objective

To perform data analysis using SQL queries and extract business insights through grouping, filtering, joins, CTEs, window functions, and views.

---

## 🛠️ Tools Used

* **SQL Environment:** Microsoft SQL Server / MySQL
* **File Type:** `.sql` file with all queries
* **Additional Output:** Screenshots of query results

---

## 📂 Key Queries Implemented

### 🔹 Basic Queries

* `SELECT`, `WHERE`, `ORDER BY`, `GROUP BY`
* Extracted year, month, day from dates
* Calculated `start_of_month`, `end_of_month`, and `converted_date`

### 🔹 Aggregate Functions

* `SUM(Sales)`, `COUNT(*)`, `AVG()`, etc.
* Grouped monthly sales using `EOMONTH()` and `FORMAT()`

### 🔹 Window Functions (OVER Clause)

* Running totals on monthly sales
* Used `SUM() OVER (ORDER BY Month)` without `GROUP BY`

### 🔹 Common Table Expressions (CTEs)

* Used `WITH` to modularize queries for:

  * Monthly sales
  * Segment-wise summaries
  * Running totals

### 🔹 Joins

* Joined `Orders$` and `People$` on `Region`

### 🔹 Views

* Created a reusable view for monthly sales summaries

### 🔹 Optimization

* Added indexes to improve performance on frequently filtered or joined columns

---

## 📈 Business Insights Found

* Identified peak sales months
* Compared customer segments
* Calculated total and running sales
* Created summarized outputs per segment and date

---



