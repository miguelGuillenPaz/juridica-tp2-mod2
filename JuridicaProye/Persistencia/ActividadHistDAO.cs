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
    public class ActividadHistDAO
    {

        //Total registros
        public int totalRegistros(int tipo, int codPlaPro)
        {

            string sql = "";
            int totReg = 0;

            //Dependiendo el tipo, vemos el total de actividades en general para el ID único o el total correlativo
            if (tipo == 0)
            {
                sql = "select count(*) from dbo.T_ActividadHist";
            }
            else
            {
                sql = "select count(*) from dbo.T_ActividadHist where codPlaPro=@codPlaPro";
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

        //Listado de actividades Hist
        public List<ActividadHist> obtenerActividadHist(int tipAct, int codPlanPro) 
        {
            List<ActividadHist> listadoActHist = null;
            ActividadHist actividadHist = null;
            string sql = "";

            if (tipAct == 0) sql = "select * from dbo.T_ActividadHist where codPlaPro=@codPlaPro";    

            using (SqlConnection con = new SqlConnection(ConexionUtil.Cadena)) {
                con.Open();
                using (SqlCommand com = new SqlCommand(sql, con)) {
                    com.Parameters.Add(new SqlParameter("@codPlaPro", codPlanPro));
                    using (SqlDataReader resultado = com.ExecuteReader())
                    {
                        if (resultado.HasRows)
                        {
                            //Obtenemos uno por uno
                            listadoActHist = new List<ActividadHist>();
                            while (resultado.Read())
                            {
                                //Recorremos objeto por objeto y anadimos
                                actividadHist = new ActividadHist
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
                                listadoActHist.Add(actividadHist);
                            }
                        }
                        else
                        {
                            Debug.WriteLine("No retornó registros");
                        }
                    }
                }
            }
            return listadoActHist;
        }

    }
}