insert into pais ( COD_PAIS, DESCRIPCION ) 
values ('PE', 'Perú');
insert into pais ( COD_PAIS, DESCRIPCION ) 
values ('AR', 'Argentina');
insert into pais ( COD_PAIS, DESCRIPCION ) 
values ('CO', 'Colombia');

insert into persona (
  DNI, NOMBRES, APELLIDO1, APELLIDO2, NACIONALIDAD, DIRECCION, SEXO, FECHA_NAC, EMAIL
) 
values ('10000001', 'Ivan', 'Garcia', 'Lopez', 'PE', 'Calle 1', 'M', '5/01/74', 'igarcio@correo.com');

insert into persona (
  DNI, NOMBRES, APELLIDO1, APELLIDO2, NACIONALIDAD, DIRECCION, SEXO, FECHA_NAC, EMAIL) 
values ('10000002', 'Carla', 'Villegas', 'Ruiz', 'CO', 'Calle 2', 'F', '5/09/84', 'cvillegas@correo.com');

insert into persona (
  DNI, NOMBRES, APELLIDO1, APELLIDO2, NACIONALIDAD, DIRECCION, SEXO, FECHA_NAC, EMAIL) 
values ('10000003', 'Luis', 'Galvez', 'Montoya', 'AR', 'Calle A Urb Ate Tacna', 'M', '6/10/81', 'lmontoya@correo.com');

insert into persona (
  DNI, NOMBRES, APELLIDO1, APELLIDO2, NACIONALIDAD, DIRECCION, SEXO, FECHA_NAC, EMAIL) 
values ('10000004', 'Ines', 'Valverde', 'Alegria', 'PE', 'Calle B Urb Basadre Tacna',  'F', '15/11/82', 'ivalverde@correo.com');

insert into persona (
  DNI, NOMBRES, APELLIDO1, APELLIDO2, NACIONALIDAD, DIRECCION, SEXO, FECHA_NAC, EMAIL) 
values ('10000005', 'Jorge', 'Palomino', 'Guisado', 'PE', 'Calle X Urb Los Alisos Huancavelica', 'M', '4/01/80', 'jpalomino@correo.com');

insert into persona (
  DNI, NOMBRES, APELLIDO1, APELLIDO2, NACIONALIDAD, DIRECCION, SEXO, FECHA_NAC, EMAIL) 
values ('10000006', 'Marlene', 'Vivanco', 'Partor', 'PE', 'Calle Z Urb Cipreses Huancavelica', 'F', '4/01/80', 'mvivanco@correo.com');

insert into persona (
  DNI, NOMBRES, APELLIDO1, APELLIDO2, NACIONALIDAD, DIRECCION, SEXO, FECHA_NAC, EMAIL) 
values ('10000007', 'Carlos', 'Herrera', 'Tello', 'CO', 'Calle M Urb Girasoles Andahuaylas', 'M', '4/02/91', 'cherrera@correo.com');

insert into persona (
  DNI, NOMBRES, APELLIDO1, APELLIDO2, NACIONALIDAD, DIRECCION, SEXO, FECHA_NAC, EMAIL) 
values ('10000008', 'Lucia', 'Jimenez', 'Pinto', 'PE', 'Calle H Urb Asmat Andahuaylas', 'M', '4/02/91', 'ljimenez@correo.com');

insert into persona (
  DNI, NOMBRES, APELLIDO1, APELLIDO2, NACIONALIDAD, DIRECCION, SEXO, FECHA_NAC, EMAIL) 
values ('10000009', 'Andres', 'Suarez', 'Icochea', 'PE', 'Calle L Urb Asmat Huanuco', 'M', '4/02/99', 'asuarez@correo.com');

insert into persona (
  DNI, NOMBRES, APELLIDO1, APELLIDO2, NACIONALIDAD, DIRECCION, SEXO, FECHA_NAC, EMAIL) 
values ('10000010', 'Paolo', 'Santibanez', 'Ruiz', 'PE', 'Calle J Urb Sigma Huanuco', 'M', '14/03/98', 'psantibanez@correo.com');

insert into persona (
  DNI, NOMBRES, APELLIDO1, APELLIDO2, NACIONALIDAD, DIRECCION, SEXO, FECHA_NAC, EMAIL) 
values ('10000011', 'Carola', 'Sosa', 'Vargas', 'PE', 'Calle O Urb Estrella Piura', 'F', '11/03/97', 'csosa@correo.com');

insert into persona (
  DNI, NOMBRES, APELLIDO1, APELLIDO2, NACIONALIDAD, DIRECCION, SEXO, FECHA_NAC, EMAIL) 
values ('10000012', 'Juana', 'Ygreda', 'Soto', 'PE', 'Calle 1 Urb Estrella Tumbes', 'F', '14/07/99', 'jygreda@correo.com');

insert into departamentos (COD_DPTO, NOMBRE_DPTO, RESPONSABLE, NRO_PABELLONES, NRO_CAFETERIAS)
values ('D0001', 'EEGGCC', '10000008', 5, 1);

insert into departamentos (COD_DPTO, NOMBRE_DPTO, RESPONSABLE, NRO_PABELLONES, NRO_CAFETERIAS)
values ('D0002', 'EEGGLL', '10000005', 3, 1);

insert into departamentos (COD_DPTO, NOMBRE_DPTO, RESPONSABLE, NRO_PABELLONES, NRO_CAFETERIAS)
values ('D0003', 'CIENCIAS E INGENIERÍA', '10000006', 4, 0);

insert into BIBLIOTECA (COD_BIBLIO, NOMBRE_BIBLIO, UBICACION, CANT_SALAS, CANT_ESTANTES) 
values ('B0001', 'Biblioteca Central', 'Ingreso pta principal', 10, 20);

insert into BIBLIOTECA (COD_BIBLIO, NOMBRE_BIBLIO, UBICACION, CANT_SALAS, CANT_ESTANTES) 
values ('B0002', 'Biblioteca Minas', 'Pabellon M', 1, 5);

insert into BIBLIOTECA (COD_BIBLIO, NOMBRE_BIBLIO, UBICACION, CANT_SALAS, CANT_ESTANTES) 
values ('B0003', 'Biblioteca Sociales', 'Pabellon S', 4, 8);

insert into BIBLIOTECA (COD_BIBLIO, NOMBRE_BIBLIO, UBICACION, CANT_SALAS, CANT_ESTANTES) 
values ('B0004', 'Biblioteca Teología', ' ', 1, 2);

insert into BIBLIOTECA (COD_BIBLIO, NOMBRE_BIBLIO, UBICACION, CANT_SALAS, CANT_ESTANTES) 
values ('B0005', 'Biblioteca de Innovación', '', 15, 50);

insert into BIBLIOTECA (COD_BIBLIO, NOMBRE_BIBLIO, UBICACION, CANT_SALAS, CANT_ESTANTES) 
values ('B0006', 'Biblioteca de centro Est. Orientales', '', 1, 1);

insert into BIBLIOTECA (COD_BIBLIO, NOMBRE_BIBLIO, UBICACION, CANT_SALAS, CANT_ESTANTES) 
values ('B0007', 'Biblioteca centrum', 'DOSIS', 4, 12);

insert into BIBLIOTECA (COD_BIBLIO, NOMBRE_BIBLIO, UBICACION, CANT_SALAS, CANT_ESTANTES) 
values ('B0008', 'Biblioteca Riva-Aguero', 'Jr Camana', 5, 12);

insert into TIPOLIBRO (COD_TIPO_LIBRO, DESCRIPCION) 
values ('T0001', 'Libro');

insert into TIPOLIBRO (COD_TIPO_LIBRO, DESCRIPCION) 
values ('T0002', 'Revista');

insert into TIPOLIBRO (COD_TIPO_LIBRO, DESCRIPCION) 
values ('T0003', 'Articulo');

insert into TIPOLIBRO (COD_TIPO_LIBRO, DESCRIPCION) 
values ('T0004', 'Tesis');

insert into LIBRO (COD_LIBRO, TITULO, AUTOR, EDITORAL, ANHO_PUBLICA, TIPO_LIBRO)
values ('L0001', 'CÁLCULO DIFERENCIAL', 'MAYNARD KONG', 'PUCP', 1997, 'T0001');
insert into LIBRO (COD_LIBRO, TITULO, AUTOR, EDITORAL, ANHO_PUBLICA, TIPO_LIBRO)
values ('L0002', 'CÁLCULO DIFERENCIAL', 'TOMÁS NÚÑEZ', 'PUCP', 2000, 'T0001');
insert into LIBRO (COD_LIBRO, TITULO, AUTOR, EDITORAL, ANHO_PUBLICA, TIPO_LIBRO)
values ('L0003', 'Systems analysis and design in a changing world', 'Satzinger, John W.', 'Cengage Learning', 2016, 'T0001');
insert into LIBRO (COD_LIBRO, TITULO, AUTOR, EDITORAL, ANHO_PUBLICA, TIPO_LIBRO)
values ('L0004', 'CÁLCULO DIFERENCIAL E INTEGRAL', 'DALE VARBERG', '', 2012, 'T0001');
insert into LIBRO (COD_LIBRO, TITULO, AUTOR, EDITORAL, ANHO_PUBLICA, TIPO_LIBRO)
values ('L0005', 'FÍSICA', 'DUDLEY WILLIAMS', '', 2015, 'T0001');
insert into LIBRO (COD_LIBRO, TITULO, AUTOR, EDITORAL, ANHO_PUBLICA, TIPO_LIBRO)
values ('L0006', 'PROGRAMACIÓN EN LENGUAJE C', 'HERBERT SCHILDT', '', 2015, 'T0001');
insert into LIBRO (COD_LIBRO, TITULO, AUTOR, EDITORAL, ANHO_PUBLICA, TIPO_LIBRO)
values ('L0007', 'Diseño conceptual de bases de datos', 'Batini, Carlo - Ceri, Stefano - Navathe, Shamkant B', '', 2016, 'T0001');
insert into LIBRO (COD_LIBRO, TITULO, AUTOR, EDITORAL, ANHO_PUBLICA, TIPO_LIBRO)
values ('L0008', 'PROGRAMACIÓN ESTRUCTURADA EN LENGUAJE C', 'LEOBARDO LÓPEZ ROMÁN', 'Addison Wesley', 1994, 'T0001');
insert into LIBRO (COD_LIBRO, TITULO, AUTOR, EDITORAL, ANHO_PUBLICA, TIPO_LIBRO)
values ('L0009', 'The data warehouse toolkit : the complete guide to dimensional modeling', 'Kimball, Ralph', 'Wiley Wesley', 2002, 'T0002');
insert into LIBRO (COD_LIBRO, TITULO, AUTOR, EDITORAL, ANHO_PUBLICA, TIPO_LIBRO)
values ('L0010', 'C how to program', 'DEITEL, Harvey M.', 'Prentice-Hall', 2004, 'T0001');
insert into LIBRO (COD_LIBRO, TITULO, AUTOR, EDITORAL, ANHO_PUBLICA, TIPO_LIBRO)
values ('L0011', 'Análisis y diseño de sistemas', 'Kendall, Kenneth', 'Pearson Educación', 2011, 'T0001');
insert into LIBRO (COD_LIBRO, TITULO, AUTOR, EDITORAL, ANHO_PUBLICA, TIPO_LIBRO)
values ('L0012', 'Systems analysis and design in a changing world', 'Satzinger, John W.', 'Cengage Learning', 2016, 'T0001');

insert into ALUMNO (COD_ALUMNO, FACULTAD, ESPECIALIDAD,	NIVEL_ESTUDIO) 
values (10000001, 'D0001', 'ING. CIVIL', 2);
insert into ALUMNO (COD_ALUMNO, FACULTAD, ESPECIALIDAD,	NIVEL_ESTUDIO) 
values (10000002, 'D0002', 'GESTIÓN', 1);
insert into ALUMNO (COD_ALUMNO, FACULTAD, ESPECIALIDAD,	NIVEL_ESTUDIO) 
values (10000003, 'D0002', 'DERECHO', 2);
insert into ALUMNO (COD_ALUMNO, FACULTAD, ESPECIALIDAD,	NIVEL_ESTUDIO) 
values (10000004, 'D0001', 'ING. INFORMATICA', 4);
insert into ALUMNO (COD_ALUMNO, FACULTAD, ESPECIALIDAD,	NIVEL_ESTUDIO) 
values (10000007, 'D0001', 'ING. INDUSTRIAL', 3);
insert into ALUMNO (COD_ALUMNO, FACULTAD, ESPECIALIDAD,	NIVEL_ESTUDIO) 
values (10000009, 'D0003', 'MECANICA', 6);
insert into ALUMNO (COD_ALUMNO, FACULTAD, ESPECIALIDAD,	NIVEL_ESTUDIO) 
values (10000010, 'D0003', 'ELECTRONICA', 8);
insert into ALUMNO (COD_ALUMNO, FACULTAD, ESPECIALIDAD,	NIVEL_ESTUDIO) 
values (10000011, 'D0003', 'CIVIL', 9);
insert into ALUMNO (COD_ALUMNO, FACULTAD, ESPECIALIDAD,	NIVEL_ESTUDIO) 
values (10000012, 'D0003', 'QUIMICA', 8);

insert into LIBRO_BIBLIOTECA (COD_BIBLIO, COD_LIBRO, TOTAL_EJEMPLAR, ESTANTE) 
values ('B0001', 'L0001', 5,  'E0001');
insert into LIBRO_BIBLIOTECA (COD_BIBLIO, COD_LIBRO, TOTAL_EJEMPLAR, ESTANTE) 
values ('B0001', 'L0002', 1,  'E0001');
insert into LIBRO_BIBLIOTECA (COD_BIBLIO, COD_LIBRO, TOTAL_EJEMPLAR, ESTANTE) 
values ('B0001', 'L0009', 2,  'E0001');
insert into LIBRO_BIBLIOTECA (COD_BIBLIO, COD_LIBRO, TOTAL_EJEMPLAR, ESTANTE) 
values ('B0001', 'L0010', 3,  'E0001');

insert into LIBRO_BIBLIOTECA (COD_BIBLIO, COD_LIBRO, TOTAL_EJEMPLAR, ESTANTE) 
values ('B0002', 'L0001', 2,  'E0001');
insert into LIBRO_BIBLIOTECA (COD_BIBLIO, COD_LIBRO, TOTAL_EJEMPLAR, ESTANTE) 
values ('B0002', 'L0003', 3,  'E0001');
insert into LIBRO_BIBLIOTECA (COD_BIBLIO, COD_LIBRO, TOTAL_EJEMPLAR, ESTANTE) 
values ('B0002', 'L0004', 1,  'E0001');

insert into LIBRO_BIBLIOTECA (COD_BIBLIO, COD_LIBRO, TOTAL_EJEMPLAR, ESTANTE) 
values ('B0003', 'L0007', 11,  'E0001');
insert into LIBRO_BIBLIOTECA (COD_BIBLIO, COD_LIBRO, TOTAL_EJEMPLAR, ESTANTE) 
values ('B0003', 'L0008', 2,  'E0001');

insert into LIBRO_BIBLIOTECA (COD_BIBLIO, COD_LIBRO, TOTAL_EJEMPLAR, ESTANTE) 
values ('B0004', 'L0002', 3,  'E0002');
insert into LIBRO_BIBLIOTECA (COD_BIBLIO, COD_LIBRO, TOTAL_EJEMPLAR, ESTANTE) 
values ('B0004', 'L0012', 5,  'E0002');

insert into LIBRO_BIBLIOTECA (COD_BIBLIO, COD_LIBRO, TOTAL_EJEMPLAR, ESTANTE) 
values ('B0005', 'L0001', 10,  'E0002');
insert into LIBRO_BIBLIOTECA (COD_BIBLIO, COD_LIBRO, TOTAL_EJEMPLAR, ESTANTE) 
values ('B0005', 'L0005', 2,  'E0002');
insert into LIBRO_BIBLIOTECA (COD_BIBLIO, COD_LIBRO, TOTAL_EJEMPLAR, ESTANTE) 
values ('B0005', 'L0006', 3,  'E0001');

insert into LIBRO_PRESTADO (COD_BIBLIO, COD_LIBRO, COD_ALUMNO, FECHA_SOLICITUD,    FECHA_ENTREGA, NRO_DIAS_PRESTADO) 
values ('B0001', 'L0001', 10000001, '6/05/2022', '11/05/2022', 5);
insert into LIBRO_PRESTADO (COD_BIBLIO, COD_LIBRO, COD_ALUMNO, FECHA_SOLICITUD,    FECHA_ENTREGA, NRO_DIAS_PRESTADO) 
values ('B0001', 'L0002', 10000001, '6/05/2022', '10/05/2022', 10);

insert into LIBRO_PRESTADO (COD_BIBLIO, COD_LIBRO, COD_ALUMNO, FECHA_SOLICITUD,    FECHA_ENTREGA, NRO_DIAS_PRESTADO) 
values ('B0001', 'L0009', 10000002, '16/06/2022', null, 5);
insert into LIBRO_PRESTADO (COD_BIBLIO, COD_LIBRO, COD_ALUMNO, FECHA_SOLICITUD,    FECHA_ENTREGA, NRO_DIAS_PRESTADO) 
values ('B0002', 'L0001', 10000002, '6/04/2022', '10/05/2022', 5);
insert into LIBRO_PRESTADO (COD_BIBLIO, COD_LIBRO, COD_ALUMNO, FECHA_SOLICITUD,    FECHA_ENTREGA, NRO_DIAS_PRESTADO) 
values ('B0002', 'L0003', 10000002, '26/04/2022', '01/05/2022', 5);

insert into LIBRO_PRESTADO (COD_BIBLIO, COD_LIBRO, COD_ALUMNO, FECHA_SOLICITUD,    FECHA_ENTREGA, NRO_DIAS_PRESTADO) 
values ('B0002', 'L0004', 10000003, '27/06/2022', '01/06/2022', 5);

insert into LIBRO_PRESTADO (COD_BIBLIO, COD_LIBRO, COD_ALUMNO, FECHA_SOLICITUD,    FECHA_ENTREGA, NRO_DIAS_PRESTADO) 
values ('B0005', 'L0001', 10000004, '01/09/2022', '10/09/2022', 5);
insert into LIBRO_PRESTADO (COD_BIBLIO, COD_LIBRO, COD_ALUMNO, FECHA_SOLICITUD,    FECHA_ENTREGA, NRO_DIAS_PRESTADO) 
values ('B0005', 'L0005', 10000004, '01/09/2022', '10/09/2022', 5);
insert into LIBRO_PRESTADO (COD_BIBLIO, COD_LIBRO, COD_ALUMNO, FECHA_SOLICITUD,    FECHA_ENTREGA, NRO_DIAS_PRESTADO) 
values ('B0005', 'L0006', 10000004, '01/09/2022', '10/09/2022', 5);
insert into LIBRO_PRESTADO (COD_BIBLIO, COD_LIBRO, COD_ALUMNO, FECHA_SOLICITUD,    FECHA_ENTREGA, NRO_DIAS_PRESTADO) 
values ('B0004', 'L0012', 10000004, '11/09/2022', '15/09/2022', 3);

insert into LIBRO_PRESTADO (COD_BIBLIO, COD_LIBRO, COD_ALUMNO, FECHA_SOLICITUD,    FECHA_ENTREGA, NRO_DIAS_PRESTADO) 
values ('B0003', 'L0007', 10000007, '19/09/2022', '20/09/2022', 3);
insert into LIBRO_PRESTADO (COD_BIBLIO, COD_LIBRO, COD_ALUMNO, FECHA_SOLICITUD,    FECHA_ENTREGA, NRO_DIAS_PRESTADO) 
values ('B0003', 'L0008', 10000007, '12/09/2022', '17/09/2022', 3);

insert into LIBRO_PRESTADO (COD_BIBLIO, COD_LIBRO, COD_ALUMNO, FECHA_SOLICITUD,    FECHA_ENTREGA, NRO_DIAS_PRESTADO) 
values ('B0004', 'L0002', 10000009, '21/08/2022', '30/08/2022', 3);
insert into LIBRO_PRESTADO (COD_BIBLIO, COD_LIBRO, COD_ALUMNO, FECHA_SOLICITUD,    FECHA_ENTREGA, NRO_DIAS_PRESTADO) 
values ('B0004', 'L0012', 10000009, '21/08/2022', '30/08/2022', 3);
insert into LIBRO_PRESTADO (COD_BIBLIO, COD_LIBRO, COD_ALUMNO, FECHA_SOLICITUD,    FECHA_ENTREGA, NRO_DIAS_PRESTADO) 
values ('B0005', 'L0006', 10000009, '01/05/2022', '10/05/2022', 5);