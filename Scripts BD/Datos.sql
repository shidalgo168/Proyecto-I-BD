insert into TipoTelefono (idTipoTelefono, nombre) values (1, 'Casa');
insert into TipoTelefono (idTipoTelefono, nombre) values (2, 'Celular');
insert into TipoTelefono (idTipoTelefono, nombre) values (3, 'Empresarial');

insert into TipoEmpleado (idTipoEmpleado, nombre, salario) values (1, 'Gerente', 968488.97);
insert into TipoEmpleado (idTipoEmpleado, nombre, salario) values (2, 'Cajero', 1108031.98);
insert into TipoEmpleado (idTipoEmpleado, nombre, salario) values (3, 'Mensajero', 1209506.0);
insert into TipoEmpleado (idTipoEmpleado, nombre, salario) values (4, 'Vendedor', 551698.72);
insert into TipoEmpleado (idTipoEmpleado, nombre, salario) values (5, 'Servicio al cliente', 1491142.0);
insert into TipoEmpleado (idTipoEmpleado, nombre, salario) values (6, 'Ebanistas', 714183.03);
insert into TipoEmpleado (idTipoEmpleado, nombre, salario) values (7, 'Tapiceros', 528922.87);

insert into TipoEntrega (idTipoEntrega, nombre) values (1, 'Envío');
insert into TipoEntrega (idTipoEntrega, nombre) values (2, 'Retiro presencial');

insert into Telefono (idTelefono, fk_idTipoTelefono) values (485824352,1);
insert into Telefono (idTelefono, fk_idTipoTelefono) values (369423987,1);
insert into Telefono (idTelefono, fk_idTipoTelefono) values (447768420,1);
insert into Telefono (idTelefono, fk_idTipoTelefono) values (809300168,1);
insert into Telefono (idTelefono, fk_idTipoTelefono) values (904076298,1);
insert into Telefono (idTelefono, fk_idTipoTelefono) values (339515399,1);
insert into Telefono (idTelefono, fk_idTipoTelefono) values (629618515,1);
insert into Telefono (idTelefono, fk_idTipoTelefono) values (796203843,1);
insert into Telefono (idTelefono, fk_idTipoTelefono) values (235136288,1);
insert into Telefono (idTelefono, fk_idTipoTelefono) values (294830058,2);
insert into Telefono (idTelefono, fk_idTipoTelefono) values (951345623,2);
insert into Telefono (idTelefono, fk_idTipoTelefono) values (785814873,2);
insert into Telefono (idTelefono, fk_idTipoTelefono) values (745005395,2);
insert into Telefono (idTelefono, fk_idTipoTelefono) values (265121989,2);
insert into Telefono (idTelefono, fk_idTipoTelefono) values (369624332,2);
insert into Telefono (idTelefono, fk_idTipoTelefono) values (155074267,2);
insert into Telefono (idTelefono, fk_idTipoTelefono) values (626833770,2);
insert into Telefono (idTelefono, fk_idTipoTelefono) values (734634760,2);
insert into Telefono (idTelefono, fk_idTipoTelefono) values (563828585,2);
insert into Telefono (idTelefono, fk_idTipoTelefono) values (525604771,2);
insert into Telefono (idTelefono, fk_idTipoTelefono) values (503332577,2);
insert into Telefono (idTelefono, fk_idTipoTelefono) values (846715513,2);
insert into Telefono (idTelefono, fk_idTipoTelefono) values (484295350,2);
insert into Telefono (idTelefono, fk_idTipoTelefono) values (544077212,3);
insert into Telefono (idTelefono, fk_idTipoTelefono) values (268732184,3);
insert into Telefono (idTelefono, fk_idTipoTelefono) values (865925902,3);

insert into Sucursal (idSucursal, nombre, fk_idTelefono, direccion) values (1, 'Sucursal1', 544077212, geography::Point(9.983477, -84.117842, 4326));
insert into Sucursal (idSucursal, nombre, fk_idTelefono, direccion) values (2, 'Sucursal2', 268732184, geography::Point(9.862614, -83.915421, 4326));
insert into Sucursal (idSucursal, nombre, fk_idTelefono, direccion) values (3, 'Sucursal3', 865925902, geography::Point(10.628699, -85.439859, 4326));

insert into Empleado (idEmpleado, fk_idSucursal, fk_idTelefono, fk_idTipoEmpleado, nombre, apellido1, apellido2, cedula, correo, fechaContratacion, foto, contrasenha) values (1, 1, 484295350, 1, 'Hamil', 'Mattusevich', 'Skep', 100860410, 'hskep0@wikimedia.org', '10/1/2018', null, 'S6HJVG22k2');
insert into Empleado (idEmpleado, fk_idSucursal, fk_idTelefono, fk_idTipoEmpleado, nombre, apellido1, apellido2, cedula, correo, fechaContratacion, foto, contrasenha) values (2, 2, 846715513, 1, 'Ruth', 'Goymer', 'Arnaez', 407830374, 'rarnaez1@samsung.com', '12/26/2018', null, 'pEB5Q0oTtxmX');
insert into Empleado (idEmpleado, fk_idSucursal, fk_idTelefono, fk_idTipoEmpleado, nombre, apellido1, apellido2, cedula, correo, fechaContratacion, foto, contrasenha) values (3, 3, 235136288, 1, 'Maurits', 'Jovic', 'Redmire', 503930748, 'mredmire2@nasa.gov', '4/10/2018', null, 'xkka9MZiuuL');
insert into Empleado (idEmpleado, fk_idSucursal, fk_idTelefono, fk_idTipoEmpleado, nombre, apellido1, apellido2, cedula, correo, fechaContratacion, foto, contrasenha) values (4, 1, 629618515, 7, 'Umberto', 'Clemenceau', 'Deakes', 308290387, 'udeakes3@about.me', '2/13/2020', null, 'yzr4cE');
insert into Empleado (idEmpleado, fk_idSucursal, fk_idTelefono, fk_idTipoEmpleado, nombre, apellido1, apellido2, cedula, correo, fechaContratacion, foto, contrasenha) values (5, 1, 745005395, 4, 'Cherrita', 'Henfre', 'Bollands', 601380759, 'cbollands4@ihg.com', '3/20/2020', null, '4Mc1fzc2XmGM');
insert into Empleado (idEmpleado, fk_idSucursal, fk_idTelefono, fk_idTipoEmpleado, nombre, apellido1, apellido2, cedula, correo, fechaContratacion, foto, contrasenha) values (6, 1, 339515399, 3, 'Armando', 'Piddick', 'Boskell', 603630156, 'aboskell5@cbslocal.com', '5/16/2020', null, 'Jlpg4XDm');
insert into Empleado (idEmpleado, fk_idSucursal, fk_idTelefono, fk_idTipoEmpleado, nombre, apellido1, apellido2, cedula, correo, fechaContratacion, foto, contrasenha) values (7, 3, 785814873, 4, 'Ermina', 'Tolcher', 'Rosbrough', 604610517, 'erosbrough6@reference.com', '2/27/2020', null, '3fn61t91');
insert into Empleado (idEmpleado, fk_idSucursal, fk_idTelefono, fk_idTipoEmpleado, nombre, apellido1, apellido2, cedula, correo, fechaContratacion, foto, contrasenha) values (8, 2, 265121989, 4, 'Emmalyn', 'Skyram', 'Harrill', 208150922, 'eharrill7@mapquest.com', '3/8/2019', null, 'WuWJv3DzIu');
insert into Empleado (idEmpleado, fk_idSucursal, fk_idTelefono, fk_idTipoEmpleado, nombre, apellido1, apellido2, cedula, correo, fechaContratacion, foto, contrasenha) values (9, 2, 904076298, 5, 'Jaime', 'Fleisch', 'Wragg', 203940961, 'jwragg8@uol.com.br', '9/21/2019', null, 'vvPG279g');
insert into Empleado (idEmpleado, fk_idSucursal, fk_idTelefono, fk_idTipoEmpleado, nombre, apellido1, apellido2, cedula, correo, fechaContratacion, foto, contrasenha) values (10, 3, 809300168, 2, 'Zed', 'Trevithick', 'Janda', 308750830, 'zjanda9@bbc.co.uk', '1/31/2020', null, 'l5XDyE');
insert into Empleado (idEmpleado, fk_idSucursal, fk_idTelefono, fk_idTipoEmpleado, nombre, apellido1, apellido2, cedula, correo, fechaContratacion, foto, contrasenha) values (11, 2, 503332577, 4, 'Bertrand', 'Rheam', 'Sommerton', 300050400, 'bsommerton0@soundcloud.com', '6/22/2019', null, 'W5SULW');
insert into Empleado (idEmpleado, fk_idSucursal, fk_idTelefono, fk_idTipoEmpleado, nombre, apellido1, apellido2, cedula, correo, fechaContratacion, foto, contrasenha) values (12, 2, 525604771, 6, 'Cyrus', 'Tritten', 'Flattman', 505170237, 'cflattman1@pen.io', '3/15/2019', null, 'PduAASpLzG');
insert into Empleado (idEmpleado, fk_idSucursal, fk_idTelefono, fk_idTipoEmpleado, nombre, apellido1, apellido2, cedula, correo, fechaContratacion, foto, contrasenha) values (13, 2, 796203843, 5, 'Petrina', 'Teek', 'Hirsthouse', 401440938, 'phirsthouse2@exblog.jp', '12/20/2019', null, 'Gi8tfLg6Q');

insert into Cliente (idCliente, fk_idTelefono, nombre, apellido1, apellido2, correo, fechaCumpleanhos, direccion, foto, contrasenha) values (305270587, 563828585, 'Tasia', 'Doelle', 'Lembke', 'tlembke0@shinystat.com', '11/22/1975', geography::Point(9.972552, -85.386937, 4326), null, 'OvV7ElA');
insert into Cliente (idCliente, fk_idTelefono, nombre, apellido1, apellido2, correo, fechaCumpleanhos, direccion, foto, contrasenha) values (303790475, 951345623, 'Damiano', 'Swainston', 'Comport', 'dcomport1@hhs.gov', '9/6/1996', geography::Point(10.353696, -84.174298, 4326), null, 'gwiZixh');
insert into Cliente (idCliente, fk_idTelefono, nombre, apellido1, apellido2, correo, fechaCumpleanhos, direccion, foto, contrasenha) values (401120976, 734634760, 'Didi', 'Maplestone', 'Di Dello', 'ddidello2@dailymail.co.uk', '5/8/1980', geography::Point(9.761865, -83.365751, 4326), null, 'Iv1EVvbujTLE');
insert into Cliente (idCliente, fk_idTelefono, nombre, apellido1, apellido2, correo, fechaCumpleanhos, direccion, foto, contrasenha) values (204370054, 447768420, 'Zorina', 'McGuckin', 'Menichini', 'zmenichini3@woothemes.com', '3/16/1952', geography::Point(9.857626, -83.899031, 4326), null, 'y74wIZ8o1xty');
insert into Cliente (idCliente, fk_idTelefono, nombre, apellido1, apellido2, correo, fechaCumpleanhos, direccion, foto, contrasenha) values (504930280, 626833770, 'Celka', 'O''Doran', 'Remmers', 'cremmers4@ft.com', '11/16/1972', geography::Point(9.703438, -83.727706, 4326), null, 'r8Y2lS04JK4c');
insert into Cliente (idCliente, fk_idTelefono, nombre, apellido1, apellido2, correo, fechaCumpleanhos, direccion, foto, contrasenha) values (407280521, 369423987, 'Lovell', 'Videneev', 'Hullock', 'lhullock5@ft.com', '3/18/1954', geography::Point(9.216203, -83.94878, 4326), null, 'OOf49KXa');
insert into Cliente (idCliente, fk_idTelefono, nombre, apellido1, apellido2, correo, fechaCumpleanhos, direccion, foto, contrasenha) values (301380677, 155074267, 'Peggi', 'Swiffin', 'Folger', 'pfolger6@desdev.cn', '6/7/1976', geography::Point(9.593275, -84.669417, 4326), null, 'ZnrvNyGpy1');
insert into Cliente (idCliente, fk_idTelefono, nombre, apellido1, apellido2, correo, fechaCumpleanhos, direccion, foto, contrasenha) values (208110325, 485824352, 'Geno', 'Pigdon', 'Marflitt', 'gmarflitt7@archive.org', '10/3/1978', geography::Point(10.300787, -83.378414, 4326), null, 'PYcMlEyc');
insert into Cliente (idCliente, fk_idTelefono, nombre, apellido1, apellido2, correo, fechaCumpleanhos, direccion, foto, contrasenha) values (309700922, 369624332, 'Jori', 'Trowl', 'Shellibeer', 'jshellibeer8@feedburner.com', '12/24/1967', geography::Point(9.199041, -83.093115, 4326), null, 'z5Vsqa');
insert into Cliente (idCliente, fk_idTelefono, nombre, apellido1, apellido2, correo, fechaCumpleanhos, direccion, foto, contrasenha) values (101490478, 294830058, 'Aron', 'Yeowell', 'Dounbare', 'adounbare9@dedecms.com', '12/3/1984', geography::Point(9.157725, -83.674443, 4326), null, 'eldd45pKYQcH');

insert into Producto (idProducto, nombre, descripcion, foto, precio) values (1, 'Jolt Cola', 'Hiccough', null, 325000);
insert into Producto (idProducto, nombre, descripcion, foto, precio) values (2, 'Capicola - Hot', 'Other open skull fracture with subarachnoid, subdural, and extradural hemorrhage, with prolonged [more than 24 hours] loss of consciousness', null, 450000);
insert into Producto (idProducto, nombre, descripcion, foto, precio) values (3, 'Yogurt - Banana, 175 Gr', 'Injury to pancreas, tail, with open wound into cavity', null, 500000);
insert into Producto (idProducto, nombre, descripcion, foto, precio) values (4, 'Miso - Soy Bean Paste', 'Developmental dislocation of joint, ankle and foot', null, 575000);
insert into Producto (idProducto, nombre, descripcion, foto, precio) values (5, 'Lettuce - Treviso', 'Congenital single renal cyst', null, 150000);
insert into Producto (idProducto, nombre, descripcion, foto, precio) values (6, 'Table Cloth 90x90 Colour', 'Injury due to marine mines', null, 550000);
insert into Producto (idProducto, nombre, descripcion, foto, precio) values (7, 'Beans - Fine', 'Ectopic pregnancy affecting fetus or newborn', null, 50000);
insert into Producto (idProducto, nombre, descripcion, foto, precio) values (8, 'Bagel - Everything Presliced', 'Exposure to lasers', null, 625000);
insert into Producto (idProducto, nombre, descripcion, foto, precio) values (9, 'Sea Urchin', 'Organic sleep apnea, unspecified', null, 475000);
insert into Producto (idProducto, nombre, descripcion, foto, precio) values (10, 'Wine - Cava Aria Estate Brut', 'Perforation of intestine', null, 550000);
insert into Producto (idProducto, nombre, descripcion, foto, precio) values (11, 'Steampan - Foil', 'Malignant neoplasm of middle lobe, bronchus or lung', null, 350000);
insert into Producto (idProducto, nombre, descripcion, foto, precio) values (12, 'Flour Pastry Super Fine', 'Achlorhydria', null, 200000);

insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (1, 1, 1, 33);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (2, 1, 2, 98);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (3, 1, 3, 73);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (4, 1, 4, 96);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (5, 1, 5, 62);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (6, 1, 6, 94);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (7, 1, 7, 58);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (8, 1, 8, 39);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (9, 1, 9, 38);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (10, 1, 10, 69);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (11, 1, 11, 97);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (12, 1, 12, 83);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (13, 2, 1, 35);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (14, 2, 2, 46);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (15, 2, 3, 30);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (16, 2, 4, 44);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (17, 2, 5, 70);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (18, 2, 6, 40);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (19, 2, 7, 55);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (20, 2, 8, 53);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (21, 2, 9, 36);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (22, 2, 10, 53);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (23, 2, 11, 61);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (24, 2, 12, 60);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (25, 3, 1, 45);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (26, 3, 2, 63);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (27, 3, 3, 71);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (28, 3, 4, 52);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (29, 3, 5, 30);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (30, 3, 6, 48);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (31, 3, 7, 87);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (32, 3, 8, 95);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (33, 3, 9, 58);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (34, 3, 10, 67);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (35, 3, 11, 79);
insert into Producto_X_Sucursal (idProductoXSucursal, fk_idSucursal, fk_idProducto, cantidadDisponible) values (36, 3, 12, 99);

insert into Factura (idFactura, fk_idCliente, fk_idSucursal, fk_idTipoEntrega, fechaVenta) values (1, 401120976, 3, 2, '11/14/2019');
insert into Factura (idFactura, fk_idCliente, fk_idSucursal, fk_idTipoEntrega, fechaVenta) values (2, 504930280, 1, 2, '5/25/2020');
insert into Factura (idFactura, fk_idCliente, fk_idSucursal, fk_idTipoEntrega, fechaVenta) values (3, 407280521, 2, 1, '6/30/2020');

insert into LineaFactura (idLineaFactura, fk_idFactura, fk_idProducto, cantidad, subtotal) values (1, 1, 10, 3, 1650000);
insert into LineaFactura (idLineaFactura, fk_idFactura, fk_idProducto, cantidad, subtotal) values (2, 1, 1, 5, 1625000);
insert into LineaFactura (idLineaFactura, fk_idFactura, fk_idProducto, cantidad, subtotal) values (3, 1, 6, 2, 1100000);
insert into LineaFactura (idLineaFactura, fk_idFactura, fk_idProducto, cantidad, subtotal) values (4, 1, 7, 1, 50000);
insert into LineaFactura (idLineaFactura, fk_idFactura, fk_idProducto, cantidad, subtotal) values (7, 2, 7, 2, 100000);
insert into LineaFactura (idLineaFactura, fk_idFactura, fk_idProducto, cantidad, subtotal) values (8, 2, 5, 1, 150000);
insert into LineaFactura (idLineaFactura, fk_idFactura, fk_idProducto, cantidad, subtotal) values (9, 2, 1, 4, 1300000);
insert into LineaFactura (idLineaFactura, fk_idFactura, fk_idProducto, cantidad, subtotal) values (10, 3, 11, 3, 1050000);
insert into LineaFactura (idLineaFactura, fk_idFactura, fk_idProducto, cantidad, subtotal) values (11, 3, 6, 2, 1100000);
insert into LineaFactura (idLineaFactura, fk_idFactura, fk_idProducto, cantidad, subtotal) values (12, 3, 3, 4, 2000000);

insert into ComisionEmpleado (idComision, fk_idEmpleado, fk_idFactura) values (1, 5, 1);
insert into ComisionEmpleado (idComision, fk_idEmpleado, fk_idFactura) values (2, 8, 2);
insert into ComisionEmpleado (idComision, fk_idEmpleado, fk_idFactura) values (3, 11, 3);

