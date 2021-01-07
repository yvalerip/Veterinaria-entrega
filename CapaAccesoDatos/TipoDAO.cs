using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaAccesoDatos;
using CapaEntidades;

namespace CapaAccesoDatos
{
    public class TipoDAO
    {

        //objeto contexto para acceso a base de datos
        private readonly Farmacia_Veterinaria_Salud_AnimalEntities12 context;

        public TipoDAO()
        {
            this.context = new Farmacia_Veterinaria_Salud_AnimalEntities12();
        }

        public List<TipoE> MostrarCategoria()
        {
            try
            {
                return (from p in context.Tipo
                        select new TipoE
                        {
                            IdTipo = p.IdTipo,
                            TipoCategoria = p.TipoCategoria,


                        }).ToList();
            }
            catch (Exception)
            {
                return null;
            }
        }


        #region Methods
        // obtenemos las categorias de la BD
        public TipoE ObtenerTipoCategoria(int id)
        {
            return (from p in context.Tipo
                    select new TipoE
                    {
                        IdTipo = p.IdTipo,
                        TipoCategoria = p.TipoCategoria,

                    }).FirstOrDefault(p => p.IdTipo == id);
        }
        
        public bool InsertaYActualiza(Tipo objTipo, byte tipo)
        {
            try
            {
                context.Tipo.Add(objTipo);
                if (tipo == 1) //Si es actualizar
                {
                    context.Entry(objTipo).State = EntityState.Modified;
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
        public bool EliminarTipo(int pk)
        {
            try
            {
                var data = context.Tipo.FirstOrDefault(x => x.IdTipo == pk);
                context.Tipo.Remove(data);
                context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        #endregion
        //SqlConnection con = null;
        //SqlCommand cmd = null;
        //bool response = false;
        //try
        //{
        //    con = Conexion.getInstance().ConexionBD();
        //    cmd = new SqlCommand("spRegistrarTipo", con);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    cmd.Parameters.AddWithValue("@prmTipoCategoria",objTipo.TipoCategoria);
        //    con.Open();

        //    int filas = cmd.ExecuteNonQuery();
        //    if (filas > 0) response = true;
        //}
        //catch (Exception ex)
        //{
        //    response = false;
        //    throw ex;
        //}
        //finally
        //{
        //    con.Close();
        //}
        //return response;


        //public List<Tipo> ListarTipos()
        //{
        //    List<Tipo> Lista = new List<Tipo>();
        //    SqlConnection con = null;
        //    SqlCommand cmd = null;
        //    SqlDataReader dr = null;

        //    try
        //    {
        //        con = Conexion.getInstance().ConexionBD();
        //        con.Open();
        //        cmd = new SqlCommand("spListarTipos", con);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        dr = cmd.ExecuteReader();

        //        while (dr.Read())
        //        {
        //            //crear objetos del TipoCategoria
        //            Tipo objTipo = new Tipo();
        //            objTipo.IdTipo = Convert.ToInt32(dr["IdTipo"].ToString());
        //            objTipo.TipoCategoria = dr["TipoCategoria"].ToString();

        //            //añadir a la lista de objetos
        //            Lista.Add(objTipo);
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