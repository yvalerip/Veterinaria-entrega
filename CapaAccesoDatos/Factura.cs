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
    
    public partial class Factura
    {
        public int IdFactura { get; set; }
        public System.DateTime Fecha { get; set; }
        public string Iva { get; set; }
        public decimal Total { get; set; }
        public int IdPago { get; set; }
    
        public virtual Tipo_de_Pago Tipo_de_Pago { get; set; }
    }
}