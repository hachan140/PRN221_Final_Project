create database CinemaSystem
use CinemaSystem
CREATE TABLE [dbo].[Bookings](
	[BookingID] [int] NOT NULL IDENTITY(1,1),
	[ShowID] [int] NOT NULL,
	[SeatNumber] [varchar](50) NOT NULL,
	[Amount] [float] NULL,
	[Status]  [varchar](50) NOT NULL DEFAULT 'valid',
 CONSTRAINT [PK_Bookings] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 10/8/2023 11:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryCode] [varchar](50) NOT NULL,
	[CountryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Films]    Script Date: 10/8/2023 11:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Films](
	[FilmID] [int] NOT NULL IDENTITY(1,1),
	[GenreID] [int] NULL,
	[Title] [varchar](50) NOT NULL,
	[Year] [int] NULL,
	[CountryCode] [varchar](50) NULL,
 CONSTRAINT [PK_Films] PRIMARY KEY CLUSTERED 
(
	[FilmID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 10/8/2023 11:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[GenreID] [int] NOT NULL IDENTITY(1,1),
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 10/8/2023 11:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomID] [int] NOT NULL IDENTITY(1,1),
	[Name] [varchar](50) NOT NULL,
	[NumberRows] [int] NULL,
	[NumberCols] [int] NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shows]    Script Date: 10/8/2023 11:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shows](
	[ShowID] [int] NOT NULL IDENTITY(1,1),
	[RoomID] [int] NOT NULL,
	[FilmID] [int] NOT NULL,
	[ShowDate] [date] NOT NULL,
	[Price] [float] NOT NULL,
	[Status] [varchar](50) NOT NULL,
	[Slot] [int] NOT NULL,
 CONSTRAINT [PK_Shows] PRIMARY KEY CLUSTERED 
(
	[ShowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Shows] ADD  DEFAULT ('closed') FOR [Status]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Shows] FOREIGN KEY([ShowID])
REFERENCES [dbo].[Shows] ([ShowID])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Shows]
GO
ALTER TABLE [dbo].[Films]  WITH CHECK ADD  CONSTRAINT [FK_Films_Countries] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Countries] ([CountryCode])
GO
ALTER TABLE [dbo].[Films] CHECK CONSTRAINT [FK_Films_Countries]
GO
ALTER TABLE [dbo].[Films]  WITH CHECK ADD  CONSTRAINT [FK_Films_Genres] FOREIGN KEY([GenreID])
REFERENCES [dbo].[Genres] ([GenreID])
GO
ALTER TABLE [dbo].[Films] CHECK CONSTRAINT [FK_Films_Genres]
GO
ALTER TABLE [dbo].[Shows]  WITH CHECK ADD  CONSTRAINT [FK_Shows_Films] FOREIGN KEY([FilmID])
REFERENCES [dbo].[Films] ([FilmID])
GO
ALTER TABLE [dbo].[Shows] CHECK CONSTRAINT [FK_Shows_Films]
GO
ALTER TABLE [dbo].[Shows]  WITH CHECK ADD  CONSTRAINT [FK_Shows_Rooms] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([RoomID])
GO
ALTER TABLE [dbo].[Shows] CHECK CONSTRAINT [FK_Shows_Rooms]
GO
USE [master]
GO
ALTER DATABASE [CinemaSystem] SET  READ_WRITE 
GO