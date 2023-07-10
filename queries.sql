-- all books currently in library
SELECT * FROM Books


-- all active users in library
SELECT * FROM Users


-- Total fines
SELECT SUM(Fine_Amount) AS TotalFines 
FROM Fines


-- Sample Query 1: all books currently checked out
SELECT Books.*
FROM Books
INNER JOIN CirculationRecords ON Books.Book_ID = CirculationRecords.Book_ID
WHERE CirculationRecords.Return_Date = '1001-01-01';


-- Sample Query 2: total fines by given user
SELECT SUM(Fines.Fine_Amount) AS TotalFines
FROM Fines
INNER JOIN CirculationRecords ON Fines.Book_ID = CirculationRecords.Book_ID
AND Fines.User_ID = CirculationRecords.User_ID
INNER JOIN Users ON CirculationRecords.User_ID = Users.User_ID
WHERE Users.User_ID = 1;