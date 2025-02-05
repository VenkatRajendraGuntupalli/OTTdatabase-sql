# Database Schema for OTT platform

## Overview
This project defines the **database schema** for a **Streaming Platform**. The schema includes tables for users, content, payments, subscriptions, genres, production houses, awards, and more. It also features **stored procedures, triggers, transactions, and views** to enhance data integrity and performance.

## Features
- **Well-structured tables** following industry standards.
- **Stored Procedures** for common operations like payments and subscription updates.
- **Triggers** for auditing and enforcing constraints.
- **Views** to simplify data retrieval.
- **Transactions** ensuring data consistency.

---

## 📂 File Structure

---

## 📌 Tables Included
| Table Name            | Description |
|-----------------------|------------|
| `Awards`             | Stores details of awards given to content |
| `Content`            | Stores movies, shows, and other content metadata |
| `Payment`            | Tracks user payments and subscription details |
| `User`               | Stores user details including subscription status |
| `Worker`             | Stores workers associated with content production |
| `Content_type`       | Defines different types of content (Movies, Shows, etc.) |
| `Genre`              | Stores different content genres |
| `is_bestowed`        | Links awards with content |
| `PG_rating`          | Stores parental guidance ratings |
| `Production_House`   | Stores production house details |
| `Subscription_types` | Defines different subscription plans |
| `ZipCodes`           | Stores zip code and location information |

---

## 📌 Views Included
| View Name            | Description |
|----------------------|------------|
| `active_users`      | Lists users with active subscriptions |
| `content_by_genre`  | Retrieves content filtered by genre |

---

## 📌 Stored Procedures
| Procedure Name            | Description |
|---------------------------|------------|
| `ProcessPayment`         | Handles user payments and updates their subscription |
| `UpdateUserSubscription` | Updates a user's subscription type |

---

## 📌 Triggers
| Trigger Name            | Description |
|-------------------------|------------|
| `trg_UserSignUp`       | Logs when a new user is registered |
| `trg_ContentAddition`  | Logs when new content is added |

---

## ⚡ How to Use

### 🛠 Setting up the Database
1. Run **`schema.sql`** to create all tables.
2. Run **`views.sql`** to create database views.
3. Run **`stored_procedures.sql`** to add stored procedures.
4. Run **`triggers.sql`** to set up triggers.
5. Run **`transactions.sql`** to enable database transactions.
6. (Optional) Run **`seed_data.sql`** to insert test data.

### 📜 Running Queries
- To fetch **active users**, use:
  ```sql
  SELECT * FROM active_users;

- To fetch **fetch content by genre**, use:
  ```sql
  SELECT * FROM content_by_genre WHERE genre_name = 'Action';


## 🎯 Future Enhancements
- Add more **indexes** to optimize performance.
- Implement **stored procedures** for content recommendations.
- Enhance security using **role-based access control**.

---

## 📝 License
This project is licensed under the **MIT License** – feel free to use and modify it.

---

## 👨‍💻 Author
Developed by **VENKAT RAJENDRA GUNTUPALLI**  
📧 Contact: **guntupalliv1@udayton.edu**  
🔗 GitHub: **https://github.com/VenkatRajendraGuntupalli**
