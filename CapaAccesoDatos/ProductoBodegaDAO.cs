using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;
using System.Data;

namespace CapaAccesoDatos
{
    public class ProductoBodegaDAO
    {
        // objeto contexto para acceso a base de datos
        private readonly Farmacia_Veterinaria_Salud_AnimalEntities12 context;
        //constructor
        public ProductoBodegaDAO()
        {
            this.context = new Farmacia_Veterinaria_Salud_AnimalEntities12();
        }

        //public List<ProductoBodegaE> MostrarDetalleProducto()
        //{
        //    try
        //    {
        //        return (from dt in context.DetalleProduc
        //                join p in context.Producto
        //                on dt.IDproducto equals p.IDproducto
        //                join a in context.Admin_Bodega
        //                on dt.IDbodega equals a.IDbodega
        //                join m in context.Marca
        //                on dt.IDmarca equals m.IDmarca
        //                join e in context.Unidad_De_medida
        //                on dt.IDunidadMedida equals e.IDunidadMedida
        //                select new DetalleProductoE
        //                {
        //                    IDdetalleProduc = dt.IDdetalleProduc,
        //                    IDproducto = dt.IDproducto,
        //                    Nombre = p.Nombre,
        //                    IDbodega = dt.IDbodega,
        //                    NombreBodega = a.NombreBodega,
        //                    IDmarca = dt.IDmarca,
        //                    Marca = m.NombreMarca,
        //                    IDunidadMedida = dt.IDunidadMedida,
        //                    NombreUnidad = e.NombreUnidad,
        //                    Rutaimagen = dt.Rutaimagen
        //                }).ToList();
        //    }
        //    catch (Exception)
        //    {
        //        return null;
        //    }
        }
    }

