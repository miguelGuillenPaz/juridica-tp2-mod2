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

        //public List<Proyecto> listarProyecto(string statusProye)
        //{
        //    List<Proyecto> listaProyecto = null;
        //    Proyecto proye = null;

        //    string sql = "";
        //    sql = "select  codPro, nomPro from t_proyecto where estPro =@statusProye";

        //    using (SqlConnection con = new SqlConnection(ConexionUtil.Cadena))
        //    {
        //        con.Open();
        //        using (SqlCommand com = new SqlCommand(sql, con))
        //        {
        //            com.Parameters.Add(new SqlParameter("@statusProye", statusProye));

        //            using (SqlDataReader resultado = com.ExecuteReader())
        //            {
        //                if (resultado.HasRows)
        //                {
        //                    listaProyecto = new List<Proyecto>();
        //                    while (resultado.Read())
        //                    {
        //                        proye = new Proyecto()
        //                        {
        //                            codPro = (int)resultado["codPro"],
        //                            desPro = (String)resultado["nomPro"],
        //                        };
        //                        listaProyecto.Add(proye);
        //                    }
        //                }
        //                else
        //                {
        //                    Debug.WriteLine("No retornó registros");
        //                }

        //            }
        //        }


        //    }
        //    return listaProyecto;

        //}

        public List<Requerimiento> listarRequerimiento(Int16 idRequerimiento, Int16 idProyecto, Int16 idTipo, Int16 idEstado, DateTime fecIni, DateTime fecFin)
        {
            List<Requerimiento> listaRequerimiento = null;
            Requerimiento req = null;

           string sql = "";
            sql = "select idReqLegal, r.codPro,p.desPro,p.nomPro,r.idTipoReqLegal,rt.cDescripcion,r.cDescripcion as 'desc',dFechaRegistro,r.idEstadoReqLegal, re.cDescripcion as 'estado' ";
            sql = sql + "from T_RequerimientoLegal_CN r ";
            sql = sql + "inner join T_Proyecto p on p.codPro = r.codPro ";
            sql = sql + "inner join T_RequerimientoLegal_Tipo rt on rt.idTipoReqLegal = r.idTipoReqLegal ";
            sql = sql + "inner join t_requerimientoLegal_estado re on re.idEstadoReqLegal= r.idEstadoReqLegal ";
            sql = sql + "where (@idEstado is null or r.idEstadoReqLegal=@idEstado) ";
            sql = sql + "and (@idTipo is null or r.idTipoReqLegal =@idTipo) ";
            sql = sql + "and (@idProyecto is null or r.codPro = @idProyecto) ";
            sql = sql + "and (@idReqLegal is null or r.idReqLegal =@idReqLegal) ";
            sql = sql + "and r.dFechaRegistro >= @fecIni ";
            sql = sql + "and r.dFechaRegistro <= @fecFin";
            

            using (SqlConnection con = new SqlConnection(ConexionUtil.Cadena))
            {
                con.Open();
                using (SqlCommand com = new SqlCommand(sql, con))
                {
                    if (idRequerimiento == 0)
                    {
                        com.Parameters.Add(new SqlParameter("@idReqLegal", DBNull.Value));
                    }
                    else
                    {
                        com.Parameters.Add(new SqlParameter("@idReqLegal", idRequerimiento));
                    }
                    if (idProyecto == 0)
                    {
                        com.Parameters.Add(new SqlParameter("@idProyecto", DBNull.Value));
                    }
                    else
                    {
                        com.Parameters.Add(new SqlParameter("@idProyecto", idProyecto));
                    }
                    if (idEstado == 0)
                    {
                        com.Parameters.Add(new SqlParameter("@idEstado", DBNull.Value));
                    }
                    else
                    {
                        com.Parameters.Add(new SqlParameter("@idEstado", idEstado));
                    }
                    if (idTipo == 0)
                    {
                        com.Parameters.Add(new SqlParameter("@idTipo", DBNull.Value));
                    }
                    else
                    {
                        com.Parameters.Add(new SqlParameter("@idTipo", idTipo));
                    }
                    com.Parameters.Add(new SqlParameter("@fecIni", fecIni));
                    com.Parameters.Add(new SqlParameter("@fecFin", fecFin));

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
                                    descripcion = (String)resultado["desc"],
                                    descTipoReq=(String)resultado["cDescripcion"],
                                    desEstado =(String)resultado["estado"],
                                    idTipoRequerimiento = (Int16)resultado["idTipoReqLegal"],
                                    desProyecto =(String)resultado["desPro"],
                                    idProyecto = (int)resultado["codPro"],
                                    idEstado = (Int16)resultado["idEstadoReqLegal"],
                                    fecha = (DateTime)resultado["dFechaRegistro"],
                                    
                                 };
                                Proyecto pro = new Proyecto();
                                pro.codPro = (int)resultado["codPro"];
                                pro.desPro = (String)resultado["desPro"];

                                req.Proyecto = pro;
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
            sql = "select idTipoReqLegal, cDescripcion from T_RequerimientoLegal_Tipo where bActivo=1";

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
                            tipo = new TipoRequerimiento()
                            {
                                idTipoReq=0,
                                descripcion="Todos",
                            };
                            listaTipoRequerimiento.Add(tipo);
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

        public List<Estado> listarEstadoRequerimiento()
        {
            List<Estado> listaEstadoRequerimiento = null;
            Estado estado = null;

            string sql = "";
            sql = "select idEstadoReqLegal, cDescripcion from T_RequerimientoLegal_Estado";

            using (SqlConnection con = new SqlConnection(ConexionUtil.Cadena))
            {
                con.Open();
                using (SqlCommand com= new SqlCommand(sql, con))
                {
                    using (SqlDataReader resultado = com.ExecuteReader())
                    {
                        if (resultado.HasRows)
                        {
                            listaEstadoRequerimiento = new List<Estado>();
                            estado= new Estado()
                            {
                                idEstadoReq = 0,
                                descripcion = "Todos",
                            };
                            listaEstadoRequerimiento.Add(estado);
                            while (resultado.Read())
                            {
                                estado = new Estado()
                            {
                                idEstadoReq = (Int16)resultado["idEstadoReqLegal"],
                                descripcion = (String)resultado["cDescripcion"],
                            };
                                listaEstadoRequerimiento.Add(estado);
                            }
                        }
                        else
                        {
                            Debug.WriteLine("No retornó registros");
                        }
                    }
                }
            }
            return listaEstadoRequerimiento;
        }
        
    }
}