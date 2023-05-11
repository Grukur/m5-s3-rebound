create table empresas(
	run  varchar(10) not null primary key,
	nombre varchar(120) not null,
	direccion varchar(120) not null,
	telefono varchar(15) not null,
	correo varchar(80) not null, 
	web varchar(50)	
);

create table clientes(
	run  varchar(10) not null primary key,
	nombre varchar(120) not null,
	correo varchar(80) not null, 
	direccion varchar(120) not null,
	telefono varchar(15) not null,
	alta char(1) not null
);

create table vehiculos(
	id numeric(12,2) primary key,
	patente varchar(10) not null,
	marca varchar(20) not null,
	modelo varchar(20) not null,
	color varchar(15) not null,
	precio numeric(12,2) not null,
	frecuencia_matencion numeric(5,2) not null,
	id_marca numeric(12,2) not null references marcas(id),
	id_tipoVehiculo numeric(12,2) not null references tipo_vehiculos(id)
);

create table ventas(
	folio numeric(12,2) primary key,
	fecha date default now(),
	monto numeric(12,2) not null,
	id_vehiculo numeric(12,2) not null references vehiculos(id),
	id_cliente varchar(10) not null references clientes(run)
);

create table mantenciones(
	id numeric(12,2) primary key,
	fecha date default now(),
	trabajaos_realizados varchar(1000),
	id_venta numeric(12,2) not null references ventas(folio)
);

create table tipo_vehiculos(
	id numeric(12,2) primary key,
	nombre varchar(120) not null
);

create table marcas(
	id numeric(12,2) primary key,
	nombre varchar(120) not null
);