use Master
go
---------------------------------------
-- CREACION DE LA BASE DE DATOS --
---------------------------------------
if exists (select * from dbo.sysdatabases where name='DBControlTutorias')
drop database DBControlTutorias
go
create database DBControlTutorias
go
---------------------------------------
-- CREACION DE LAS TABLAS --
---------------------------------------
use DBControlTutorias
go

/* Crear los tipos */
CREATE TYPE TCodDocente FROM varchar(12) NOT NULL;
go
CREATE TYPE TCodAlumno FROM varchar(12) NOT NULL ;
go
CREATE TYPE TCodAulaTutoria FROM varchar(12) NOT NULL ;
go
CREATE TYPE TCodGrupoEstudiante FROM varchar(12) NOT NULL ;
go
CREATE TYPE TIdUsuario FROM varchar(12) NOT NULL ;
go
CREATE TYPE TCodEs FROM varchar(12) NOT NULL ;
go
CREATE TYPE TCodCategoria FROM varchar(12) NOT NULL ;
go
CREATE TYPE TIdSemestre FROM int NOT NULL ;
go
--**************************************
-- TABLA ESCUELA PROFESIONAL
--**************************************
use DBControlTutorias
go
create table TEspecialidad
( -- lista de atributos
CodEspecialidad       TCodEs,
Nombre_Especialidad   varchar(100) not null,
primary key (CodEspecialidad)
)
Go
--**************************************
-- TABLA CATEGORIA DOCENTE
--**************************************
use DBControlTutorias
go
create table TCategoriaDocente
(
CodCategoria  TCodCategoria,
Categoria     varchar(50) not null,
primary key (CodCategoria)
)
Go
--**************************************
-- TABLA SEMESTRE
--**************************************
use DBControlTutorias
go
create table TSemestre
(
IdSemestre  TIdSemestre,
Semestre     varchar(15) not null,
primary key (IdSemestre)
)
Go

----**************************************
---- TABLA USUARIO (Login)
----**************************************
--use DBControlTutorias
--go
--create table TUsuarios
--( --lista de atributos
--  IdUsuarios    TIdUsuario,
--  Apellidos		varchar(50) not null,
--  Nombres		varchar(50) not null,
--  TipoUsuario	varchar(50) check (TipoUsuario  in ('DESARROLLADOR','DIRECTOR DE ESCUELA','DOCENTE TUTOR','ESTUDIANTE AYUDANTE DE TUTORIA','COORDINACION GENERAL DE TUTORIA')),
--  Clave		    varchar(100) not null,
--  -- especificacion de claves
--  PRIMARY KEY (IdUsuarios)
--)
--go
--------------------------------------------------------------------------
-- CREACION DE LA TABLA USUARIOS
--------------------------------------------------------------------------

use DBControlTutorias
go
CREATE TABLE TUsuarios
(
	Id        TIdUsuario,
    Nombre    VARCHAR(50) NOT NULL,
    Apellido  VARCHAR(50) NOT NULL,
	Rol       VARCHAR(50) check (Rol  in ('DESARROLLADOR','DIRECTOR DE ESCUELA','DOCENTE TUTOR','ESTUDIANTE AYUDANTE DE TUTORIA','COORDINACION GENERAL DE TUTORIA')),
    clave     VARCHAR(50) NOT NULL,
	primary key (Id),
)
GO
select * from TUsuarios

--**************************************
-- TABLA DOCENTE
--**************************************
use DBControlTutorias
go
create table TDocente
( -- lista de atributos
	CodDocente		TCodDocente,
	Nombres			varchar(30) not null,
	Apellidos		varchar(30) not null,
	Correo			varchar(40),
	Telefono		varchar(20),
	DNI				varchar(8) not null,
	Categoria		varchar(20) not null,
	Especialidad	varchar(60) not null,
	Impedimento		varchar(20) not null,
	-- especificacion de claves
	PRIMARY KEY (CodDocente)
)
go
--drop table TDocente
--**************************************
-- TABLA ALUMNO
--**************************************
use DBControlTutorias
go
create table TAlumno
( -- lista de atributos
	CodAlumno TCodAlumno,
	Apellidos varchar(20) not null,
	Nombres varchar(20) not null,
	Correo varchar(20),
	Telefono varchar(20),
	DNI varchar(8) not null,
	-- especificacion de claves
	primary key (CodAlumno)
)
go

--**************************************
-- TABLA GRUPO ESTUDIANTES
--**************************************
use DBControlTutorias
go
CREATE TABLE TGrupoEstudiante (
  CodGrupoEstudiante	TCodGrupoEstudiante,
  CodAlumno		        TCodAlumno,
  primary key (CodGrupoEstudiante,CodAlumno),
  FOREIGN KEY (CodAlumno) REFERENCES TAlumno(CodAlumno),
);
go

--**************************************
-- TABLA AULA DE TUTORIA
--**************************************
use DBControlTutorias
go
CREATE TABLE TAulaTutoria
(
-- lista de atributos
  CodAulaTutoria     TCodAulaTutoria,
  CodDocenteTutor	 varchar(10) not null,
  CodGrupoAlumno     varchar(10) ,---TCodGrupoAlumnos,
  Semestre		     varchar(10),
  HoraInicio		 varchar(10),
  Lugar			     varchar(80),

  PRIMARY KEY (CodAulaTutoria),
  --FOREIGN KEY (CodGrupoAlumno) REFERENCES TGrupoEstudiante(CodGrupoEstudiante)
);
go
--drop table TAulaTutoria
----CREATE TABLE [TDocEvaluaciónTutoría] (
----  [CodAulaTutoria] varchar(10),
----  [CodDocente] varchar(10),
----  [Observaciones] varchar(1000),
----  [Fecha] datetime,
----  [RealizoAsistenciaSocial] bool,
----  [RealizoAsistenciaPsicologica] bool
----);


----CREATE TABLE [TDocInformeDesarrolloEstudiante] (
----  [CodDocente] varchar(10),
----  [CodEstudiante] varchar(10),
----  [Observaciones] varchar(100),
----  [Fecha] datetime
----);

----CREATE TABLE [TAulaTutoriaXEstudianteEstudiantes] (
----  [CodAulaTutoria] varchar(10),
----  [CodEstudiante] varchar(10)
----);
----CREATE TABLE [TDocAsistencia] (
----  [CodAulaTutoria] varchar(10),
----  [CodEstudiante] varchar(10),
----  [Fecha] datetime,
----  [Asistio] bool
----);

----CREATE TABLE [TDocInformeDesarrolloEstudiante] (
----  [CodDocente] varchar(10),
----  [CodEstudiante] varchar(10),
----  [Observaciones] varchar(100),
----  [Fecha] datetime
----);

-------------------------------------------------------------------
-- inserción de datos en la tabla Usuarios --
-------------------------------------------------------------------

-- DATOS LOGIN DEL USUARIO
use DBControlTutorias
go
insert into TUsuarios values('De001','ERICK ANDREW','BUSTAMANTE FLORES','DESARROLLADOR','123456')
insert into TUsuarios values('De002','LEYDI DIANA','CHOQUE SARMIENTO','DESARROLLADOR','123456')
insert into TUsuarios values('De003','ALEX HELDER','HUANCARA CCOLQQUE','DESARROLLADOR','123456')
insert into TUsuarios values('De004','CARLOS EDUARDO','INCA CRUZ','DESARROLLADOR','123456')
insert into TUsuarios values('De005','MARIELA','LUYCHO ANCAIFURO','DESARROLLADOR','123456')
insert into TUsuarios values('De006','DANIEL EDUARDO','SARCO JACINTO','DESARROLLADOR','123456')
insert into TUsuarios values('De007','ALEXANDER','TTITO SAYA','DESARROLLADOR','123456')
insert into TUsuarios values('De008','RICHARD MIKHAEL','PEREIRA CHINCHERO','DESARROLLADOR','123456')
go


-- DATOS DOCENTES
use DBControlTutorias
go
insert into TDocente values('D00001','ALZAMORA PAREDES','ROBERT WILBERT','robert.alzamora@unsaac.edu.pe','984632900','24589812','NOMBRADO','INGENIERIA DE SOFTWARE','No')
insert into TDocente values('D00002','VILLAFUERTE SERNA','RONY','rony.villafuerte@unsaac.edu.pe','998562389','24589689','NOMBRADO','AUDITORIA EN REDES','No')
insert into TDocente values('D00003','CHOQUE SOTO','VANESA MARIBEL','maribel.choque@unsaac.edu.pe','989862347','70349636','NOMBRADO','TECNOLOGIAS DE INFORMACION Y COMUNICACION','No')
insert into TDocente values('D00004','IBARRA ZAMBRANO','WALDO ELIO','waldo.ibarra@unsaac.edu.pe','984596398','24586688','NOMBRADO','TECNOLOGIAS DE INFORMACION Y COMUNICACION','No')
insert into TDocente values('D00005','ZAMALLOA PARO','WILLIAM','william.zamalloa@unsaac.edu.pe','994562385','70589696','CONTRATADO','INGENIERIA DE SOFTWARE','No')
insert into TDocente values('D00006','CARRASCO POBLETE','EDWIN','edwin.carrasco@unsaac.edu.pe','984562347','74589636','NOMBRADO','AUDITORIA EN REDES','No')
insert into TDocente values('D00007','CUTIPA ARAPA','EFRAINA GLADYS','efraina.cutipa@unsaac.edu.pe','999525389','24559933','CONTRATADO','AUDITORIA EN REDES','No')
insert into TDocente values('D00008','RIVAS PUGA','ABDON','abdon.rivas@unsaac.edu.pe','984562347','74589636','NOMBRADO','INGENIERIA DE SOFTWARE','No')
insert into TDocente values('D00009','CARDENAS MAYTA','ANA ROCIO','ana.cardenas@unsaac.edu.pe','937562347','74590636','CONTRATADO','TECNOLOGIAS DE INFORMACION Y COMUNICACION','No')
insert into TDocente values('D00010','CANDIA OVIEDO','DENIS IVAN','denis.candia@unsaac.edu.pe','912562947','24589622','NOMBRADO','INGENIERIA DE SOFTWARE','No')
insert into TDocente values('D00011','PALOMINO OLIVERA','EMILIO','emilio.palomino@unsaac.edu.pe','984562347','74969633','NOMBRADO','AUDITORIA EN REDES','No')
insert into TDocente values('D00012','GAMARRA SALDIVAR','ENRIQUE','enrique.gamarra@unsaac.edu.pe','988588345','70589636','NOMBRADO','INGENIERIA DE SOFTWARE','Ninguno')
insert into TDocente values('D00013','PACHECO VASQUEZ','ESTER CRISTINA','ester.pacheco@unsaac.edu.pe','914562396','74582635','CONTRATADO','TECNOLOGIAS DE INFORMACION Y COMUNICACION','No')
insert into TDocente values('D00014','TICON PARI','GUZMAN','guzman.ticona@unsaac.edu.pe','912562348','24989636','NOMBRADO','TECNOLOGIAS DE INFORMACION Y COMUNICACION','No')
insert into TDocente values('D00015','DUEÑAS DE LA CRUZ','HENRY SAMUEL','henry.dueñas@unsaac.edu.pe','916282325','24589631','CONTRATADO','TECNOLOGIAS DE INFORMACION Y COMUNICACION','No')
insert into TDocente values('D00016','MEDRANO VALENCIA','IVAN CESAR','ivan.medrano@unsaac.edu.pe','918562342','70589521','NOMBRADO','INGENIERIA DE SOFTWARE','No')
insert into TDocente values('D00017','ROZAS HUACHO','JAVIER ARTURO','javir.rozas@unsaac.edu.pe','919562347','74589696','NOMBRADO','INGENIERIA DE SOFTWARE','No')
insert into TDocente values('D00018','CHAVEZ CENTENO','JAVIER DAVID','javier.chavez@unsaac.edu.pe','984562347','70589634','NOMBRADO','AUDITORIA EN REDES','No')
insert into TDocente values('D00019','PILLCO QUISPE','JOSE MAURO','jose.pillco@unsaac.edu.pe','976562347','24589666','NOMBRADO','INGENIERIA DE SOFTWARE','No')
insert into TDocente values('D00020','MEDINA MIRANDA','KARELIA','karelia.medina@unsaac.edu.pe','984562325','74589961','NOMBRADO','INGENIERIA DE SOFTWARE','No')
insert into TDocente values('D00021','ENCISO RODAS','LAURO','lauro.enciso@unsaac.edu.pe','994562398','74589656','NOMBRADO','AUDITORIA EN REDES','No')
insert into TDocente values('D00022','FLORES PACHECO','LINO PRISCILIANO','lino.pacheco@unsaac.edu.pe','984662007','74589200','NOMBRADO','CIENCIAS DE LA COMPUTACION','No')
insert into TDocente values('D00023','PALMA TITO','LUIS BELTRAN','luis.palma@unsaac.edu.pe','984562347','70589056','NOMBRADO','INGENIERIA DE SOFTWARE','No')
insert into TDocente values('D00024','ACURIO USCA','NILA SONIA','nila.acurio@unsaac.edu.pe','996523479','72529622','NOMBRADO','TECNOLOGIAS DE INFORMACION Y COMUNICACION','No')
go


-- DATOS ALUMNOS
use DBControlTutorias
go
insert into TAlumno values ('124813','DE LA CRUZ QUISPE','ALEX ALBERTO','124813@unsaac.edu.pe','996789497','24632532')
insert into TAlumno values ('124219','VALLE HUAMAN','MARIA ANGELA','124219@unsaac.edu.pe','973789025','72634545')
insert into TAlumno values ('150409','TTITO RAMOS','MANUEL DARIO','150409@unsaac.edu.pe','965783029','74234575')
insert into TAlumno values ('134544','ZUNIGA HUAMAN','EDI FRAI','134544@unsaac.edu.pe','937159085','24632515')
insert into TAlumno values ('113553','FLORES YUCRA','IGNACIO','113553@unsaac.edu.pe','928089096','74362845')
insert into TAlumno values ('141670','HALIRE HUAMAN','JAIME ANDRE','141670@unsaac.edu.pe','915786032','24634198')
insert into TAlumno values ('151827','LEVA SALAS ','RENAN FERDINANDN','151827@unsaac.edu.pe','918781227','70621528')
insert into TAlumno values ('110125','LOPINTA HUAMAN','CRISTIAN RODRIGO','110125@unsaac.edu.pe','989289025','24769542')
insert into TAlumno values ('155184','MAMANI CCANAHUIREL','LALO LEONEL','155184@unsaac.edu.pe','981789018','70625583')
insert into TAlumno values ('154637','NINA PONCE','JOSUE JOSE','154637@unsaac.edu.pe','992789035','70689502')
insert into TAlumno values ('141674','VILCA PANTIGOSO','KAROL BERLIZN','141674@unsaac.edu.pe','921793025','24689572')
insert into TAlumno values ('133959','ANCCO PERALTA','JUAN ABEL','133959@unsaac.edu.pe','924398918','72964555')
insert into TAlumno values ('151833','CONDE CHURA','YURI FERNANDO','151833@unsaac.edu.pe','925789088','24689354')
insert into TAlumno values ('160893','OLAZABAL CALLER','LETICIA GIULIANA','160893@unsaac.edu.pe','919078902','70344501')
insert into TAlumno values ('164240','ESCOBEDO DURAN','ROBERTO CARLOS','164240@unsaac.edu.pe','985783621','24615545')
insert into TAlumno values ('155185','PEZUA CERNADES','ARACELY','155185@unsaac.edu.pe','912689087','70384588')
insert into TAlumno values ('144993','IBARRA HUAMAN','ALEXANDER PAVEL','144993@unsaac.edu.pe','918709095','79625845')
insert into TAlumno values ('160545','NAOLA PEREYRA','ALEXANDER YERIM','160545@unsaac.edu.pe','973989025','70656582')
insert into TAlumno values ('150389','CONDE SALLO','JHACK STEVEN','150389@unsaac.edu.pe','923789089','24684582')
insert into TAlumno values ('150543','DONGO ESQUIVEL','DIEGO YOSHIRO','150543@unsaac.edu.pe','912589025','72634565')
go

use DBControlTutorias
go
-- DATOS TABLA CATEGORIA DOCENTE
INSERT INTO TCategoriaDocente VALUES ('AS','ASOCIADO')
INSERT INTO TCategoriaDocente VALUES ('AU','AUXILIAR')
INSERT INTO TCategoriaDocente VALUES ('PR','PRINCIPAL')
go

use DBControlTutorias
go
-- DATOS TABLA CATEGORIA DOCENTE
INSERT INTO TEspecialidad VALUES ('E1','AUDITORIA EN REDES')
INSERT INTO TEspecialidad VALUES ('E2','INGENIERIA DE SOFTWARE')
INSERT INTO TEspecialidad VALUES ('E3','TECNOLOGIAS DE INFORMACION Y COMUNICACION')
INSERT INTO TEspecialidad VALUES ('E4','CIENCIAS DE LA COMPUTACION')
go

use DBControlTutorias
go
-- DATOS TABLA CATEGORIA DOCENTE
INSERT INTO TSemestre VALUES (1,'2017_1')
INSERT INTO TSemestre VALUES (2,'2017_2')
INSERT INTO TSemestre VALUES (3,'2018_1')
INSERT INTO TSemestre VALUES (4,'2018_2')
INSERT INTO TSemestre VALUES (5,'2019_1')
INSERT INTO TSemestre VALUES (6,'2019_2')
INSERT INTO TSemestre VALUES (7,'2020_1')
INSERT INTO TSemestre VALUES (8,'2020_2')
INSERT INTO TSemestre VALUES (9,'2021_1')
INSERT INTO TSemestre VALUES (10,'2021_2')
go