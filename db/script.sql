CREATE TABLE [dbo].[CALIFICACION](
	[ID] [uniqueidentifier] NOT NULL,
	[FK_AUDIOVISUAL] [uniqueidentifier] NOT NULL,
	[CALIFICACION] [tinyint] NOT NULL,
 CONSTRAINT [PK_CALIFICACION] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERSONAJES]    Script Date: 28/6/2022 08:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERSONAJES](
	[ID] [uniqueidentifier] NOT NULL,
	[IMAGEN_URL] [varchar](50) NOT NULL,
	[NOMBRE] [varchar](50) NOT NULL,
	[EDAD] [tinyint] NOT NULL,
	[PESO] [tinyint] NOT NULL,
	[HISTORIA] [varchar](max) NOT NULL,
 CONSTRAINT [PK_PERSONAJES] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERSONAJESxAUDIOVISUAL]    Script Date: 28/6/2022 08:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERSONAJESxAUDIOVISUAL](
	[ID] [uniqueidentifier] NOT NULL,
	[FK_PERSONAJE] [uniqueidentifier] NOT NULL,
	[FK_AUDIOVISUAL] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PERSONAJESxAUDIOVISUAL] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCCION_AUDIOVISUAL]    Script Date: 28/6/2022 08:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCCION_AUDIOVISUAL](
	[ID] [uniqueidentifier] NOT NULL,
	[IMAGEN] [varchar](50) NOT NULL,
	[TITULO] [varchar](50) NOT NULL,
	[FECHA_CREACION] [date] NOT NULL,
 CONSTRAINT [PK_PRODUCCION_AUDIOVISUAL] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[PERSONAJES] ([ID], [IMAGEN_URL], [NOMBRE], [EDAD], [PESO], [HISTORIA]) VALUES (N'2c0732ef-5c75-40e6-beda-21525488200d', N'https://imgur.com/a/7RvLwqQ', N'Philip J. Fry', 31, 80, N'Philip James Fry (normalmente conocido como Fry) es el protagonista de Futurama, la serie de animación para televisión creada por Matt Groening, creador de Los Simpson. Fry es un joven repartidor de pizza en el año 1999 que, por accidente, cae en una cámara criogénica y queda congelado por espacio de 1000 años. Se despierta en el año 2999 y, después de conocer a Leela y Bender, empieza a trabajar como repartidor en la empresa de mensajería interplanetaria Planet Express. Sobrevivió a un infarto.')
INSERT [dbo].[PERSONAJES] ([ID], [IMAGEN_URL], [NOMBRE], [EDAD], [PESO], [HISTORIA]) VALUES (N'9d773e53-91a9-4a48-b073-652c1a5cc526', N'https://imgur.com/VfHz6pZ', N'Homero Simpson', 37, 120, N'Homer Jay Simpson (Homero J. Simpson en Hispanoamérica y Homer J. Simpson en España) es un personaje ficticio protagonista de la serie de televisión de dibujos animados Los Simpson. Es el padre de la familia protagonista y uno de los personajes centrales y más importantes de la serie. Fue creado por el dibujante Matt Groening e hizo su debut en televisión el 19 de abril de 1987, en el corto Good Night del programa El show de Tracey Ullman. Su segundo nombre es un juego de palabras; durante muchas temporadas no se supo qué había detrás de la J hasta que en el capítulo «D''oh-in'' In the Wind» descubre que su segundo nombre es Jay (nombre en inglés de la letra j); de este modo, cuando Homer pronuncia en inglés su propio nombre, no se distingue si da la letra inicial del segundo nombre o este al completo.')
GO
INSERT [dbo].[PERSONAJESxAUDIOVISUAL] ([ID], [FK_PERSONAJE], [FK_AUDIOVISUAL]) VALUES (N'8023d43e-4d6a-4ff4-b299-c59ef05e7a4f', N'9d773e53-91a9-4a48-b073-652c1a5cc526', N'9069b08a-f3d0-4250-852a-71b47a4e84d7')
INSERT [dbo].[PERSONAJESxAUDIOVISUAL] ([ID], [FK_PERSONAJE], [FK_AUDIOVISUAL]) VALUES (N'6fa093ce-fcbd-4542-a9c3-fa22325e8dc3', N'2c0732ef-5c75-40e6-beda-21525488200d', N'53741071-e08e-4892-b88b-a4aa3f8337dc')
GO
INSERT [dbo].[PRODUCCION_AUDIOVISUAL] ([ID], [IMAGEN], [TITULO], [FECHA_CREACION]) VALUES (N'9069b08a-f3d0-4250-852a-71b47a4e84d7', N'https://i.imgur.com/2NTUKzY.png', N'Los Simpson', CAST(N'1989-12-17' AS Date))
INSERT [dbo].[PRODUCCION_AUDIOVISUAL] ([ID], [IMAGEN], [TITULO], [FECHA_CREACION]) VALUES (N'53741071-e08e-4892-b88b-a4aa3f8337dc', N'https://i.imgur.com/UGgIPHl.png', N'Futurama', CAST(N'2002-06-12' AS Date))
GO
ALTER TABLE [dbo].[CALIFICACION]  WITH CHECK ADD  CONSTRAINT [FK_CALIFICACION_PRODUCCION_AUDIOVISUAL] FOREIGN KEY([FK_AUDIOVISUAL])
REFERENCES [dbo].[PRODUCCION_AUDIOVISUAL] ([ID])
GO
ALTER TABLE [dbo].[CALIFICACION] CHECK CONSTRAINT [FK_CALIFICACION_PRODUCCION_AUDIOVISUAL]
GO
ALTER TABLE [dbo].[PERSONAJESxAUDIOVISUAL]  WITH CHECK ADD  CONSTRAINT [FK_PERSONAJESxAUDIOVISUAL_PERSONAJES] FOREIGN KEY([FK_PERSONAJE])
REFERENCES [dbo].[PERSONAJES] ([ID])
GO
ALTER TABLE [dbo].[PERSONAJESxAUDIOVISUAL] CHECK CONSTRAINT [FK_PERSONAJESxAUDIOVISUAL_PERSONAJES]
GO
ALTER TABLE [dbo].[PERSONAJESxAUDIOVISUAL]  WITH CHECK ADD  CONSTRAINT [FK_PERSONAJESxAUDIOVISUAL_PRODUCCION_AUDIOVISUAL] FOREIGN KEY([FK_AUDIOVISUAL])
REFERENCES [dbo].[PRODUCCION_AUDIOVISUAL] ([ID])
GO
ALTER TABLE [dbo].[PERSONAJESxAUDIOVISUAL] CHECK CONSTRAINT [FK_PERSONAJESxAUDIOVISUAL_PRODUCCION_AUDIOVISUAL]
GO
USE [master]
GO
ALTER DATABASE [DAI-TP06] SET  READ_WRITE 
GO
