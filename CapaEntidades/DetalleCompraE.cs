using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
   public class DetalleCompraE
    {
        public int IdDetalleCompra { get; set; }
        public int IdCompra { get; set; }
        public int IdProductoBodega { get; set; }
        public decimal PrecioCompra { get; set; }
        public int Regalia { get; set; }
        public int Cantidad { get; set; }

        public DetalleCompraE()
        {
        }
    }
}
