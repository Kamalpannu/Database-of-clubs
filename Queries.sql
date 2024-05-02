-- 
-- Group 17
-- Members: Evan, MySQL Expert
--          Preetkamal Singh, MS SQL Expert
-- --------------------------------------
-- All queries must run without any error under MySQL and MS SQL Server.

-- Q1 - Display the last name of teachers and their date of birth who are cool and fun :-)
SELECT Teachers.LName, Teachers.BirthDate
FROM Teachers JOIN Employees ON Teachers.TID = Employees.EID
WHERE Coolness = 'Hot';

-- Q2 Display students Info who work hard to lean SQL and use it in their career
SELECT *
FROM Students LEFT JOIN Grades ON Students.SID = Grades.SID
WHERE Grades.Status = 'works Hard';

--Q1 Return members name who led the group and also work on projects
SELECT DISTINCT m.Name
FROM Member m
WHERE EXISTS (
    SELECT *
    FROM MemberLeadsClub mlc
    JOIN MemberWorksProject mwp ON mlc.StudentID = mwp.StudentID
    WHERE m.StudentID = mlc.StudentID
);
--Q2 Retrun the members and clubname along with the club is leaded by whom 
SELECT m.Name, c.Name AS ClubName
FROM Member m
LEFT JOIN MemberLeadsClub mlc ON m.StudentID = mlc.StudentID
LEFT JOIN Club c ON mlc.ClubID = c.ClubID;

--Q3 Update the alumnus works employment peroid 
UPDATE EmploymentPeriod
SET EndDate = '2023-12-31',CompanyName='Senior Software engineer'
WHERE EmploymentID = 1;

--Q4 Retrieve all members who have worked on projects with a total funding greater than the average total funding of all projects.
SELECT m.Name
FROM Member m
WHERE EXISTS (
SELECT *
FROM MemberWorksProject mwp
INNER JOIN Project p ON mwp.ProjectID = p.ProjectID
WHERE p.TotalFunding > (
SELECT AVG(TotalFunding)
FROM Project
)
AND m.StudentID = mwp.StudentID
);

--Q5 Count the number of projects a specific member has worked on
SELECT COUNT(*) AS NumProjects
FROM MemberWorksProject
WHERE StudentID =2;

--Q6 Delete a specific member from the database along with their related records
DELETE FROM Member
WHERE StudentID = 3;

--Q7 Create a view to display the total funding received by each project group. 
CREATE VIEW ProjectGroupTotalFunding AS
SELECT p.GroupID, SUM(p.TotalFunding) AS TotalFunding
FROM Project p
GROUP BY p.GroupID;

--Q8 Find the minimum start date among all employment periods
SELECT MIN(StartDate) AS EarliestStartDate
FROM EmploymentPeriod;

--Q8 Retrieve all combinations of member names and club names.
SELECT m.Name, c.Name AS ClubName
FROM Member m
CROSS JOIN Club c
WHERE m.ClubID=c.ClubID;

--Q9 Find the minimum start date among all employment periods.
SELECT MIN(StartDate) AS EarliestStartDate
FROM EmploymentPeriod;

--Q10 Calculate the average division amount allocated to projects for a specific member
SELECT AVG(DivisionAmount) AS AvgDivisionAmount
FROM MemberWorksProject
WHERE StudentID = 1;

--Q11 Retrieve the names of all students who have worked on projects led by a specific club.
SELECT m.Name
FROM Member m
WHERE EXISTS (
    SELECT *
    FROM MemberWorksProject mwp
    JOIN [Group] g ON mwp.GroupID = g.GroupID
    JOIN Club c ON g.ClubID = c.ClubID
    WHERE c.Name = 'Chess Club'
    AND m.StudentID = mwp.StudentID
);

--Q12 Create a view to display all active employment periods.
CREATE VIEW ActiveEmploymentPeriods AS
SELECT *
FROM EmploymentPeriod
WHERE EndDate IS NULL;

--Q13 Retrieve the names of members who have led a club and are currently part of a specific project group.
SELECT DISTINCT m.Name
FROM Member m
JOIN MemberLeadsClub mlc ON m.StudentID = mlc.StudentID
JOIN MemberGroup mg ON m.StudentID = mg.StudentID
JOIN [Group] g ON mg.GroupID = g.GroupID
WHERE g.GroupID = 3;

--Q14 Retrieve members who are not currently part of any group.
SELECT m.StudentId, m.Name AS MemberName
FROM Member m
LEFT JOIN MemberGroup mg ON m.StudentId = mg.StudentId
WHERE mg.StudentId IS NULL;

--Q15 Retrieve information about members, their respective clubs, and the projects those clubs are associated with
SELECT m.StudentId, m.Name AS MemberName, c.Name AS ClubName, g.Name AS GroupName, p.ProjectID, p.TotalFunding
FROM Member m
NATURAL JOIN MemberLeadsClub mlc
NATURAL JOIN Club c
NATURAL JOIN [Group] g
LEFT JOIN Project p ON g.GroupID = p.GroupID;

--Q16 Retrieve members who are currently part of any group:
SELECT m.StudentId, m.Name AS MemberName
FROM Member m
LEFT JOIN MemberGroup mg ON m.StudentId = mg.StudentId
WHERE mg.StudentId IS NOT NULL;

--Q17 Retrieve members who are both alumnus and students
SELECT m.StudentId, m.Name AS MemberName
FROM Member m
JOIN Alumnus a ON m.StudentId = a.StudentId
JOIN Student s ON m.StudentId = s.StudentId;

--Q18 Retrieve members who have worked on projects with a total funding greater than a certain amount:
SELECT m.Name AS MemberName
FROM Member m
JOIN MemberWorksProject mwp ON m.StudentId = mwp.StudentId
JOIN Project p ON mwp.ProjectID = p.ProjectID
WHERE p.TotalFunding > 500;

--Q19 Retrieve clubs along with the total number of members, but only show clubs with more than 1 members
SELECT c.Name AS ClubName, COUNT(mlc.StudentId) AS TotalMembers
FROM Club c
LEFT JOIN MemberLeadsClub mlc ON c.ClubID = mlc.ClubID
GROUP BY c.Name
HAVING COUNT(mlc.StudentId) > 1;

--Q20 Retrieve members who have worked on projects with a total funding greater than the average total funding of all project
SELECT m.Name AS MemberName
FROM Member m
JOIN MemberWorksProject mwp ON m.StudentId = mwp.StudentId
JOIN Project p ON mwp.ProjectID = p.ProjectID
GROUP BY m.Name
HAVING SUM(p.TotalFunding) > (SELECT AVG(TotalFunding) FROM Project);