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
    
    public partial class Compra
    {
        public Compra()
        {
            this.Detalle_Compra = new HashSet<Detalle_Compra>();
        }
    
        public int IdCompra { get; set; }
        public int IdProveedor { get; set; }
        public int NumFactura { get; set; }
        public System.DateTime Fecha { get; set; }
        public decimal SubTotal { get; set; }
        public decimal Total { get; set; }
    
        public virtual Proveedor Proveedor { get; set; }
        public virtual ICollection<Detalle_Compra> Detalle_Compra { get; set; }
    }
}
