using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
  public  class CompraE
    {
        public int IdCompra { get; set; }
        public int IdProveedor { get; set; }
        public System.DateTime Fecha { get; set; }      
        public decimal SubTotal { get; set; }
        public decimal Total { get; set; }
        public int NumFactura { get; set; }
      
        public string Nombre { get; set; }
        public string Apellidos { get; set; }
        public CompraE()
        {

        }
    }
}
