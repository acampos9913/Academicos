USE [master]
GO
/****** Object:  Database [ProBiblioteca]    Script Date: 30/05/2015 8:42:38 ******/
CREATE DATABASE [ProBiblioteca]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProBiblioteca', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ProBiblioteca.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ProBiblioteca_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ProBiblioteca_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ProBiblioteca] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProBiblioteca].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProBiblioteca] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProBiblioteca] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProBiblioteca] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProBiblioteca] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProBiblioteca] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProBiblioteca] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProBiblioteca] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ProBiblioteca] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProBiblioteca] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProBiblioteca] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProBiblioteca] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProBiblioteca] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProBiblioteca] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProBiblioteca] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProBiblioteca] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProBiblioteca] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProBiblioteca] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProBiblioteca] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProBiblioteca] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProBiblioteca] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProBiblioteca] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProBiblioteca] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProBiblioteca] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProBiblioteca] SET RECOVERY FULL 
GO
ALTER DATABASE [ProBiblioteca] SET  MULTI_USER 
GO
ALTER DATABASE [ProBiblioteca] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProBiblioteca] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProBiblioteca] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProBiblioteca] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProBiblioteca', N'ON'
GO
USE [ProBiblioteca]
GO
/****** Object:  StoredProcedure [dbo].[actulizarStockLibros]    Script Date: 30/05/2015 8:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[actulizarStockLibros]
@Codigo char(6),
@Tipo varchar(30)
as
if @Tipo='Sumar'
begin
update Libros 
set Stock=Stock+1 where Codigo_lib=@Codigo
end
else
begin
update Libros 
set Stock=Stock-1 where Codigo_lib=@Codigo
end


GO
/****** Object:  StoredProcedure [dbo].[buscarLibros]    Script Date: 30/05/2015 8:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[buscarLibros]
@Tipo varchar(50),
@dato varchar(100)
as
if @Tipo='Autor'(
select L.Codigo_lib, A.Codigo_aut ,A.Nombres_aut ,E.Codigo_edi  ,E.Nom_edi ,G.Codigo_gen  ,G.Nombres_gen , Estado_Libros, Ejemplares_lib, Titulo_lib, Decripcion_lib,
Imagen_lib, Observaciones,L.Stock from Libros L join Autores A on L.Codigo_aut =A.Codigo_aut
join Editores E on E.Codigo_edi =L.Codigo_edi join Categoria G on L.Codigo_gen =G.Codigo_gen
where L.Estado_Libros='Habilitado' and A.Nombres_aut like ''+@dato+'%')
else if @Tipo='Titulo'(
select L.Codigo_lib, A.Codigo_aut ,A.Nombres_aut ,E.Codigo_edi  ,E.Nom_edi ,G.Codigo_gen  ,G.Nombres_gen , Estado_Libros, Ejemplares_lib, Titulo_lib, Decripcion_lib,
Imagen_lib, Observaciones,L.Stock from Libros L join Autores A on L.Codigo_aut =A.Codigo_aut
join Editores E on E.Codigo_edi =L.Codigo_edi join Categoria G on L.Codigo_gen =G.Codigo_gen
where L.Estado_Libros='Habilitado' and L.Titulo_lib like ''+@dato+'%')
else if @Tipo='Editor'(
select L.Codigo_lib, A.Codigo_aut ,A.Nombres_aut ,E.Codigo_edi  ,E.Nom_edi ,G.Codigo_gen  ,G.Nombres_gen , Estado_Libros, Ejemplares_lib, Titulo_lib, Decripcion_lib,
Imagen_lib, Observaciones,L.Stock from Libros L join Autores A on L.Codigo_aut =A.Codigo_aut
join Editores E on E.Codigo_edi =L.Codigo_edi join Categoria G on L.Codigo_gen =G.Codigo_gen
where L.Estado_Libros='Habilitado' and E.Nom_edi like ''+@dato+'%')
else(
select L.Codigo_lib, A.Codigo_aut ,A.Nombres_aut ,E.Codigo_edi  ,E.Nom_edi ,G.Codigo_gen  ,G.Nombres_gen , Estado_Libros, Ejemplares_lib, Titulo_lib, Decripcion_lib,
Imagen_lib, Observaciones,L.Stock from Libros L join Autores A on L.Codigo_aut =A.Codigo_aut
join Editores E on E.Codigo_edi =L.Codigo_edi join Categoria G on L.Codigo_gen =G.Codigo_gen
where L.Estado_Libros='Habilitado' and (E.Nom_edi like ''+@dato+'%' or 
L.Titulo_lib like ''+@dato+'%' or A.Nombres_aut like ''+@dato+'%'))


GO
/****** Object:  StoredProcedure [dbo].[CAMBIARESTADOS]    Script Date: 30/05/2015 8:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[CAMBIARESTADOS]
@NombreEstado varchar(25),
@Codigo char(6),
@Tabla varchar(25)
as
if @Tabla='Autores'
begin
update Autores set Estado_aut=@NombreEstado
where Codigo_aut=@Codigo 
end
else if @Tabla='Editores'
begin
update Editores set Estado_edi=@NombreEstado
where Codigo_edi =@Codigo 
end
else if @Tabla='Categoria'
begin
update Categoria set Estado_Cat=@NombreEstado
where Codigo_gen =@Codigo 
end
else if @Tabla='Libros'
begin
update Libros set Estado_Libros=@NombreEstado
where Codigo_lib =@Codigo 
end
else if @Tabla='Usuario'
begin
update Usuario set Estado_Usuario=@NombreEstado
where Codigo_usu =@Codigo 
end
else
begin
print 'No ha especificado nada'
end



GO
/****** Object:  StoredProcedure [dbo].[ListarPretamoUsuario]    Script Date: 30/05/2015 8:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ListarPretamoUsuario]
@Codigo char(6)
as
select P.Codigo_pre,D.Codigo_lib  ,Codigo_usu_lector, Estado_Prestamo, Fecha_prestamo, FechaLimite_devolucion from Prestamo P
join Usuario U on U.Codigo_usu =P.Codigo_usu_lector join DPrestamo D on P .Codigo_pre =D.Codigo_pre join Libros L on L.Codigo_lib=D.Codigo_lib 
where (P.Estado_Prestamo='En canasta' or P.Estado_Prestamo='Entregado') and P.Codigo_usu_lector=@Codigo


GO
/****** Object:  StoredProcedure [dbo].[paActualizarPrestamo]    Script Date: 30/05/2015 8:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[paActualizarPrestamo]
@Codigo_pre char(6),
@tipo varchar(50)
as
if @tipo='Entrega'
begin
update Prestamo
set Estado_Prestamo='Entregado' where Codigo_pre =@Codigo_pre 
end
else if @tipo='Devolucion'
begin
if (select FechaLimite_devolucion from Prestamo where Codigo_pre=@Codigo_pre )>=(select Fecha_dev from Devolucion where Codigo_pre=@Codigo_pre  )
begin
update Prestamo
set Estado_Prestamo='Devuelto' where Codigo_pre =@Codigo_pre
end
else if (select FechaLimite_devolucion from Prestamo where Codigo_pre=@Codigo_pre )<(select Fecha_dev from Devolucion where Codigo_pre=@Codigo_pre )
begin
update Prestamo
set Estado_Prestamo='Devolucion extemporanea' where Codigo_pre =@Codigo_pre
end
end

else
begin
print 'Nada'
end

GO
/****** Object:  StoredProcedure [dbo].[paEditarAutores]    Script Date: 30/05/2015 8:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[paEditarAutores]
@Codigo_aut char(6),
@Nombres_aut varchar(50),
@Ape_aut varchar(50)
as
update Autores
set
Nombres_aut=@Nombres_aut,
Ape_aut=@Ape_aut
where Codigo_aut=@Codigo_aut



GO
/****** Object:  StoredProcedure [dbo].[paEditarCategorias]    Script Date: 30/05/2015 8:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[paEditarCategorias]
@Codigo_gen char(6),
@Nombres_gen varchar(50),
@Descripcion_gen varchar(50)
as
update Categoria
set
Nombres_gen=@Nombres_gen,
Descripcion_gen=@Descripcion_gen
where Codigo_gen=@Codigo_gen



GO
/****** Object:  StoredProcedure [dbo].[paEditarEditores]    Script Date: 30/05/2015 8:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[paEditarEditores]
@Codigo_edi char(6),
@Nom_edi varchar(50),
@Direccion varchar(50)
as 
update Editores
set
Nom_edi=@Nom_edi,
Direccion=@Direccion
where Codigo_edi=@Codigo_edi



GO
/****** Object:  StoredProcedure [dbo].[paEditarLibros]    Script Date: 30/05/2015 8:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[paEditarLibros]
@Codigo_lib char(6),
@Codigo_aut char(6), 
@Codigo_edi char(6), 
@Codigo_gen char(6), 
@Ejemplares_lib int,
@Titulo_lib varchar(50), 
@Decripcion_lib varchar(50), 
@Imagen_lib varchar(50), 
@Observaciones varchar(50),
@Stock int
as
update Libros
set
Codigo_aut=@Codigo_aut, Codigo_edi=@Codigo_edi, Codigo_gen=@Codigo_gen,Ejemplares_lib=@Ejemplares_lib, Titulo_lib=@Titulo_lib,
 Decripcion_lib=@Decripcion_lib, Imagen_lib=@Imagen_lib, Observaciones=@Observaciones,Stock=@Stock
where Codigo_lib=@Codigo_lib


GO
/****** Object:  StoredProcedure [dbo].[paEditarUsuario]    Script Date: 30/05/2015 8:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[paEditarUsuario]
@Codigo_usu char(6), @DocumentoDeIdentidad char(8), @Nombres_usu varchar(50), @ApellidosPaterno_usu varchar(50),
@ApellidosMaterno_usu varchar(50), @Telelefono_usu varchar(50), @Direccion_usu varchar(50), @CorreoElectronico_usu varchar(50),
@Facha_nac_usu date, @Imagen varchar(50),@Psw_sesesion_us varchar(50)
as
update Usuario
set
DocumentoDeIdentidad=@DocumentoDeIdentidad, Nombres_usu=@Nombres_usu, ApellidosPaterno_usu=@ApellidosPaterno_usu,
ApellidosMaterno_usu=@ApellidosMaterno_usu, Telelefono_usu =@Telelefono_usu, Direccion_usu=@Direccion_usu, CorreoElectronico_usu=@CorreoElectronico_usu,
Facha_nac_usu=@Facha_nac_usu,Imagen=@Imagen,Psw_sesesion_us=@Psw_sesesion_us
where Codigo_usu=@Codigo_usu


GO
/****** Object:  StoredProcedure [dbo].[paInserAutores]    Script Date: 30/05/2015 8:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[paInserAutores]
@Codigo_aut char(6),
@Nombres_aut varchar(50),
@Ape_aut varchar(50)
as
insert into Autores(Codigo_aut,Nombres_aut, Ape_aut)  values(@Codigo_aut,@Nombres_aut, @Ape_aut)



GO
/****** Object:  StoredProcedure [dbo].[paInsertarCategorias]    Script Date: 30/05/2015 8:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[paInsertarCategorias]
@Codigo_gen char(6),
@Nombres_gen varchar(50),
@Descripcion_gen varchar(50)
as
insert into Categoria(Codigo_gen,Nombres_gen,Descripcion_gen) values(@Codigo_gen,@Nombres_gen,@Descripcion_gen)



GO
/****** Object:  StoredProcedure [dbo].[paInsertarDevolucion]    Script Date: 30/05/2015 8:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[paInsertarDevolucion]
@Codigo_dev char(6), @Codigo_pre char(6), @Codigo_usu_emp char(6)
as
insert into Devolucion(Codigo_dev, Codigo_pre, Codigo_usu_emp, Fecha_dev)
values(@Codigo_dev, @Codigo_pre, @Codigo_usu_emp, GETDATE())


GO
/****** Object:  StoredProcedure [dbo].[paInsertarEditores]    Script Date: 30/05/2015 8:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[paInsertarEditores]
@Codigo_edi char(6),
@Nom_edi varchar(50),
@Direccion varchar(50)
as insert into Editores(Codigo_edi,Nom_edi,Direccion) values(@Codigo_edi,@Nom_edi,@Direccion)



GO
/****** Object:  StoredProcedure [dbo].[paInsertarEntrega]    Script Date: 30/05/2015 8:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[paInsertarEntrega]
@Codigo_ent char(6), 
@Codigo_pre char(6), 
@Codigo_usu_emp char(6)
as
insert into Entrega(Codigo_ent, Codigo_pre, Codigo_usu_emp, Fecha_ent)
values(@Codigo_ent, @Codigo_pre, @Codigo_usu_emp, getdate())


GO
/****** Object:  StoredProcedure [dbo].[paInsertarLibros]    Script Date: 30/05/2015 8:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[paInsertarLibros]
@Codigo_lib char(6),
@Codigo_aut char(6), 
@Codigo_edi char(6), 
@Codigo_gen char(6), 
@Ejemplares_lib int,
@Titulo_lib varchar(50), 
@Decripcion_lib varchar(50), 
@Imagen_lib varchar(50), 
@Observaciones varchar(50),
@Stock int
as
insert into Libros(Codigo_lib, Codigo_aut, Codigo_edi, Codigo_gen, Ejemplares_lib, Titulo_lib, Decripcion_lib, Imagen_lib, Observaciones,Stock)
values(@Codigo_lib, @Codigo_aut, @Codigo_edi, @Codigo_gen, @Ejemplares_lib, @Titulo_lib, @Decripcion_lib, @Imagen_lib, @Observaciones,@Stock)


GO
/****** Object:  StoredProcedure [dbo].[paInsertarPrestamo]    Script Date: 30/05/2015 8:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[paInsertarPrestamo]
@Codigo_pre char(6), 
@Codigo_usu_lector char(6),
@FechaLimite_devolucion date
as
insert into Prestamo(Codigo_pre, Codigo_usu_lector,Fecha_prestamo, FechaLimite_devolucion)
values(@Codigo_pre, @Codigo_usu_lector, GETDATE(), @FechaLimite_devolucion)


GO
/****** Object:  StoredProcedure [dbo].[paInsertarUsuario]    Script Date: 30/05/2015 8:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[paInsertarUsuario]
@Codigo_usu char(6), @DocumentoDeIdentidad char(8), @Psw_sesesion_us varchar(50), @Nombres_usu varchar(50), @ApellidosPaterno_usu varchar(50),
@ApellidosMaterno_usu varchar(50), @Telelefono_usu varchar(8), @Direccion_usu varchar(100), @CorreoElectronico_usu varchar(100),
@Facha_nac_usu date, @Tipo_usu varchar(50), @Imagen varchar(50), @Nombres_sesison_usu varchar(50)
as
insert into Usuario(Codigo_usu, DocumentoDeIdentidad, Psw_sesesion_us, Nombres_usu, ApellidosPaterno_usu, ApellidosMaterno_usu, 
Telelefono_usu, Direccion_usu, CorreoElectronico_usu, Fecha_registro_usu ,Facha_nac_usu, Tipo_usu, Imagen, Nombres_sesison_usu)
values(@Codigo_usu, @DocumentoDeIdentidad, @Psw_sesesion_us, @Nombres_usu, @ApellidosPaterno_usu, @ApellidosMaterno_usu, 
@Telelefono_usu, @Direccion_usu,@CorreoElectronico_usu, getdate(),@Facha_nac_usu, 
@Tipo_usu, @Imagen, @Nombres_sesison_usu)


GO
/****** Object:  StoredProcedure [dbo].[paListarAutores]    Script Date: 30/05/2015 8:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[paListarAutores]
as
select  Codigo_aut, Nombres_aut, Ape_aut,Estado_aut from Autores


GO
/****** Object:  StoredProcedure [dbo].[paListarAutoresXid]    Script Date: 30/05/2015 8:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[paListarAutoresXid]
@codigo char(6)
as
select  Codigo_aut, Nombres_aut, Ape_aut from Autores
where Codigo_aut=@codigo 



GO
/****** Object:  StoredProcedure [dbo].[paListarCategoria]    Script Date: 30/05/2015 8:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[paListarCategoria]
as
select Codigo_gen, Nombres_gen, Descripcion_gen,Estado_Cat  from Categoria


GO
/****** Object:  StoredProcedure [dbo].[paListarCategoriaXId]    Script Date: 30/05/2015 8:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[paListarCategoriaXId]
@Codigo char(6)
as
select Codigo_gen, Nombres_gen, Descripcion_gen,[Estado_Cat]  from Categoria
where Codigo_gen=@Codigo



GO
/****** Object:  StoredProcedure [dbo].[paListarEditores]    Script Date: 30/05/2015 8:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[paListarEditores]
as
select Codigo_edi, Nom_edi,Direccion,Estado_Edi   from Editores


GO
/****** Object:  StoredProcedure [dbo].[paListarEditoresXId]    Script Date: 30/05/2015 8:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[paListarEditoresXId]
@Codigo char(6)
as
select Codigo_edi, Nom_edi,Direccion,[Estado_Edi]  from Editores
where Codigo_edi=@Codigo



GO
/****** Object:  StoredProcedure [dbo].[paListarLibros]    Script Date: 30/05/2015 8:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[paListarLibros]
@Estado varchar(50),
@Categoria varchar(6)
as
select L.Codigo_lib, A.Codigo_aut ,A.Nombres_aut ,E.Codigo_edi  ,E.Nom_edi ,G.Codigo_gen  ,G.Nombres_gen , Estado_Libros, Ejemplares_lib, Titulo_lib, Decripcion_lib,
Imagen_lib, L.Observaciones,L.Stock,Estado_Libros from Libros L join Autores A on L.Codigo_aut =A.Codigo_aut
join Editores E on E.Codigo_edi =L.Codigo_edi join Categoria G on L.Codigo_gen =G.Codigo_gen
where L.Estado_Libros like ''+@Estado+'%' and L.Codigo_gen like ''+@Categoria+'%'

GO
/****** Object:  StoredProcedure [dbo].[paListarLibrosXId]    Script Date: 30/05/2015 8:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[paListarLibrosXId]
@Codigo char(6)
as
select L.Codigo_lib, A.Codigo_aut ,A.Nombres_aut ,E.Codigo_edi  ,E.Nom_edi ,G.Codigo_gen  ,G.Nombres_gen , Estado_Libros, Ejemplares_lib,
Titulo_lib, Decripcion_lib,Imagen_lib, Observaciones,Stock from Libros L join Autores A on L.Codigo_aut =A.Codigo_aut
join Editores E on E.Codigo_edi =L.Codigo_edi join Categoria G on L.Codigo_gen =G.Codigo_gen where L.Codigo_lib=@Codigo


GO
/****** Object:  StoredProcedure [dbo].[paListarPrestamos]    Script Date: 30/05/2015 8:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[paListarPrestamos]
@Estado varchar(50),
@Usuario varchar(6)
as
select P.Codigo_pre,Contar=count(D.Codigo_lib),Codigo_usu_lector, Estado_Prestamo, Fecha_prestamo, FechaLimite_devolucion from Prestamo P
join Usuario U on U.Codigo_usu =P.Codigo_usu_lector join DPrestamo D on P .Codigo_pre =D.Codigo_pre join Libros L on L.Codigo_lib=D.Codigo_lib 
where P.Estado_Prestamo like ''+@Estado+'%' and P.Codigo_usu_lector like ''+@Usuario+'%' group by P.Codigo_pre,
Codigo_usu_lector, Estado_Prestamo, Fecha_prestamo, FechaLimite_devolucion


GO
/****** Object:  StoredProcedure [dbo].[paListarUsuarios]    Script Date: 30/05/2015 8:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[paListarUsuarios]
@strCodigo_usu char(6),
@strTipo_usu nvarchar(50)
as
if @strTipo_usu='Bibliotecario'
begin
select U.Codigo_usu, U.DocumentoDeIdentidad,U.Nombres_sesison_usu ,U.Imagen ,U.Psw_sesesion_us, U.Nombres_usu, U.ApellidosPaterno_usu, U.ApellidosMaterno_usu,
U.Telelefono_usu, U.Direccion_usu, U.CorreoElectronico_usu, U.Fecha_registro_usu, U.Facha_nac_usu, U.Estado_Usuario,U.Tipo_usu,Estado_Usuario 
from Usuario U
where U.Tipo_usu='Lector'
end
else
begin
select U.Codigo_usu, U.DocumentoDeIdentidad,U.Nombres_sesison_usu ,U.Imagen ,U.Psw_sesesion_us, U.Nombres_usu, U.ApellidosPaterno_usu, U.ApellidosMaterno_usu,
U.Telelefono_usu, U.Direccion_usu, U.CorreoElectronico_usu, U.Fecha_registro_usu, U.Facha_nac_usu, U.Estado_Usuario,U.Tipo_usu
from Usuario U
where U.Codigo_usu<>@strCodigo_usu
end


GO
/****** Object:  StoredProcedure [dbo].[paListarUsuariosXId]    Script Date: 30/05/2015 8:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[paListarUsuariosXId]
@Codigo char(6)
as
select U.Codigo_usu, U.DocumentoDeIdentidad,U.Nombres_sesison_usu ,U.Imagen ,U.Psw_sesesion_us, U.Nombres_usu, U.ApellidosPaterno_usu, U.ApellidosMaterno_usu,
U.Telelefono_usu, U.Direccion_usu, U.CorreoElectronico_usu, U.Fecha_registro_usu, U.Facha_nac_usu, U.Estado_Usuario,U.Tipo_usu
from Usuario U
where U.Codigo_usu=@Codigo



GO
/****** Object:  StoredProcedure [dbo].[paVerificarSession]    Script Date: 30/05/2015 8:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[paVerificarSession]
@strNombres_sesison_usu varchar(50),
@strPsw_sesesion_us varchar(50)
as
select U.Codigo_usu, U.DocumentoDeIdentidad, U.Psw_sesesion_us, U.Nombres_usu, U.ApellidosPaterno_usu, U.ApellidosMaterno_usu,
U.Telelefono_usu, U.Direccion_usu, U.CorreoElectronico_usu, U.Fecha_registro_usu, U.Facha_nac_usu, U.Estado_Usuario,U.Tipo_usu,U.Nombres_sesison_usu 
from Usuario U 
where U.Nombres_sesison_usu=@strNombres_sesison_usu  and U.Psw_sesesion_us=@strPsw_sesesion_us



GO
/****** Object:  StoredProcedure [dbo].[spActulizarPassword]    Script Date: 30/05/2015 8:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spActulizarPassword]
@Codigo_usu char(6),
@Psw_sesesion_us varchar(50)
as
update Usuario 
set
Psw_sesesion_us=@Psw_sesesion_us
where Codigo_usu =@Codigo_usu



GO
/****** Object:  StoredProcedure [dbo].[spInserDetalle]    Script Date: 30/05/2015 8:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spInserDetalle]
@Codigo_pre char(6),
@Codigo_lib char(6)
as
insert into DPrestamo values(@Codigo_pre,
@Codigo_lib)


GO
/****** Object:  Table [dbo].[Autores]    Script Date: 30/05/2015 8:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Autores](
	[Codigo_aut] [char](6) NOT NULL,
	[Nombres_aut] [varchar](50) NULL,
	[Ape_aut] [varchar](50) NULL,
	[Estado_aut] [varchar](50) NULL,
 CONSTRAINT [Codigo_autPK] PRIMARY KEY CLUSTERED 
(
	[Codigo_aut] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 30/05/2015 8:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categoria](
	[Codigo_gen] [char](6) NOT NULL,
	[Nombres_gen] [varchar](50) NULL,
	[Descripcion_gen] [varchar](100) NULL,
	[Estado_Cat] [varchar](50) NULL,
 CONSTRAINT [Codigo_genPK] PRIMARY KEY CLUSTERED 
(
	[Codigo_gen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Devolucion]    Script Date: 30/05/2015 8:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Devolucion](
	[Codigo_dev] [char](6) NOT NULL,
	[Codigo_pre] [char](6) NOT NULL,
	[Codigo_usu_emp] [char](6) NOT NULL,
	[Fecha_dev] [date] NULL,
 CONSTRAINT [Codigo_devPK] PRIMARY KEY CLUSTERED 
(
	[Codigo_pre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DPrestamo]    Script Date: 30/05/2015 8:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DPrestamo](
	[Codigo_pre] [char](6) NULL,
	[Codigo_lib] [char](6) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Editores]    Script Date: 30/05/2015 8:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Editores](
	[Codigo_edi] [char](6) NOT NULL,
	[Nom_edi] [varchar](50) NULL,
	[Direccion] [varchar](100) NULL,
	[Estado_Edi] [varchar](50) NULL,
 CONSTRAINT [Cod_ediPK] PRIMARY KEY CLUSTERED 
(
	[Codigo_edi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Entrega]    Script Date: 30/05/2015 8:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Entrega](
	[Codigo_ent] [char](6) NOT NULL,
	[Codigo_pre] [char](6) NOT NULL,
	[Codigo_usu_emp] [char](6) NOT NULL,
	[Fecha_ent] [date] NULL,
 CONSTRAINT [Codigo_entPK] PRIMARY KEY CLUSTERED 
(
	[Codigo_ent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Generador]    Script Date: 30/05/2015 8:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Generador](
	[Parametro] [varchar](30) NOT NULL,
	[Ultimo] [int] NULL,
	[Abreviatura] [varchar](5) NULL,
	[Caracteres] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Libros]    Script Date: 30/05/2015 8:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Libros](
	[Codigo_lib] [char](6) NOT NULL,
	[Codigo_aut] [char](6) NOT NULL,
	[Codigo_edi] [char](6) NOT NULL,
	[Codigo_gen] [char](6) NOT NULL,
	[Estado_Libros] [varchar](50) NULL,
	[Ejemplares_lib] [int] NULL,
	[Titulo_lib] [varchar](50) NULL,
	[Decripcion_lib] [varchar](200) NULL,
	[Imagen_lib] [varchar](50) NULL,
	[Observaciones] [varchar](200) NULL,
	[Stock] [int] NULL,
 CONSTRAINT [Codigo_libPK] PRIMARY KEY CLUSTERED 
(
	[Codigo_lib] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Prestamo]    Script Date: 30/05/2015 8:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Prestamo](
	[Codigo_pre] [char](6) NOT NULL,
	[Codigo_usu_lector] [char](6) NULL,
	[Estado_Prestamo] [varchar](50) NULL,
	[Fecha_prestamo] [date] NULL,
	[FechaLimite_devolucion] [date] NULL,
 CONSTRAINT [Codigo_prePK] PRIMARY KEY CLUSTERED 
(
	[Codigo_pre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 30/05/2015 8:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[Codigo_usu] [char](6) NOT NULL,
	[DocumentoDeIdentidad] [char](8) NULL,
	[Psw_sesesion_us] [varchar](50) NULL,
	[Nombres_usu] [varchar](50) NULL,
	[ApellidosPaterno_usu] [varchar](50) NULL,
	[ApellidosMaterno_usu] [varchar](50) NULL,
	[Telelefono_usu] [varchar](8) NULL,
	[Direccion_usu] [varchar](100) NULL,
	[CorreoElectronico_usu] [varchar](100) NULL,
	[Fecha_registro_usu] [date] NULL,
	[Facha_nac_usu] [date] NULL,
	[Estado_Usuario] [varchar](50) NULL,
	[Tipo_usu] [varchar](50) NOT NULL,
	[Imagen] [varchar](50) NULL,
	[Nombres_sesison_usu] [varchar](50) NULL,
 CONSTRAINT [Codigo_usuPK] PRIMARY KEY CLUSTERED 
(
	[Codigo_usu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Autores] ([Codigo_aut], [Nombres_aut], [Ape_aut], [Estado_aut]) VALUES (N'AUT001', N'Manuel', N'Vera Vera', N'Habilitado')
INSERT [dbo].[Autores] ([Codigo_aut], [Nombres_aut], [Ape_aut], [Estado_aut]) VALUES (N'AUT002', N'Juan', N'Carranza Carranza', N'Habilitado')
INSERT [dbo].[Autores] ([Codigo_aut], [Nombres_aut], [Ape_aut], [Estado_aut]) VALUES (N'AUT003', N'Luis', N'Garcia Mendez', N'Inabilitado')
INSERT [dbo].[Autores] ([Codigo_aut], [Nombres_aut], [Ape_aut], [Estado_aut]) VALUES (N'AUT004', N'Lopez Manuel', N'Vera Zegura', N'Inabilitado')
INSERT [dbo].[Autores] ([Codigo_aut], [Nombres_aut], [Ape_aut], [Estado_aut]) VALUES (N'AUT005', N'Carlos', N'Sanchez Lopez', N'Habilitado')
INSERT [dbo].[Autores] ([Codigo_aut], [Nombres_aut], [Ape_aut], [Estado_aut]) VALUES (N'AUT006', N'Renzo', N'Cardenas Saavedra', N'Habilitado')
INSERT [dbo].[Autores] ([Codigo_aut], [Nombres_aut], [Ape_aut], [Estado_aut]) VALUES (N'AUT007', N'Cesar', N'Vallejo', N'Habilitado')
INSERT [dbo].[Autores] ([Codigo_aut], [Nombres_aut], [Ape_aut], [Estado_aut]) VALUES (N'AUT008', N'Sonia', N'Mendez Loyala', N'Habilitado')
INSERT [dbo].[Categoria] ([Codigo_gen], [Nombres_gen], [Descripcion_gen], [Estado_Cat]) VALUES (N'CAT001', N'Matematica', N'Caculos Arimetico', N'Habilitado')
INSERT [dbo].[Categoria] ([Codigo_gen], [Nombres_gen], [Descripcion_gen], [Estado_Cat]) VALUES (N'CAT002', N'Filosofia', N'Razonamiento Logico', N'Habilitado')
INSERT [dbo].[Categoria] ([Codigo_gen], [Nombres_gen], [Descripcion_gen], [Estado_Cat]) VALUES (N'CAT003', N'Programacion', N'Desarrollo de aplicaiones de tecnologia', N'Habilitado')
INSERT [dbo].[Categoria] ([Codigo_gen], [Nombres_gen], [Descripcion_gen], [Estado_Cat]) VALUES (N'CAT004', N'Humor', N'Ejemplar de acciones graciosas', N'Habilitado')
INSERT [dbo].[Categoria] ([Codigo_gen], [Nombres_gen], [Descripcion_gen], [Estado_Cat]) VALUES (N'CAT005', N'Musical', N'Tonos y melodias', N'Habilitado')
INSERT [dbo].[Categoria] ([Codigo_gen], [Nombres_gen], [Descripcion_gen], [Estado_Cat]) VALUES (N'CAT006', N'Religion', N'Contenido Eclesiatico', N'Habilitado')
INSERT [dbo].[Categoria] ([Codigo_gen], [Nombres_gen], [Descripcion_gen], [Estado_Cat]) VALUES (N'CAT007', N'Politica', N'Pensamientos politicos', N'Habilitado')
INSERT [dbo].[Categoria] ([Codigo_gen], [Nombres_gen], [Descripcion_gen], [Estado_Cat]) VALUES (N'CAT008', N'Literatura', N'Lectura y escritura', N'Habilitado')
INSERT [dbo].[Devolucion] ([Codigo_dev], [Codigo_pre], [Codigo_usu_emp], [Fecha_dev]) VALUES (N'DEV001', N'PRE002', N'USU003', CAST(0xC8380B00 AS Date))
INSERT [dbo].[Devolucion] ([Codigo_dev], [Codigo_pre], [Codigo_usu_emp], [Fecha_dev]) VALUES (N'DEV002', N'PRE003', N'USU003', CAST(0xC8380B00 AS Date))
INSERT [dbo].[Devolucion] ([Codigo_dev], [Codigo_pre], [Codigo_usu_emp], [Fecha_dev]) VALUES (N'DEV003', N'PRE004', N'USU003', CAST(0xC8380B00 AS Date))
INSERT [dbo].[Devolucion] ([Codigo_dev], [Codigo_pre], [Codigo_usu_emp], [Fecha_dev]) VALUES (N'DEV004', N'PRE005', N'USU003', CAST(0xC8380B00 AS Date))
INSERT [dbo].[Devolucion] ([Codigo_dev], [Codigo_pre], [Codigo_usu_emp], [Fecha_dev]) VALUES (N'DEV005', N'PRE006', N'USU003', CAST(0xC8380B00 AS Date))
INSERT [dbo].[Devolucion] ([Codigo_dev], [Codigo_pre], [Codigo_usu_emp], [Fecha_dev]) VALUES (N'DEV006', N'PRE007', N'USU003', CAST(0xC8380B00 AS Date))
INSERT [dbo].[Devolucion] ([Codigo_dev], [Codigo_pre], [Codigo_usu_emp], [Fecha_dev]) VALUES (N'DEV007', N'PRE008', N'USU003', CAST(0xC8380B00 AS Date))
INSERT [dbo].[DPrestamo] ([Codigo_pre], [Codigo_lib]) VALUES (N'PRE002', N'LIB003')
INSERT [dbo].[DPrestamo] ([Codigo_pre], [Codigo_lib]) VALUES (N'PRE002', N'LIB001')
INSERT [dbo].[DPrestamo] ([Codigo_pre], [Codigo_lib]) VALUES (N'PRE002', N'LIB002')
INSERT [dbo].[DPrestamo] ([Codigo_pre], [Codigo_lib]) VALUES (N'PRE004', N'LIB001')
INSERT [dbo].[DPrestamo] ([Codigo_pre], [Codigo_lib]) VALUES (N'PRE003', N'LIB001')
INSERT [dbo].[DPrestamo] ([Codigo_pre], [Codigo_lib]) VALUES (N'PRE005', N'LIB002')
INSERT [dbo].[DPrestamo] ([Codigo_pre], [Codigo_lib]) VALUES (N'PRE005', N'LIB003')
INSERT [dbo].[DPrestamo] ([Codigo_pre], [Codigo_lib]) VALUES (N'PRE006', N'LIB001')
INSERT [dbo].[DPrestamo] ([Codigo_pre], [Codigo_lib]) VALUES (N'PRE006', N'LIB002')
INSERT [dbo].[DPrestamo] ([Codigo_pre], [Codigo_lib]) VALUES (N'PRE006', N'LIB003')
INSERT [dbo].[DPrestamo] ([Codigo_pre], [Codigo_lib]) VALUES (N'PRE007', N'LIB001')
INSERT [dbo].[DPrestamo] ([Codigo_pre], [Codigo_lib]) VALUES (N'PRE008', N'LIB003')
INSERT [dbo].[Editores] ([Codigo_edi], [Nom_edi], [Direccion], [Estado_Edi]) VALUES (N'EDI001', N'Olmedo', N'Urb California Lt 25', N'Habilitado')
INSERT [dbo].[Editores] ([Codigo_edi], [Nom_edi], [Direccion], [Estado_Edi]) VALUES (N'EDI002', N'Solutions', N'Huanchaco Lt 1220 Mz LL Urb.', N'Habilitado')
INSERT [dbo].[Editores] ([Codigo_edi], [Nom_edi], [Direccion], [Estado_Edi]) VALUES (N'EDI003', N'Imprenta Castillo', N'Lima sur', N'Habilitado')
INSERT [dbo].[Editores] ([Codigo_edi], [Nom_edi], [Direccion], [Estado_Edi]) VALUES (N'EDI004', N'Printer par', N'Av. gran chimu 124', N'Habilitado')
INSERT [dbo].[Editores] ([Codigo_edi], [Nom_edi], [Direccion], [Estado_Edi]) VALUES (N'EDI005', N'Cimatec', N'Jr. wiracocha 120', N'Habilitado')
INSERT [dbo].[Editores] ([Codigo_edi], [Nom_edi], [Direccion], [Estado_Edi]) VALUES (N'EDI006', N'EFM', N'Av. Pershing 740', N'Habilitado')
INSERT [dbo].[Editores] ([Codigo_edi], [Nom_edi], [Direccion], [Estado_Edi]) VALUES (N'EDI007', N'Murdoch', N'Ramon Zavala 352', N'Habilitado')
INSERT [dbo].[Editores] ([Codigo_edi], [Nom_edi], [Direccion], [Estado_Edi]) VALUES (N'EDI008', N'Icom', N'Av. guzman blanco 542', N'Habilitado')
INSERT [dbo].[Editores] ([Codigo_edi], [Nom_edi], [Direccion], [Estado_Edi]) VALUES (N'EDI009', N'Frio Mercantil', N'Av. la marina 420', N'Habilitado')
INSERT [dbo].[Editores] ([Codigo_edi], [Nom_edi], [Direccion], [Estado_Edi]) VALUES (N'EDI010', N'MyS', N'Av. lima sn camp. atocongo', N'Habilitado')
INSERT [dbo].[Entrega] ([Codigo_ent], [Codigo_pre], [Codigo_usu_emp], [Fecha_ent]) VALUES (N'ENT001', N'PRE002', N'USU003', CAST(0xC8380B00 AS Date))
INSERT [dbo].[Entrega] ([Codigo_ent], [Codigo_pre], [Codigo_usu_emp], [Fecha_ent]) VALUES (N'ENT002', N'PRE004', N'USU003', CAST(0xC8380B00 AS Date))
INSERT [dbo].[Entrega] ([Codigo_ent], [Codigo_pre], [Codigo_usu_emp], [Fecha_ent]) VALUES (N'ENT003', N'PRE005', N'USU003', CAST(0xC8380B00 AS Date))
INSERT [dbo].[Entrega] ([Codigo_ent], [Codigo_pre], [Codigo_usu_emp], [Fecha_ent]) VALUES (N'ENT004', N'PRE006', N'USU003', CAST(0xC8380B00 AS Date))
INSERT [dbo].[Entrega] ([Codigo_ent], [Codigo_pre], [Codigo_usu_emp], [Fecha_ent]) VALUES (N'ENT005', N'PRE007', N'USU003', CAST(0xC8380B00 AS Date))
INSERT [dbo].[Entrega] ([Codigo_ent], [Codigo_pre], [Codigo_usu_emp], [Fecha_ent]) VALUES (N'ENT006', N'PRE008', N'USU003', CAST(0xC8380B00 AS Date))
INSERT [dbo].[Generador] ([Parametro], [Ultimo], [Abreviatura], [Caracteres]) VALUES (N'Autores', 8, N'Aut', 6)
INSERT [dbo].[Generador] ([Parametro], [Ultimo], [Abreviatura], [Caracteres]) VALUES (N'Categoria', 8, N'Cat', 6)
INSERT [dbo].[Generador] ([Parametro], [Ultimo], [Abreviatura], [Caracteres]) VALUES (N'Devolucion', 7, N'Dev', 6)
INSERT [dbo].[Generador] ([Parametro], [Ultimo], [Abreviatura], [Caracteres]) VALUES (N'Editores', 10, N'Edi', 6)
INSERT [dbo].[Generador] ([Parametro], [Ultimo], [Abreviatura], [Caracteres]) VALUES (N'Entrega', 6, N'Ent', 6)
INSERT [dbo].[Generador] ([Parametro], [Ultimo], [Abreviatura], [Caracteres]) VALUES (N'Libros', 25, N'Lib', 6)
INSERT [dbo].[Generador] ([Parametro], [Ultimo], [Abreviatura], [Caracteres]) VALUES (N'Prestamo', 8, N'Pre', 6)
INSERT [dbo].[Generador] ([Parametro], [Ultimo], [Abreviatura], [Caracteres]) VALUES (N'Sancion', 0, N'San', 6)
INSERT [dbo].[Generador] ([Parametro], [Ultimo], [Abreviatura], [Caracteres]) VALUES (N'Usuario', 16, N'Usu', 6)
INSERT [dbo].[Libros] ([Codigo_lib], [Codigo_aut], [Codigo_edi], [Codigo_gen], [Estado_Libros], [Ejemplares_lib], [Titulo_lib], [Decripcion_lib], [Imagen_lib], [Observaciones], [Stock]) VALUES (N'LIB001', N'AUT001', N'EDI001', N'CAT003', N'Habilitado', 3, N'How Program Java', N'Libros de programacion', N'LIB001.jpg', N'Ninguna', 3)
INSERT [dbo].[Libros] ([Codigo_lib], [Codigo_aut], [Codigo_edi], [Codigo_gen], [Estado_Libros], [Ejemplares_lib], [Titulo_lib], [Decripcion_lib], [Imagen_lib], [Observaciones], [Stock]) VALUES (N'LIB002', N'AUT001', N'EDI001', N'CAT003', N'Habilitado', 2, N'Php', N'Libro de programacion', N'LIB002.jpg', N'Ninguna', 2)
INSERT [dbo].[Libros] ([Codigo_lib], [Codigo_aut], [Codigo_edi], [Codigo_gen], [Estado_Libros], [Ejemplares_lib], [Titulo_lib], [Decripcion_lib], [Imagen_lib], [Observaciones], [Stock]) VALUES (N'LIB003', N'AUT005', N'EDI008', N'CAT003', N'Habilitado', 4, N'Linux', N'Libros de programacion', N'LIB003.jpg', N'Ninguna', 8)
INSERT [dbo].[Libros] ([Codigo_lib], [Codigo_aut], [Codigo_edi], [Codigo_gen], [Estado_Libros], [Ejemplares_lib], [Titulo_lib], [Decripcion_lib], [Imagen_lib], [Observaciones], [Stock]) VALUES (N'LIB004', N'AUT002', N'EDI003', N'CAT003', N'Habilitado', 2, N'Php Y Msql', N'Libros de programacion', N'LIB004.png', N'Ninguna', 2)
INSERT [dbo].[Libros] ([Codigo_lib], [Codigo_aut], [Codigo_edi], [Codigo_gen], [Estado_Libros], [Ejemplares_lib], [Titulo_lib], [Decripcion_lib], [Imagen_lib], [Observaciones], [Stock]) VALUES (N'LIB005', N'AUT005', N'EDI004', N'CAT003', N'Habilitado', 3, N'C++', N'Libros de programacion', N'LIB005.jpg', N'Programacion', 3)
INSERT [dbo].[Libros] ([Codigo_lib], [Codigo_aut], [Codigo_edi], [Codigo_gen], [Estado_Libros], [Ejemplares_lib], [Titulo_lib], [Decripcion_lib], [Imagen_lib], [Observaciones], [Stock]) VALUES (N'LIB006', N'AUT005', N'EDI004', N'CAT003', N'Habilitado', 1, N'Sistemas operativos', N'Libros de programacion', N'LIB006.jpg', N'Programacion', 1)
INSERT [dbo].[Libros] ([Codigo_lib], [Codigo_aut], [Codigo_edi], [Codigo_gen], [Estado_Libros], [Ejemplares_lib], [Titulo_lib], [Decripcion_lib], [Imagen_lib], [Observaciones], [Stock]) VALUES (N'LIB007', N'AUT005', N'EDI007', N'CAT003', N'Habilitado', 4, N'Asp .net', N'Libros de programacion', N'LIB007.jpg', N'Programacion', 4)
INSERT [dbo].[Libros] ([Codigo_lib], [Codigo_aut], [Codigo_edi], [Codigo_gen], [Estado_Libros], [Ejemplares_lib], [Titulo_lib], [Decripcion_lib], [Imagen_lib], [Observaciones], [Stock]) VALUES (N'LIB008', N'AUT005', N'EDI004', N'CAT003', N'Habilitado', 2, N'Base de Datos', N'Libros de programacion', N'LIB008.jpg', N'Programacion', 2)
INSERT [dbo].[Libros] ([Codigo_lib], [Codigo_aut], [Codigo_edi], [Codigo_gen], [Estado_Libros], [Ejemplares_lib], [Titulo_lib], [Decripcion_lib], [Imagen_lib], [Observaciones], [Stock]) VALUES (N'LIB009', N'AUT003', N'EDI003', N'CAT001', N'Habilitado', 4, N'Mat Avan', N'Libros', N'LIB009.jpg', N'Ninguna', 4)
INSERT [dbo].[Libros] ([Codigo_lib], [Codigo_aut], [Codigo_edi], [Codigo_gen], [Estado_Libros], [Ejemplares_lib], [Titulo_lib], [Decripcion_lib], [Imagen_lib], [Observaciones], [Stock]) VALUES (N'LIB010', N'AUT005', N'EDI003', N'CAT001', N'Habilitado', 2, N'Matematica', N'Libros', N'LIB010.jpg', N'Libros', 2)
INSERT [dbo].[Libros] ([Codigo_lib], [Codigo_aut], [Codigo_edi], [Codigo_gen], [Estado_Libros], [Ejemplares_lib], [Titulo_lib], [Decripcion_lib], [Imagen_lib], [Observaciones], [Stock]) VALUES (N'LIB011', N'AUT007', N'EDI005', N'CAT001', N'Habilitado', 1, N'Algebra', N'libros', N'LIB011.jpg', N'Ninguna', 1)
INSERT [dbo].[Libros] ([Codigo_lib], [Codigo_aut], [Codigo_edi], [Codigo_gen], [Estado_Libros], [Ejemplares_lib], [Titulo_lib], [Decripcion_lib], [Imagen_lib], [Observaciones], [Stock]) VALUES (N'LIB012', N'AUT004', N'EDI007', N'CAT001', N'Habilitado', 1, N'Mat Teoria', N'Libros', N'LIB012.jpg', N'Ninguna', 1)
INSERT [dbo].[Libros] ([Codigo_lib], [Codigo_aut], [Codigo_edi], [Codigo_gen], [Estado_Libros], [Ejemplares_lib], [Titulo_lib], [Decripcion_lib], [Imagen_lib], [Observaciones], [Stock]) VALUES (N'LIB013', N'AUT006', N'EDI006', N'CAT001', N'Habilitado', 2, N'Analisis', N'Libros', N'LIB013.jpg', N'Ninguna', 2)
INSERT [dbo].[Libros] ([Codigo_lib], [Codigo_aut], [Codigo_edi], [Codigo_gen], [Estado_Libros], [Ejemplares_lib], [Titulo_lib], [Decripcion_lib], [Imagen_lib], [Observaciones], [Stock]) VALUES (N'LIB014', N'AUT006', N'EDI006', N'CAT002', N'Habilitado', 3, N'Final', N'Libros', N'LIB014.jpg', N'Ninguna', 3)
INSERT [dbo].[Libros] ([Codigo_lib], [Codigo_aut], [Codigo_edi], [Codigo_gen], [Estado_Libros], [Ejemplares_lib], [Titulo_lib], [Decripcion_lib], [Imagen_lib], [Observaciones], [Stock]) VALUES (N'LIB015', N'AUT004', N'EDI007', N'CAT002', N'Habilitado', 1, N'P Posisitva', N'Libros', N'LIB015.jpg', N'Ninguna', 1)
INSERT [dbo].[Libros] ([Codigo_lib], [Codigo_aut], [Codigo_edi], [Codigo_gen], [Estado_Libros], [Ejemplares_lib], [Titulo_lib], [Decripcion_lib], [Imagen_lib], [Observaciones], [Stock]) VALUES (N'LIB016', N'AUT008', N'EDI007', N'CAT002', N'Habilitado', 3, N'Psiclogia', N'Libros', N'LIB016.jpg', N'Ninguna', 3)
INSERT [dbo].[Libros] ([Codigo_lib], [Codigo_aut], [Codigo_edi], [Codigo_gen], [Estado_Libros], [Ejemplares_lib], [Titulo_lib], [Decripcion_lib], [Imagen_lib], [Observaciones], [Stock]) VALUES (N'LIB017', N'AUT005', N'EDI005', N'CAT004', N'Habilitado', 1, N'Irresistibles', N'Libros', N'LIB017.jpg', N'Ninguna', 1)
INSERT [dbo].[Libros] ([Codigo_lib], [Codigo_aut], [Codigo_edi], [Codigo_gen], [Estado_Libros], [Ejemplares_lib], [Titulo_lib], [Decripcion_lib], [Imagen_lib], [Observaciones], [Stock]) VALUES (N'LIB018', N'AUT006', N'EDI005', N'CAT004', N'Habilitado', 3, N'Sympson', N'libros', N'LIB018.jpg', N'Ninguna', 3)
INSERT [dbo].[Libros] ([Codigo_lib], [Codigo_aut], [Codigo_edi], [Codigo_gen], [Estado_Libros], [Ejemplares_lib], [Titulo_lib], [Decripcion_lib], [Imagen_lib], [Observaciones], [Stock]) VALUES (N'LIB019', N'AUT006', N'EDI004', N'CAT005', N'Habilitado', 2, N'Arte', N'Libros', N'LIB019.jpg', N'Ninguna', 2)
INSERT [dbo].[Libros] ([Codigo_lib], [Codigo_aut], [Codigo_edi], [Codigo_gen], [Estado_Libros], [Ejemplares_lib], [Titulo_lib], [Decripcion_lib], [Imagen_lib], [Observaciones], [Stock]) VALUES (N'LIB020', N'AUT006', N'EDI004', N'CAT005', N'Habilitado', 2, N'Piano', N'Libros', N'LIB020.jpg', N'Ninguna', 2)
INSERT [dbo].[Libros] ([Codigo_lib], [Codigo_aut], [Codigo_edi], [Codigo_gen], [Estado_Libros], [Ejemplares_lib], [Titulo_lib], [Decripcion_lib], [Imagen_lib], [Observaciones], [Stock]) VALUES (N'LIB021', N'AUT006', N'EDI006', N'CAT005', N'Habilitado', 1, N'Guit Electrica', N'Libros', N'LIB021.jpg', N'Ninguna', 1)
INSERT [dbo].[Libros] ([Codigo_lib], [Codigo_aut], [Codigo_edi], [Codigo_gen], [Estado_Libros], [Ejemplares_lib], [Titulo_lib], [Decripcion_lib], [Imagen_lib], [Observaciones], [Stock]) VALUES (N'LIB022', N'AUT005', N'EDI005', N'CAT006', N'Habilitado', 1, N'Destinado', N'Libros', N'LIB022.jpg', N'Ninguna', 1)
INSERT [dbo].[Libros] ([Codigo_lib], [Codigo_aut], [Codigo_edi], [Codigo_gen], [Estado_Libros], [Ejemplares_lib], [Titulo_lib], [Decripcion_lib], [Imagen_lib], [Observaciones], [Stock]) VALUES (N'LIB023', N'AUT008', N'EDI006', N'CAT006', N'Habilitado', 2, N'Jesus', N'Libros', N'LIB023.jpg', N'Ninguna', 2)
INSERT [dbo].[Libros] ([Codigo_lib], [Codigo_aut], [Codigo_edi], [Codigo_gen], [Estado_Libros], [Ejemplares_lib], [Titulo_lib], [Decripcion_lib], [Imagen_lib], [Observaciones], [Stock]) VALUES (N'LIB024', N'AUT005', N'EDI004', N'CAT007', N'Habilitado', 1, N'Politica', N'Libros', N'LIB024.jpg', N'Ninguna', 1)
INSERT [dbo].[Libros] ([Codigo_lib], [Codigo_aut], [Codigo_edi], [Codigo_gen], [Estado_Libros], [Ejemplares_lib], [Titulo_lib], [Decripcion_lib], [Imagen_lib], [Observaciones], [Stock]) VALUES (N'LIB025', N'AUT003', N'EDI003', N'CAT008', N'Habilitado', 3, N'Infantill', N'Libros', N'LIB025.jpg', N'Ninguna', 3)
INSERT [dbo].[Prestamo] ([Codigo_pre], [Codigo_usu_lector], [Estado_Prestamo], [Fecha_prestamo], [FechaLimite_devolucion]) VALUES (N'PRE001', N'USU002', N'Devuelto', CAST(0xC8380B00 AS Date), CAST(0xCB380B00 AS Date))
INSERT [dbo].[Prestamo] ([Codigo_pre], [Codigo_usu_lector], [Estado_Prestamo], [Fecha_prestamo], [FechaLimite_devolucion]) VALUES (N'PRE002', N'USU013', N'Devuelto', CAST(0xC8380B00 AS Date), CAST(0xCB380B00 AS Date))
INSERT [dbo].[Prestamo] ([Codigo_pre], [Codigo_usu_lector], [Estado_Prestamo], [Fecha_prestamo], [FechaLimite_devolucion]) VALUES (N'PRE003', N'USU014', N'Devuelto', CAST(0xC8380B00 AS Date), CAST(0xCB380B00 AS Date))
INSERT [dbo].[Prestamo] ([Codigo_pre], [Codigo_usu_lector], [Estado_Prestamo], [Fecha_prestamo], [FechaLimite_devolucion]) VALUES (N'PRE004', N'USU013', N'Devuelto', CAST(0xC8380B00 AS Date), CAST(0xCB380B00 AS Date))
INSERT [dbo].[Prestamo] ([Codigo_pre], [Codigo_usu_lector], [Estado_Prestamo], [Fecha_prestamo], [FechaLimite_devolucion]) VALUES (N'PRE005', N'USU015', N'Devuelto', CAST(0xC8380B00 AS Date), CAST(0xCB380B00 AS Date))
INSERT [dbo].[Prestamo] ([Codigo_pre], [Codigo_usu_lector], [Estado_Prestamo], [Fecha_prestamo], [FechaLimite_devolucion]) VALUES (N'PRE006', N'USU015', N'Devuelto', CAST(0xC8380B00 AS Date), CAST(0xCB380B00 AS Date))
INSERT [dbo].[Prestamo] ([Codigo_pre], [Codigo_usu_lector], [Estado_Prestamo], [Fecha_prestamo], [FechaLimite_devolucion]) VALUES (N'PRE007', N'USU013', N'Devuelto', CAST(0xC8380B00 AS Date), CAST(0xCB380B00 AS Date))
INSERT [dbo].[Prestamo] ([Codigo_pre], [Codigo_usu_lector], [Estado_Prestamo], [Fecha_prestamo], [FechaLimite_devolucion]) VALUES (N'PRE008', N'USU015', N'Devuelto', CAST(0xC8380B00 AS Date), CAST(0xCB380B00 AS Date))
INSERT [dbo].[Usuario] ([Codigo_usu], [DocumentoDeIdentidad], [Psw_sesesion_us], [Nombres_usu], [ApellidosPaterno_usu], [ApellidosMaterno_usu], [Telelefono_usu], [Direccion_usu], [CorreoElectronico_usu], [Fecha_registro_usu], [Facha_nac_usu], [Estado_Usuario], [Tipo_usu], [Imagen], [Nombres_sesison_usu]) VALUES (N'USU001', N'87654321', N'135246', N'MiguelCM', N'Campos', N'Morales', N'26-2489', N'Alto trujillo', N'andrescmp18@hotmail.com', CAST(0xD2380B00 AS Date), CAST(0x241B0B00 AS Date), N'Habilitado', N'Administrador', N'default.png', N'admin')
INSERT [dbo].[Usuario] ([Codigo_usu], [DocumentoDeIdentidad], [Psw_sesesion_us], [Nombres_usu], [ApellidosPaterno_usu], [ApellidosMaterno_usu], [Telelefono_usu], [Direccion_usu], [CorreoElectronico_usu], [Fecha_registro_usu], [Facha_nac_usu], [Estado_Usuario], [Tipo_usu], [Imagen], [Nombres_sesison_usu]) VALUES (N'USU002', N'87654321', N'246135', N'JulioBB', N'Briceño', N'Briceño', N'28-2568', N'Alto trujillo', N'andrescmp18@hotmail.com', CAST(0xD2380B00 AS Date), CAST(0x241B0B00 AS Date), N'Habilitado', N'Lector', N'default.png', N'jbriceno')
INSERT [dbo].[Usuario] ([Codigo_usu], [DocumentoDeIdentidad], [Psw_sesesion_us], [Nombres_usu], [ApellidosPaterno_usu], [ApellidosMaterno_usu], [Telelefono_usu], [Direccion_usu], [CorreoElectronico_usu], [Fecha_registro_usu], [Facha_nac_usu], [Estado_Usuario], [Tipo_usu], [Imagen], [Nombres_sesison_usu]) VALUES (N'USU003', N'87654321', N'123456', N'PierRC', N'Reyes', N'Castillo', N'45-2568', N'Alto trujillo', N'andrescmp18@hotmail.com', CAST(0xD2380B00 AS Date), CAST(0x241B0B00 AS Date), N'Habilitado', N'Bibliotecario', NULL, N'Bibliotecario')
INSERT [dbo].[Usuario] ([Codigo_usu], [DocumentoDeIdentidad], [Psw_sesesion_us], [Nombres_usu], [ApellidosPaterno_usu], [ApellidosMaterno_usu], [Telelefono_usu], [Direccion_usu], [CorreoElectronico_usu], [Fecha_registro_usu], [Facha_nac_usu], [Estado_Usuario], [Tipo_usu], [Imagen], [Nombres_sesison_usu]) VALUES (N'USU004', N'12345678', N'1234', N'AndresZG', N'Zavaleta', N'Gomez', N'12-3589', N'Alto trujillo', N'cmo18@hotmail.com', CAST(0xC7380B00 AS Date), CAST(0xC1380B00 AS Date), N'Habilitado', N'Lector', N'default.jpg', N'azavaleta')
INSERT [dbo].[Usuario] ([Codigo_usu], [DocumentoDeIdentidad], [Psw_sesesion_us], [Nombres_usu], [ApellidosPaterno_usu], [ApellidosMaterno_usu], [Telelefono_usu], [Direccion_usu], [CorreoElectronico_usu], [Fecha_registro_usu], [Facha_nac_usu], [Estado_Usuario], [Tipo_usu], [Imagen], [Nombres_sesison_usu]) VALUES (N'USU005', N'12345678', N'123', N'KaterineGC', N'Gonzales', N'Chavez', N'36-9856', N'21', N'andr@hotmail.com', CAST(0xC7380B00 AS Date), CAST(0xB9380B00 AS Date), N'Habilitado', N'Lector', N'USU005.jpg', N'User123')
INSERT [dbo].[Usuario] ([Codigo_usu], [DocumentoDeIdentidad], [Psw_sesesion_us], [Nombres_usu], [ApellidosPaterno_usu], [ApellidosMaterno_usu], [Telelefono_usu], [Direccion_usu], [CorreoElectronico_usu], [Fecha_registro_usu], [Facha_nac_usu], [Estado_Usuario], [Tipo_usu], [Imagen], [Nombres_sesison_usu]) VALUES (N'USU006', N'78956854', N'123', N'BrendaGS', N'Guitierrez', N'Solorzano', N'12-3564', N'21', N'andp18@hotmail.com', CAST(0xC7380B00 AS Date), CAST(0x1D390B00 AS Date), N'Habilitado', N'Lector', N'default.png', N'12')
INSERT [dbo].[Usuario] ([Codigo_usu], [DocumentoDeIdentidad], [Psw_sesesion_us], [Nombres_usu], [ApellidosPaterno_usu], [ApellidosMaterno_usu], [Telelefono_usu], [Direccion_usu], [CorreoElectronico_usu], [Fecha_registro_usu], [Facha_nac_usu], [Estado_Usuario], [Tipo_usu], [Imagen], [Nombres_sesison_usu]) VALUES (N'USU007', N'12546824', N'123', N'EduardoSV', N'Santos', N'Valderrama', N'45-2568', N'21', N'andp12212@hotmail.com', CAST(0xC7380B00 AS Date), CAST(0x1D390B00 AS Date), N'Habilitado', N'Lector', N'default.png', N'122')
INSERT [dbo].[Usuario] ([Codigo_usu], [DocumentoDeIdentidad], [Psw_sesesion_us], [Nombres_usu], [ApellidosPaterno_usu], [ApellidosMaterno_usu], [Telelefono_usu], [Direccion_usu], [CorreoElectronico_usu], [Fecha_registro_usu], [Facha_nac_usu], [Estado_Usuario], [Tipo_usu], [Imagen], [Nombres_sesison_usu]) VALUES (N'USU008', N'10427854', N'1233', N'MarisolBM', N'Blass', N'Mendoza', N'42-2568', N'sdds', N'assscmp18@hotmail.com', CAST(0xC7380B00 AS Date), CAST(0xC5380B00 AS Date), N'Habilitado', N'Lector', N'default.png', N'123456')
INSERT [dbo].[Usuario] ([Codigo_usu], [DocumentoDeIdentidad], [Psw_sesesion_us], [Nombres_usu], [ApellidosPaterno_usu], [ApellidosMaterno_usu], [Telelefono_usu], [Direccion_usu], [CorreoElectronico_usu], [Fecha_registro_usu], [Facha_nac_usu], [Estado_Usuario], [Tipo_usu], [Imagen], [Nombres_sesison_usu]) VALUES (N'USU009', N'24685758', N'@ht123', N'Javier', N'Sanchez', N'Fernandez', N'24-2589', N'12', N'andre8@hotmail.com', CAST(0xC7380B00 AS Date), CAST(0x1D390B00 AS Date), N'Habilitado', N'Lector', N'default.jpg', N'aminsanchez')
INSERT [dbo].[Usuario] ([Codigo_usu], [DocumentoDeIdentidad], [Psw_sesesion_us], [Nombres_usu], [ApellidosPaterno_usu], [ApellidosMaterno_usu], [Telelefono_usu], [Direccion_usu], [CorreoElectronico_usu], [Fecha_registro_usu], [Facha_nac_usu], [Estado_Usuario], [Tipo_usu], [Imagen], [Nombres_sesison_usu]) VALUES (N'USU010', N'12345678', N'Ninguno', N'andres', N'campos', N'morales', N'123', N'123', N'Miguelito@hotmail.com', CAST(0xC7380B00 AS Date), CAST(0xC5380B00 AS Date), N'Habilitado', N'Lector', N'default.png', N'User123456')
INSERT [dbo].[Usuario] ([Codigo_usu], [DocumentoDeIdentidad], [Psw_sesesion_us], [Nombres_usu], [ApellidosPaterno_usu], [ApellidosMaterno_usu], [Telelefono_usu], [Direccion_usu], [CorreoElectronico_usu], [Fecha_registro_usu], [Facha_nac_usu], [Estado_Usuario], [Tipo_usu], [Imagen], [Nombres_sesison_usu]) VALUES (N'USU011', N'12345678', N'123', N'andres', N'campos', N'morales', N'andres', N'trujllo', N'User200@hotmail.com', CAST(0xC7380B00 AS Date), CAST(0x1D390B00 AS Date), N'Habilitado', N'Lector', N'default.png', N'User200')
INSERT [dbo].[Usuario] ([Codigo_usu], [DocumentoDeIdentidad], [Psw_sesesion_us], [Nombres_usu], [ApellidosPaterno_usu], [ApellidosMaterno_usu], [Telelefono_usu], [Direccion_usu], [CorreoElectronico_usu], [Fecha_registro_usu], [Facha_nac_usu], [Estado_Usuario], [Tipo_usu], [Imagen], [Nombres_sesison_usu]) VALUES (N'USU012', N'12345678', N'12', N'juli', N'perez', N'salinas', N'319912', N'Alto trujillo', N'Perez@hotmail.com', CAST(0xC8380B00 AS Date), CAST(0xBF380B00 AS Date), N'Habilitado', N'Lector', N'default.png', N'Masdeuno')
INSERT [dbo].[Usuario] ([Codigo_usu], [DocumentoDeIdentidad], [Psw_sesesion_us], [Nombres_usu], [ApellidosPaterno_usu], [ApellidosMaterno_usu], [Telelefono_usu], [Direccion_usu], [CorreoElectronico_usu], [Fecha_registro_usu], [Facha_nac_usu], [Estado_Usuario], [Tipo_usu], [Imagen], [Nombres_sesison_usu]) VALUES (N'USU013', N'76555602', N'123', N'andres', N'BriceÃ±o', N'BriceÃ±o', N'98754852', N'trujillo', N'juliocesar_set85@outlook.com', CAST(0xC8380B00 AS Date), CAST(0xBC380B00 AS Date), N'Habilitado', N'Lector', N'default.png', N'Julio')
INSERT [dbo].[Usuario] ([Codigo_usu], [DocumentoDeIdentidad], [Psw_sesesion_us], [Nombres_usu], [ApellidosPaterno_usu], [ApellidosMaterno_usu], [Telelefono_usu], [Direccion_usu], [CorreoElectronico_usu], [Fecha_registro_usu], [Facha_nac_usu], [Estado_Usuario], [Tipo_usu], [Imagen], [Nombres_sesison_usu]) VALUES (N'USU014', N'1234    ', N'123', N'joel', N'arteaga', N'burga', N'31212', N'trujillo', N'joel@hotmail.com', CAST(0xC8380B00 AS Date), CAST(0x5B950A00 AS Date), N'Habilitado', N'Lector', N'default.png', N'joel')
INSERT [dbo].[Usuario] ([Codigo_usu], [DocumentoDeIdentidad], [Psw_sesesion_us], [Nombres_usu], [ApellidosPaterno_usu], [ApellidosMaterno_usu], [Telelefono_usu], [Direccion_usu], [CorreoElectronico_usu], [Fecha_registro_usu], [Facha_nac_usu], [Estado_Usuario], [Tipo_usu], [Imagen], [Nombres_sesison_usu]) VALUES (N'USU015', N'43199122', N'123', N'Carlos', N'Perez ', N'Sanhez', N'235685', N'Av. Union 256', N'juliocesar_set@outlook.com', CAST(0xC8380B00 AS Date), CAST(0xC8380B00 AS Date), N'Habilitado', N'Lector', N'default.png', N'CarlosP')
INSERT [dbo].[Usuario] ([Codigo_usu], [DocumentoDeIdentidad], [Psw_sesesion_us], [Nombres_usu], [ApellidosPaterno_usu], [ApellidosMaterno_usu], [Telelefono_usu], [Direccion_usu], [CorreoElectronico_usu], [Fecha_registro_usu], [Facha_nac_usu], [Estado_Usuario], [Tipo_usu], [Imagen], [Nombres_sesison_usu]) VALUES (N'USU016', N'45689526', N'123', N'Lucia', N'Perez', N'Barreto', N'24-5628', N'Jiron Ancash NÂº 258', N'lucia@gmail.com', CAST(0xC8380B00 AS Date), CAST(0xC8380B00 AS Date), N'Habilitado', N'Lector', N'default.png', N'LuciaP')
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_Generador]    Script Date: 30/05/2015 8:42:39 ******/
ALTER TABLE [dbo].[Generador] ADD  CONSTRAINT [PK_Generador] PRIMARY KEY NONCLUSTERED 
(
	[Parametro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Autores] ADD  DEFAULT ('Habilitado') FOR [Estado_aut]
GO
ALTER TABLE [dbo].[Categoria] ADD  DEFAULT ('Habilitado') FOR [Estado_Cat]
GO
ALTER TABLE [dbo].[Editores] ADD  DEFAULT ('Habilitado') FOR [Estado_Edi]
GO
ALTER TABLE [dbo].[Libros] ADD  DEFAULT ('Habilitado') FOR [Estado_Libros]
GO
ALTER TABLE [dbo].[Prestamo] ADD  DEFAULT ('En canasta') FOR [Estado_Prestamo]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ('Habilitado') FOR [Estado_Usuario]
GO
ALTER TABLE [dbo].[Devolucion]  WITH CHECK ADD  CONSTRAINT [Codigo_pre_DevolucionFK] FOREIGN KEY([Codigo_pre])
REFERENCES [dbo].[Prestamo] ([Codigo_pre])
GO
ALTER TABLE [dbo].[Devolucion] CHECK CONSTRAINT [Codigo_pre_DevolucionFK]
GO
ALTER TABLE [dbo].[Devolucion]  WITH CHECK ADD  CONSTRAINT [Codigo_usu_empDevolucionFK] FOREIGN KEY([Codigo_usu_emp])
REFERENCES [dbo].[Usuario] ([Codigo_usu])
GO
ALTER TABLE [dbo].[Devolucion] CHECK CONSTRAINT [Codigo_usu_empDevolucionFK]
GO
ALTER TABLE [dbo].[DPrestamo]  WITH CHECK ADD  CONSTRAINT [FK_DPrestamo_Libro] FOREIGN KEY([Codigo_lib])
REFERENCES [dbo].[Libros] ([Codigo_lib])
GO
ALTER TABLE [dbo].[DPrestamo] CHECK CONSTRAINT [FK_DPrestamo_Libro]
GO
ALTER TABLE [dbo].[Entrega]  WITH CHECK ADD  CONSTRAINT [Codigo_pre_EntregaFK] FOREIGN KEY([Codigo_pre])
REFERENCES [dbo].[Prestamo] ([Codigo_pre])
GO
ALTER TABLE [dbo].[Entrega] CHECK CONSTRAINT [Codigo_pre_EntregaFK]
GO
ALTER TABLE [dbo].[Entrega]  WITH CHECK ADD  CONSTRAINT [Codigo_usu_empEntregaFK] FOREIGN KEY([Codigo_usu_emp])
REFERENCES [dbo].[Usuario] ([Codigo_usu])
GO
ALTER TABLE [dbo].[Entrega] CHECK CONSTRAINT [Codigo_usu_empEntregaFK]
GO
ALTER TABLE [dbo].[Libros]  WITH CHECK ADD  CONSTRAINT [Codigo_aut_LibrosFK] FOREIGN KEY([Codigo_aut])
REFERENCES [dbo].[Autores] ([Codigo_aut])
GO
ALTER TABLE [dbo].[Libros] CHECK CONSTRAINT [Codigo_aut_LibrosFK]
GO
ALTER TABLE [dbo].[Libros]  WITH CHECK ADD  CONSTRAINT [Codigo_edi_LibrosFK] FOREIGN KEY([Codigo_edi])
REFERENCES [dbo].[Editores] ([Codigo_edi])
GO
ALTER TABLE [dbo].[Libros] CHECK CONSTRAINT [Codigo_edi_LibrosFK]
GO
ALTER TABLE [dbo].[Libros]  WITH CHECK ADD  CONSTRAINT [Codigo_gen_LibrosFK] FOREIGN KEY([Codigo_gen])
REFERENCES [dbo].[Categoria] ([Codigo_gen])
GO
ALTER TABLE [dbo].[Libros] CHECK CONSTRAINT [Codigo_gen_LibrosFK]
GO
ALTER TABLE [dbo].[Prestamo]  WITH CHECK ADD  CONSTRAINT [Codigo_usu_PrestamoFK] FOREIGN KEY([Codigo_usu_lector])
REFERENCES [dbo].[Usuario] ([Codigo_usu])
GO
ALTER TABLE [dbo].[Prestamo] CHECK CONSTRAINT [Codigo_usu_PrestamoFK]
GO
USE [master]
GO
ALTER DATABASE [ProBiblioteca] SET  READ_WRITE 
GO
