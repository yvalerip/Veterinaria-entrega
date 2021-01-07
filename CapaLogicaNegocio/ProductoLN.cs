using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaAccesoDatos;
using CapaEntidades;

namespace CapaLogicaNegocio
{
    public class ProductoLN
    {
        private readonly ProductoDAO Pro;
        public ProductoLN()
        {
            this.Pro = new ProductoDAO();
        }

        public List<productoE> MostrarProducto()
        {
            return Pro.MostrarProducto();
        }

        public productoE obtenerProducto(int id)
        {
            return Pro.ObtenerProducto(id);
        }

        public bool InsertaYActualiza(productoE objProducto, byte tipo)
        {
            try
            {
                Producto prod = new Producto();
                prod.IdProducto = objProducto.IdProducto;
                prod.NombreProducto = objProducto.NombreProducto;
                prod.Estado = objProducto.Estado;
                prod.IdTipo = objProducto.IdTipo;

                return Pro.InsertaYActualiza(prod, tipo);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool EliminarProducto(int pk)
        {
            try
            {
                return Pro.EliminarProducto(pk);
            }
            catch (Exception)
            {
                return false;
            }
        }

    }
}
