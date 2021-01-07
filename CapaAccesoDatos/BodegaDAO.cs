using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;
using System.Data;
using System.Data.SqlClient;

namespace CapaAccesoDatos
{
   public class BodegaDAO
    {
        //objeto contexto para acceso a base de datos
        private readonly Farmacia_Veterinaria_Salud_AnimalEntities12 context;

        public BodegaDAO()
        {
            this.context = new Farmacia_Veterinaria_Salud_AnimalEntities12();
        }

        public List<BodegaE> MostrarBodega()
        {
            try
            {
                return (from bo in context.Bodega
                        select new BodegaE
                        {
                            IdBodega = bo.IdBodega,
                            NombreBodega = bo.NombreBodega,
                          
                            Descripcion = bo.Descripcion,
                        }).ToList();
            }
            catch (Exception)
            {
                return null;
            }
        }



        // obtenemos las categorias de la BD

        public BodegaE ObtenerBodega(int id)
        {
            return (from bo in context.Bodega
                    select new BodegaE
                    {
                        IdBodega = bo.IdBodega,
                        NombreBodega = bo.NombreBodega,
                        Descripcion = bo.Descripcion,
                    }).FirstOrDefault(bo => bo.IdBodega == id);
        }

        public bool InsertaYActualiza(Bodega objAdminBodega, byte tipo)
        {
            try
            {
                context.Bodega.Add(objAdminBodega);
                if (tipo == 1) //Si es actualizar
                {
                    context.Entry(objAdminBodega).State = EntityState.Modified;
                }

                context.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw ex;

            }
        }

        //eliminar
        public bool EliminarBodega(int pk)
        {
            try
            {
                var data = context.Bodega.FirstOrDefault(x => x.IdBodega == pk);
                context.Bodega.Remove(data);
                context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }


    }
}
