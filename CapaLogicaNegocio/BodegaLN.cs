using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;
using CapaAccesoDatos;

namespace CapaLogicaNegocio
{
    public class BodegaLN
    {
        private readonly BodegaDAO bo;

        public BodegaLN()
        {
            this.bo = new BodegaDAO();
        }

   

        public List<BodegaE> MostrarBodega()
        {
            return bo.MostrarBodega();
        }

        public BodegaE obtenerBodega(int id)
        {
            return bo.ObtenerBodega(id);
        }

        public bool InsertaYActualiza(BodegaE objAdminBodega, byte tipo)
        {
            try
            {
                Bodega bode = new Bodega();
                bode.IdBodega = objAdminBodega.IdBodega;
                bode.NombreBodega = objAdminBodega.NombreBodega;
                
                bode.Descripcion = objAdminBodega.Descripcion;
                return bo.InsertaYActualiza(bode, tipo);
            }
            catch (Exception)
            {
                return false;
            }
        }


        public bool EliminarBodega(int pk)
        {
            try
            {
                return bo.EliminarBodega(pk);
            }
            catch (Exception)
            {
                return false;
            }
        }

    }
}
