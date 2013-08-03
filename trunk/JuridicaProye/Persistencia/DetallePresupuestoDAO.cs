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
    public class DetallePresupuestoDAO
    {

        //Listado de DetallePresupuestos
        public List<DetallePresupuesto> obtenerDetallePresupuestoPorFiltro(int tipoFiltro, int codPre)
        {
            List<DetallePresupuesto> listadoDetallePresupuestos = null;
            DetallePresupuesto DetallePresupuesto = null;
            string sql = "";

            if (tipoFiltro == 0) sql = "select * from dbo.T_DetallePresupuesto where codPre=@codPre";

            using (SqlConnection con = new SqlConnection(ConexionUtil.Cadena))
            {
                con.Open();
                using (SqlCommand com = new SqlCommand(sql, con))
                {
                    if (tipoFiltro == 0)
                    {
                        com.Parameters.Add(new SqlParameter("@codPre", codPre));
                    }

                    using (SqlDataReader resultado = com.ExecuteReader())
                    {
                        if (resultado.HasRows)
                        {
                            //Obtenemos uno por uno
                            listadoDetallePresupuestos = new List<DetallePresupuesto>();
                            while (resultado.Read())
                            {
                                //Recorremos objeto por objeto y anadimos
                                DetallePresupuesto = new DetallePresupuesto
                                {
                                    codDetPre = (int)resultado["codDetPre"],
                                    codPre = (int)resultado["codPre"],
                                    desDetPre = (string)resultado["desDetPre"],
                                    porDetPre = (double)resultado["porDetPre"],
                                    valDetPre = (double)resultado["valDetPre"],
                                    codVarPre = (int)resultado["codVarPre"],
                                };
                                //Adicionamos al arreglo el objeto
                                listadoDetallePresupuestos.Add(DetallePresupuesto);
                            }
                        }
                        else
                        {
                            Debug.WriteLine("No retornó registros");
                        }
                    }
                }
            }
            return listadoDetallePresupuestos;
        }

    }
}