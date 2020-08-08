create database ServicioCliente;


create table ServicioCliente.CentroAtencionCliente(
	idCentroAtencionCliente int not null auto_increment,
    descripcion varchar(100) not null,
    primary key (idCentroAtencionCliente)

) engine = InnoDB;
create Table ServicioCliente.EncargadoAtencionCliente
(
	idEncargadoAtencionCliente int not null auto_increment,
    nombreEncargado varchar(100) not null,
    idCentroAtencionCliente int not null,
    primary key (idEncargadoAtencionCliente),
    constraint fk_EncargadoAtencionCliente_CentroAtencionCliente foreign key (idCentroAtencionCliente)
    references ServicioCliente.CentroAtencionCliente (idCentroAtencionCliente)
) engine = InnoDB;

create Table ServicioCliente.Ticket
(
	idTicket int not null auto_increment,
    issue varchar(100) not null,
    subjectTicket varchar (30) not null,
    statusTicket varchar (10) not null,
    idEncargadoAtencionCliente int not null,
    idCliente int not null,
    primary key (idTicket),
    constraint fk_Ticket_EncargadoAtencionCliente foreign key (idEncargadoAtencionCliente)
    references ServicioCliente.EncargadoAtencionCliente (idEncargadoAtencionCliente)
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
