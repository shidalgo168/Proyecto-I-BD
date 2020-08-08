insert into ServicioCliente.CentroAtencionCliente (descripcion)
values ('Costa Rica'),
('Salvador'),
('Estados Unidos');

insert into ServicioCliente.EncargadoAtencionCliente (nombreEncargado, idCentroAtencionCliente)
values ('Felipe Alfaro',2),
('Ana Castro',1),
('Andres Rojas',2),
('Felix Chavez',3),
('Evelyn Soanes',1);

insert into ServicioCliente.Ticket (issue,statusTicket, subjectTicket, idEncargadoAtencionCliente,idCliente)
values ('Articulo debio llegar hace 3 semanas', 'en proceso','Articulo no ha llegado', 1,3),
('Articulo llego con margas y quebrado', 'resuelto','Articulo llego dañado', 2,4),
('Articulo debio llegar hace 3 meses', 'en proceso','Articulo no ha llegado', 4,5);

insert into ServicioCliente.Cupon (porcentaje, idCliente, fechaExpiracion, estado)
values (0.3, 1, '2020-12-12',1),
(0.15, 5, '2020-10-12',0),
(0.4, 6, '2020-11-09',1),
(0.3, 2, '2020-06-06',0),
(0.3, 3, '2020-12-12',1),
(0.3, 4, '2020-12-12',1),
(0.3, 7, '2020-12-12',1)