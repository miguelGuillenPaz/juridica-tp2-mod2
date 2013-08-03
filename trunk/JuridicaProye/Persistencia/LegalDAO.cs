using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Collections;

using DemoMVC.Models;

namespace DemoMVC.Persistencia
{
    public class LegalDAO
    {
        //Solicitud Requerimiento Legal
        public int insertarRequerimientoLegal(LegalRequerimiento reqLegal)
        {
            int nuevoIdReqLegal = 0;

            using (SqlConnection con = new SqlConnection(ConexionUtil.Cadena))
            {
                SqlTransaction sqlTransaction = null;
                try
                {
                    SqlCommand cmdIns = new SqlCommand("T_RequerimientoLegal_CN_Insertar", con);
                    cmdIns.CommandType = System.Data.CommandType.StoredProcedure;
                                        
                    con.Open();
                    sqlTransaction = con.BeginTransaction();

                    cmdIns.Parameters.Add(new SqlParameter("@codPro", reqLegal.codPro));
                    cmdIns.Parameters.Add(new SqlParameter("@idTipoReqLegal", reqLegal.idTipoReqLegal));
                    cmdIns.Parameters.Add(new SqlParameter("@codUsuario", reqLegal.codUsuario));
                    cmdIns.Parameters.Add(new SqlParameter("@cDescripcion", reqLegal.cDescripcion));

                    cmdIns.Transaction = sqlTransaction;
                    //totIns = cmdIns.ExecuteNonQuery();
                    nuevoIdReqLegal = Convert.ToInt32(cmdIns.ExecuteScalar());
                    sqlTransaction.Commit();

                    con.Close();

                }
                catch (Exception ex)
                {
                    if (sqlTransaction != null) sqlTransaction.Rollback();
                    throw new Exception(ex.ToString(), ex);
                }
                finally
                {
                    if (con.State == ConnectionState.Open) con.Close();
                    sqlTransaction.Dispose();
                }
            }

            return nuevoIdReqLegal;
        }

        //Solicitud Requerimiento Legal - Listado de Vecinos
        public int insertarRequerimientoLegalVecinos(LegalVecinoColindante vecinoColLegal)
        {
            int totIns = 0;

            using (SqlConnection con = new SqlConnection(ConexionUtil.Cadena))
            {
                SqlTransaction sqlTransaction = null;
                try
                {
                    SqlCommand cmdIns = new SqlCommand("T_RequerimientoLegal_CN_InsertarVecinos", con);
                    cmdIns.CommandType = System.Data.CommandType.StoredProcedure;

                    con.Open();
                    sqlTransaction = con.BeginTransaction();

                    cmdIns.Parameters.Add(new SqlParameter("@idReqLegal", vecinoColLegal.idReqLegal));
                    cmdIns.Parameters.Add(new SqlParameter("@cNombres", vecinoColLegal.cNombres));
                    cmdIns.Parameters.Add(new SqlParameter("@cApellidos", vecinoColLegal.cApellidos));
                    cmdIns.Parameters.Add(new SqlParameter("@cDni", vecinoColLegal.cDni));
                    cmdIns.Parameters.Add(new SqlParameter("@cTipoEdificacion", vecinoColLegal.cTipoEdificacion));
                    cmdIns.Parameters.Add(new SqlParameter("@cNombreCondominio", vecinoColLegal.cNombreCondominio));
                    cmdIns.Parameters.Add(new SqlParameter("@cDireccion", vecinoColLegal.cDireccion));
                    cmdIns.Parameters.Add(new SqlParameter("@codUbiDep", vecinoColLegal.codUbiDep));
                    cmdIns.Parameters.Add(new SqlParameter("@codUbiProv", vecinoColLegal.codUbiProv));
                    cmdIns.Parameters.Add(new SqlParameter("@codUbiDist", vecinoColLegal.codUbiDist));

                    cmdIns.Transaction = sqlTransaction;
                    totIns = cmdIns.ExecuteNonQuery();
                    sqlTransaction.Commit();

                    con.Close();

                }
                catch (Exception ex)
                {
                    if (sqlTransaction != null) sqlTransaction.Rollback();
                    throw new Exception(ex.ToString(), ex);
                }
                finally
                {
                    if (con.State == ConnectionState.Open) con.Close();
                    sqlTransaction.Dispose();
                }
            }

            return totIns;
        }

        public List<Proyecto> listarProyecto(string statusProye)
        {
            List<Proyecto> listaProyecto = null;
            Proyecto proye = null;

            string sql = "";
            sql = "select  codPro, nomPro from t_proyecto where estPro =@statusProye";

            using (SqlConnection con = new SqlConnection(ConexionUtil.Cadena))
            {
                con.Open();
                using (SqlCommand com = new SqlCommand(sql, con))
                {
                    com.Parameters.Add(new SqlParameter("@statusProye", statusProye));

                    using (SqlDataReader resultado = com.ExecuteReader())
                    {
                        if (resultado.HasRows)
                        {
                            listaProyecto = new List<Proyecto>();
                            while (resultado.Read())
                            {
                                proye = new Proyecto()
                                {
                                    codPro = (int)resultado["codPro"],
                                    desPro = (String)resultado["nomPro"],
                                };
                                listaProyecto.Add(proye);
                            }
                        }
                        else
                        {
                            Debug.WriteLine("No retornó registros");
                        }

                    }
                }


            }
            return listaProyecto;

        }

        public List<Requerimiento> listarRequerimiento(string idRequerimiento)
        {
            List<Requerimiento> listaRequerimiento = null;
            Requerimiento req = null;

            string sql = "";
            sql = "select idReqLegal,idTipoReqLegal,codPro,dfechaRegistro from T_RequerimientoLegal_CN";

            using (SqlConnection con = new SqlConnection(ConexionUtil.Cadena))
            {
                con.Open();
                using (SqlCommand com = new SqlCommand(sql, con))
                {
                    com.Parameters.Add(new SqlParameter("@idReq", idRequerimiento));

                    using (SqlDataReader resultado = com.ExecuteReader())
                    {
                        if (resultado.HasRows)
                        {
                            listaRequerimiento = new List<Requerimiento>();
                            while (resultado.Read())
                            {
                                req = new Requerimiento()
                                {
                                    idReq = (int)resultado["idReqLegal"],
                                    idTipoRequerimiento = (Int16)resultado["idTipoReqLegal"],
                                    idProyecto = (int)resultado["codPro"],
                                    fecha = (DateTime)resultado["dFechaRegistro"],
                                 };
                                listaRequerimiento.Add(req);
                            }
                        }
                        else
                        {
                            Debug.WriteLine("No retornó registros");
                        }

                    }
                }
            }
            return listaRequerimiento;
        }


        public List<TipoRequerimiento> listarTipoRequerimiento()
        {
            List<TipoRequerimiento> listaTipoRequerimiento = null;
            TipoRequerimiento tipo = null;

            string sql = "";
            sql = "select idTipoReqLegal, cDescripcion from T_RequerimientoLegal_Tipo";

            using (SqlConnection con = new SqlConnection(ConexionUtil.Cadena))
            {
                con.Open();
                using (SqlCommand com = new SqlCommand(sql, con))
                {

                    using (SqlDataReader resultado = com.ExecuteReader())
                    {
                        if (resultado.HasRows)
                        {
                            listaTipoRequerimiento = new List<TipoRequerimiento>();
                            while (resultado.Read())
                            {
                                tipo = new TipoRequerimiento()
                                {
                                    idTipoReq = (Int16)resultado["idTipoReqLegal"],
                                    descripcion = (String)resultado["cDescripcion"],
                                };
                                listaTipoRequerimiento.Add(tipo);
                            }
                        }
                        else
                        {
                            Debug.WriteLine("No retornó registros");
                        }

                    }
                }


            }
            return listaTipoRequerimiento;
        }

    }
}