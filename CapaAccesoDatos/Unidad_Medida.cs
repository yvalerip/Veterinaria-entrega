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
    
    public partial class Unidad_Medida
    {
        public Unidad_Medida()
        {
            this.Producto_Bodega = new HashSet<Producto_Bodega>();
        }
    
        public int IdUnidadMedida { get; set; }
        public string NombreUnidad { get; set; }
        public string AbreviaturaUnidad { get; set; }
    
        public virtual ICollection<Producto_Bodega> Producto_Bodega { get; set; }
    }
}