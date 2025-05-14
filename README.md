# Smart Farm Management System

An advanced SQL-based project designed to simulate and manage real-world farm operations — from crop planning and planting to rainfall tracking, fertilizer application, sales monitoring, and machinery maintenance. Ideal for showcasing deep SQL understanding, database design, and data analysis skills.

## 👨‍💻 Author

**Rajwardhan Malhari Pawar**
[GitHub Profile](https://github.com/rajwardhan1907)
📧 [rajwardhan0707@gmail.com](mailto:rajwardhan0707@gmail.com)

---

## 🧠 Project Highlights

* Full ER design with normalization
* Real-life entities like Crops, Fields, Plantings, Fertilizers, Rainfall, Machinery, Labor, and Sales
* Advanced SQL queries for analysis
* Use of relationships and foreign keys
* Ideal for portfolio, resumes, and interview discussions

---

## 🗃️ Database Tables

| Table                      | Description                                |
| -------------------------- | ------------------------------------------ |
| **Crops**                  | Crop types, season, yield info             |
| **Fields**                 | Details about land and soil                |
| **Plantings**              | Track what crop was planted where and when |
| **FertilizerApplications** | Records of fertilizer used per field       |
| **RainfallData**           | Daily rainfall logs for each field         |
| **MachineryMaintenance**   | Machine health and maintenance             |
| **Labor**                  | Labor usage per field and task             |
| **Sales**                  | Crop sales, price, and quantity            |

---

## 💾 Technologies Used

* MySQL / PostgreSQL
* ER Design via NetworkX
* Python (for visualization)
* GitHub for version control

---

## 📊 Sample SQL Features Used

* `JOIN`, `GROUP BY`, `HAVING`, `WHERE`, `CASE`
* Subqueries & nested queries
* Aggregates: `AVG()`, `SUM()`, `MAX()`, `MIN()`
* Views, Indexes, and Constraints
* Foreign key relationships

---

## 🚀 Sample Queries

```sql
-- Total revenue generated per crop\SELECT c.CropName, SUM(s.QuantityKg * s.PricePerKg) AS TotalRevenue
FROM Sales s
JOIN Crops c ON s.CropID = c.CropID
GROUP BY c.CropName;

-- Average rainfall per field
SELECT FieldID, AVG(Rainfall_mm) AS AvgRainfall
FROM RainfallData
GROUP BY FieldID;
```

---

## 📥 Getting Started

1. Clone this repo

```bash
git clone https://github.com/rajwardhan1907/smart-farm-sql-project.git
```

2. Create database using schema.sql
3. Insert sample data from `mock_data.sql`
4. Run analysis queries from `queries.sql`

---

## 🤝 Contributions & Contact

Feel free to open issues or fork the project for improvements.

📧 Email: [rajwardhan0707@gmail.com](mailto:rajwardhan0707@gmail.com)
🐙 GitHub: [rajwardhan1907](https://github.com/rajwardhan1907)

---

## 🏁 License

This project is open-source and available under the [MIT License](LICENSE).
