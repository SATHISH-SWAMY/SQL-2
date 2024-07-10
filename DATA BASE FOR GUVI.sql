CREATE DATABASE guvi_zen;
USE guvi_zen;
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15),
    date_of_birth DATE
);
CREATE TABLE Instructors (
    instructor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15),
    hire_date DATE
);


CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100),
    course_description TEXT,
    credits INT
);

CREATE TABLE Classes (
    class_id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT,
    instructor_id INT,
    start_date DATE,
    end_date DATE,
    schedule VARCHAR(100),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    class_id INT,
    student_id INT,
    enrollment_date DATE,
    FOREIGN KEY (class_id) REFERENCES Classes(class_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

CREATE TABLE Assignments (
    assignment_id INT PRIMARY KEY AUTO_INCREMENT,
    class_id INT,
    title VARCHAR(100),
    description TEXT,
    due_date DATE,
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);
CREATE TABLE Grades (
    grade_id INT PRIMARY KEY AUTO_INCREMENT,
    assignment_id INT,
    student_id INT,
    grade DECIMAL(3, 2),
    FOREIGN KEY (assignment_id) REFERENCES Assignments(assignment_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);


INSERT INTO Students (first_name, last_name, email, phone_number, date_of_birth)
VALUES ('John', 'Doe', 'john.doe@example.com', '1234567890', '1990-01-01');

INSERT INTO Instructors (first_name, last_name, email, phone_number, hire_date)
VALUES ('Jane', 'Smith', 'jane.smith@example.com', '0987654321', '2020-01-01');

INSERT INTO Courses (course_name, course_description, credits)
VALUES ('Database Design', 'Learn about designing databases', 3);

INSERT INTO Classes (course_id, instructor_id, start_date, end_date, schedule)
VALUES (1, 1, '2024-08-01', '2024-12-01', 'Mon, Wed, Fri 10:00-11:00');

INSERT INTO Enrollments (class_id, student_id, enrollment_date)
VALUES (1, 1, '2024-07-10');

INSERT INTO Assignments (class_id, title, description, due_date)
VALUES (1, 'Assignment 1', 'First assignment description', '2024-09-01');

