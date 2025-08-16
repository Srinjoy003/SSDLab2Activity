==================================================================
CS6.302 - Software System Development
Lab - 2 :: SQL - Stored Procedures and Cursors
==================================================================

This submission contains the SQL scripts (q1.sql to q5.sql) for the lab assignment.


## Git Repository Link (Mandatory)

[IMPORTANT: REPLACE THIS LINE WITH YOUR ACTUAL GIT REPOSITORY LINK]


## Steps to Execute the Scripts

Follow these steps in your MySQL client (like MySQL Workbench).

### 1. Initial Database Setup

a. Connect to your MySQL server.

b. Create and use a new database for this lab.
   CREATE DATABASE lab2;
   USE lab2;

c. Run the table creation and data insertion script provided in the lab handout. This will create the `Shows`, `Subscribers`, and `WatchHistory` tables and populate them with sample data.

### 2. Create the Stored Procedures

Open and run each of the following files one by one. This will create the five required stored procedures in your `lab2` database.

- q1.sql
- q2.sql
- q3.sql
- q4.sql
- q5.sql

### 3. How to Run and Test Each Procedure

After the procedures are created, you can test them using the `CALL` command.

**Question 1: ListAllSubscribers()**
-- Lists the names of all subscribers.
CALL ListAllSubscribers();

**Question 2: GetWatchHistoryBySubscriber()**
-- Shows the watch history for a specific subscriber (e.g., ID 2).
CALL GetWatchHistoryBySubscriber(2);

**Question 3: AddSubscriberIfNotExists()**
-- Tries to add a new subscriber.
CALL AddSubscriberIfNotExists('New User');
-- Tries to add an existing subscriber.
CALL AddSubscriberIfNotExists('Emily Clark');

**Question 4: SendWatchTimeReport()**
-- Shows reports only for subscribers who have a watch history.
CALL SendWatchTimeReport();

**Question 5: GenerateAllSubscriberReports()**
-- Loops through every subscriber and shows their report.
CALL GenerateAllSubscriberReports();