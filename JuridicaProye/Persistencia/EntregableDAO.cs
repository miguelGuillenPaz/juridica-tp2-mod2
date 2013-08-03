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
    public class EntregableDAO
    {

        //Total registros
        public int totalRegistros(int codEnt, int codPro)
        {

            string sql = "select count(*) from dbo.T_Entregable where codEnt=@codEnt and codPro=@codPro";
            int totReg = 0;

            using (SqlConnection con = new SqlConnection(ConexionUtil.Cadena))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand(sql, con);
                    con.Open();
                    cmd.Parameters.Add(new SqlParameter("@codEnt", codEnt));
                    cmd.Parameters.Add(new SqlParameter("@codPro", codPro));
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

        //Insertar Entregable
        public int insertarEntregable(Entregable entregable)
        {

            string sql = "insert into dbo.T_Entregable values (@nomEnt,@desEnt,@codEnt,@codPro)";
            int totIns = 0;

            using (SqlConnection con = new SqlConnection(ConexionUtil.Cadena))
            {
                try
                {
                    SqlCommand cmdIns = new SqlCommand(sql, con);
                    cmdIns.Parameters.AddWithValue("@nomEnt", entregable.nomEnt);
                    cmdIns.Parameters.AddWithValue("@desEnt", entregable.desEnt);
                    cmdIns.Parameters.AddWithValue("@codEnt", entregable.codEnt);
                    cmdIns.Parameters.AddWithValue("@codPro", entregable.codPro);
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

        //Actualizar Entregable
        public int actualizarEntregable(Entregable entregable)
        {

            string sql = "update dbo.T_Entregable set nomEnt=@nomEnt, desEnt=@desEnt, codEnt=@codEnt, codPro=@codPro)";
            int totUpd = 0;

            using (SqlConnection con = new SqlConnection(ConexionUtil.Cadena))
            {
                try
                {
                    SqlCommand cmdUpd = new SqlCommand(sql, con);
                    cmdUpd.Parameters.AddWithValue("@nomEnt", entregable.nomEnt);
                    cmdUpd.Parameters.AddWithValue("@desEnt", entregable.desEnt);
                    cmdUpd.Parameters.AddWithValue("@codEnt", entregable.codEnt);
                    cmdUpd.Parameters.AddWithValue("@codPro", entregable.codPro);
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

        //Eliminar Entregable
        public void eliminarEntregable(int codEnt, int codPro)
        {
            string sql = "delete from dbo.T_Entregable where codEnt=@codEnt";

            try
            {
                using (SqlConnection con = new SqlConnection(ConexionUtil.Cadena))
                {
                    SqlCommand cmd = new SqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@codEnt", codEnt);
                    cmd.Parameters.AddWithValue("@codPro", codPro);
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