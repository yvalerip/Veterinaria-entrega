using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaAccesoDatos;
using CapaEntidades;

namespace CapaLogicaNegocio
{
    public class PresentacionLN
    {
        private readonly PresentacionDAO pres;

        public PresentacionLN()
        {
            this.pres = new PresentacionDAO();
        }

        public List<PresentacionE> MostrarPresentacion()
        {
            return pres.MostrarPresentacion();
        }


        public PresentacionE obtenerPresentacion(int id)
        {
            return pres.ObtenerPresentacion(id);
        }

        public bool InsertaYActualiza(PresentacionE objPres, byte pres)
        {
            try
            {
                Presentacion Pres = new Presentacion();
                Pres.IdPresentacion = objPres.IdPresentacion;
                Pres.NombrePresentacion = objPres.NombrePresentacion;
                return this.pres.InsertaYActualiza(Pres, pres);
            }
            catch (Exception)
            {
                return false;
            }
        }

        //Eliminar Prov
        public bool EliminarPresentacion(int pk)
        {
            try
            {
                return pres.EliminarPresentacion(pk);
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
