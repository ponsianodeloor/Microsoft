USE [master]
GO
/****** Object:  Database [Universidad]    Script Date: 12/6/2020 23:24:42 ******/
CREATE DATABASE [Universidad]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Universidad', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Universidad.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Universidad_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Universidad_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Universidad] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Universidad].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Universidad] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Universidad] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Universidad] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Universidad] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Universidad] SET ARITHABORT OFF 
GO
ALTER DATABASE [Universidad] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Universidad] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Universidad] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Universidad] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Universidad] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Universidad] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Universidad] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Universidad] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Universidad] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Universidad] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Universidad] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Universidad] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Universidad] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Universidad] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Universidad] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Universidad] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Universidad] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Universidad] SET RECOVERY FULL 
GO
ALTER DATABASE [Universidad] SET  MULTI_USER 
GO
ALTER DATABASE [Universidad] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Universidad] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Universidad] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Universidad] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Universidad] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Universidad', N'ON'
GO
ALTER DATABASE [Universidad] SET QUERY_STORE = OFF
GO
USE [Universidad]
GO
/****** Object:  Table [dbo].[alumnos]    Script Date: 12/6/2020 23:24:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[alumnos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[alumno_cedula] [varchar](50) NULL,
	[alumno_nombre] [varchar](50) NULL,
	[alumno_apellido] [varchar](50) NULL,
	[alumno_estado_civil] [varchar](50) NULL,
	[alumno_fdn] [date] NULL,
	[alumno_genero] [varchar](50) NULL,
	[alumno_telefono] [varchar](50) NULL,
	[alumno_email] [varchar](50) NULL,
	[alumno_direccion_1] [varchar](50) NULL,
	[alumno_direccion_2] [varchar](50) NULL,
 CONSTRAINT [PK_alumnos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[asignaturas]    Script Date: 12/6/2020 23:24:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[asignaturas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[asignatura_nombre] [varchar](50) NULL,
	[asignatura_unidad_valorativa] [int] NULL,
	[carrera_id] [int] NULL,
 CONSTRAINT [PK_asignaturas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[carreras]    Script Date: 12/6/2020 23:24:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carreras](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[carrera_nombre] [varchar](100) NULL,
	[carrera_codigo] [varchar](50) NULL,
 CONSTRAINT [PK_carreras] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[matricula_alumnos]    Script Date: 12/6/2020 23:24:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[matricula_alumnos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[periodo_id] [int] NULL,
	[carrera_id] [int] NULL,
	[alumno_id] [int] NULL,
	[matricula_alumno_fecha_matriculacion] [date] NULL,
 CONSTRAINT [PK_matricula_alumnos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[periodos]    Script Date: 12/6/2020 23:24:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[periodos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[periodo_nombre] [varchar](50) NULL,
	[periodo_fecha_inicio] [date] NULL,
	[periodo_fecha_final] [date] NULL,
 CONSTRAINT [PK_periodo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[profesores]    Script Date: 12/6/2020 23:24:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profesores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[profesor_cedula] [varchar](50) NULL,
	[profesor_nombres] [varchar](50) NULL,
	[profesor_apellidos] [varchar](50) NULL,
	[profesor_genero] [varchar](50) NULL,
	[profesor_email] [varchar](50) NULL,
	[profesor_celular] [varchar](50) NULL,
	[profesor_estado_civil] [varchar](50) NULL,
	[profesor_profesion] [varchar](50) NULL,
	[profesor_fecha_nacimiento] [date] NULL,
	[profesor_fecha_ingreso] [date] NULL,
 CONSTRAINT [PK_profesores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[profesores_asignaturas]    Script Date: 12/6/2020 23:24:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profesores_asignaturas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[profesor_id] [int] NULL,
	[asignatura_id] [int] NULL,
	[periodo_id] [int] NULL,
 CONSTRAINT [PK_profesores_asignaturas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[asignaturas]  WITH CHECK ADD  CONSTRAINT [FK_asignaturas_carreras] FOREIGN KEY([carrera_id])
REFERENCES [dbo].[carreras] ([id])
GO
ALTER TABLE [dbo].[asignaturas] CHECK CONSTRAINT [FK_asignaturas_carreras]
GO
ALTER TABLE [dbo].[matricula_alumnos]  WITH CHECK ADD  CONSTRAINT [FK_matricula_alumnos_alumnos] FOREIGN KEY([alumno_id])
REFERENCES [dbo].[alumnos] ([id])
GO
ALTER TABLE [dbo].[matricula_alumnos] CHECK CONSTRAINT [FK_matricula_alumnos_alumnos]
GO
ALTER TABLE [dbo].[matricula_alumnos]  WITH CHECK ADD  CONSTRAINT [FK_matricula_alumnos_carreras] FOREIGN KEY([carrera_id])
REFERENCES [dbo].[carreras] ([id])
GO
ALTER TABLE [dbo].[matricula_alumnos] CHECK CONSTRAINT [FK_matricula_alumnos_carreras]
GO
ALTER TABLE [dbo].[matricula_alumnos]  WITH CHECK ADD  CONSTRAINT [FK_matricula_alumnos_periodos] FOREIGN KEY([periodo_id])
REFERENCES [dbo].[periodos] ([id])
GO
ALTER TABLE [dbo].[matricula_alumnos] CHECK CONSTRAINT [FK_matricula_alumnos_periodos]
GO
ALTER TABLE [dbo].[profesores_asignaturas]  WITH CHECK ADD  CONSTRAINT [FK_profesores_asignaturas_periodos] FOREIGN KEY([periodo_id])
REFERENCES [dbo].[periodos] ([id])
GO
ALTER TABLE [dbo].[profesores_asignaturas] CHECK CONSTRAINT [FK_profesores_asignaturas_periodos]
GO
ALTER TABLE [dbo].[profesores_asignaturas]  WITH CHECK ADD  CONSTRAINT [FK_profesores_asignaturas_profesores] FOREIGN KEY([profesor_id])
REFERENCES [dbo].[profesores] ([id])
GO
ALTER TABLE [dbo].[profesores_asignaturas] CHECK CONSTRAINT [FK_profesores_asignaturas_profesores]
GO
ALTER TABLE [dbo].[profesores_asignaturas]  WITH CHECK ADD  CONSTRAINT [FK_profesores_asignaturas_profesores_asignaturas] FOREIGN KEY([asignatura_id])
REFERENCES [dbo].[asignaturas] ([id])
GO
ALTER TABLE [dbo].[profesores_asignaturas] CHECK CONSTRAINT [FK_profesores_asignaturas_profesores_asignaturas]
GO
USE [master]
GO
ALTER DATABASE [Universidad] SET  READ_WRITE 
GO
