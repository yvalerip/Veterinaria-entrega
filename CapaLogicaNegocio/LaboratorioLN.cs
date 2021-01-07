using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;
using CapaAccesoDatos;

namespace CapaLogicaNegocio
{
    public class LaboratorioLN
    {
        private readonly LaboratorioDAO lab;

        public LaboratorioLN()
        {
            this.lab = new LaboratorioDAO();
        }

        public List<LaboratorioE> MostrarLaboratorio()
        {
            return lab.MostrarLaboratorio();
        }


        public LaboratorioE obtenerLaboratorio(int id)
        {
            return lab.ObtenerLaboratorio(id);
        }

        public bool InsertaYActualiza(LaboratorioE objLab, byte laboratorio)
        {
            try
            {
               Laboratorio Labt = new Laboratorio();
                Labt.IdLaboratorio = objLab.IdLaboratorio;
                Labt.NombreLaboratorio = objLab.NombreLaboratorio;
                return lab.InsertaYActualiza(Labt, laboratorio);
            }
            catch (Exception)
            {
                return false;
            }
        }

        //Eliminar Prov
        public bool EliminarLaboratorio(int pk)
        {
            try
            {
                return lab.EliminarLaboratorio(pk);
            }
            catch (Exception)
            {
                return false;
            }
        }


        //#region "PATRON SINGLETON"
        //private static LaboratorioLN objEmpleado = null;
        //private LaboratorioLN() { }
        //public static LaboratorioLN getInstance()
        //{
        //    if (objEmpleado == null)
        //    {
        //        objEmpleado = new LaboratorioLN();
        //    }
        //    return objEmpleado;
        //}
        //#endregion

        //public bool RegistrarLaboratorio(Laboratorio objLaboratorio)
        //{
        //    try
        //    {
        //        return LaboratorioDAO.getInstance().RegistrarLaboratorio(objLaboratorio);
        //    }
        //    catch(Exception ex)
        //    {
        //        throw ex;
        //    }

        //}

        //public List<Laboratorio> ListarLaboratorio()
        //{
        //    try
        //    {
        //        return LaboratorioDAO.getInstance().ListarLaboratorio();
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}
    }
}
