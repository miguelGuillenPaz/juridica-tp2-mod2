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
    public class ProyectoDAO
    {

        //Actualizar estado de proyecto para indicar que ya se asociaron las actividades
        public int actualizarProyecto(int codPro, string estPro)
        {
            string sql = "update dbo.T_Proyecto set estPro=@estPro where codPro=@codPro";
            int totUpd = 0;

            using (SqlConnection con = new SqlConnection(ConexionUtil.Cadena))
            {
                try
                {
                    SqlCommand cmdUpd = new SqlCommand(sql, con);
                    cmdUpd.Parameters.AddWithValue("@codPro", codPro);
                    cmdUpd.Parameters.AddWithValue("@estPro", estPro);
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

        //Listado de proyectos
        public List<Proyecto> obtenerProyectoPorFiltro(int tipoFiltro, int codProy, string statusProy)
        {
            List<Proyecto> listadoProyectos = null;
            Proyecto proyecto = null;
            string sql = "";

            if (tipoFiltro == 0) {
                //sql = "select * from dbo.T_Proyecto where codPro=@codPro";
                sql = "select proy.*, tipProy.nomTipPro, preProy.impPre, ubigeo.nomUbiDep, ubigeo.nomUbiProv, ubigeo.nomUbiDist from dbo.T_Proyecto proy ";
                sql = sql + "inner join dbo.T_TipoProyecto tipProy on tipProy.codTipPro = proy.codTipPro ";
                sql = sql + "inner join dbo.T_Presupuesto preProy on preProy.codPro = proy.codPro ";
                sql = sql + "inner join dbo.T_Ubigeo ubigeo on (ubigeo.codUbiDep = proy.codUbiDep ";
                sql = sql + "and ubigeo.codUbiProv = proy.codUbiProv and ubigeo.codUbiDist = proy.codUbiDist) ";
                sql = sql + "where proy.codPro=@codPro";
            }
            if (tipoFiltro == 1) {
                sql = "select proy.*, tipProy.nomTipPro, preProy.impPre, ubigeo.nomUbiDep, ubigeo.nomUbiProv, ubigeo.nomUbiDist from dbo.T_Proyecto proy ";
                sql = sql + "inner join dbo.T_TipoProyecto tipProy on tipProy.codTipPro = proy.codTipPro ";
                sql = sql + "inner join dbo.T_Presupuesto preProy on preProy.codPro = proy.codPro ";
                sql = sql + "inner join dbo.T_Ubigeo ubigeo on (ubigeo.codUbiDep = proy.codUbiDep ";
                sql = sql + "and ubigeo.codUbiProv = proy.codUbiProv and ubigeo.codUbiDist = proy.codUbiDist) ";
                sql = sql + "where proy.estPro=@estPro";
            }
            if (tipoFiltro == 2) 
            {
                sql = "select proy.*, tipProy.nomTipPro, preProy.impPre, ubigeo.nomUbiDep, ubigeo.nomUbiProv, ubigeo.nomUbiDist from dbo.T_Proyecto proy ";
                sql = sql + "inner join dbo.T_TipoProyecto tipProy on tipProy.codTipPro = proy.codTipPro ";
                sql = sql + "inner join dbo.T_Presupuesto preProy on preProy.codPro = proy.codPro ";
                sql = sql + "inner join dbo.T_Ubigeo ubigeo on (ubigeo.codUbiDep = proy.codUbiDep ";
                sql = sql + "and ubigeo.codUbiProv = proy.codUbiProv and ubigeo.codUbiDist = proy.codUbiDist) ";
                sql = sql + "where proy.codPro=@codPro and proy.estPro=@estPro";
            } 

            using (SqlConnection con = new SqlConnection(ConexionUtil.Cadena)) {
                con.Open();
                using (SqlCommand com = new SqlCommand(sql, con)) {
                    if (tipoFiltro == 0) {
                        com.Parameters.Add(new SqlParameter("@codPro", codProy));
                    }
                    if (tipoFiltro == 1)
                    {
                        com.Parameters.Add(new SqlParameter("@estPro", statusProy));
                    }
                    if (tipoFiltro == 2)
                    {
                        com.Parameters.Add(new SqlParameter("@codPro", codProy));
                        com.Parameters.Add(new SqlParameter("@estPro", statusProy));
                    }

                    using (SqlDataReader resultado = com.ExecuteReader())
                    {
                        if (resultado.HasRows)
                        {
                            //Obtenemos uno por uno
                            listadoProyectos = new List<Proyecto>();
                            while (resultado.Read())
                            {
                                //Recorremos objeto por objeto y anadimos
                                proyecto = new Proyecto
                                {
                                    codPro = (int)resultado["codPro"],
                                    codTipPro = (int)resultado["codTipPro"],
                                    codUbiDep = (int)resultado["codUbiDep"],
                                    codFluCaj = (int)resultado["codFluCaj"],
                                    codUbiProv = (int)resultado["codUbiProv"],
                                    codUbiDist = (int)resultado["codUbiDist"],
                                    nomPro = (string)resultado["nomPro"],
                                    feciniplaPro = (string)resultado["feciniplaPro"],
                                    fecfinplaPro = (string)resultado["fecfinplaPro"],
                                    fecinireaPro = (string)resultado["fecinireaPro"],
                                    fecfinreaPro = (string)resultado["fecfinreaPro"],
                                    priPro = (int)resultado["priPro"],
                                    desPro = (string)resultado["desPro"],
                                    razsocfacPro = (string)resultado["razsocfacPro"],
                                    conpagPro = (string)resultado["conpagPro"],
                                    monfacPro = (string)resultado["monfacPro"],
                                    nrohojenvPro = (int)resultado["nrohojenvPro"],
                                    fechojenvPro = (string)resultado["fechojenvPro"],
                                    estPro = (string)resultado["estPro"],
                                    rucfacPro = (string)resultado["rucfacPro"],
                                    tipoProyecto = (string)resultado["nomTipPro"],
                                    presupuesto = (double)resultado["impPre"],
                                    nomUbiDep = (string)resultado["nomUbiDep"],
                                    nomUbiProv = (string)resultado["nomUbiProv"],
                                    nomUbiDist = (string)resultado["nomUbiDist"],
                                };
                                listadoProyectos.Add(proyecto);
                                
                            }
                        }
                        else 
                        {
                            Debug.WriteLine("No retornó registros");
                        }
                    }
                }
            }
            return listadoProyectos;
        }

    }
}