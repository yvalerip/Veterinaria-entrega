using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;
using CapaAccesoDatos;

namespace CapaLogicaNegocio
{
    public class ProveedorLN
    {

        private readonly ProveedorDAO prov;

        public ProveedorLN()
        {
            this.prov = new ProveedorDAO();
        }


        public List<ProveedorE> MostrarProveedor()
        {
            return prov.MostrarProveedor();
        }

        //public List<TipoE> MostrarProveedor()
        //{
        //    return Prov.MostrarProveedor();
        //}

        public ProveedorE obtenerProveedor(int id)
        {
            return prov.ObtenerProveedor(id);
        }

        public bool InsertaYActualiza(ProveedorE objProv, byte proveedor)
        {
            try
            {
                Proveedor Prov = new Proveedor();
                Prov.IdProveedor = objProv.IdProveedor;
                Prov.Nombre = objProv.Nombre;
                Prov.Apellidos = objProv.Apellidos;
                Prov.Telefono = objProv.Telefono;
                Prov.Correo = objProv.Correo;
                return prov.InsertaYActualiza(Prov, proveedor);
            }
            catch (Exception)
            {
                return false;
            }
        }

        //Eliminar Prov
        public bool EliminarProveedor(int pk)
        {
            try
            {
                return prov.EliminarProveedor(pk);
            }
            catch (Exception)
            {
                return false;
            }
        }
        //#region "PATRON SINGLETON"
        //private static ProveedorLN objEmpleado = null;
        //private ProveedorLN() { }
        //public static ProveedorLN getInstance()
        //{
        //    if (objEmpleado == null)
        //    {
        //        objEmpleado = new ProveedorLN();
        //    }
        //    return objEmpleado;
        //}
        //#endregion

        //public bool RegistrarProveedor(Proveedor objProveedor)
        //{
        //    try
        //    {
        //        return ProveedorDAO.getInstance().RegistrarProveedor(objProveedor);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        //public List<Proveedor> ListarProveedores()
        //{
        //    try
        //    {
        //        return ProveedorDAO.getInstance().ListarProveedores();
        //    }
        //    catch(Exception ex)
        //    {
        //        throw ex;
        //    }
        //}
    }
}
