# COVID-19 Data Exploration using SQL

This project focuses on **exploring, cleaning, and analyzing real-world COVID-19 data** using **SQL Server (T-SQL)**.  
The goal is to practice realistic data workflows: importing flat files, fixing schema issues, handling NULLs, and extracting meaningful insights.

---

## 📂 Dataset
- Source: World Health Organization statistics dataset (CSV flat files)
- Data includes:
  - Cases & deaths
  - Population metrics
  - ICU & hospital data
  - Rates per million
  - Country & date level records

---

## 🧹 Data Cleaning & Preparation
Before analysis, several real-world issues were handled:

- Converted flat file (CSV) into SQL Server tables
- Corrected incorrect data types (INT vs BIGINT vs FLOAT)
- Handled **decimal values stored as strings**
- Resolved import errors caused by truncation and overflow
- Managed missing values using **NULL handling**
- Ensured numeric accuracy for analytical calculations

---

## 🛠 SQL Concepts Used
- `CAST()` / `CONVERT()`
- `NULLIF()` and `ISNULL()`
- Joins
- Aggregations (`SUM`, `AVG`, `COUNT`)
- Window functions
- CTEs (Common Table Expressions)
- Data type optimization
- Calculated fields and ratios

---
