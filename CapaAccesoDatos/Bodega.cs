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
    
    public partial class Bodega
    {
        public Bodega()
        {
            this.Producto_Bodega = new HashSet<Producto_Bodega>();
        }
    
        public int IdBodega { get; set; }
        public string NombreBodega { get; set; }
        public string Descripcion { get; set; }
    
        public virtual ICollection<Producto_Bodega> Producto_Bodega { get; set; }
    }
}
