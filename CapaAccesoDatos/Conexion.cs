using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;

namespace CapaAccesoDatos
{
    public class Conexion
    {

        public static string CadenaConexion
        {
            get
            {
                return "data source =.; initial catalog =Farmacia_Veterinaria Salud Animal; integrated security = true";

            }
        }
        #region conecion base de datos

        //private static Conexion conexion = null;
        //private Conexion() { }
        //public static Conexion getInstance()
        //{ 
        //    if(conexion == null)
        //    {
        //        conexion = new Conexion();
        //    }
        //    return conexion;
        //}
        #endregion

        //public SqlConnection ConexionBD()
        //{
        //    SqlConnection conexion = new SqlConnection();
        //    conexion.ConnectionString = "Data Source=.; Initial Catalog=Farmacia_Veterinaria Salud Animal; User ID=sa; Password=.";
        //    return conexion;
        //}
    }
}
