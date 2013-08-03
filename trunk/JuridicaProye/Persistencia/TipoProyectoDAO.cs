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
    public class TipoProyectoDAO
    {

        //Listado de tipos de proyectos
        public List<TipoProyecto> obtenerTipoProyecto()
        {
            List<TipoProyecto> listadoTipoProyectos = null;
            TipoProyecto tipProy = null;
            string sql = "select * from dbo.T_TipoProyecto";

            using (SqlConnection con = new SqlConnection(ConexionUtil.Cadena)) 
            {
                con.Open();
                using (SqlCommand com = new SqlCommand(sql, con)) 
                {
                    using (SqlDataReader resultado = com.ExecuteReader()) {
                        if (resultado.HasRows)
                        { 
                            //Obtenemos uno por uno
                            listadoTipoProyectos = new List<TipoProyecto>();
                            while (resultado.Read())
                            {
                                //Recorremos objeto por objeto y anadimos
                                tipProy = new TipoProyecto
                                {
                                    nomTipPro = (string)resultado["nomTipPro"],
                                    desTipPro = (string)resultado["desTipPro"],
                                    codTipPro = (int)resultado["codTipPro"],
                                };
                                //Adicionamos al arreglo del objeto
                                listadoTipoProyectos.Add(tipProy);
                            }
                        }                        
                    }
                }
                con.Close();
            }

            return listadoTipoProyectos;
        }

    }
}