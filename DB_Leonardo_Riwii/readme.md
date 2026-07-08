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

-- consults

  1--
SELECT
        t.nombre AS tecnico,
        COUNT(o.id) AS total_ordenes
    FROM technicians t
    INNER JOIN orders o
    ON t.id = o.id_technician
    GROUP BY t.nombre;

    2--
SELECT
        c.nombre AS ciudad,
        COUNT(m.id) AS total_servicios
    FROM city c
    INNER JOIN clients cl
    ON c.id = cl.id_city
    INNER JOIN movements m
    ON cl.id = m.id_client
    GROUP BY c.nombre;

    3--
SELECT
        st.nombre AS tipo_servicio,
        COUNT(o.id) AS total_servicios
    FROM service_types st
    INNER JOIN orders o
    ON st.id = o.id_service_type
    GROUP BY st.nombre;

    4--
SELECT
        e.nombre AS equipo,
        COUNT(m.id) AS mantenimientos
    FROM equipments e
    INNER JOIN movements m
    ON e.id = m.id_equipment
    GROUP BY e.nombre;

    5--
SELECT
        c.nombre AS cliente,
        COUNT(m.id) AS total_ordenes
    FROM clients c
    INNER JOIN movements m
    ON c.id = m.id_client
    GROUP BY c.nombre;

    6--
SELECT
        b.name AS sede,
        COUNT(m.id) AS total_ordenes
    FROM branch b
    INNER JOIN clients c
    ON b.id_client = c.id
    INNER JOIN movements m
    ON c.id = m.id_client
    GROUP BY b.name;


## Extra points
	## Extra points
    I did a view of the filtering of technicial requirements

      
