-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE countries (
    country_id        VARCHAR(255) NOT NULL,
    country_name      VARCHAR(255) NOT NULL,
    regions_region_id VARCHAR(255) NOT NULL
);

ALTER TABLE countries ADD CONSTRAINT countries_pk PRIMARY KEY ( country_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE departments (
    department_id         VARCHAR(255) NOT NULL,
    department_name       VARCHAR(255) NOT NULL,
    locations_location_id VARCHAR(255) NOT NULL,
    employees_employee_id VARCHAR(255) NOT NULL
);

ALTER TABLE departments ADD CONSTRAINT departments_pk PRIMARY KEY ( department_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE employees (
    employee_id               VARCHAR(255) NOT NULL,
    manager_id                VARCHAR(255) NOT NULL,
    first_name                VARCHAR(50) NOT NULL,
    last_name                 VARCHAR(50) NOT NULL,
    email                     VARCHAR(100) NOT NULL,
    phone_number              VARCHAR(20) NOT NULL,
    hire_date                 VARCHAR(255) NOT NULL,
    salary                    VARCHAR(255) NOT NULL,
    comission_pct             VARCHAR(255) NOT NULL,
    departments_department_id VARCHAR(255) NOT NULL,
    employees_employee_id     VARCHAR(255) NOT NULL,
    jobs_job_id               VARCHAR(20) NOT NULL
);

ALTER TABLE employees ADD CONSTRAINT employees_pk PRIMARY KEY ( employee_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE job_history (
    start_date                VARCHAR(255) NOT NULL,
    end_date                  VARCHAR(255) NOT NULL,
    employees_employee_id     VARCHAR(255) NOT NULL,
    departments_department_id VARCHAR(255) NOT NULL,
    jobs_job_id               VARCHAR(20) NOT NULL
);

ALTER TABLE job_history ADD CONSTRAINT job_history_pk PRIMARY KEY ( start_date );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE jobs (
    job_id     VARCHAR(20) NOT NULL,
    job_title  VARCHAR(50) NOT NULL,
    min_salary VARCHAR(255) NOT NULL,
    max_salary VARCHAR(255) NOT NULL
);

ALTER TABLE jobs ADD CONSTRAINT jobs_pk PRIMARY KEY ( job_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE locations (
    location_id          VARCHAR(255) NOT NULL,
    street_address       VARCHAR(255) NOT NULL,
    postal_code          VARCHAR(20) NOT NULL,
    city                 VARCHAR(50) NOT NULL,
    state_province       VARCHAR(50) NOT NULL,
    countries_country_id VARCHAR(255) NOT NULL
);

ALTER TABLE locations ADD CONSTRAINT locations_pk PRIMARY KEY ( location_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE regions (
    region_id   FLOAT NOT NULL,
    region_name VARCHAR(20) NOT NULL
);

ALTER TABLE regions ADD CONSTRAINT regions_pk PRIMARY KEY ( region_id );

ALTER TABLE countries
    ADD CONSTRAINT countries_regions_fk FOREIGN KEY ( regions_region_id )
        REFERENCES regions ( region_id );

ALTER TABLE departments
    ADD CONSTRAINT departments_employees_fk FOREIGN KEY ( employees_employee_id )
        REFERENCES employees ( employee_id );

ALTER TABLE departments
    ADD CONSTRAINT departments_locations_fk FOREIGN KEY ( locations_location_id )
        REFERENCES locations ( location_id );

ALTER TABLE employees
    ADD CONSTRAINT employees_departments_fk FOREIGN KEY ( departments_department_id )
        REFERENCES departments ( department_id );

ALTER TABLE employees
    ADD CONSTRAINT employees_employees_fk FOREIGN KEY ( employees_employee_id )
        REFERENCES employees ( employee_id );

ALTER TABLE employees
    ADD CONSTRAINT employees_jobs_fk FOREIGN KEY ( jobs_job_id )
        REFERENCES jobs ( job_id );

ALTER TABLE job_history
    ADD CONSTRAINT job_history_departments_fk FOREIGN KEY ( departments_department_id )
        REFERENCES departments ( department_id );

ALTER TABLE job_history
    ADD CONSTRAINT job_history_employees_fk FOREIGN KEY ( employees_employee_id )
        REFERENCES employees ( employee_id );

ALTER TABLE job_history
    ADD CONSTRAINT job_history_jobs_fk FOREIGN KEY ( jobs_job_id )
        REFERENCES jobs ( job_id );

ALTER TABLE locations
    ADD CONSTRAINT locations_countries_fk FOREIGN KEY ( countries_country_id )
        REFERENCES countries ( country_id );
        

INSERT INTO countries (country_id, country_name, regions_region_id)
VALUES
    ('US', 'United States', 'NA'),
    ('CA', 'Canada', 'NA');

INSERT INTO departments (department_id, department_name, locations_location_id, employees_employee_id)
VALUES
    ('HR', 'Human Resources', 'LOC1', 'EMP1'),
    ('IT', 'Information Technology', 'LOC2', 'EMP2');

INSERT INTO employees (employee_id, manager_id, first_name, last_name, email, phone_number, hire_date, salary, comission_pct, departments_department_id, employees_employee_id, jobs_job_id)
VALUES
    ('EMP1', 'EMP2', 'John', 'Doe', 'john.doe@example.com', '123-456-7890', '2023-10-20', '60000', '0.10', 'HR', 'EMP1', 'HR_REP'),
    ('EMP2', NULL, 'Alice', 'Smith', 'alice.smith@example.com', '987-654-3210', '2023-10-21', '70000', '0.15', 'IT', 'EMP2', 'IT_REP');

INSERT INTO job_history (start_date, end_date, employees_employee_id, departments_department_id, jobs_job_id)
VALUES
    ('2023-01-01', '2023-05-01', 'EMP1', 'HR', 'HR_REP'),
    ('2023-02-01', '2023-06-01', 'EMP2', 'IT', 'IT_REP');

INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES
    ('HR_REP', 'HR Representative', '50000', '70000'),
    ('IT_REP', 'IT Representative', '60000', '80000');

INSERT INTO locations (location_id, street_address, postal_code, city, state_province, countries_country_id)
VALUES
    ('LOC1', '123 Main St', '12345', 'New York', 'NY', 'US'),
    ('LOC2', '456 Elm St', '67890', 'Toronto', 'ON', 'CA');

INSERT INTO regions (region_id, region_name)
VALUES
    ('NA', 'North America');

