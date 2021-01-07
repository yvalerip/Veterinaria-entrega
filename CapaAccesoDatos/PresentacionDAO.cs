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
    public  class PresentacionDAO
    {
        //objeto contexto para acceso a base de datos
        private readonly Farmacia_Veterinaria_Salud_AnimalEntities12 context;

        public PresentacionDAO()
        {
            this.context = new Farmacia_Veterinaria_Salud_AnimalEntities12();
        }

        public List<PresentacionE> MostrarPresentacion()
        {
            try
            {
                return (from pr in context.Presentacion
                        select new PresentacionE
                        {
                            IdPresentacion = pr.IdPresentacion,
                            NombrePresentacion = pr.NombrePresentacion,


                        }).ToList();
            }
            catch (Exception)
            {
                return null;
            }
        }



        // obtenemos las categorias de la BD

        public PresentacionE ObtenerPresentacion(int id)
        {
            return (from pr in context.Presentacion
                    select new PresentacionE
                    {
                        IdPresentacion = pr.IdPresentacion,
                        NombrePresentacion = pr.NombrePresentacion,

                    }).FirstOrDefault(pr =>pr.IdPresentacion == id);
        }

        public bool InsertaYActualiza(Presentacion objPres, byte pres)
        {
            try
            {
                context.Presentacion.Add(objPres);
                if (pres == 1) //Si es actualizar
                {
                    context.Entry(objPres).State = EntityState.Modified;
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
        public bool EliminarPresentacion(int pk)
        {
            try
            {
                var data = context.Presentacion.FirstOrDefault(x => x.IdPresentacion == pk);
                context.Presentacion.Remove(data);
                context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }


        //#region "PATRON SINGLETON"
        //private static PresentacionDAO objEmpleado = null;
        //private PresentacionDAO() { }
        //public static PresentacionDAO getInstance()
        //{
        //    if (objEmpleado == null)
        //    {
        //        objEmpleado = new PresentacionDAO();
        //    }
        //    return objEmpleado;
        //}
        //#endregion

        //public bool RegistrarPresentacion(Presentacion objPresentacion)
        //{
        //    SqlConnection con = null;
        //    SqlCommand cmd = null;
        //    bool response = false;
        //    try
        //    {
        //        con = Conexion.getInstance().ConexionBD();
        //        cmd = new SqlCommand("spRegistrarPresentacion",con);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.Parameters.AddWithValue("@prmNombrePresentacion", objPresentacion.NombrePresentacion);
        //        con.Open();

        //        int filas= cmd.ExecuteNonQuery();
        //        if (filas > 0) response = true;
        //    }
        //    catch(Exception ex)
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

        //public List<Presentacion>ListarPresentacion()
        //{
        //    List<Presentacion> Lista = new List<Presentacion>();
        //    SqlConnection con = null;
        //    SqlCommand cmd = null;
        //    SqlDataReader dr = null;

        //    try
        //    {
        //        con = Conexion.getInstance().ConexionBD();
        //        con.Open();
        //        cmd = new SqlCommand("spListarPresentacion", con);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        dr = cmd.ExecuteReader();

        //        while (dr.Read())
        //        {
        //            //crear objetos de tipo presentacion
        //            Presentacion objPresentacion = new Presentacion();
        //            objPresentacion.IdPresentacion = Convert.ToInt32(dr["IdPresentacion"].ToString());
        //            objPresentacion.NombrePresentacion = dr["NombrePresentacion"].ToString();

        //            //añadir a la lista de objetos
        //            Lista.Add(objPresentacion);
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
