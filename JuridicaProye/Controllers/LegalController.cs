using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using DemoMVC.Models;
using DemoMVC.Persistencia;

namespace DemoMVC.Controllers
{
    public class LegalController : Controller
    {
        //
        // GET: /Legal/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Registrar()
        {

            ProyectoDAO proye = new ProyectoDAO();
            ViewData["Proyectos"] = new SelectList(proye.obtenerProyectoPorFiltro(1,0,"PRE").ToList(), "codPro", "nomPro");
            return View();
        }

        [HttpPost]
        public ActionResult Registrar(FormCollection formCollection)
        {
            LegalRequerimiento legalReq = new LegalRequerimiento();
            String txtCodPro = formCollection["codPro"];
            legalReq.codPro = Int32.Parse(txtCodPro);
            //legalReq.codPro = Convert.ToInt32(Request.Form["cboProyecto"]);
            legalReq.cDescripcion = Request.Form["txtDescripcion"];
            legalReq.codUsuario = 2; //cperez
            legalReq.idTipoReqLegal = 1; //Carta Notarial

            LegalDAO legalDAO = new LegalDAO();
            int nuevoIdReqLegal = legalDAO.insertarRequerimientoLegal(legalReq);

            //Insertar Vecinos
            /*int totalVecinos = arrVecinos.Count;
            int cantInserts = 0;
            if (totalVecinos > 0)
            {
                foreach (string value in arrVecinos)
                {
                    LegalVecinoColindante legalVecino = new LegalVecinoColindante();
                    legalVecino.cNombres = value;
                    var n = legalDAO.insertarRequerimientoLegalVecinos(legalVecino);
                    if (n > 0) cantInserts++;
                }*/
                
                /*for (int i = 0; i < totalVecinos; i++)
                {
                    LegalVecinoColindante legalVecino = new LegalVecinoColindante();
                    legalVecino.cNombres = arrVecinos[i].cNombres;
                    var n = legalDAO.insertarRequerimientoLegalVecinos(legalVecino);
                    if (n > 0) cantInserts++;
                }*/
            //}

            //int totInsVec = 0;
            ProyectoDAO proyecto = new ProyectoDAO();
            ViewData["Proyectos"] = new SelectList(proyecto.obtenerProyectoPorFiltro(1,0,"PRE").ToList(), "codPro", "nomPro");

            if (nuevoIdReqLegal > 0) TempData["bInsertSuccess"] = true; else TempData["bInsertSuccess"] = false;

            //TempData["MsgConfirmacion"] = "El requerimiento legal con id: " + legalReq.codPro + " ha sido solicitado.";

            return View("Registrar");
        }

         public ActionResult listarRequerimientos()
        {
            LegalDAO proye = new LegalDAO();
            ProyectoDAO proyecto = new ProyectoDAO();

            ViewData["Proyectos"] = new SelectList(proyecto.obtenerProyectoPorFiltro(1, 0, "PRE"), "codPro", "nomPro");

            ViewData["TipoReq"] = new SelectList(proye.listarTipoRequerimiento().ToList(), "idTipoReq", "descripcion");
            //return View(proye);

            List<Requerimiento> listadoRequerimiento = null;

            listadoRequerimiento = proye.listarRequerimiento(0, 0, 0, 0, Convert.ToDateTime("2013-01-01"), Convert.ToDateTime("2013-08-31"));
                         
            return View(listadoRequerimiento);
        }

        [HttpPost]
        public ActionResult listarRequerimientos(FormCollection formCollection)
        {
            LegalDAO proye = new LegalDAO();
            ProyectoDAO proyecto = new ProyectoDAO();

            List<Requerimiento> listadoRequerimiento = null;

            ViewData["Proyectos"] = new SelectList(proyecto.obtenerProyectoPorFiltro(1,0,"PRE").ToList(), "codPro", "nomPro");
            ViewData["TipoReq"] = new SelectList(proye.listarTipoRequerimiento().ToList(), "idTipoReq", "descripcion");
            

            String  txtCodSolicitud = formCollection["txtCodSolicitud"].ToString();
            String txtCodPro = formCollection["codPro"].ToString();
            String  txtTipoReq = formCollection["codTipoReq"].ToString();
            listadoRequerimiento = proye.listarRequerimiento(Convert.ToInt16(DBNull.Value),1,1,1,Convert.ToDateTime("2013-01-01"),Convert.ToDateTime("2013-09-01"));


            return View(listadoRequerimiento);
        }
    }

}
