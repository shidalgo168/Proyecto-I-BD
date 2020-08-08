create database ServicioCliente;



create Table ServicioCliente.Ticket
(
	idTicket int not null auto_increment,
    issue varchar(100) not null,
    subjectTicket varchar (30) not null,
    statusTicket varchar (10) not null,
    idCliente int not null,
    primary key (idTicket)

)engine = InnoDB; 

create table ServicioCliente.Cupon
(
	idCupon int not null auto_increment,
    porcentaje float not null,
    idCliente int not null,
    fechaExpiracion date not null,
    estado varchar (10) not null,
    primary key (idCupon)
) engine = InnoDB;