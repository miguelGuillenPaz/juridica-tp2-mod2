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
    public class UbigeoDAO
    {
        //Listado de ubigeos: departamentos
        public List<Ubigeo> obtenerUbigeo(int codTipoUbi, int codUbiDep, int codUbiProv, int codUbiDist)
        {
            List<Ubigeo> listadoUbigeos = null;
            Ubigeo ubigeo = null;
            string sql = "";

            if (codTipoUbi == 0) sql = "select distinct nomUbiDep, codUbiDep from dbo.T_Ubigeo";
            if (codTipoUbi == 1) sql = "select distinct nomUbiProv, codUbiProv from dbo.T_Ubigeo where codUbiDep=@codUbiDep";
            if (codTipoUbi == 2) sql = "select distinct nomUbiDist, codUbiDist from dbo.T_Ubigeo where codUbiDep=@codUbiDep and codUbiProv=@codUbiProv";
            if (codTipoUbi == 3) sql = "select nomUbiDep from dbo.T_Ubigeo where codUbiDep=@codUbiDep";
            if (codTipoUbi == 4) sql = "select nomUbiProv from dbo.T_Ubigeo where codUbiDep=@codUbiDep and codUbiProv=@codUbiProv";
            if (codTipoUbi == 5) sql = "select nomUbiDist from dbo.T_Ubigeo where codUbiDep=@codUbiDep and codUbiProv=@codUbiProv and codUbiDist=@codUbiDist";

            using (SqlConnection con = new SqlConnection(ConexionUtil.Cadena))
            {
                con.Open();
                using (SqlCommand com = new SqlCommand(sql, con))
                {
                    if (codTipoUbi == 3) {
                        com.Parameters.Add(new SqlParameter("@codUbiDep", codUbiDep));
                    }
                    if (codTipoUbi == 1 || codTipoUbi == 2 || codTipoUbi == 4)
                    {
                        com.Parameters.Add(new SqlParameter("@codUbiDep", codUbiDep));
                    }
                    if (codTipoUbi == 2 || codTipoUbi == 4)
                    {
                        com.Parameters.Add(new SqlParameter("@codUbiProv", codUbiProv));
                    }
                    if (codTipoUbi == 5)
                    {
                        com.Parameters.Add(new SqlParameter("@codUbiDep", codUbiDep));
                        com.Parameters.Add(new SqlParameter("@codUbiProv", codUbiProv));
                        com.Parameters.Add(new SqlParameter("@codUbiDist", codUbiDist));
                    }
                    using (SqlDataReader resultado = com.ExecuteReader())
                    {
                        if (resultado.HasRows)
                        {
                            //Obtenemos uno por uno
                            listadoUbigeos = new List<Ubigeo>();

                            while (resultado.Read())
                            {
                                //Si los codigos son 0, 1, 2
                                if (codTipoUbi == 0 || codTipoUbi == 1 || codTipoUbi == 2)
                                {
                                    //Adicionamos al arreglo del objeto
                                    if (codTipoUbi == 0)
                                    {
                                        //Recorremos objeto por objeto y anadimos
                                        ubigeo = new Ubigeo
                                        {
                                            codUbiDep = (int)resultado["codUbiDep"],
                                            nomUbiDep = (string)resultado["nomUbiDep"],
                                        };
                                        if (ubigeo.codUbiDep == codUbiDep)
                                        {
                                            ubigeo.selected = "selected";
                                        }
                                    }
                                    if (codTipoUbi == 1)
                                    {
                                        //Recorremos objeto por objeto y anadimos
                                        ubigeo = new Ubigeo
                                        {
                                            codUbiProv = (int)resultado["codUbiProv"],
                                            nomUbiProv = (string)resultado["nomUbiProv"],
                                        };
                                        if (ubigeo.codUbiProv == codUbiProv)
                                        {
                                            ubigeo.selected = "selected";
                                        }
                                    }
                                    if (codTipoUbi == 2)
                                    {
                                        //Recorremos objeto por objeto y anadimos
                                        ubigeo = new Ubigeo
                                        {
                                            codUbiDist = (int)resultado["codUbiDist"],
                                            nomUbiDist = (string)resultado["nomUbiDist"],
                                        };
                                        if (ubigeo.codUbiDist == codUbiDist)
                                        {
                                            ubigeo.selected = "selected";
                                        }
                                    }
                                    listadoUbigeos.Add(ubigeo);                            
                                }
                                else 
                                {
                                    //Recorremos objeto por objeto y anadimos
                                    ubigeo = new Ubigeo
                                    {
                                        codUbigeo = (int)resultado["codUbigeo"],
                                        codUbiDep = (int)resultado["codUbiDep"],
                                        codUbiProv = (int)resultado["codUbiProv"],
                                        codUbiDist = (int)resultado["codUbiDist"],
                                        nomUbiDep = (string)resultado["nomUbiDep"],
                                        nomUbiProv = (string)resultado["nomUbiProv"],
                                        nomUbiDist = (string)resultado["nomUbiDist"],
                                        codposUbi = (string)resultado["codposUbi"],
                                    };
                                    //Adicionamos al arreglo del objeto
                                    listadoUbigeos.Add(ubigeo);                                
                                }
                            }
                        }
                    }
                }
                con.Close();
            }

            return listadoUbigeos;
        }

    }
}