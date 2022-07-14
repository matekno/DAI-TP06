USE [DAI-TP06]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO CREATE TABLE [dbo].[CALIFICACION](
		[ID] [int] IDENTITY(1, 1) NOT NULL,
		[FK_AUDIOVISUAL] [int] NOT NULL,
		[CALIFICACION] [tinyint] NOT NULL,
		CONSTRAINT [PK_CALIFICACION] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (
			PAD_INDEX = OFF,
			STATISTICS_NORECOMPUTE = OFF,
			IGNORE_DUP_KEY = OFF,
			ALLOW_ROW_LOCKS = ON,
			ALLOW_PAGE_LOCKS = ON
		) ON [PRIMARY]
	) ON [PRIMARY]
GO
	/****** Object:  Table [dbo].[PERSONAJES]    Script Date: 14/7/2022 10:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO CREATE TABLE [dbo].[PERSONAJES](
		[ID] [int] IDENTITY(1, 1) NOT NULL,
		[IMAGEN_URL] [varchar](50) NOT NULL,
		[NOMBRE] [varchar](50) NOT NULL,
		[EDAD] [tinyint] NOT NULL,
		[PESO] [tinyint] NOT NULL,
		[HISTORIA] [varchar](max) NOT NULL,
		CONSTRAINT [PK_PERSONAJES] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (
			PAD_INDEX = OFF,
			STATISTICS_NORECOMPUTE = OFF,
			IGNORE_DUP_KEY = OFF,
			ALLOW_ROW_LOCKS = ON,
			ALLOW_PAGE_LOCKS = ON
		) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
	/****** Object:  Table [dbo].[PERSONAJESxAUDIOVISUAL]    Script Date: 14/7/2022 10:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO CREATE TABLE [dbo].[PERSONAJESxAUDIOVISUAL](
		[ID] [int] IDENTITY(1, 1) NOT NULL,
		[FK_PERSONAJE] [int] NOT NULL,
		[FK_AUDIOVISUAL] [int] NOT NULL,
		CONSTRAINT [PK_PERSONAJESxAUDIOVISUAL] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (
			PAD_INDEX = OFF,
			STATISTICS_NORECOMPUTE = OFF,
			IGNORE_DUP_KEY = OFF,
			ALLOW_ROW_LOCKS = ON,
			ALLOW_PAGE_LOCKS = ON
		) ON [PRIMARY]
	) ON [PRIMARY]
GO
	/****** Object:  Table [dbo].[PRODUCCION_AUDIOVISUAL]    Script Date: 14/7/2022 10:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO CREATE TABLE [dbo].[PRODUCCION_AUDIOVISUAL](
		[ID] [int] IDENTITY(1, 1) NOT NULL,
		[IMAGEN] [varchar](50) NOT NULL,
		[TITULO] [varchar](50) NOT NULL,
		[FECHA_CREACION] [date] NOT NULL,
		CONSTRAINT [PK_PRODUCCION_AUDIOVISUAL] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (
			PAD_INDEX = OFF,
			STATISTICS_NORECOMPUTE = OFF,
			IGNORE_DUP_KEY = OFF,
			ALLOW_ROW_LOCKS = ON,
			ALLOW_PAGE_LOCKS = ON
		) ON [PRIMARY]
	) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PERSONAJES] ON
GO
INSERT [dbo].[PERSONAJES] (
		[ID],
		[IMAGEN_URL],
		[NOMBRE],
		[EDAD],
		[PESO],
		[HISTORIA]
	)
VALUES (
		1,
		N'https://imgur.com/VfHz6pZ',
		N'Homero Simpson,',
		37,
		120,
		N 'Homer Jay Simpson (Homero J. Simpson en Hispanoamérica y Homer J. Simpson en España) es un personaje ficticio protagonista de la serie de televisión de dibujos animados Los Simpson. Es el padre de la familia protagonista y uno de los personajes centrales y más importantes de la serie. Fue creado por el dibujante Matt Groening e hizo su debut en televisión el 19 de abril de 1987, en el corto Good Night del programa El show de Tracey Ullman. Su segundo nombre es un juego de palabras; durante muchas temporadas no se supo qué había detrás de la J hasta que en el capítulo «D''oh-in'' In the Wind» descubre que su segundo nombre es Jay (nombre en inglés de la letra j); de este modo, cuando Homer pronuncia en inglés su propio nombre, no se distingue si da la letra inicial del segundo nombre o este al completo.'
	)
GO
INSERT [dbo].[PERSONAJES] (
		[ID],
		[IMAGEN_URL],
		[NOMBRE],
		[EDAD],
		[PESO],
		[HISTORIA]
	)
VALUES (3, N'd', N'Marge Simpson', 44, 44, N'dddd')
GO
INSERT [dbo].[PERSONAJES] (
		[ID],
		[IMAGEN_URL],
		[NOMBRE],
		[EDAD],
		[PESO],
		[HISTORIA]
	)
VALUES (
		4,
		N'https://imgur.com/a/7RvLwqQ',
		N'Philip J. Fry',
		31,
		80,
		N'Philip James Fry (normalmente conocido como Fry) es el protagonista de Futurama, la serie de animación para televisión creada por Matt Groening, creador de Los Simpson. Fry es un joven repartidor de pizza en el año 1999 que, por accidente, cae en una cámara criogénica y queda congelado por espacio de 1000 años. Se despierta en el año 2999 y, después de conocer a Leela y Bender, empieza a trabajar como repartidor en la empresa de mensajería interplanetaria Planet Express. Sobrevivió a un infarto.'
	)
GO
INSERT [dbo].[PERSONAJES] (
		[ID],
		[IMAGEN_URL],
		[NOMBRE],
		[EDAD],
		[PESO],
		[HISTORIA]
	)
VALUES (
		5,
		N'ddd',
		N'Leela ',
		44,
		52,
		N'Leela tiene un ojo nomas'
	)
GO
SET IDENTITY_INSERT [dbo].[PERSONAJES] OFF
GO
SET IDENTITY_INSERT [dbo].[PERSONAJESxAUDIOVISUAL] ON
GO
INSERT [dbo].[PERSONAJESxAUDIOVISUAL] ([ID], [FK_PERSONAJE], [FK_AUDIOVISUAL])
VALUES (1, 1, 1)
GO
INSERT [dbo].[PERSONAJESxAUDIOVISUAL] ([ID], [FK_PERSONAJE], [FK_AUDIOVISUAL])
VALUES (2, 3, 1)
GO
INSERT [dbo].[PERSONAJESxAUDIOVISUAL] ([ID], [FK_PERSONAJE], [FK_AUDIOVISUAL])
VALUES (3, 4, 2)
GO
INSERT [dbo].[PERSONAJESxAUDIOVISUAL] ([ID], [FK_PERSONAJE], [FK_AUDIOVISUAL])
VALUES (4, 5, 2)
GO
SET IDENTITY_INSERT [dbo].[PERSONAJESxAUDIOVISUAL] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUCCION_AUDIOVISUAL] ON
GO
INSERT [dbo].[PRODUCCION_AUDIOVISUAL] ([ID], [IMAGEN], [TITULO], [FECHA_CREACION])
VALUES (
		1,
		N 'https://i.imgur.com/2NTUKzY.png',
		N'Los Simpson',
		CAST(N'1989-12-17' AS Date)
	)
GO
INSERT [dbo].[PRODUCCION_AUDIOVISUAL] ([ID], [IMAGEN], [TITULO], [FECHA_CREACION])
VALUES (
		2,
		N'https://i.imgur.com/UGgIPHl.png',
		N'Futurama',
		CAST(N'2002-06-12' AS Date)
	)
GO
SET IDENTITY_INSERT [dbo].[PRODUCCION_AUDIOVISUAL] OFF
GO
ALTER TABLE [dbo].[CALIFICACION] WITH CHECK
ADD CONSTRAINT [FK_CALIFICACION_PRODUCCION_AUDIOVISUAL] FOREIGN KEY([FK_AUDIOVISUAL]) REFERENCES [dbo].[PRODUCCION_AUDIOVISUAL] ([ID])
GO
ALTER TABLE [dbo].[CALIFICACION] CHECK CONSTRAINT [FK_CALIFICACION_PRODUCCION_AUDIOVISUAL]
GO
ALTER TABLE [dbo].[PERSONAJESxAUDIOVISUAL] WITH CHECK
ADD CONSTRAINT [FK_PERSONAJESxAUDIOVISUAL_PERSONAJES] FOREIGN KEY([FK_PERSONAJE]) REFERENCES [dbo].[PERSONAJES] ([ID])
GO
ALTER TABLE [dbo].[PERSONAJESxAUDIOVISUAL] CHECK CONSTRAINT [FK_PERSONAJESxAUDIOVISUAL_PERSONAJES]
GO
ALTER TABLE [dbo].[PERSONAJESxAUDIOVISUAL] WITH CHECK
ADD CONSTRAINT [FK_PERSONAJESxAUDIOVISUAL_PRODUCCION_AUDIOVISUAL] FOREIGN KEY([FK_AUDIOVISUAL]) REFERENCES [dbo].[PRODUCCION_AUDIOVISUAL] ([ID])
GO
ALTER TABLE [dbo].[PERSONAJESxAUDIOVISUAL] CHECK CONSTRAINT [FK_PERSONAJESxAUDIOVISUAL_PRODUCCION_AUDIOVISUAL]
GO
	/****** Object:  StoredProcedure [dbo].[spGetCharactersAndProduction]    Script Date: 14/7/2022 10:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO CREATE PROCEDURE [dbo].[spGetCharactersAndProduction] @prod VARCHAR(50) AS BEGIN
SELECT PRODUCCION_AUDIOVISUAL.TITULO,
	PRODUCCION_AUDIOVISUAL.IMAGEN,
	PRODUCCION_AUDIOVISUAL.FECHA_CREACION
FROM PRODUCCION_AUDIOVISUAL
WHERE PRODUCCION_AUDIOVISUAL.TITULO = @prod;
SELECT PERSONAJES.*
FROM PRODUCCION_AUDIOVISUAL
	INNER JOIN PERSONAJESxAUDIOVISUAL ON PRODUCCION_AUDIOVISUAL.ID = PERSONAJESxAUDIOVISUAL.FK_AUDIOVISUAL
	INNER JOIN PERSONAJES ON PERSONAJESxAUDIOVISUAL.FK_PERSONAJE = PERSONAJES.ID
WHERE PRODUCCION_AUDIOVISUAL.TITULO = @prod;
END
GO USE [master]
GO ALTER DATABASE [DAI-TP06]
SET READ_WRITE
GO