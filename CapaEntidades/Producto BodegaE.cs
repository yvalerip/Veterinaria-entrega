using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
   public class Producto_BodegaE
    {
        public int IdProductoBodega { get; set; }
        public int IdProducto { get; set; }
        public int IdBodega { get; set; }
        public int IdTipo { get; set; }
        public int IdUnidadMedida { get; set; }
        public int IdPresentacion { get; set; }
        public int IdLaboratorio { get; set; }
        public int Existencia { get; set; }
        public decimal PrecioCompra { get; set; }
        public decimal PrecioVenta { get; set; }
        public DateTime Fecha { get; set; }
        //public int IdLote { get; set; }
        public string Concentracion { get; set; }
        public string Adminisrtracion { get; set; }
       

        public string NombreProducto { get; set; }
        public string NombreBodega { get; set; }
        public string TipoCategoria { get; set; }
        public string NombreUnidad { get; set; }
        public string NombrePresentacion { get; set; }
        public string NombreLaboratorio { get; set; }
        public int Cantidad { get; set; }
        public int Regalia { get; set; }
       
    }
}
