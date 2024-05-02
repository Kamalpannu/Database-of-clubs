USE Group(2);

INSERT INTO Member (StudentId, Name, DOB) VALUES (1, 'John Doe', '1995-05-15');
INSERT INTO Member (StudentId, Name, DOB) VALUES (2, 'Jane Smith', '1998-10-20');
INSERT INTO Member (StudentId, Name, DOB) VALUES (3, 'Alice Johnson', '1997-03-08');
INSERT INTO Member (StudentId, Name, DOB) VALUES (4, 'Bob Williams', '1996-08-25');
INSERT INTO Member (StudentId, Name, DOB) VALUES (5, 'Emily Brown', '1999-12-12');


INSERT INTO Alumnus (StudentId) VALUES (1);
INSERT INTO Alumnus (StudentId) VALUES (3);


INSERT INTO Student (StudentId) VALUES (2);
INSERT INTO Student (StudentId) VALUES (4);
INSERT INTO Student (StudentId) VALUES (5);


INSERT INTO Club (ClubID, Name) VALUES (1, 'Chess Club');
INSERT INTO Club (ClubID, Name) VALUES (2, 'Football Club');
INSERT INTO Club (ClubID, Name) VALUES (3, 'Music Club');


INSERT INTO [Group] (GroupID, Name, ClubID) VALUES (1, 'Chess Enthusiasts', 1);
INSERT INTO [Group] (GroupID, Name, ClubID) VALUES (2, 'Football Fanatics', 2);
INSERT INTO [Group] (GroupID, Name, ClubID) VALUES (3, 'Music Lovers', 3);


INSERT INTO Project (ProjectID, TotalFunding, GroupID) VALUES (1, 1000.00, 1);
INSERT INTO Project (ProjectID, TotalFunding, GroupID) VALUES (2, 2500.50, 2);
INSERT INTO Project (ProjectID, TotalFunding, GroupID) VALUES (3, 500.00, 3);


INSERT INTO EmploymentPeriod (EmploymentID, StartDate, CompanyName, EndDate, PositionName) VALUES (1, '2020-01-01', 'ABC Corp', '2021-01-01', 'Software Engineer');
INSERT INTO EmploymentPeriod (EmploymentID, StartDate, CompanyName, EndDate, PositionName) VALUES (2, '2019-05-15', 'XYZ Inc', '2020-06-30', 'Marketing Manager');


INSERT INTO AlumnusWorksEmploymentPeriod (EmploymentID, StartDate, EndDate, StudentID) VALUES (1, '2020-01-01', '2021-01-01', 1);
INSERT INTO AlumnusWorksEmploymentPeriod (EmploymentID, StartDate, EndDate, StudentID) VALUES (2, '2019-05-15', '2020-06-30', 3);


INSERT INTO MemberLeadsClub (ClubID, StudentID) VALUES (1, 1);
INSERT INTO MemberLeadsClub (ClubID, StudentID) VALUES (2, 2);
INSERT INTO MemberLeadsClub (ClubID, StudentID) VALUES (3, 3);


INSERT INTO MemberGroup (StudentID, GroupID, StartDate, EndDate) VALUES (1, 1, '2020-01-01', '2021-01-01');
INSERT INTO MemberGroup (StudentID, GroupID, StartDate, EndDate) VALUES (2, 2, '2019-05-15', '2020-06-30');
INSERT INTO MemberGroup (StudentID, GroupID, StartDate, EndDate) VALUES (3, 3, '2018-09-01', NULL);


INSERT INTO MemberWorksProject (StudentID, ProjectID, DivisionAmount) VALUES (1, 1, 0.75);
INSERT INTO MemberWorksProject (StudentID, ProjectID, DivisionAmount) VALUES (2, 2, 0.60);
INSERT INTO MemberWorksProject (StudentID, ProjectID, DivisionAmount) VALUES (3, 3, 0.80);


INSERT INTO MemberGroupEvents (GroupID, StudentID, EventID, Subject, RegistrationFee, Date, [Time], Room, Floor, Building) VALUES (1, 1, 1, 'Chess Tournament', 10.00, '2021-03-20', '18:00:00', 'Room A', '1', 'Building X');
INSERT INTO MemberGroupEvents (GroupID, StudentID, EventID, Subject, RegistrationFee, Date, [Time], Room, Floor, Building) VALUES (2, 2, 2, 'Football Match', 5.00, '2021-04-10', '14:30','Room B','2','Building Y');