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
    public class PresupuestoDAO
    {

        //Listado de presupuestos
        public List<Presupuesto> obtenerPresupuestoPorFiltro(int tipoFiltro, int codProy, string codPre)
        {
            List<Presupuesto> listadoPresupuestos = null;
            Presupuesto Presupuesto = null;
            string sql = "";

            if (tipoFiltro == 0) sql = "select * from dbo.T_Presupuesto where codPro=@codPro";

            using (SqlConnection con = new SqlConnection(ConexionUtil.Cadena))
            {
                con.Open();
                using (SqlCommand com = new SqlCommand(sql, con))
                {
                    if (tipoFiltro == 0)
                    {
                        com.Parameters.Add(new SqlParameter("@codPro", codProy));
                    }

                    using (SqlDataReader resultado = com.ExecuteReader())
                    {
                        if (resultado.HasRows)
                        {
                            //Obtenemos uno por uno
                            listadoPresupuestos = new List<Presupuesto>();
                            while (resultado.Read())
                            {
                                //Recorremos objeto por objeto y anadimos
                                Presupuesto = new Presupuesto
                                {
                                    codPre = (int)resultado["codPre"],
                                    codPro = (int)resultado["codPro"],
                                    codTipMon = (int)resultado["codTipMon"],
                                    verPre = (int)resultado["verPre"],
                                    fecPre = (string)resultado["fecPre"],
                                    monPre = (double)resultado["monPre"],
                                    impPre = (double)resultado["impPre"],
                                    estPre = (string)resultado["estPre"],
                                    impconPre = (double)resultado["impconPre"],
                                };
                                //Adicionamos al arreglo el objeto
                                listadoPresupuestos.Add(Presupuesto);
                            }
                        }
                        else
                        {
                            Debug.WriteLine("No retornó registros");
                        }
                    }
                }
            }
            return listadoPresupuestos;
        }



    }
}