using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Transactions;

namespace CapaAccesoDatos
{
   public class CompraDAO
    {
        private readonly Farmacia_Veterinaria_Salud_AnimalEntities12 context;
        public CompraDAO()
        {
            this.context = new Farmacia_Veterinaria_Salud_AnimalEntities12();
        }

        public bool RegistrarCompra(CompraE objCompra, List<Producto_BodegaE> ProductoBodega)
        {
            using (TransactionScope scope = new TransactionScope())
            {
                try
                {
                    List<Detalle_Compra> listDetalle = new List<Detalle_Compra>();
                    Compra Comp = new Compra
                    {
                        NumFactura = objCompra.NumFactura,
                        Fecha = objCompra.Fecha,
                       
                        IdProveedor = objCompra.IdProveedor,
                       
                        SubTotal = objCompra.SubTotal,
                        Total = objCompra.Total,
                    };

                    context.Compra.Add(Comp);
                    context.SaveChanges();

                    foreach (var item in ProductoBodega)
                    {
                        Producto_Bodega dtProd = new Producto_Bodega
                        {
                            IdProducto = item.IdProducto,
                            IdBodega = item.IdBodega,
                            IdUnidadMedida = item.IdUnidadMedida,
                            IdPresentacion = item.IdPresentacion,
                            IdLaboratorio = item.IdLaboratorio,
                            PrecioCompra = item.PrecioCompra,
                            PrecioVenta = item.PrecioVenta,
                            Concentracion= item.Concentracion,
                            Adminisrtracion=item.Adminisrtracion,
                            //IdLote = item.IdLote,
                            Existencia = item.Existencia,                          
                            Fecha = item.Fecha,                          
                        };
                        context.Producto_Bodega.Add(dtProd);
                        context.SaveChanges();

                        Detalle_Compra dtComp = new Detalle_Compra
                        {
                            IdCompra= Comp.IdCompra,
                            IdProductoBodega = dtProd.IdProductoBodega,
                            Cantidad = item.Existencia,                           
                            PrecioCompra = item.PrecioCompra,
                            Regalia = item.Regalia,
                        };

                        context.Detalle_Compra.Add(dtComp);
                        context.SaveChanges();
                    }
                    scope.Complete();
                    return true;

                }
                catch (Exception ex)
                {
                    scope.Dispose();
                    throw ex;
                    return false;

                }

            }

        }

        public List<CompraE> MostrarCompras()
        {
            List<CompraE> lista = new List<CompraE>();
            try
            {
                lista = (from c in context.Compra
                         join p in context.Proveedor
                         on c.IdProveedor equals p.IdProveedor
                        
                         select new CompraE
                         {
                             IdCompra = c.IdCompra,
                             NumFactura = c.NumFactura,
                             IdProveedor = c.IdProveedor,
                             Nombre = p.Nombre,
                             Apellidos=p.Apellidos,
                            
                             SubTotal = c.SubTotal,
                             Total = c.Total,
                         }).ToList();
            }
            catch (Exception ex)
            {
                lista = null;
                throw;
            }
            return lista;
        }
        public string TraerUsuario(int id)
        {
            var dato = context.Usuario.FirstOrDefault(x => x.IdUsuario == id).NombreUsuario;
            return dato;
        }

        public CompraE ObtenerCompra(int PKey)
        {
            CompraE compra = new CompraE();
            try
            {
                compra = (from c in context.Compra
                          join p in context.Proveedor
                          on c.IdProveedor equals p.IdProveedor
                          select new CompraE
                          {
                              IdCompra = c.IdCompra,
                              Fecha = c.Fecha,
                              NumFactura = c.NumFactura,
                              IdProveedor = c.IdProveedor,
                              Nombre = p.Nombre,
                              Apellidos=p.Apellidos,
                             
                              SubTotal = c.SubTotal,
                              Total = c.Total,
                          }).FirstOrDefault(c => c.IdCompra == PKey);
            }
            catch (Exception)
            {

                throw;
            }
            return compra;
        }
    }
}
