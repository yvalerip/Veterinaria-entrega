//------------------------------------------------------------------------------
// <auto-generated>
//    Este código se generó a partir de una plantilla.
//
//    Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//    Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CapaAccesoDatos
{
    using System;
    using System.Collections.Generic;
    
    public partial class Venta
    {
        public Venta()
        {
            this.Detalle_Venta = new HashSet<Detalle_Venta>();
        }
    
        public int IdVenta { get; set; }
        public int IdUsuario { get; set; }
        public int Idcliente { get; set; }
        public System.DateTime Fecha { get; set; }
        public decimal Total { get; set; }
        public string Iva { get; set; }
    
        public virtual ICollection<Detalle_Venta> Detalle_Venta { get; set; }
        public virtual Usuario Usuario { get; set; }
    }
}
