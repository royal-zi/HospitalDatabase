create database hospitalbd;
use hospitalbd;

CREATE TABLE departments (
  `id_departments` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_departments`));

CREATE TABLE employees (
  `id_empleyees` INT NOT NULL AUTO_INCREMENT,
  `full_name` VARCHAR(45) NOT NULL,
  `department_id` INT NOT NULL,
  `date` DATE NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `number` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`id_empleyees`),
  FOREIGN KEY (`department_id`) REFERENCES departments(`id_departments`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE roles (
  `id_roles` INT NOT NULL AUTO_INCREMENT,
  `role_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_roles`));

CREATE TABLE has_roles(
  `id_has_roles` INT NOT NULL AUTO_INCREMENT,
  `employee_id` INT NOT NULL,
  `work_time_from` TIMESTAMP NOT NULL,
  `work_time_to` TIMESTAMP NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`id_has_roles`),
  FOREIGN KEY (`employee_id`) REFERENCES employees(`id_empleyees`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (`role_id`) REFERENCES roles (`id_roles`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE patients(
  `id_patients` INT NOT NULL AUTO_INCREMENT,
  `full_name` VARCHAR(45) NOT NULL,
  `IIN` VARCHAR(45)  NOT NULL,
  `datee` DATE NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_patients`));

CREATE TABLE appointments (
  `id_appointments` INT NOT NULL AUTO_INCREMENT,
  `patient_id` INT NOT NULL,
  `employee_id` INT NOT NULL,
  PRIMARY KEY (`id_appointments`),
  FOREIGN KEY (`patient_id`) REFERENCES patients (`id_patients`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  FOREIGN KEY (`employee_id`) REFERENCES employees (`id_empleyees`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


CREATE TABLE services(
  `id_services` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `cost` INT NOT NULL,
  PRIMARY KEY (`id_services`));


CREATE TABLE procedures(
  `id_procedures` INT NOT NULL AUTO_INCREMENT,
  `appointment_id` INT NOT NULL,
  `start_date` DATE NOT NULL,
  `days` INT NOT NULL,
  `how_much_times` INT NOT NULL,
  `service_id` INT NOT NULL,
  `status` TINYINT NOT NULL,
  PRIMARY KEY (`id_procedures`),
  FOREIGN KEY (`appointment_id`) REFERENCES appointments (`id_appointments`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  FOREIGN KEY (`service_id`) REFERENCES services (`id_services`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
 
CREATE TABLE bills (
  `id_bills` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `cost` INT NOT NULL,
  PRIMARY KEY (`id_bills`));


CREATE TABLE bill_records (
  `id_bill_records` INT NOT NULL AUTO_INCREMENT,
  `bill_id` INT NOT NULL,
  `day` INT NOT NULL,
  `how_much_times` INT NOT NULL,
  `appointment_id` INT NOT NULL,
  `start_day` VARCHAR(45) NOT NULL,
  `status` TINYINT NOT NULL,
  PRIMARY KEY (`id_bill_records`),
  FOREIGN KEY (`appointment_id`) REFERENCES appointments(`id_appointments`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (`bill_id`) REFERENCES bills (`id_bills`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


CREATE TABLE rooms (
  `id_rooms` INT NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL,
  PRIMARY KEY (`id_rooms`)
  );

CREATE TABLE patient_room (
  `id_patient_room` INT NOT NULL,
  `room_id` INT NOT NULL,
  `appointment_id` INT NOT NULL,
  PRIMARY KEY (`id_patient_room`),
  FOREIGN KEY (`appointment_id`) REFERENCES appointments (`id_appointments`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  FOREIGN KEY (`room_id`) REFERENCES rooms (`id_rooms`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

insert into departments(name) values("Cardiology");
insert into departments(name) values("Neurology");
insert into departments(name) values("Cardiology");
insert into departments(name) values("Oncology");
insert into departments(name) values("Pediatrics");

select * from employees;



insert into roles(role_name) values("nurse");
insert into roles(role_name) values("doctor");
insert into roles(role_name) values("assistant");
insert into roles(role_name) values("administrator");
insert into roles(role_name) values("manager");

insert into rooms(type) values("1");
insert into rooms(type) values("2");
insert into rooms(type) values("3");
insert into rooms(type) values("4");
insert into rooms(type) values("5");

insert into patients(full_name,IIN,datee,address,email) values("John Branny","20516601501",16/05/2002,"Abaya 462","qwerty@gmail.com");
insert into patients(full_name,IIN,datee,address,email) values("Janny Brad","10526645501",26/05/2001,"Manasa 4","asdfgh@gmail.com");
insert into patients(full_name,IIN,datee,address,email) values("Ayim Azangalieva","20517891501",25/10/2002,"Abaya 462","kijuom,@gmail.com");
insert into patients(full_name,IIN,datee,address,email) values("Ziyada Dos","10527895501",14/07/2000,"Manasa 4","efgethh@gmail.com");
insert into patients(full_name,IIN,datee,address,email) values("Enlik Askerbay","208516601501",31/08/2002,"Al-Farabi 123","fjhsgu@gmail.com");

insert into employees(full_name,department_id,date,email,number,password) VALUES ('Anna Bill', '4', '2015-05-26', 'asdfgh@gmail.com', '87471562111', 'qwerty123');
insert into employees(full_name,department_id,date,email,number,password) VALUES ('Zi Dos', '2', '2001-02-16', 'qwerty@gmail.com', '87471950021', 'qwertyuiop123');
insert into employees(full_name,department_id,date,email,number,password) VALUES ('Aizhan Baltabay', '4', '2015-05-30', 'qwqedw@gmail.com', '87471562111', 'qwerty123');
insert into employees(full_name,department_id,date,email,number,password) VALUES ('Nurai Seisenbay', '2', '2011-12-14', 'vcfbgf@gmail.com', '87471950021', 'qwertyuiop123');
insert into employees(full_name,department_id,date,email,number,password) VALUES ('Akerke Kenzhebay', '5', '2005-04-15', 'hjkuiku@gmail.com', '87471562111', 'qwerty123');


insert into bills(name,cost) values("paracetamol",100);
insert into bills(name,cost) values("citramon",150);
insert into bills(name,cost) values("asperin",50);
insert into bills(name,cost) values("cefazalin",1200);
insert into bills(name,cost) values("nazivin",700);


insert into services(name,cost) values("ukol",200);
insert into services(name,cost) values("sistema",500);
insert into services(name,cost) values("rentgen",1500);
insert into services(name,cost) values("mrt",10000);
insert into services(name,cost) values("analiz",400);


INSERT INTO has_roles (`id_has_roles`, `employee_id`, `work_time_from`, `work_time_to`, `role_id`) VALUES ('1', '3', '2022-02-15 08:00:00', '2022-02-15 20:00:00', '1');
INSERT INTO has_roles (`id_has_roles`, `employee_id`, `work_time_from`, `work_time_to`, `role_id`) VALUES ('2', '1', '2022-02-15 08:00:00', '2022-02-15 20:00:00', '5');
INSERT INTO has_roles (`id_has_roles`, `employee_id`, `work_time_from`, `work_time_to`, `role_id`) VALUES ('3', '5', '2022-02-15 08:00:00', '2022-02-15 20:00:00', '3');
INSERT INTO has_roles (`id_has_roles`, `employee_id`, `work_time_from`, `work_time_to`, `role_id`) VALUES ('4', '4', '2022-02-15 08:00:00', '2022-02-15 20:00:00', '2');
INSERT INTO has_roles (`id_has_roles`, `employee_id`, `work_time_from`, `work_time_to`, `role_id`) VALUES ('5', '2', '2022-02-15 08:00:00', '2022-02-15 20:00:00', '4');


 INSERT INTO appointments (`id_appointments`, `patient_id`, `employee_id`) VALUES ('1', '4', '5');
INSERT INTO appointments (`id_appointments`, `patient_id`, `employee_id`) VALUES ('2', '5', '3');
INSERT INTO appointments (`id_appointments`, `patient_id`, `employee_id`) VALUES ('3', '3', '1');
INSERT INTO appointments (`id_appointments`, `patient_id`, `employee_id`) VALUES ('4', '2', '5');
INSERT INTO appointments (`id_appointments`, `patient_id`, `employee_id`) VALUES ('5', '1', '4');

INSERT INTO bill_records (`id_bill_records`, `bill_id`, `day`, `how_much_times`, `appointment_id`, `start_day`, `status`) VALUES ('1', '2', '3', '3', '2', '16.02.2022', '1');
INSERT INTO bill_records (`id_bill_records`, `bill_id`, `day`, `how_much_times`, `appointment_id`, `start_day`, `status`) VALUES ('2', '5', '2', '4', '1', '15.02.2022', '1');
INSERT INTO bill_records (`id_bill_records`, `bill_id`, `day`, `how_much_times`, `appointment_id`, `start_day`, `status`) VALUES ('3', '2', '1', '5', '5', '12.02.2022', '0');
INSERT INTO bill_records (`id_bill_records`, `bill_id`, `day`, `how_much_times`, `appointment_id`, `start_day`, `status`) VALUES ('4', '3', '4', '1', '3', '10.02.2022', '1');
INSERT INTO bill_records (`id_bill_records`, `bill_id`, `day`, `how_much_times`, `appointment_id`, `start_day`, `status`) VALUES ('5', '4', '5', '2', '4', '14.02.2022', '1');


INSERT INTO patient_room (`id_patient_room`, `room_id`, `appointment_id`) VALUES ('1', '3', '4');
INSERT INTO patient_room (`id_patient_room`, `room_id`, `appointment_id`) VALUES ('2', '4', '3');
INSERT INTO patient_room (`id_patient_room`, `room_id`, `appointment_id`) VALUES ('3', '5', '1');
INSERT INTO patient_room (`id_patient_room`, `room_id`, `appointment_id`) VALUES ('4', '2', '5');
INSERT INTO patient_room (`id_patient_room`, `room_id`, `appointment_id`) VALUES ('5', '1', '2');


INSERT INTO procedures (id_procedures, appointment_id, start_date, days, how_much_times, service_id, status) VALUES ('1', '3', '12.03.2022', '3', '3', '2', '1');
INSERT INTO procedures (id_procedures, appointment_id, start_date, days, how_much_times, service_id, status) VALUES ('2', '4', '11.03.2022', '7', '3', '4', '1');
INSERT INTO procedures (id_procedures, appointment_id, start_date, days, how_much_times, service_id, status) VALUES ('3', '2', '16.03.2022', '7', '2', '2', '1');
INSERT INTO procedures (id_procedures, appointment_id, start_date, days, how_much_times, service_id, status) VALUES ('4', '1', '9.03.2022', '5', '1', '4', '1');
INSERT INTO procedures (id_procedures, appointment_id, start_date, days, how_much_times, service_id, status) VALUES ('5', '5', '10.03.2022', '15', '2', '3', '1');





 SET SQL_SAFE_UPDATES = 0;
 
delete  from services where name="analiz";
delete  from patients where IIN=020516601501;
delete  from bills where cost=700;
delete  from rooms where type="4";
delete  from departments where name="Cardiology";
DELETE FROM patients WHERE (`id_patients` = '4');
DELETE FROM patients WHERE (`id_patients` = '5');

UPDATE services SET name = "analiz" WHERE id_services = 1;
UPDATE patients SET IIN = 455454545454 WHERE id_patients = 2;
UPDATE bills SET name = "antigripin", cost=200 WHERE id_bills = 4;
UPDATE rooms SET type = 6 WHERE id_rooms	= 5;
UPDATE departments SET name = "Neurology" WHERE id_departments	= 3;

/*cross join
all rows from the table
*/
SELECT * FROM `patients` CROSS JOIN `rooms`;

/*inner join
all rows from the table
*/
SELECT patients.`full_name` , services.`name` , services.`cost`
FROM patients ,services
WHERE patients.`id_patients` = services.`id_services`;

/*left join
all rows from the Left table
*/
SELECT A.`full_name` , B.`name` , B.`cost`
FROM `patients` AS A
LEFT JOIN `services` AS B
ON B.`id_services` = A.`id_patients`;


/*right join
all rows from the Right table
*/

SELECT A.`full_name` , B.`name` , B.`cost`
FROM `patients` AS A
RIGHT JOIN `services` AS B
ON B.`id_services` = A.`id_patients`;

/*A self join is a regular join, but the table is joined with itself.*/

SELECT A.full_name AS full_name1, B.full_name AS full_name2, A.email
FROM patients A, patients B
WHERE A.email = B.email;

select * from patients;


CREATE VIEW records_employee_patientss AS SELECT patients.id_patients,employees.id_empleyees, employees.full_name,patients.IIN FROM patients,employees,appointments where appointments.employee_id = employees.id_empleyees and appointments.patient_id = patients.id_patients;
CREATE VIEW record_employee_roles AS SELECT roles.role_name,employees.full_name FROM has_roles,roles,employees where roles.id_roles = has_roles.role_id and has_roles.employee_id = employees.id_empleyees ;
CREATE VIEW record_patient_appointment AS SELECT patients.full_name,appointments.id_appointments FROM patients,appointments where appointments.patient_id = patients.id_patients  ;
CREATE VIEW record_patient_room AS SELECT patients.full_name,rooms.type FROM patients,rooms,patient_room,appointments where patients.id_patients = appointments.patient_id and patient_room.appointment_id = appointments.id_appointments and  patient_room.room_id=rooms.id_rooms ;
CREATE VIEW record_patient_services AS SELECT patients.full_name,services.name FROM patients,services,procedures,appointments where patients.id_patients = appointments.patient_id and procedures.appointment_id = appointments.id_appointments and  procedures.service_id=services.id_services ;

select * from records_employee_patientss;

SELECT AVG(cost) AS AveragePriceOfBills FROM bills;
SELECT AVG(cost) AS AveragePriceOfSeervices FROM services;
SELECT SUM(cost) AS SUMOFBILLS FROM bills;
SELECT COUNT(id_rooms) AS CountOfRooms FROM rooms;
SELECT MAX(cost) AS MaximumPrice FROM services;

SELECT employees.date, COUNT(employees.id_empleyees) as countOfEmployees FROM employees  GROUP BY employees.date;
SELECT bills.cost, COUNT(bills.id_bills) as countOfBills FROM bills  GROUP BY bills.cost;
SELECT services.cost, COUNT(services.id_services) as countOfServices FROM services  GROUP BY services.cost;
SELECT procedures.status, COUNT(procedures.id_procedures) as countOfProcedures FROM procedures  GROUP BY procedures.status;
SELECT employees.department_id , COUNT(employees.id_empleyees) as countOfEmployees FROM employees  GROUP BY employees.department_id;
select * from employees

