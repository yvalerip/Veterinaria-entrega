using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaAccesoDatos;
using CapaEntidades;

namespace CapaLogicaNegocio
{
   public class CompraLN
    {
        private readonly CompraDAO cp;
        public CompraLN()
        {
            cp = new CompraDAO();
        }

        public bool RegistrarCompra(CompraE objCompra, List<Producto_BodegaE> Detalle)
        {
            return cp.RegistrarCompra(objCompra, Detalle);
        }

        public List<CompraE> MostrarCompras()
        {
            return cp.MostrarCompras();
        }

        public CompraE ObtenerCompra(int Pkey)
        {
            return cp.ObtenerCompra(Pkey);
        }

    }
}
