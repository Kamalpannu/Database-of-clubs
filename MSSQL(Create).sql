CREATE TABLE Member (
    StudentId INT PRIMARY KEY,
    Name VARCHAR(20),
    DOB DATE
);

CREATE TABLE Alumnus (
    StudentId INT PRIMARY KEY,
    FOREIGN KEY (StudentId) REFERENCES Member(StudentId)
);

CREATE TABLE Student (
    StudentId INT PRIMARY KEY,
    FOREIGN KEY (StudentId) REFERENCES Member(StudentId)
);

CREATE TABLE Club (
    ClubID INT PRIMARY KEY,
    Name VARCHAR(10)
);

CREATE TABLE [Group] (
    GroupID INT PRIMARY KEY,
    Name VARCHAR(10),
    ClubID INT,
    FOREIGN KEY (ClubID) REFERENCES Club(ClubID)
);

CREATE TABLE Project (
    ProjectID INT PRIMARY KEY,
    TotalFunding DECIMAL(6, 2),
    GroupID INT,
    FOREIGN KEY (GroupID) REFERENCES [Group](GroupID)
);

CREATE TABLE EmploymentPeriod (
    EmploymentID INT PRIMARY KEY,
    StartDate DATE,
    CompanyName VARCHAR(15),
    EndDate DATE,
    PositionName VARCHAR(16)
);

CREATE TABLE AlumnusWorksEmploymentPeriod (
    EmploymentID INT,
    StartDate DATE,
    EndDate DATE,
    StudentID INT,
    FOREIGN KEY (EmploymentID) REFERENCES EmploymentPeriod(EmploymentID),
    FOREIGN KEY (StudentID) REFERENCES Alumnus(StudentID)
);

CREATE TABLE MemberLeadsClub (
    ClubID INT,
    StudentID INT,
    FOREIGN KEY (ClubID) REFERENCES Club(ClubID),
    FOREIGN KEY (StudentID) REFERENCES Member(StudentID)
);

CREATE TABLE MemberGroup (
    StudentID INT,
    GroupID INT,
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Member(StudentID),
    FOREIGN KEY (GroupID) REFERENCES [Group](GroupID)
);

CREATE TABLE MemberWorksProject (
    StudentID INT,
    ProjectID INT,
    DivisionAmount DECIMAL(4, 2),
    FOREIGN KEY (StudentID) REFERENCES Member(StudentID),
    FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID)
);

CREATE TABLE MemberGroupEvents (
    GroupID INT,
    StudentID INT,
    EventID INT,
    Subject VARCHAR(10),
    RegistrationFee DECIMAL(4, 2),
    Date DATE,
    [Time] TIME,
    Room VARCHAR(18),
    Floor VARCHAR(3),
    Building VARCHAR(3),
    FOREIGN KEY (GroupID) REFERENCES [Group](GroupID),
    FOREIGN KEY (StudentID) REFERENCES Member(StudentID)
);