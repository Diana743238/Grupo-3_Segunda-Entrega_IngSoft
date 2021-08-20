use DBControlTutorias
go
CREATE PROCEDURE spuRecuperarDocentesSinImpedimentos
AS
begin
   SELECT *
   FROM TDocente
   WHERE Impedimento='NO' or Impedimento='No' or Impedimento='no' or Impedimento='Ninguno'
END;
go

--EXEC spuRecuperarDocentesSinImpedimentos

--drop PROCEDURE spuRecuperarDocentesSinImpedimentos

use DBControlTutorias
go
CREATE PROCEDURE spuConsultarAulaTutoriaXCodAulaTutoria  @CodAulaTutoria varchar(10)
AS
begin
   SELECT *
   FROM TAulaTutoria A INNER JOIN TDocente B ON A.CodDocenteTutor=B.CodDocente
   WHERE CodAulaTutoria=@CodAulaTutoria
END;
go


--EXEC spuConsultarAulaTutoriaXCodAulaTutoria 'A0001'


use DBControlTutorias
go
CREATE PROCEDURE spuConsultarAulaTutoriaDT
AS
begin
   SELECT CodAulaTutoria,Semestre,HoraInicio,Lugar,CodDocente,Nombres,Apellidos
   FROM TAulaTutoria A INNER JOIN TDocente B ON A.CodDocenteTutor=B.CodDocente
END;
go

--drop PROCEDURE spuConsultarAulaTutoriaDT
--EXEC spuConsultarAulaTutoriaDT




use DBControlTutorias
go
CREATE PROCEDURE spuListarAlumnosTutoria
AS
begin
   SELECT *
   FROM TAlumno
END;
go

--drop PROCEDURE spuConsultarAulaTutoriaDT
--EXEC spuListarAlumnosTutoria



use DBControlTutorias
go
CREATE PROCEDURE spuListarAlumnosGrupoAula @CodAula varchar(10)
AS
begin
   SELECT *
   FROM TAlumno A inner join ( SELECT * from TGrupoEstudiante G inner join TAulaTutoria A  
   ON G.CodGrupoEstudiante=A.CodGrupoAlumno
   WHERE A.CodAulaTutoria =@CodAula) H
   on A.CodAlumno= H.CodAlumno
END;
go

--drop PROCEDURE spuListarAlumnosGrupoAula
--EXEC spuListarAlumnosGrupoAula 'A0001'

CREATE PROCEDURE spuGenerarListaAlumnos @Cantidad INT
AS
begin
   SELECT TOP (@Cantidad) A.*
   FROM   TAlumno A
   WHERE NOT EXISTS( SELECT * FROM TGrupoEstudiante G
                     WHERE A.CodAlumno=G.CodAlumno)
   ORDER BY NEWID()
END;
go

--drop PROCEDURE spuGenerarListaAlumnos
--EXEC spuGenerarListaAlumnos 11
 
CREATE PROCEDURE spuCalcularAlumnoGrupo @NroGrupos INT OUTPUT
AS
BEGIN
  DECLARE @CantidadAlumnos INT;
  DECLARE @CantidadTutores INT;
  SELECT  @CantidadAlumnos = COUNT(*) FROM TAlumno A;
  SELECT @CantidadTutores = COUNT(*) FROM TAulaTutoria;
  SELECT @NroGrupos =  @CantidadAlumnos / @CantidadTutores ;
 RETURN
 END
GO
 
--drop PROCEDURE spuCalcularAlumnoGrupo
--DECLARE @NroGrupos INT EXEC spuCalcularAlumnoGrupo @NroGrupos OUTPUT SELECT @NroGrupos
 
