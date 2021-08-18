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
   FROM TGrupoEstudiante G inner join TAulaTutoria A
   ON G.CodGrupoEstudiante=A.CodGrupoAlumno
   WHERE A.CodAulaTutoria =@CodAula
END;
go

--drop PROCEDURE spuConsultarAulaTutoriaDT
--EXEC spuListarAlumnosGrupoAula 'A0001'
