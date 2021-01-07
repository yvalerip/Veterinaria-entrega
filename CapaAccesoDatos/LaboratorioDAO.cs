using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaAccesoDatos;
using CapaEntidades;
using System.Data;
using System.Data.SqlClient;

namespace CapaAccesoDatos
{
    public class LaboratorioDAO
    {

        //objeto contexto para acceso a base de datos
        private readonly Farmacia_Veterinaria_Salud_AnimalEntities12 context;

        public LaboratorioDAO()
        {
            this.context = new Farmacia_Veterinaria_Salud_AnimalEntities12();
        }

        public List<LaboratorioE> MostrarLaboratorio()
        {
            try
            {
                return (from l in context.Laboratorio
                        select new LaboratorioE
                        {
                            IdLaboratorio = l.IdLaboratorio,
                            NombreLaboratorio = l.NombreLaboratorio,


                        }).ToList();
            }
            catch (Exception)
            {
                return null;
            }
        }



        // obtenemos las categorias de la BD

        public LaboratorioE ObtenerLaboratorio(int id)
        {
            return (from l in context.Laboratorio
                    select new LaboratorioE
                    {
                        IdLaboratorio = l.IdLaboratorio,
                        NombreLaboratorio = l.NombreLaboratorio,

                    }).FirstOrDefault(l => l.IdLaboratorio == id);
        }

        public bool InsertaYActualiza(Laboratorio objLab, byte lab)
        {
            try
            {
                context.Laboratorio.Add(objLab);
                if (lab == 1) //Si es actualizar
                {
                    context.Entry(objLab).State = EntityState.Modified;
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
        public bool EliminarLaboratorio(int pk)
        {
            try
            {
                var data = context.Laboratorio.FirstOrDefault(x => x.IdLaboratorio == pk);
                context.Laboratorio.Remove(data);
                context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        //#region "PATRON SINGLETON"
        //private static LaboratorioDAO objEmpleado = null;
        //private LaboratorioDAO() { }
        //public static LaboratorioDAO getInstance()
        //{
        //    if (objEmpleado == null)
        //    {
        //        objEmpleado = new LaboratorioDAO();
        //    }
        //    return objEmpleado;
        //}
        //#endregion

        //public bool RegistrarLaboratorio(Laboratorio objLaboratorio)
        //{
        //    SqlConnection con = null;
        //    SqlCommand cmd = null;
        //    bool response = false;
        //    try
        //    {
        //        con = Conexion.getInstance().ConexionBD();
        //        cmd = new SqlCommand("spRegistrarLaboratorio", con);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.Parameters.AddWithValue("@prmNombreLaboratorio", objLaboratorio.NombreLaboratorio);
        //        con.Open();

        //        int filas = cmd.ExecuteNonQuery();
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

        //public List<Laboratorio> ListarLaboratorio()
        //{
        //    List<Laboratorio> Lista = new List<Laboratorio>();
        //    SqlConnection con = null;
        //    SqlCommand cmd = null;
        //    SqlDataReader dr = null;

        //    try
        //    {
        //        con = Conexion.getInstance().ConexionBD();
        //        con.Open();
        //        cmd = new SqlCommand("spListarLaboratorio", con);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        dr = cmd.ExecuteReader();

        //        while (dr.Read())
        //        {
        //            //crear objetos de tipo Lab
        //            Laboratorio objLaboratorio = new Laboratorio();
        //            objLaboratorio.IdLaboratorio = Convert.ToInt32(dr["IdLaboratorio"].ToString());
        //            objLaboratorio.NombreLaboratorio = dr["NombreLaboratorio"].ToString();


        //            //añadir a la lista de objetos
        //            Lista.Add(objLaboratorio);
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