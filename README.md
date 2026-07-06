#  TechCare Solutions Riwi S.A.S Data Base.

##  Descripction

this is a relational data base solution for the company TechCare Soltions, where we took a desnormalized excel sheet data and then we just normalized it, after this created a der and mer diagrams for better understanding and finally we created the sql data base. 

##  Used technologies

- MySQL
- SQL
- MySQL Workbench
- Git
- GitHub
- Draw.io




##  Project structure

```
📁 project/
│── 📄 README.md
│── 📄 script.sql
│── 📄 MR_Diagram.png and DER_Diagram.png
│── 📄 diagrama_er.png
---
```
##  How to execute the project

### 1. Enter to the folder

```bash
cd <DB_Leonardo_Riwi>
```
### 2. Open MySQL Workbench

Create a new data base

```sql
CREATE DATABASE Example:
BD_Leonardo_Riwii;
USE BD_Leonardo_Riwii;
```

### 3. Execute the SQL file

open`script.sql` and execute it.


##  Relational model


DB_Leonardo_Riwi/MR_Diagram.draw.io.png



##  Entity-Relationship Diagram

DB_Leonardo_Riwi/DER_DIagram.draw.io.png



##  Normalization Process

    we did a very exahustive normalization process in the excel sheet because the company's growth has led to various problems with information management:
    • Customers registered multiple times.
    • Technicians with duplicate names.
    • Equipment registered with different descriptions.
    • Duplicate services.
    • Locations with inconsistent information.
    • Cities spelled in different ways.
    • Incomplete records.
    • Difficulty determining each technician’s workload.
    • Unreliable reports for management.
    The solution was to implement the 1fn, 2fn and 3fn in these data, we erased the duplicated and non atomic values, also delete all the parcial and transitive dependencies so that we were able to make a clean data sheets for the diagramas ans SQL data base.

##  Important used consults  



```sql
create database bd_leonardo_jimenez_cumbia; -- -> this is the principal step to create the data base
use bd_leonardo_jimenez_cumbia; -- -> and the use it

-- tables creation step(i created the the strongest ones first, then the weak ones so that the relation between tables was succesfull)
create table clients(
	id int auto_increment primary key, -- --> the id must be auto_increment and primary key so that we can create relations
    nombre varchar(100)
);

create table city(
	id int auto_increment primary key,
    nombre varchar(100)
);

alter table clients
add column id_city int;
alter table clients
add foreign key(id_city)references city(id); -- -> this is the foreign key conexion between weak and strong tables

create table branch(
	id int auto_increment primary key,
    name varchar(100),
    id_city int,
    foreign key(id_city) references city(id),
    id_client int, 
    foreign key(id_client) references clients(id)
);

select * from clients; --> we selected all the data from the clients table

create table service_types(
	id int auto_increment primary key,
    nombre varchar(100)
);

create table equipment_categories(
	id int auto_increment primary key,
    nombre varchar(100)
);

create table technicians(
	id int auto_increment primary key,
    nombre varchar(100)
);

create table equipments(
	id int auto_increment primary key,
    nombre varchar(100)
);

create table orders( --> this is a weak table beacuse depends on others to had a succesfully relation between tables
	id int auto_increment primary key,
    id_equipment int,
    foreign key(id_equipment) references equipments(id),
    id_equipment_category int,
    foreign key(id_equipment_category) references equipment_categories(id),
    id_technician int,
    foreign key(id_technician) references technicians(id),
    id_service_type int,
    foreign key(id_service_type) references service_types(id)
);

select * from service_types;

create table movements(
	id int auto_increment primary key,
    workorder varchar(255),
    service_date date,
    hours decimal, --> we used decimal beacuse its probably that the final client must use the hours for math operations and its about money too.
    cost decimal,
    id_order int,
    foreign key(id_order) references orders(id),
    id_equipment int,
    foreign key(id_equipment) references equipments(id)
);

## Extra points
	## Extra points
    I did a view of the filtering of technicial requirements
	-- extra point view by Technical Performance.
	CREATE OR REPLACE VIEW vw_rendimiento_tecnicos AS -- we use AS when we want to create an alias to a table or some data
	SELECT -- call the different data 
	    t.id AS tecnico_id, -- and we give an alias to it so t.id is the new alias of tecnico_id
	    t.nombre AS nombre_tecnico,
	    COUNT(DISTINCT m.workorder) AS total_ordenes_atendidas,
	    SUM(m.hours) AS total_horas_trabajadas,
	    SUM(m.cost) AS costo_total_generado,
	    ROUND(AVG(m.hours), 2) AS promedio_horas_por_orden -- we use round to round a decimal number and in this case with two digits
	FROM technicians t
	INNER JOIN orders o ON t.id = o.id_technician -- we use inner join to extract data from two different tables, its very usefull for information viewing
	INNER JOIN movements m ON o.id = m.id_order
	GROUP BY t.id, t.nombre; -- we make a gtoup by nombre_tecnico and id_tecnico.
	
	SELECT * FROM vw_rendimiento_tecnicos; -- and finally to use this view we need to make a consult of the view, so the na,me is vw_rendimiento_tecnicos

    

```
## Author

**Nombre:** Leonardo David Jimenez Dager

GitHub: https://github.com/leonardoFRNG

**Clan:** Cumbia
