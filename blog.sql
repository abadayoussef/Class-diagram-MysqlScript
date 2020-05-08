-- create and use database
CREATE DATABASE blogManagment;
USE blogManagment;

-- create tables
CREATE TABLE UserRole(IDRole INT AUTO_INCREMENT, RoleName VARCHAR(50), PRIMARY KEY(IDRole));
CREATE TABLE Category(IDCategory INT AUTO_INCREMENT, CategoryName VARCHAR(50), PRIMARY KEY(IDCategory));

CREATE TABLE Users(IDUser INT AUTO_INCREMENT, Username VARCHAR(50), FullName VARCHAR(80), Birthday DATETIME, Country VARCHAR(50), JOINDate DATETIME DEFAULT CURRENT_TIMESTAMP, IDRole INT, PRIMARY KEY(IDUser), FOREIGN KEY (IDRole) references UserRole(IDRole));

CREATE TABLE Blog(IDBlog INT AUTO_INCREMENT, BlogText VARCHAR(5000), DateBlog DATETIME DEFAULT CURRENT_TIMESTAMP, IDUser INT, IDCategory INT, PRIMARY KEY(IDBlog), FOREIGN KEY (IDUser) references Users(IDUser), FOREIGN KEY (IDCategory) references Category(IDCategory));

CREATE TABLE Comment(IDComment INT AUTO_INCREMENT, CommentText VARCHAR(250), DateComment DATETIME DEFAULT CURRENT_TIMESTAMP, IDUser INT, IDBlog INT, PRIMARY KEY(IDComment), FOREIGN KEY (IDUser) references Users (IDUser), FOREIGN KEY (IDBlog) references Blog(IDBlog));


-- add rows
INSERT INTO UserRole(RoleName) values ('Admin'), ('Moderator'), ('Publisher'), ('Memeber'), ('Visitor');
INSERT INTO Category(CategoryName) values ('News'), ('Sport'), ('Tech'), ('Nature'), ('Music');

INSERT INTO Users(Username, FullName, Birthday, Country, IDRole) values ('abada', 'Youssef Abada', '1993-06-18', 'Morocco', 1), ('john', 'John Doe', '1990-11-10', 'USA', 4), ('mahmoud', 'Mahmoud Hasabalah', '1986-07-02', 'Egypt', 5);

INSERT INTO Blog(BlogText, IDUser, IDCategory) values ('lorem ipsum haha 1', 3, 1), ('lorem ipsum blabla 2', 2, 1);

INSERT INTO Comment(CommentText, IDUser, IDBlog) values ('Very nice bro',  3, 1), ('haha very funny', 2, 2);


-- update some rows
UPDATE Blog SET BlogText = 'this is a demo text' WHERE IDBlog = 2;
UPDATE Users SET Country = 'Canada' WHERE IDUser = 1;

-- delete some rows
DELETE FROM Category WHERE CategoryName = 'Nature';
DELETE FROM Comment WHERE IDUser = 2;


-- show data
SELECT * FROM Blog;
SELECT c.CommentText, u.Username FROM Comment c INNER JOIN Users u on u.IDUser = u.IDUser ORDER BY u.Username;