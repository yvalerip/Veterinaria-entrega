using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class productoE
    {

        public int IdProducto { get; set; }
        public string NombreProducto { get; set; }
        public bool Estado { get; set; }

        public int IdTipo { get; set; }
        public string TipoCategoria { get; set; }
      

        public productoE()
        {

        }
    }
}
