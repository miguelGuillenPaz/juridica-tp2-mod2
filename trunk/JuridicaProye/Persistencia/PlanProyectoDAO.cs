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
    public class PlanProyectoDAO
    {

        //Total registros
        public int totalRegistros(int codPlaPro) {

            string sql = "select count(*) from dbo.T_PlanProyecto where codPlaPro=@codPlaPro";
            int totReg = 0;

            using (SqlConnection con = new SqlConnection(ConexionUtil.Cadena))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand(sql, con);
                    con.Open();
                    cmd.Parameters.Add(new SqlParameter("@codPlaPro", codPlaPro));
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

        //Insertar plan de proyecto
        public int insertarPlanProyecto(PlanProyecto planProy){

            string sql = "insert into dbo.T_PlanProyecto values (@desPlaPro,@codPlaPro,@codPro,@codFluCaj)";
            int totIns = 0;

            using (SqlConnection con = new SqlConnection(ConexionUtil.Cadena))
            {
                try
                {
                    SqlCommand cmdIns = new SqlCommand(sql, con);
                    cmdIns.Parameters.AddWithValue("@desPlaPro", planProy.desPlaPro);
                    cmdIns.Parameters.AddWithValue("@codPlaPro", planProy.codPlaPro);
                    cmdIns.Parameters.AddWithValue("@codPro",planProy.codPro);
                    cmdIns.Parameters.AddWithValue("@codFluCaj",planProy.codFluCaj);
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

        //Actualizar plan de proyecto
        public int actualizarPlanProyecto(PlanProyecto planProy)
        {

            string sql = "update dbo.T_PlanProyecto set desPlaPro=@desPlaPro, codPlaPro=@codPlaPro, codPro=@codPro, codFluCaj=@codFluCaj)";
            int totUpd = 0;

            using (SqlConnection con = new SqlConnection(ConexionUtil.Cadena))
            {
                try
                {
                    SqlCommand cmdUpd = new SqlCommand(sql, con);
                    cmdUpd.Parameters.AddWithValue("@desPlaPro",planProy.desPlaPro);
                    cmdUpd.Parameters.Add("@codPlaPro",planProy.codPlaPro);
                    cmdUpd.Parameters.Add("@codPro",planProy.codPro);
                    cmdUpd.Parameters.Add("@codFluCaj",planProy.codFluCaj);
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

    }
}