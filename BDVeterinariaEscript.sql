USE [Farmacia_Veterinaria Salud Animal]
GO
/****** Object:  Table [dbo].[Bodega]    Script Date: 6/1/2021 16:58:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bodega](
	[IdBodega] [int] NOT NULL,
	[NombreBodega] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Bodega] PRIMARY KEY CLUSTERED 
(
	[IdBodega] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Compra]    Script Date: 6/1/2021 16:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compra](
	[IdCompra] [int] NOT NULL,
	[IdProveedor] [int] NOT NULL,
	[NumFactura] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[SubTotal] [money] NOT NULL,
	[Total] [money] NOT NULL,
 CONSTRAINT [PK_Compra] PRIMARY KEY CLUSTERED 
(
	[IdCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Configuracion]    Script Date: 6/1/2021 16:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Configuracion](
	[IdConfiguracion] [int] NOT NULL,
	[NombreNegocio] [varchar](50) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[RutaImagen] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Configuracion] PRIMARY KEY CLUSTERED 
(
	[IdConfiguracion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Detalle Compra]    Script Date: 6/1/2021 16:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle Compra](
	[IdDetalleCompra] [int] NOT NULL,
	[IdCompra] [int] NOT NULL,
	[IdProductoBodega] [int] NOT NULL,
	[PrecioCompra] [money] NOT NULL,
	[Regalia] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_Detalle Compra] PRIMARY KEY CLUSTERED 
(
	[IdDetalleCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Detalle Venta]    Script Date: 6/1/2021 16:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle Venta](
	[IdDetalleVenta] [int] NOT NULL,
	[IdVenta] [int] NOT NULL,
	[IdProductoBodega] [int] NOT NULL,
	[Precio] [money] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[SubTotal] [money] NOT NULL,
 CONSTRAINT [PK_Detalle Venta] PRIMARY KEY CLUSTERED 
(
	[IdDetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Factura]    Script Date: 6/1/2021 16:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[IdFactura] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Iva] [nvarchar](50) NOT NULL,
	[Total] [money] NOT NULL,
	[IdPago] [int] NOT NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Laboratorio]    Script Date: 6/1/2021 16:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Laboratorio](
	[IdLaboratorio] [int] IDENTITY(1,1) NOT NULL,
	[NombreLaboratorio] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Laboratorio] PRIMARY KEY CLUSTERED 
(
	[IdLaboratorio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lote]    Script Date: 6/1/2021 16:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lote](
	[IdLlote] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[FechaVencimiento] [datetime] NOT NULL,
	[Activo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Lote] PRIMARY KEY CLUSTERED 
(
	[IdLlote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Presentacion]    Script Date: 6/1/2021 16:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Presentacion](
	[IdPresentacion] [int] IDENTITY(1,1) NOT NULL,
	[NombrePresentacion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Presentacion] PRIMARY KEY CLUSTERED 
(
	[IdPresentacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Producto]    Script Date: 6/1/2021 16:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[NombreProducto] [nvarchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
	[IdTipo] [int] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Producto Bodega]    Script Date: 6/1/2021 16:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto Bodega](
	[IdProductoBodega] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NOT NULL,
	[IdBodega] [int] NOT NULL,
	[IdUnidadMedida] [int] NOT NULL,
	[IdPresentacion] [int] NOT NULL,
	[IdLaboratorio] [int] NOT NULL,
	[PrecioCompra] [money] NOT NULL,
	[PrecioVenta] [money] NOT NULL,
	[Concentracion] [nvarchar](50) NOT NULL,
	[Adminisrtracion] [nvarchar](50) NOT NULL,
	[IdLote] [int] NOT NULL,
	[Existencia] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
 CONSTRAINT [PK_Producto Bodega] PRIMARY KEY CLUSTERED 
(
	[IdProductoBodega] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 6/1/2021 16:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[IdProveedor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellidos] [nvarchar](50) NOT NULL,
	[Telefono] [nvarchar](50) NOT NULL,
	[Correo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tipo]    Script Date: 6/1/2021 16:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo](
	[IdTipo] [int] IDENTITY(1,1) NOT NULL,
	[TipoCategoria] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tipo] PRIMARY KEY CLUSTERED 
(
	[IdTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tipo de Pago]    Script Date: 6/1/2021 16:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo de Pago](
	[IdPago] [int] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Valor] [money] NOT NULL,
 CONSTRAINT [PK_Tipo de Pago] PRIMARY KEY CLUSTERED 
(
	[IdPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Unidad Medida]    Script Date: 6/1/2021 16:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unidad Medida](
	[IdUnidadMedida] [int] IDENTITY(1,1) NOT NULL,
	[NombreUnidad] [nvarchar](50) NOT NULL,
	[AbreviaturaUnidad] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Unidad Medida] PRIMARY KEY CLUSTERED 
(
	[IdUnidadMedida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 6/1/2021 16:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] NOT NULL,
	[NombreUsuario] [nvarchar](50) NOT NULL,
	[Contraseña] [nvarchar](50) NOT NULL,
	[NombrePila] [nvarchar](50) NOT NULL,
	[Apellido] [nvarchar](50) NOT NULL,
	[Posicion] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Venta]    Script Date: 6/1/2021 16:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[IdVenta] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Idcliente] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Total] [money] NOT NULL,
	[Iva] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Bodega] ([IdBodega], [NombreBodega], [Descripcion]) VALUES (0, N'Bodega1', N'Bodega1')
SET IDENTITY_INSERT [dbo].[Laboratorio] ON 

INSERT [dbo].[Laboratorio] ([IdLaboratorio], [NombreLaboratorio]) VALUES (2, N'Laboratorio Inmaculada')
INSERT [dbo].[Laboratorio] ([IdLaboratorio], [NombreLaboratorio]) VALUES (7, N'Lab remanente')
INSERT [dbo].[Laboratorio] ([IdLaboratorio], [NombreLaboratorio]) VALUES (8, N'Laboratorios Ramos')
SET IDENTITY_INSERT [dbo].[Laboratorio] OFF
SET IDENTITY_INSERT [dbo].[Presentacion] ON 

INSERT [dbo].[Presentacion] ([IdPresentacion], [NombrePresentacion]) VALUES (1, N'Frasco')
INSERT [dbo].[Presentacion] ([IdPresentacion], [NombrePresentacion]) VALUES (12, N'Caja')
INSERT [dbo].[Presentacion] ([IdPresentacion], [NombrePresentacion]) VALUES (13, N'Sobre')
SET IDENTITY_INSERT [dbo].[Presentacion] OFF
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([IdProducto], [NombreProducto], [Estado], [IdTipo]) VALUES (1, N'Clotimaxol', 1, 3)
INSERT [dbo].[Producto] ([IdProducto], [NombreProducto], [Estado], [IdTipo]) VALUES (4, N'acetominofen', 1, 18)
INSERT [dbo].[Producto] ([IdProducto], [NombreProducto], [Estado], [IdTipo]) VALUES (5, N'PARACETAMOL', 1, 18)
SET IDENTITY_INSERT [dbo].[Producto] OFF
SET IDENTITY_INSERT [dbo].[Proveedor] ON 

INSERT [dbo].[Proveedor] ([IdProveedor], [Nombre], [Apellidos], [Telefono], [Correo]) VALUES (12, N'luis', N'Lacayo', N'85478569', N'calle 8')
INSERT [dbo].[Proveedor] ([IdProveedor], [Nombre], [Apellidos], [Telefono], [Correo]) VALUES (13, N'jose miguel', N'sanchez castillo', N'546532', N'barrio la cruz')
INSERT [dbo].[Proveedor] ([IdProveedor], [Nombre], [Apellidos], [Telefono], [Correo]) VALUES (14, N'mario', N'canteno zuniga', N'75486985', N'calle31')
INSERT [dbo].[Proveedor] ([IdProveedor], [Nombre], [Apellidos], [Telefono], [Correo]) VALUES (15, N'juan', N'camallo', N'55456516516', N'juanC@gmail.com')
INSERT [dbo].[Proveedor] ([IdProveedor], [Nombre], [Apellidos], [Telefono], [Correo]) VALUES (16, N'mario', N'Buenaventura', N'85478569', N'mario12@yahoo.com')
INSERT [dbo].[Proveedor] ([IdProveedor], [Nombre], [Apellidos], [Telefono], [Correo]) VALUES (17, N'mario', N'Alberto', N'54876532', N'mario@gmail.com')
SET IDENTITY_INSERT [dbo].[Proveedor] OFF
SET IDENTITY_INSERT [dbo].[Tipo] ON 

INSERT [dbo].[Tipo] ([IdTipo], [TipoCategoria]) VALUES (3, N'antiniflamatorio')
INSERT [dbo].[Tipo] ([IdTipo], [TipoCategoria]) VALUES (17, N'dolor')
INSERT [dbo].[Tipo] ([IdTipo], [TipoCategoria]) VALUES (18, N'desparasitante')
SET IDENTITY_INSERT [dbo].[Tipo] OFF
SET IDENTITY_INSERT [dbo].[Unidad Medida] ON 

INSERT [dbo].[Unidad Medida] ([IdUnidadMedida], [NombreUnidad], [AbreviaturaUnidad]) VALUES (2, N'Mililitros', N'Ml')
INSERT [dbo].[Unidad Medida] ([IdUnidadMedida], [NombreUnidad], [AbreviaturaUnidad]) VALUES (3, N'Litro', N'Lts')
INSERT [dbo].[Unidad Medida] ([IdUnidadMedida], [NombreUnidad], [AbreviaturaUnidad]) VALUES (5, N'Gramos', N'G')
SET IDENTITY_INSERT [dbo].[Unidad Medida] OFF
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [NombrePila], [Apellido], [Posicion], [Email]) VALUES (1, N'admin', N'admin', N'Juan', N'Calero', N'administrador', N'admin@gmail.com')
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [NombrePila], [Apellido], [Posicion], [Email]) VALUES (2, N'yader', N'123456', N'Yader', N'Valerio', N'Empleado', N'yvalerip@gmail.com')
ALTER TABLE [dbo].[Compra]  WITH CHECK ADD  CONSTRAINT [FK_Compra_Proveedor] FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Proveedor] ([IdProveedor])
GO
ALTER TABLE [dbo].[Compra] CHECK CONSTRAINT [FK_Compra_Proveedor]
GO
ALTER TABLE [dbo].[Detalle Compra]  WITH CHECK ADD  CONSTRAINT [FK_Detalle Compra_Compra] FOREIGN KEY([IdCompra])
REFERENCES [dbo].[Compra] ([IdCompra])
GO
ALTER TABLE [dbo].[Detalle Compra] CHECK CONSTRAINT [FK_Detalle Compra_Compra]
GO
ALTER TABLE [dbo].[Detalle Compra]  WITH CHECK ADD  CONSTRAINT [FK_Detalle Compra_Producto Bodega] FOREIGN KEY([IdProductoBodega])
REFERENCES [dbo].[Producto Bodega] ([IdProductoBodega])
GO
ALTER TABLE [dbo].[Detalle Compra] CHECK CONSTRAINT [FK_Detalle Compra_Producto Bodega]
GO
ALTER TABLE [dbo].[Detalle Venta]  WITH CHECK ADD  CONSTRAINT [FK_Detalle Venta_Producto Bodega] FOREIGN KEY([IdProductoBodega])
REFERENCES [dbo].[Producto Bodega] ([IdProductoBodega])
GO
ALTER TABLE [dbo].[Detalle Venta] CHECK CONSTRAINT [FK_Detalle Venta_Producto Bodega]
GO
ALTER TABLE [dbo].[Detalle Venta]  WITH CHECK ADD  CONSTRAINT [FK_Detalle Venta_Venta] FOREIGN KEY([IdVenta])
REFERENCES [dbo].[Venta] ([IdVenta])
GO
ALTER TABLE [dbo].[Detalle Venta] CHECK CONSTRAINT [FK_Detalle Venta_Venta]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Tipo de Pago] FOREIGN KEY([IdPago])
REFERENCES [dbo].[Tipo de Pago] ([IdPago])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Tipo de Pago]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Tipo] FOREIGN KEY([IdTipo])
REFERENCES [dbo].[Tipo] ([IdTipo])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Tipo]
GO
ALTER TABLE [dbo].[Producto Bodega]  WITH CHECK ADD  CONSTRAINT [FK_Producto Bodega_Bodega] FOREIGN KEY([IdBodega])
REFERENCES [dbo].[Bodega] ([IdBodega])
GO
ALTER TABLE [dbo].[Producto Bodega] CHECK CONSTRAINT [FK_Producto Bodega_Bodega]
GO
ALTER TABLE [dbo].[Producto Bodega]  WITH CHECK ADD  CONSTRAINT [FK_Producto Bodega_Laboratorio] FOREIGN KEY([IdLaboratorio])
REFERENCES [dbo].[Laboratorio] ([IdLaboratorio])
GO
ALTER TABLE [dbo].[Producto Bodega] CHECK CONSTRAINT [FK_Producto Bodega_Laboratorio]
GO
ALTER TABLE [dbo].[Producto Bodega]  WITH CHECK ADD  CONSTRAINT [FK_Producto Bodega_Lote] FOREIGN KEY([IdLote])
REFERENCES [dbo].[Lote] ([IdLlote])
GO
ALTER TABLE [dbo].[Producto Bodega] CHECK CONSTRAINT [FK_Producto Bodega_Lote]
GO
ALTER TABLE [dbo].[Producto Bodega]  WITH CHECK ADD  CONSTRAINT [FK_Producto Bodega_Presentacion] FOREIGN KEY([IdPresentacion])
REFERENCES [dbo].[Presentacion] ([IdPresentacion])
GO
ALTER TABLE [dbo].[Producto Bodega] CHECK CONSTRAINT [FK_Producto Bodega_Presentacion]
GO
ALTER TABLE [dbo].[Producto Bodega]  WITH CHECK ADD  CONSTRAINT [FK_Producto Bodega_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[Producto Bodega] CHECK CONSTRAINT [FK_Producto Bodega_Producto]
GO
ALTER TABLE [dbo].[Producto Bodega]  WITH CHECK ADD  CONSTRAINT [FK_Producto Bodega_Unidad Medida] FOREIGN KEY([IdUnidadMedida])
REFERENCES [dbo].[Unidad Medida] ([IdUnidadMedida])
GO
ALTER TABLE [dbo].[Producto Bodega] CHECK CONSTRAINT [FK_Producto Bodega_Unidad Medida]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Usuario]
GO
