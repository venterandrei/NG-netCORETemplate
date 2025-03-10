USE [master]
GO
/****** Object:  Database [WebApi_Db]    Script Date: 3/3/2025 9:46:17 AM ******/
CREATE DATABASE [WebApi_Db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebApi_Db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\WebApi_Db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebApi_Db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\WebApi_Db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [WebApi_Db] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebApi_Db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebApi_Db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebApi_Db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebApi_Db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebApi_Db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebApi_Db] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebApi_Db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebApi_Db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebApi_Db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebApi_Db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebApi_Db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebApi_Db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebApi_Db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebApi_Db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebApi_Db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebApi_Db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebApi_Db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebApi_Db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebApi_Db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebApi_Db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebApi_Db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebApi_Db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebApi_Db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebApi_Db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebApi_Db] SET  MULTI_USER 
GO
ALTER DATABASE [WebApi_Db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebApi_Db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebApi_Db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebApi_Db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebApi_Db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WebApi_Db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [WebApi_Db] SET QUERY_STORE = ON
GO
ALTER DATABASE [WebApi_Db] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [WebApi_Db]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 3/3/2025 9:46:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Exchange] [nvarchar](500) NULL,
	[StockTicker] [nvarchar](50) NULL,
	[Isin] [nvarchar](50) NULL,
	[Website] [nvarchar](3000) NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Companies] ON 

INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (1, N'Small Cotton Ball 55', N'Licensed Concrete Bike', N'Generic Metal Soap', N'0264410896374', N'Producer Awesome Plastic Fish Metal')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (2, N'Refined Steel Keyboard', N'Awesome Steel Gloves', N'Handcrafted Steel Mouse', N'8818196080506', N'Som')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (3, N'Small Wooden Bike', N'Rustic Soft Sausages', N'Refined Rubber Keyboard', N'7481328175237', N'models optical')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (4, N'Licensed Soft Hat', N'Rustic Wooden Pizza', N'Gorgeous Frozen Chair', N'5344375795099', N'Central open-source Svalbard & Jan Mayen Islands')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (5, N'Handmade Concrete Chips', N'Incredible Granite Table', N'Practical Rubber Pants', N'8323147322180', N'Bedfordshire')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (6, N'Tasty Concrete Shoes', N'Incredible Wooden Towels', N'Unbranded Fresh Towels', N'6602467743618', N'withdrawal Engineer')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (7, N'Incredible Cotton Shoes', N'Sleek Steel Chicken', N'Fantastic Frozen Tuna', N'7695369420755', N'virtual Bedfordshire')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (8, N'Rustic Plastic Sausages', N'Handcrafted Granite Hat', N'Sleek Granite Table', N'4903169444288', N'user-facing Baby supply-chains')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (9, N'Unbranded Cotton Towels', N'Unbranded Steel Pants', N'Practical Frozen Fish', N'4399738194843', N'grid-enabled')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (10, N'Gorgeous Plastic Pizza', N'Rustic Soft Soap', N'Tasty Frozen Gloves', N'3959318660895', N'hard drive')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (11, N'Refined Wooden Gloves', N'Awesome Plastic Car', N'Tasty Plastic Chicken', N'1555350975625', N'Fantastic Incredible')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (12, N'Gorgeous Wooden Salad', N'Fantastic Cotton Chips', N'Rustic Wooden Shirt', N'7867512231994', N'Fantastic Consultant connect')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (13, N'Unbranded Rubber Soap', N'Incredible Granite Pants', N'Incredible Wooden Soap', N'4945821982967', N'Sports, Tools & Industrial Jewelery & Industrial Delaware')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (14, N'Awesome Plastic Ball', N'Ergonomic Steel Ball', N'Refined Steel Shoes', N'6364889850977', N'integrated Mount Buckinghamshire')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (15, N'Practical Rubber Gloves', N'Awesome Soft Sausages', N'Handcrafted Plastic Ball', N'1471699203215', N'Applications Sleek')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (16, N'Intelligent Metal Shoes', N'Handmade Fresh Salad', N'Generic Soft Computer', N'2692983349597', N'Small SQL Brand')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (17, N'Ergonomic Cotton Computer', N'Sleek Metal Salad', N'Awesome Fresh Pants', N'1393797560727', N'Haven')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (18, N'Awesome Concrete Tuna', N'Incredible Metal Computer', N'Handcrafted Wooden Car', N'3849254416161', N'synthesize function')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (19, N'Generic Fresh Mouse', N'Handmade Wooden Cheese', N'Fantastic Cotton Mouse', N'2292686922792', N'neural invoice')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (20, N'Rustic Cotton Table', N'Refined Soft Table', N'Ergonomic Fresh Fish', N'9334929700996', N'payment')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (21, N'Generic Metal Chips', N'Sleek Granite Salad', N'Rustic Rubber Keyboard', N'7348043420274', N'Lead Garden parse')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (22, N'Intelligent Fresh Pizza', N'Licensed Concrete Car', N'Handmade Granite Table', N'7350849350938', N'Sleek Granite Towels Uganda Shilling Savings Account')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (23, N'Licensed Steel Sausages', N'Intelligent Granite Towels', N'Practical Wooden Cheese', N'6056339328050', N'Mauritania orchid portal')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (24, N'Unbranded Concrete Salad', N'Intelligent Plastic Keyboard', N'Fantastic Granite Soap', N'4580328843160', N'ADP')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (25, N'Tasty Metal Cheese', N'Awesome Soft Chair', N'Tasty Wooden Bike', N'6769993872219', N'context-sensitive')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (26, N'Awesome Cotton Chair', N'Fantastic Fresh Bike', N'Generic Cotton Fish', N'2219834797491', N'Pine')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (27, N'Handcrafted Fresh Chair', N'Generic Plastic Computer', N'Intelligent Steel Salad', N'9300219940885', N'Reverse-engineered Bedfordshire')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (28, N'Unbranded Metal Shirt', N'Handcrafted Rubber Tuna', N'Ergonomic Cotton Computer', N'7436637476957', N'Crescent Handmade CSS')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (29, N'Practical Wooden Bacon', N'Rustic Steel Shirt', N'Rustic Metal Salad', N'5695363079388', N'grey payment')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (30, N'Unbranded Steel Shirt', N'Licensed Frozen Salad', N'Handmade Concrete Tuna', N'6411124985298', N'Gorgeous viral')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (31, N'Generic Rubber Sausages', N'Refined Granite Pizza', N'Licensed Metal Ball', N'9750102433602', N'Colorado innovate Metal')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (32, N'Small Metal Pants', N'Ergonomic Soft Table', N'Practical Wooden Fish', N'9938660566301', N'pixel Pataca')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (33, N'Refined Wooden Chips', N'Refined Fresh Hat', N'Sleek Fresh Shirt', N'7538535994011', N'North Korean Won Brazilian Real Integration')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (34, N'Gorgeous Fresh Tuna', N'Small Rubber Fish', N'Fantastic Metal Pants', N'6290026378137', N'Djibouti')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (35, N'Handmade Metal Keyboard', N'Licensed Plastic Towels', N'Licensed Soft Shirt', N'2510013093282', N'programming COM TCP')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (36, N'Handmade Cotton Shoes', N'Practical Metal Salad', N'Gorgeous Concrete Shoes', N'6567625478743', N'Group')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (37, N'Tasty Cotton Fish', N'Practical Steel Tuna', N'Intelligent Soft Chair', N'7471904095202', N'Avon')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (38, N'Awesome Granite Soap', N'Ergonomic Fresh Chair', N'Licensed Fresh Chips', N'3926651568485', N'Legacy')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (39, N'Incredible Metal Tuna', N'Ergonomic Frozen Car', N'Awesome Metal Shoes', N'9461917152519', N'B2B')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (40, N'Gorgeous Plastic Computer', N'Tasty Fresh Soap', N'Incredible Plastic Fish', N'1356161108048', N'Awesome Wooden Pants Ergonomic')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (41, N'Intelligent Granite Fish', N'Refined Cotton Car', N'Handcrafted Granite Computer', N'1800316867682', N'Sleek Plastic Tuna payment')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (42, N'Tasty Granite Car', N'Unbranded Concrete Bike', N'Small Granite Sausages', N'3043510902867', N'Tonga Awesome Wooden Keyboard')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (43, N'Licensed Steel Chair', N'Tasty Metal Tuna', N'Handmade Frozen Fish', N'6742440492024', N'Belize Orchard Group')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (44, N'Unbranded Frozen Car', N'Unbranded Steel Towels', N'Generic Concrete Bacon', N'7009995913527', N'hard drive Engineer')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (45, N'Incredible Cotton Chair', N'Fantastic Granite Chicken', N'Handcrafted Metal Chips', N'5197918058348', N'Manat Global asynchronous')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (46, N'Small Metal Hat', N'Fantastic Cotton Chair', N'Handcrafted Cotton Chair', N'6287081223588', N'deposit collaboration JSON')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (47, N'Awesome Fresh Fish', N'Awesome Plastic Sausages', N'Gorgeous Cotton Tuna', N'0352526037054', N'ADP Re-engineered')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (48, N'Ergonomic Fresh Table', N'Handmade Cotton Ball', N'Small Frozen Pizza', N'2081953031141', N'Maryland virtual interface')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (49, N'Intelligent Frozen Car', N'Gorgeous Soft Pizza', N'Rustic Frozen Soap', N'7793492955882', N'Oregon')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (50, N'Intelligent Wooden Chips', N'Ergonomic Wooden Pants', N'Practical Steel Chips', N'3286911733122', N'SQL Paradigm')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (51, N'Licensed Plastic Ball', N'Small Frozen Towels', N'Handcrafted Plastic Shoes', N'9793027424874', N'turn-key hacking TCP')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (52, N'Ergonomic Steel Soap', N'Tasty Plastic Computer', N'Rustic Steel Gloves', N'6232067013042', N'Nepalese Rupee EXE')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (53, N'Small Plastic Shoes', N'Licensed Wooden Chair', N'Unbranded Rubber Gloves', N'0934719880540', N'indexing Clothing')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (54, N'Gorgeous Frozen Hat', N'Tasty Granite Pants', N'Rustic Rubber Table', N'2809329821277', N'User-friendly experiences')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (55, N'Generic Frozen Tuna', N'Awesome Granite Chicken', N'Intelligent Granite Shirt', N'4370351877474', N'magenta transmit Branding')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (56, N'Intelligent Steel Chicken', N'Generic Rubber Towels', N'Practical Fresh Chips', N'0821399475299', N'payment executive')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (57, N'Small Rubber Shoes', N'Generic Steel Sausages', N'Ergonomic Steel Chips', N'6261009876117', N'Virtual maximize')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (58, N'Sleek Soft Shoes', N'Licensed Metal Pants', N'Sleek Rubber Keyboard', N'3813416882071', N'online holistic Haven')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (59, N'Sleek Concrete Bike', N'Ergonomic Rubber Tuna', N'Fantastic Concrete Sausages', N'4075781020574', N'hacking 24/7')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (60, N'Small Wooden Gloves', N'Unbranded Concrete Computer', N'Small Granite Shoes', N'3638150196709', N'interface')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (61, N'Handmade Plastic Ball', N'Small Granite Chips', N'Ergonomic Rubber Tuna', N'8616494664783', N'zero administration Intelligent Concrete Chicken dot-com')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (62, N'Gorgeous Granite Car', N'Small Metal Pants', N'Incredible Concrete Salad', N'5700301474153', N'yellow Land')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (63, N'Handcrafted Wooden Salad', N'Fantastic Fresh Shoes', N'Intelligent Soft Car', N'0766330223273', N'overriding')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (64, N'Generic Metal Ball', N'Sleek Steel Keyboard', N'Handcrafted Metal Tuna', N'9552028343221', N'synergize')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (65, N'Ergonomic Soft Salad', N'Small Cotton Shirt', N'Unbranded Fresh Bacon', N'7328202328665', N'United States Minor Outlying Islands Fresh deposit')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (66, N'Generic Fresh Shirt', N'Gorgeous Plastic Shirt', N'Fantastic Frozen Sausages', N'6977465506498', N'JBOD parsing Rustic Steel Mouse')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (67, N'Refined Granite Computer', N'Unbranded Steel Chicken', N'Intelligent Steel Car', N'5660309286298', N'SDD')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (68, N'Sleek Concrete Gloves', N'Practical Soft Salad', N'Sleek Fresh Bacon', N'0825355911487', N'Palestinian Territory Fantastic')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (69, N'Generic Steel Chair', N'Rustic Concrete Pants', N'Awesome Wooden Bacon', N'3161435427521', N'Creek Nepal')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (70, N'Tasty Rubber Computer', N'Tasty Wooden Car', N'Unbranded Fresh Tuna', N'1613636809986', N'Practical Rubber Bacon EXE')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (71, N'Refined Cotton Pants', N'Incredible Frozen Table', N'Awesome Granite Chicken', N'7942383310990', N'3rd generation')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (72, N'Sleek Cotton Pants', N'Generic Wooden Table', N'Awesome Cotton Chair', N'4321232144604', N'optimizing')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (73, N'Generic Metal Fish', N'Intelligent Metal Car', N'Gorgeous Fresh Chips', N'5511453990176', N'Internal Hawaii Personal Loan Account')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (74, N'Unbranded Fresh Hat', N'Refined Steel Car', N'Intelligent Granite Tuna', N'3889865670057', N'radical Utah Borders')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (75, N'Sleek Cotton Towels', N'Refined Concrete Gloves', N'Handmade Fresh Chips', N'7842401961305', N'Clothing, Health & Beauty COM')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (76, N'Tasty Metal Tuna', N'Licensed Plastic Tuna', N'Unbranded Rubber Salad', N'9999896757178', N'Reduced Fresh')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (77, N'Practical Rubber Towels', N'Tasty Concrete Salad', N'Generic Steel Tuna', N'3616691622338', N'auxiliary Markets capability')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (78, N'Tasty Fresh Cheese', N'Practical Frozen Shoes', N'Rustic Fresh Chair', N'1208066068432', N'card')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (79, N'Ergonomic Steel Shoes', N'Intelligent Frozen Car', N'Incredible Steel Towels', N'4183265695085', N'overriding')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (80, N'Licensed Metal Pizza', N'Generic Cotton Hat', N'Ergonomic Frozen Bike', N'3413089168252', N'productivity Practical Cotton Shoes firewall')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (81, N'Intelligent Granite Sausages', N'Gorgeous Soft Ball', N'Ergonomic Rubber Mouse', N'6172597375060', N'RAM Texas')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (82, N'Licensed Soft Hat', N'Practical Metal Hat', N'Practical Metal Table', N'8334667033104', N'Profit-focused Assurance')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (83, N'Intelligent Rubber Table', N'Handcrafted Granite Bacon', N'Incredible Cotton Gloves', N'4369724688014', N'Buckinghamshire')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (84, N'Handmade Cotton Shoes', N'Fantastic Steel Shoes', N'Awesome Rubber Bike', N'7504200446086', N'Outdoors')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (85, N'Gorgeous Soft Bacon', N'Licensed Concrete Bacon', N'Fantastic Fresh Chips', N'0633999083923', N'Handcrafted Fresh Table Intelligent Fresh Ball')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (86, N'Handcrafted Wooden Table', N'Handcrafted Frozen Chicken', N'Gorgeous Steel Pizza', N'8576082799610', N'Latvian Lats')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (87, N'Practical Metal Shoes', N'Handmade Frozen Cheese', N'Handcrafted Soft Chicken', N'3050218781052', N'plug-and-play Pound Sterling synthesize')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (88, N'Fantastic Cotton Hat', N'Refined Wooden Bike', N'Sleek Frozen Pizza', N'0619071674333', N'interactive Haiti')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (89, N'Intelligent Steel Computer', N'Generic Wooden Bike', N'Refined Cotton Ball', N'6270726020864', N'pixel e-business Handcrafted Frozen Shoes')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (90, N'Intelligent Concrete Chair', N'Unbranded Wooden Fish', N'Sleek Concrete Computer', N'8529611336114', N'pixel')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (91, N'Practical Plastic Mouse', N'Handcrafted Metal Pants', N'Rustic Metal Chips', N'6493999215885', N'Pennsylvania stable')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (92, N'Refined Soft Bike', N'Tasty Metal Chicken', N'Handmade Cotton Mouse', N'9815173447399', N'6th generation circuit Enterprise-wide')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (93, N'Awesome Granite Shirt', N'Sleek Plastic Fish', N'Generic Metal Mouse', N'4242383243025', N'South Dakota')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (94, N'Rustic Cotton Ball', N'Tasty Metal Pants', N'Handcrafted Concrete Towels', N'8389292077719', N'Suriname invoice drive')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (95, N'Handcrafted Steel Table', N'Refined Wooden Chair', N'Small Steel Chips', N'0599490624785', N'quantify')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (96, N'Fantastic Fresh Keyboard', N'Tasty Fresh Chicken', N'Refined Rubber Pizza', N'0320172400133', N'Unbranded Wooden')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (97, N'Incredible Metal Mouse', N'Awesome Granite Table', N'Unbranded Rubber Fish', N'4791475155512', N'Georgia service-desk Soft')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (98, N'Incredible Concrete Fish', N'Intelligent Metal Soap', N'Practical Frozen Pizza', N'8736837788225', N'Generic')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (99, N'Incredible Steel Tuna', N'Unbranded Fresh Chicken', N'Awesome Rubber Ball', N'8347954522564', N'SDD United States Minor Outlying Islands')
GO
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (100, N'Awesome Concrete Hat', N'Ergonomic Frozen Fish', N'Ergonomic Soft Bacon', N'9609084906881', N'bypass Ghana')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (101, N'TEST', N'sdad', N'sda', N'asa', N'432432')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (111, N'VENTANSOR SRL', N'VENTANSOR SRL', N'VENTANSOR SRL', N'VENTANSOR SRL', N'VENTANSOR SRL')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (112, N'TEST4', N'TEST4', N'TEST4', N'TEST4', N'TEST4')
INSERT [dbo].[Companies] ([Id], [Name], [Exchange], [StockTicker], [Isin], [Website]) VALUES (115, N'Cotton Ball', N'Cotton Ball', N'Cotton Ball', N'Cotton Ball', N'Cotton Ball')
SET IDENTITY_INSERT [dbo].[Companies] OFF
GO
USE [master]
GO
ALTER DATABASE [WebApi_Db] SET  READ_WRITE 
GO
