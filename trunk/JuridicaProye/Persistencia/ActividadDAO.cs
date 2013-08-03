using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Collections;
using DemoMVC.Models;

namespace DemoMVC.Persistencia
{
    public class ActividadDAO
    {

        //Listado de actividades
        public List<Actividad> obtenerActividad(int codPlanPro)
        {
            List<Actividad> listadoAct = null;
            Actividad actividad = null;
            string sql = "select * from dbo.T_Actividad where codPlaPro=@codPlaPro";

            using (SqlConnection con = new SqlConnection(ConexionUtil.Cadena))
            {
                con.Open();
                using (SqlCommand com = new SqlCommand(sql, con))
                {
                    com.Parameters.Add(new SqlParameter("@codPlaPro", codPlanPro));
                    using (SqlDataReader resultado = com.ExecuteReader())
                    {
                        if (resultado.HasRows)
                        {
                            //Obtenemos uno por uno
                            listadoAct = new List<Actividad>();
                            while (resultado.Read())
                            {
                                //Recorremos objeto por objeto y anadimos
                                actividad = new Actividad
                                {
                                    codAct = (int)resultado["codAct"],
                                    corAct = (int)resultado["corAct"],
                                    desAct = (string)resultado["desAct"],
                                    feciniAct = (string)resultado["feciniAct"],
                                    fecfinAct = (string)resultado["fecfinAct"],
                                    preAct = (string)resultado["preAct"],
                                    tipAct = (string)resultado["tipAct"],
                                    codEnt = (int)resultado["codEnt"],
                                    codPlaPro = (int)resultado["codPlaPro"],
                                };
                                //Añadimos al listado
                                listadoAct.Add(actividad);
                            }
                        }
                        else
                        {
                            Debug.WriteLine("No retornó registros");
                        }
                    }
                }
            }
            return listadoAct;
        }

        //Total registros
        public int totalRegistros(int tipo, int codPlaPro)
        {

            string sql = "";
            int totReg = 0;

            //Dependiendo el tipo, vemos el total de actividades en general para el ID único o el total correlativo
            if (tipo == 0)
            {
                sql = "select count(*) from dbo.T_Actividad";
            }
            else 
            {
                sql = "select count(*) from dbo.T_Actividad where codPlaPro=@codPlaPro";
            }

            using (SqlConnection con = new SqlConnection(ConexionUtil.Cadena))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand(sql, con);
                    con.Open();
                    //Solo para el caso de tipo == 1 colocar parametro
                    if (tipo == 1) cmd.Parameters.Add(new SqlParameter("@codPlaPro", codPlaPro));
                    totReg = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.ToString(), ex);
                }
            }

            return totReg;
        }

        //Insertar actividad
        public int insertarActividad(Actividad actividad)
        {

            string sql = "insert into dbo.T_Actividad values (@codAct,@corAct,@desAct,@feciniAct,@fecfinAct,@preAct,@tipAct,@codEnt,@codPlaPro)";
            int totIns = 0;

            using (SqlConnection con = new SqlConnection(ConexionUtil.Cadena))
            {
                try
                {
                    SqlCommand cmdIns = new SqlCommand(sql, con);
                    cmdIns.Parameters.AddWithValue("@codAct", actividad.codAct);
                    cmdIns.Parameters.AddWithValue("@corAct", actividad.corAct);
                    cmdIns.Parameters.AddWithValue("@desAct", actividad.desAct);
                    cmdIns.Parameters.AddWithValue("@feciniAct", actividad.feciniAct);
                    cmdIns.Parameters.AddWithValue("@fecfinAct", actividad.fecfinAct);
                    cmdIns.Parameters.AddWithValue("@preAct", actividad.preAct);
                    cmdIns.Parameters.AddWithValue("@tipAct", actividad.tipAct);
                    cmdIns.Parameters.AddWithValue("@codEnt", actividad.codEnt);
                    cmdIns.Parameters.AddWithValue("@codPlaPro", actividad.codPlaPro);
                    con.Open();
                    totIns = Convert.ToInt32(cmdIns.ExecuteScalar());
                    con.Close();
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.ToString(), ex);
                }
            }

            return totIns;

        }

        //Actualizar actividad
        public int actualizarActividad(Actividad actividad)
        {

            string sql = "update dbo.T_Actividad set desAct=@desAct, feciniAct=@feciniAct, fecfinAct=@fecfinAct, preAct=@preAct where codPlaPro=@codPlaPro and corAct=@corAct";
            int totUpd = 0;

            using (SqlConnection con = new SqlConnection(ConexionUtil.Cadena))
            {
                try
                {
                    SqlCommand cmdUpd = new SqlCommand(sql, con);
                    cmdUpd.Parameters.AddWithValue("@corAct", actividad.corAct);
                    cmdUpd.Parameters.AddWithValue("@desAct", actividad.desAct);
                    cmdUpd.Parameters.AddWithValue("@feciniAct", actividad.feciniAct);
                    cmdUpd.Parameters.AddWithValue("@fecfinAct", actividad.fecfinAct);
                    cmdUpd.Parameters.AddWithValue("@preAct", actividad.preAct);
                    cmdUpd.Parameters.AddWithValue("@codPlaPro", actividad.codPlaPro);
                    con.Open();
                    totUpd = Convert.ToInt32(cmdUpd.ExecuteScalar());
                    con.Close();
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.ToString(), ex);
                }
            }

            return totUpd;

        }

        //Eliminar actividad
        public void eliminarActividad(int codAct) 
        {
            string sql = "delete from dbo.T_Actividad where codAct=@codAct";

            try
            {
                using (SqlConnection con = new SqlConnection(ConexionUtil.Cadena))
                {
                    SqlCommand cmd = new SqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@codAct", codAct);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }            
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString(), ex);
            }

        }

    }
}