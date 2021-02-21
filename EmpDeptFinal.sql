-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/37ghFg
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Departments" (
    "DeptId" Serial   NOT NULL,
    "DeptNo" varchar(20)   NOT NULL,
    "DeptName" varchar(50)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "DeptId"
     ),
    CONSTRAINT "uc_Departments_DeptNo" UNIQUE (
        "DeptNo"
    )
);

CREATE TABLE "Employee" (
    "EmpId" Serial   NOT NULL,
    "EmpNo" Int   NOT NULL,
    "EmpTitleNo" varchar(20)   NOT NULL,
    "EmpDob" varchar(20)   NOT NULL,
    "EmpFirstName" varchar(50)   NOT NULL,
    "EmpLastName" varchar(50)   NOT NULL,
    "EmpSex" varchar(10)   NOT NULL,
    "EmpHireDate" varchar(20)   NOT NULL,
    CONSTRAINT "pk_Employee" PRIMARY KEY (
        "EmpId"
     ),
    CONSTRAINT "uc_Employee_EmpNo" UNIQUE (
        "EmpNo"
    )
);

CREATE TABLE "DeptManager" (
    "DeptManId" Serial   NOT NULL,
    "DeptNo" varchar(20)   NOT NULL,
    "EmpNo" int   NOT NULL,
    CONSTRAINT "pk_DeptManager" PRIMARY KEY (
        "DeptManId"
     )
);

CREATE TABLE "DeptEmp" (
    "DeptEmpId" Serial   NOT NULL,
    "EmpNo" int   NOT NULL,
    "DeptNo" varchar(20)   NOT NULL,
    CONSTRAINT "pk_DeptEmp" PRIMARY KEY (
        "DeptEmpId"
     )
);

CREATE TABLE "Salaries" (
    "SalaryId" Serial   NOT NULL,
    "EmpNo" Int   NOT NULL,
    "Salary" Int   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "SalaryId"
     )
);

-- Table documentation comment 1 (try the PDF/RTF export)
-- Table documentation comment 2
CREATE TABLE "Titles" (
    "TitleID" varchar(20)   NOT NULL,
    -- Field documentation comment 3
    "Title" varchar(100)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "TitleID"
     )
);

ALTER TABLE "Employee" ADD CONSTRAINT "fk_Employee_EmpTitleNo" FOREIGN KEY("EmpTitleNo")
REFERENCES "Titles" ("TitleID");

ALTER TABLE "DeptManager" ADD CONSTRAINT "fk_DeptManager_DeptNo" FOREIGN KEY("DeptNo")
REFERENCES "Departments" ("DeptNo");

ALTER TABLE "DeptManager" ADD CONSTRAINT "fk_DeptManager_EmpNo" FOREIGN KEY("EmpNo")
REFERENCES "Employee" ("EmpNo");

ALTER TABLE "DeptEmp" ADD CONSTRAINT "fk_DeptEmp_DeptNo" FOREIGN KEY("DeptNo")
REFERENCES "Departments" ("DeptNo");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_EmpNo" FOREIGN KEY("EmpNo")
REFERENCES "Employee" ("EmpNo");

