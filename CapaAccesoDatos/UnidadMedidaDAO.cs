using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;
using System.Data;

namespace CapaAccesoDatos
{
    public class UnidadMedidaDAO
    {
        // objeto contexto para acceso a base de datos
        private readonly Farmacia_Veterinaria_Salud_AnimalEntities12 context;

        public UnidadMedidaDAO()
        {
            this.context = new Farmacia_Veterinaria_Salud_AnimalEntities12();
        }

        #region Methods

        public List<UnidadMedidaE> MostrarUnidad()
        {
            try
            {
                return (from U in context.Unidad_Medida
                        select new UnidadMedidaE
                        {
                            IdUnidadMedida = U.IdUnidadMedida,
                            NombreUnidad = U.NombreUnidad,
                            AbreviaturaUnidad = U.AbreviaturaUnidad,
                        }).ToList();
            }
            catch (Exception)
            {
                return null;
            }
        }

        public UnidadMedidaE ObtenerUnidad(int id)
        {
            return (from u in context.Unidad_Medida
                    select new UnidadMedidaE
                    {
                        IdUnidadMedida = u.IdUnidadMedida,
                        NombreUnidad = u.NombreUnidad,
                        AbreviaturaUnidad = u.AbreviaturaUnidad,

                    }).FirstOrDefault(U => U.IdUnidadMedida == id);
        }


        public bool InsertaYActualiza(Unidad_Medida objUnidadMedida, byte tipo)
        {
            try
            {
                context.Unidad_Medida.Add(objUnidadMedida);
                if (tipo == 1) //Si es actualizar
                {
                    context.Entry(objUnidadMedida).State = EntityState.Modified;
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


        public bool EliminarUnidad(int pk)
        {
            try
            {
                var data = context.Unidad_Medida.FirstOrDefault(x => x.IdUnidadMedida == pk);
                context.Unidad_Medida.Remove(data);
                context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }
        #endregion
    }
}
