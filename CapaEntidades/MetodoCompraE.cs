using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
   public class MetodoCompraE
    {
        public int IdProductoBodega { get; set; }
        public int IdProducto { get; set; }
        public int IdBodega { get; set; }
        public int IdUnidadMedida { get; set; }
        public int IdPresentacion { get; set; }
        public int IdLaboratorio { get; set; }
        public int Existencia { get; set; }      
        public decimal PrecioCompra { get; set; }
        public decimal PrecioVenta { get; set; }
        public System.DateTime Fecha { get; set; }
        public int IdLote { get; set; }


        public string NombreProducto { get; set; }
        public string NombreBodega { get; set; }
        public string NombreUnidad { get; set; }
        public string NombrePresentacion { get; set; }
        public string NombreLaboratorio { get; set; }
        public int Regalia { get; set; }
        public int IdUsuario { get; set; }
        public decimal SubTotal { get; set; }
        public decimal Total { get; set; }
        public decimal Iva { get; set; }

    }
}
