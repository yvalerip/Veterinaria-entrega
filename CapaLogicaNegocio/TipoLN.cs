using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;
using CapaAccesoDatos;

namespace CapaLogicaNegocio
{
    public class TipoLN
    {
        private readonly TipoDAO ti;

        public TipoLN()
        {
            this.ti = new TipoDAO();
        }

        public List<TipoE> MostrarCategoria()
        {
            return ti.MostrarCategoria();
        }


        public TipoE obtenerCategoria(int id)
        {
            return ti.ObtenerTipoCategoria(id);
        }

        public bool InsertaYActualiza(TipoE objTipo, byte tipo)
        {
            try
            {
                Tipo Tip = new Tipo();
                Tip.IdTipo = objTipo.IdTipo;
                Tip.TipoCategoria = objTipo.TipoCategoria;
                return ti.InsertaYActualiza(Tip, tipo);
            }
            catch (Exception)
            {
                return false;
            }
        }

        //Eliminar Prov
        public bool EliminarTipo(int pk)
        {
            try
            {
                return ti.EliminarTipo(pk);
            }
            catch (Exception)
            {
                return false;
            }
        }
        //public List<Tipo> ListarTipos()
        //{
        //    try
        //    {
        //        return TipoDAO.getInstance().ListarTipos();
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}
    }
}
