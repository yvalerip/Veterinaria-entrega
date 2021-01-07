using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaAccesoDatos;
using CapaEntidades;

namespace CapaLogicaNegocio
{
   
    public class UnidadMedidaLN
    {
        private readonly UnidadMedidaDAO Uni;

        public UnidadMedidaLN()
        {
            this.Uni = new UnidadMedidaDAO();
        }

      
        public List<UnidadMedidaE> MostrarUnidad()
        {
            return Uni.MostrarUnidad();
        }

        public UnidadMedidaE obtenerUnidad(int id)
        {
            return Uni.ObtenerUnidad(id);
        }

        public bool InsertaYActualiza(UnidadMedidaE objUnidad, byte tipo)
        {
            try
            {
                Unidad_Medida Unid = new Unidad_Medida();
                Unid.IdUnidadMedida = objUnidad.IdUnidadMedida;
                Unid.NombreUnidad = objUnidad.NombreUnidad;
                Unid.AbreviaturaUnidad = objUnidad.AbreviaturaUnidad;
                return Uni.InsertaYActualiza(Unid, tipo);
            }
            catch (Exception)
            {
                return false;
            }
        }


        public bool EliminarUnidad(int pk)
        {
            try
            {
                return Uni.EliminarUnidad(pk);
            }
            catch (Exception)
            {
                return false;
            }
        }

    }
}
