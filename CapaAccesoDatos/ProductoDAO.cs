using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;
using System.Data.SqlClient;
using System.Data;

namespace CapaAccesoDatos
{
    public class ProductoDAO
    {
        // objeto contexto para acceso a base de datos
        private readonly Farmacia_Veterinaria_Salud_AnimalEntities12 context;

        public ProductoDAO()
        {
            this.context = new Farmacia_Veterinaria_Salud_AnimalEntities12();
        }


        public List<productoE>MostrarProducto()
        {
            try
            {
                return (from p in context.Producto
                        join c in context.Tipo
                        on p.IdTipo equals c.IdTipo
                        select new productoE
                        {
                            IdProducto = p.IdProducto,
                            NombreProducto = p.NombreProducto,
                            Estado =p.Estado,
                            IdTipo = p.IdTipo,
                            TipoCategoria = c.TipoCategoria,
                        }).ToList();
            }
            catch (Exception)
            {
                return null;
            }

        }
        public productoE ObtenerProducto(int id)
        {
            return (from p in context.Producto
                    select new productoE
                    {
                        IdProducto = p.IdProducto,
                        NombreProducto = p.NombreProducto,

                    }).FirstOrDefault(p => p.IdProducto == id);
        }


        public bool InsertaYActualiza(Producto objProducto, byte tipo)
        {
            try
            {
                context.Producto.Add(objProducto);
                if (tipo == 1) //Si es actualizar
                {
                    context.Entry(objProducto).State = EntityState.Modified;
                }

                context.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw ex;

            }
        }

        public bool EliminarProducto(int pk)
        {
            try
            {
                var data = context.Producto.FirstOrDefault(x => x.IdProducto == pk);
                context.Producto.Remove(data);
                context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }
    }
}
