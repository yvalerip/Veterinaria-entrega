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
    public  class ProveedorDAO
    {
        private readonly Farmacia_Veterinaria_Salud_AnimalEntities12 context;

        public ProveedorDAO()
        {
            this.context = new Farmacia_Veterinaria_Salud_AnimalEntities12();
        }

        // obtenemos las categorias de la BD
        public ProveedorE ObtenerProveedor(int id)
        {
            return (from p in context.Proveedor
                    select new ProveedorE
                    {
                        IdProveedor = p.IdProveedor,
                        Nombre = p.Nombre,
                        Apellidos=p.Apellidos,
                        Telefono= p.Telefono,
                        Correo = p.Correo,

                    }).FirstOrDefault(p => p.IdProveedor == id);
        }

        public List<ProveedorE> MostrarProveedor()
        {
            try
            {
                return (from p in context.Proveedor
                        select new ProveedorE
                        {
                            IdProveedor = p.IdProveedor,
                            Nombre = p.Nombre,
                            Apellidos= p.Apellidos,
                            Telefono= p.Telefono,
                            Correo = p.Correo,


                        }).ToList();
            }
            catch (Exception)
            {
                return null;
            }
        }


        public bool InsertaYActualiza(Proveedor objProv, byte proveedor)
        {
            try
            {
                context.Proveedor.Add(objProv);
                if (proveedor == 1) //Si es actualizar
                {
                    context.Entry(objProv).State = EntityState.Modified;
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
        public bool EliminarProveedor(int pk)
        {
            try
            {
                var data = context.Proveedor.FirstOrDefault(x => x.IdProveedor == pk);
                context.Proveedor.Remove(data);
                context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        //#region "PATRON SINGLETON"
        //private static ProveedorDAO daoEmpleado = null;
        //private ProveedorDAO() { }
        //public static ProveedorDAO getInstance()
        //{
        //    if (daoEmpleado == null)
        //    {
        //        daoEmpleado = new ProveedorDAO();
        //    }
        //    return daoEmpleado;
        //}
        //#endregion

        //public bool RegistrarProveedor(Proveedor objProveedor)
        //{

        //    SqlConnection con = null;
        //    SqlCommand cmd = null;
        //    bool response = false;
        //    try
        //    {
        //        con = Conexion.getInstance().ConexionBD();
        //        cmd = new SqlCommand("spRegistrarProveedor", con);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.Parameters.AddWithValue("@prmNombres", objProveedor.Nombre);
        //        cmd.Parameters.AddWithValue("@prmApellidos", objProveedor.Apellidos);
        //        cmd.Parameters.AddWithValue("@prmTelefono", objProveedor.Telefono);
        //        cmd.Parameters.AddWithValue("@prmDireccion", objProveedor.Direccion);
        //        con.Open();

        //        int filas = cmd.ExecuteNonQuery();
        //        if (filas > 0) response = true;
        //    }
        //    catch (Exception ex)
        //    {
        //        response = false;
        //        throw ex;
        //    }
        //    finally
        //    {
        //        con.Close();
        //    }
        //    return response;

        //}


        //public List<Proveedor> ListarProveedores()
        //{
        //    List<Proveedor> Lista = new List<Proveedor>();
        //    SqlConnection con = null;
        //    SqlCommand cmd = null;
        //    SqlDataReader dr = null;

        //    try
        //    {
        //        con = Conexion.getInstance().ConexionBD();
        //        con.Open();
        //        cmd = new SqlCommand("spListarProveedores",con);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        dr = cmd.ExecuteReader();

        //       while (dr.Read())
        //        {
        //            //crear objetos de tipo proveedor
        //            Proveedor objProveedor = new Proveedor();
        //            objProveedor.IdProveedor = Convert.ToInt32(dr["IdProveedor"].ToString());
        //            objProveedor.Nombre = dr["Nombre"].ToString();
        //            objProveedor.Apellidos = dr["Apellidos"].ToString();
        //            objProveedor.Telefono = dr["Telefono"].ToString();
        //            objProveedor.Direccion = dr["Direccion"].ToString();

        //            //añadir a la lista de objetos
        //            Lista.Add(objProveedor);
        //        }


        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    finally
        //    {
        //        con.Close();
        //    }
        //    return Lista;
        //}

    }
}
