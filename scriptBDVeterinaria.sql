USE [Farmacia_Veterinaria Salud Animal]
GO
/****** Object:  StoredProcedure [dbo].[spListarLaboratorio]    Script Date: 15/12/2020 23:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarLaboratorio]
AS
 BEGIN
  SELECT L.IdLaboratorio
  ,L.NombreLaboratorio
  FROM Laboratorio L
 END
GO
/****** Object:  StoredProcedure [dbo].[spListarPresentacion]    Script Date: 15/12/2020 23:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarPresentacion]
AS
 BEGIN
  SELECT PS.IdPresentacion
  ,PS.NombrePresentacion
  FROM Presentacion PS
 END
GO
/****** Object:  StoredProcedure [dbo].[spListarProveedores]    Script Date: 15/12/2020 23:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarProveedores]
AS
BEGIN
SELECT  P.IdProveedor
    , P.Nombre
	, P.Apellidos
	, P.Telefono
	, p.Direccion

FROM Proveedor P

END
GO
/****** Object:  StoredProcedure [dbo].[spListarTipos]    Script Date: 15/12/2020 23:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarTipos]
AS
 BEGIN 
 SELECT T.IdTipo,
        T.TipoCategoria
 FROM Tipo T

 END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarLaboratorio]    Script Date: 15/12/2020 23:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarLaboratorio]
(@prmNombreLaboratorio nvarchar(50))
AS
BEGIN
INSERT INTO Laboratorio(NombreLaboratorio)
VALUES(@prmNombreLaboratorio)
END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarPresentacion]    Script Date: 15/12/2020 23:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spRegistrarPresentacion]
(@prmNombrePresentacion nvarchar(50))
AS
 BEGIN
  INSERT INTO Presentacion(NombrePresentacion)
  VALUES(@prmNombrePresentacion)
 END

GO
/****** Object:  StoredProcedure [dbo].[spRegistrarProveedor]    Script Date: 15/12/2020 23:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarProveedor]
(@prmNombres nvarchar(50),
@prmApellidos nvarchar(50),
@prmTelefono int,
@prmDireccion nvarchar(50)
)
AS
  BEGIN
  INSERT INTO Proveedor(Nombre, Apellidos, Telefono, Direccion)
  VALUES(@prmNombres,@prmApellidos, @prmTelefono, @prmDireccion)
  END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarTipo]    Script Date: 15/12/2020 23:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarTipo] 
(@prmTipoCategoria nvarchar(50))
AS
BEGIN
INSERT INTO Tipo(TipoCategoria)
VALUES (@prmTipoCategoria)
END
GO
/****** Object:  Table [dbo].[Bodega]    Script Date: 15/12/2020 23:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bodega](
	[IdBodega] [int] NOT NULL,
	[NombreBodega] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Bodega] PRIMARY KEY CLUSTERED 
(
	[IdBodega] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bonificacion]    Script Date: 15/12/2020 23:00:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bonificacion](
	[IdBonificacion] [int] NOT NULL,
	[NombreBonificacion] [nvarchar](50) NOT NULL,
	[OtrosDetalles] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Bonificacion] PRIMARY KEY CLUSTERED 
(
	[IdBonificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 15/12/2020 23:00:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] NOT NULL,
	[NombreCategria] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 15/12/2020 23:00:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [int] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellido] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Compra]    Script Date: 15/12/2020 23:00:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Compra](
	[IdCompra] [int] NOT NULL,
	[IdProveedor] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Iva] [money] NOT NULL,
	[SubTotal] [money] NOT NULL,
	[Total] [money] NOT NULL,
	[Estado] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Compra] PRIMARY KEY CLUSTERED 
(
	[IdCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Detalle Compra]    Script Date: 15/12/2020 23:00:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle Compra](
	[IdDetalleCompra] [int] NOT NULL,
	[IdCompra] [int] NOT NULL,
	[IdProductoBodega] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[SubTotal] [money] NOT NULL,
	[Total] [money] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[IdBonificacion] [int] NOT NULL,
 CONSTRAINT [PK_Detalle Compra] PRIMARY KEY CLUSTERED 
(
	[IdDetalleCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Detalle Venta]    Script Date: 15/12/2020 23:00:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle Venta](
	[IdDetalle] [int] NOT NULL,
	[IdVenta] [int] NOT NULL,
	[IdFactura] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Precio] [money] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[SubTotal] [money] NOT NULL,
	[Total] [money] NOT NULL,
 CONSTRAINT [PK_Detalle Venta] PRIMARY KEY CLUSTERED 
(
	[IdDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Factura]    Script Date: 15/12/2020 23:00:25 ******/
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
/****** Object:  Table [dbo].[Laboratorio]    Script Date: 15/12/2020 23:00:25 ******/
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
/****** Object:  Table [dbo].[Lote]    Script Date: 15/12/2020 23:00:25 ******/
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
/****** Object:  Table [dbo].[Presentacion]    Script Date: 15/12/2020 23:00:25 ******/
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
/****** Object:  Table [dbo].[Producto]    Script Date: 15/12/2020 23:00:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[NombreProducto] [nvarchar](50) NOT NULL,
	[Estado] [nvarchar](50) NOT NULL,
	[IdCategoria] [int] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Producto Bodega]    Script Date: 15/12/2020 23:00:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto Bodega](
	[IdProductoBodega] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[IdBodega] [int] NOT NULL,
	[IdProveedor] [int] NOT NULL,
	[IdUnidadMedida] [int] NOT NULL,
	[IdPresentacion] [int] NOT NULL,
	[IdLaboratorio] [int] NOT NULL,
	[PrecioCompra] [money] NOT NULL,
	[PrecioVenta] [money] NOT NULL,
	[Concentracion] [nvarchar](50) NOT NULL,
	[Adminisrtracion] [nvarchar](50) NOT NULL,
	[IdLote] [int] NOT NULL,
	[IdTipo] [int] NOT NULL,
 CONSTRAINT [PK_Producto Bodega] PRIMARY KEY CLUSTERED 
(
	[IdProductoBodega] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 15/12/2020 23:00:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[IdProveedor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellidos] [nvarchar](50) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Direccion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tipo]    Script Date: 15/12/2020 23:00:25 ******/
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
/****** Object:  Table [dbo].[Tipo de Pago]    Script Date: 15/12/2020 23:00:25 ******/
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
/****** Object:  Table [dbo].[Unidad Medida]    Script Date: 15/12/2020 23:00:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unidad Medida](
	[IdUnidadMedida] [int] NOT NULL,
	[NombreUnidad] [nvarchar](50) NOT NULL,
	[AbreviaturaUnidad] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Unidad Medida] PRIMARY KEY CLUSTERED 
(
	[IdUnidadMedida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 15/12/2020 23:00:25 ******/
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
/****** Object:  Table [dbo].[Venta]    Script Date: 15/12/2020 23:00:25 ******/
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
SET IDENTITY_INSERT [dbo].[Laboratorio] ON 

INSERT [dbo].[Laboratorio] ([IdLaboratorio], [NombreLaboratorio]) VALUES (1, N'Laboratorio Ramos')
INSERT [dbo].[Laboratorio] ([IdLaboratorio], [NombreLaboratorio]) VALUES (2, N'Laboratorio Inmaculada')
INSERT [dbo].[Laboratorio] ([IdLaboratorio], [NombreLaboratorio]) VALUES (3, N'')
SET IDENTITY_INSERT [dbo].[Laboratorio] OFF
SET IDENTITY_INSERT [dbo].[Presentacion] ON 

INSERT [dbo].[Presentacion] ([IdPresentacion], [NombrePresentacion]) VALUES (1, N'Jarabe')
INSERT [dbo].[Presentacion] ([IdPresentacion], [NombrePresentacion]) VALUES (2, N'')
INSERT [dbo].[Presentacion] ([IdPresentacion], [NombrePresentacion]) VALUES (3, N'inyeccion')
INSERT [dbo].[Presentacion] ([IdPresentacion], [NombrePresentacion]) VALUES (4, N'inyeccion')
SET IDENTITY_INSERT [dbo].[Presentacion] OFF
SET IDENTITY_INSERT [dbo].[Proveedor] ON 

INSERT [dbo].[Proveedor] ([IdProveedor], [Nombre], [Apellidos], [Telefono], [Direccion]) VALUES (1, N'yader francisco', N'valerio', 84373651, N'celle 41')
INSERT [dbo].[Proveedor] ([IdProveedor], [Nombre], [Apellidos], [Telefono], [Direccion]) VALUES (10, N'mario', N'', 0, N'')
INSERT [dbo].[Proveedor] ([IdProveedor], [Nombre], [Apellidos], [Telefono], [Direccion]) VALUES (11, N'mario', N'', 0, N'')
INSERT [dbo].[Proveedor] ([IdProveedor], [Nombre], [Apellidos], [Telefono], [Direccion]) VALUES (12, N'luis', N'Lacayo', 85478569, N'calle 8')
INSERT [dbo].[Proveedor] ([IdProveedor], [Nombre], [Apellidos], [Telefono], [Direccion]) VALUES (13, N'jose miguel', N'sanchez castillo', 546532, N'barrio la cruz')
INSERT [dbo].[Proveedor] ([IdProveedor], [Nombre], [Apellidos], [Telefono], [Direccion]) VALUES (14, N'mario', N'canteno zuniga', 75486985, N'calle31')
SET IDENTITY_INSERT [dbo].[Proveedor] OFF
SET IDENTITY_INSERT [dbo].[Tipo] ON 

INSERT [dbo].[Tipo] ([IdTipo], [TipoCategoria]) VALUES (1, N'Inyectable')
INSERT [dbo].[Tipo] ([IdTipo], [TipoCategoria]) VALUES (2, N'Bebible')
INSERT [dbo].[Tipo] ([IdTipo], [TipoCategoria]) VALUES (3, N'Bebible')
INSERT [dbo].[Tipo] ([IdTipo], [TipoCategoria]) VALUES (4, N'Comprimido')
SET IDENTITY_INSERT [dbo].[Tipo] OFF
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [NombrePila], [Apellido], [Posicion], [Email]) VALUES (1, N'admin', N'admin', N'Juan', N'Calero', N'administrador', N'admin@gmail.com')
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [NombrePila], [Apellido], [Posicion], [Email]) VALUES (2, N'yader', N'123456', N'Yader', N'Valerio', N'Empleado', N'yvalerip@gmail.com')
ALTER TABLE [dbo].[Detalle Compra]  WITH CHECK ADD  CONSTRAINT [FK_Detalle Compra_Bonificacion] FOREIGN KEY([IdBonificacion])
REFERENCES [dbo].[Bonificacion] ([IdBonificacion])
GO
ALTER TABLE [dbo].[Detalle Compra] CHECK CONSTRAINT [FK_Detalle Compra_Bonificacion]
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
ALTER TABLE [dbo].[Detalle Venta]  WITH CHECK ADD  CONSTRAINT [FK_Detalle Venta_Factura] FOREIGN KEY([IdFactura])
REFERENCES [dbo].[Factura] ([IdFactura])
GO
ALTER TABLE [dbo].[Detalle Venta] CHECK CONSTRAINT [FK_Detalle Venta_Factura]
GO
ALTER TABLE [dbo].[Detalle Venta]  WITH CHECK ADD  CONSTRAINT [FK_Detalle Venta_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[Detalle Venta] CHECK CONSTRAINT [FK_Detalle Venta_Producto]
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
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Categoria]
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
ALTER TABLE [dbo].[Producto Bodega]  WITH CHECK ADD  CONSTRAINT [FK_Producto Bodega_Proveedor] FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Proveedor] ([IdProveedor])
GO
ALTER TABLE [dbo].[Producto Bodega] CHECK CONSTRAINT [FK_Producto Bodega_Proveedor]
GO
ALTER TABLE [dbo].[Producto Bodega]  WITH CHECK ADD  CONSTRAINT [FK_Producto Bodega_Tipo] FOREIGN KEY([IdTipo])
REFERENCES [dbo].[Tipo] ([IdTipo])
GO
ALTER TABLE [dbo].[Producto Bodega] CHECK CONSTRAINT [FK_Producto Bodega_Tipo]
GO
ALTER TABLE [dbo].[Producto Bodega]  WITH CHECK ADD  CONSTRAINT [FK_Producto Bodega_Unidad Medida] FOREIGN KEY([IdUnidadMedida])
REFERENCES [dbo].[Unidad Medida] ([IdUnidadMedida])
GO
ALTER TABLE [dbo].[Producto Bodega] CHECK CONSTRAINT [FK_Producto Bodega_Unidad Medida]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Cliente] FOREIGN KEY([Idcliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Cliente]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Usuario]
GO
