using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DemoMVC.Models;
using DemoMVC.Persistencia;

namespace DemoMVC.Controllers
{
    [HandleError]
    public class PlanificacionController : Controller
    {
        //
        // GET: /Planificacion/
        public List<Actividad> listadoActividadesTemp = new List<Actividad>();

        public ActionResult Index()
        {
            return View();
        }

        //Muestra plan de proyecto detalle y lo crea
        [HttpGet]
        public ActionResult CrearPlan(string codProy)
        {
            //Obtener Proyecto 
            List<Proyecto> listadoProyectos = null;
            ProyectoDAO ProyectoDAO = new ProyectoDAO();
            
            string nomProy = "";
            string monProy = "";
            string fecIniP = "";
            string fecFinP = "";
            string desProy = "";
            string tipProy = "";
            string priProy = "";
            string ubiProyDpto = "";
            string ubiProyProv = "";
            string ubiProyDist = "";
            double presupuesto = 0;

            listadoProyectos = ProyectoDAO.obtenerProyectoPorFiltro(0, Convert.ToInt32(codProy), "");
            
            foreach (Proyecto proy in listadoProyectos) {
                nomProy = proy.nomPro;
                monProy = proy.monfacPro;
                fecIniP = proy.feciniplaPro;
                fecFinP = proy.fecfinplaPro;
                desProy = proy.desPro;
                tipProy = proy.tipoProyecto;
                priProy = proy.priPro.ToString();
                ubiProyDpto = proy.nomUbiDep;
                ubiProyProv = proy.nomUbiProv;
                ubiProyDist = proy.nomUbiDist;
                presupuesto = proy.presupuesto;
            }

            //Hallamos presupuesto
            List<Presupuesto> listadoPresupuestos = null;
            PresupuestoDAO presupuestoDAO = new PresupuestoDAO();
            listadoPresupuestos = presupuestoDAO.obtenerPresupuestoPorFiltro(0, Convert.ToInt32(codProy), "");
            int codPre = 0; 

            foreach (Presupuesto pres in listadoPresupuestos) {
                codPre = pres.codPre;
            }

            //Hallamos detalle del presupuesto
            List<DetallePresupuesto> listadoPresDet = null;
            DetallePresupuestoDAO detPresDAO = new DetallePresupuestoDAO();
            listadoPresDet = detPresDAO.obtenerDetallePresupuestoPorFiltro(0, codPre);

            //Enviar valores de detalle del proyecto:
            ViewData["nomProy"] = nomProy;
            ViewData["preProy"] = monProy + " " + presupuesto;
            ViewData["fecIniP"] = fecIniP;
            ViewData["fecFinP"] = fecFinP;
            ViewData["desProy"] = desProy;
            ViewData["tipProy"] = tipProy;
            ViewData["priProy"] = priProy;
            ViewData["ubiProy"] = ubiProyDpto + ", " + ubiProyProv + ", " + ubiProyDist;

            //Enviar detalle de asignacion de presupuesto (listado):

            ViewData["codProy"] = codProy;
            return View(listadoPresDet);
        }

        //Muestra plan de proyecto detalle y lo crea
        [HttpPost]
        public ActionResult CrearPlan(FormCollection formCollection)
        {
            //txtCodProyAct
            String txtCodigo = formCollection["txtCodProyAct"].ToString();

            //Si antes ya se le grabó un plan de proyecto, no insertar
            //Verificar total de planes de proyecto
            PlanProyectoDAO planProyDAO = new PlanProyectoDAO();
            int totReg = planProyDAO.totalRegistros(Convert.ToInt32(txtCodigo));

            //Insertar plan de proyecto (sólo si no se ha ingresado ninguna actividad precedente)
            if (totReg == 0) {
                PlanProyecto planProy = new PlanProyecto();
                planProy.codFluCaj = 1;
                planProy.codPlaPro = Convert.ToInt32(txtCodigo);
                planProy.desPlaPro = "Plan de Proyecto " + (Convert.ToInt32(txtCodigo));
                planProy.codPro = Convert.ToInt32(txtCodigo);
                int codPlanProy = planProyDAO.insertarPlanProyecto(planProy);
            }

            //Derivamos a tercera pantalla
            return RedirectToAction("IngresoActividades", "Planificacion", new { codProy = txtCodigo, codPlanProy = txtCodigo });            
        }

        //Listado de proyectos pre-aprobados
        public ActionResult ListadoProyPlan()
        {
            //Listado Proyecto 
            List<Proyecto> listadoProyectos = null;
            ProyectoDAO Proyecto = new ProyectoDAO();

            listadoProyectos = Proyecto.obtenerProyectoPorFiltro(1,0,"PRE");

            ViewData["totReg"] = listadoProyectos.Count;
            //Caso error: no hay registros (msgErr)
            ViewData["msgErr"] = "";

            return View(listadoProyectos);
        }

        //Listado de proyectos pre-aprobados
        public ActionResult ListadoProyPlan2()
        {
            //Listado Proyecto 
            List<Proyecto> listadoProyectos = null;
            ProyectoDAO Proyecto = new ProyectoDAO();

            listadoProyectos = Proyecto.obtenerProyectoPorFiltro(1, 0, "PRE");

            return View(listadoProyectos);
        }

        //Post
        [HttpPost]
        public ActionResult ListadoProyPlan(FormCollection formCollection)
        {
            //Listado Proyecto 
            List<Proyecto> listadoProyectos = null;
            ProyectoDAO Proyecto = new ProyectoDAO();
            String txtCodigo = formCollection["txtCodProy"].ToString();

            //Si es vacío, mostrar msg de error
            if (txtCodigo.Equals(""))
            {
                ViewData["msgErr"] = "Valores vacíos. Por favor, ingrese un código válido para la búsqueda";
            }
            else 
            {
                int codPro = 0;
                bool result = int.TryParse(txtCodigo,out codPro);

                if (codPro == 0)
                {
                    ViewData["msgErr"] = "Valores incorrectos. Por favor, ingrese un código válido para la búsqueda";
                }
                else 
                {
                    codPro = Convert.ToInt32(txtCodigo);

                    listadoProyectos = Proyecto.obtenerProyectoPorFiltro(2, codPro, "PRE");

                    if (listadoProyectos != null)
                    {
                        ViewData["msgErr"] = "";
                        ViewData["totReg"] = listadoProyectos.Count;
                    }
                    else
                    {
                        ViewData["msgErr"] = "No se encontraron registros para su búsqueda";
                    }                           
                }
 
            }
            return View(listadoProyectos);
        }

        //Ingreso de Actividades
        [HttpGet]
        public ActionResult IngresoActividades(string codProy, string codPlanProy)
        {
            ViewData["codProy"] = codProy;
            ViewData["codPlanProy"] = codPlanProy;

            //Obtener datos del proyecto
            string fechIniProy = "";
            string fechIniFin = "";
            ProyectoDAO proyDAO = new ProyectoDAO();
            List<Proyecto> listadoProy = new List<Proyecto>();

            listadoProy = proyDAO.obtenerProyectoPorFiltro(2, Convert.ToInt32(codProy), "PRE");

            foreach (Proyecto proyecto in listadoProy)
            {
                fechIniProy = proyecto.feciniplaPro;
                fechIniFin = proyecto.fecfinplaPro;
            }

            //Solo si hay elementos dentro de las actividades
            //Verificar total de planes de proyecto
            PlanProyectoDAO planProyDAO = new PlanProyectoDAO();
            int totReg = planProyDAO.totalRegistros(Convert.ToInt32(codPlanProy));

            if (totReg > 0) {
                //Si es que ya se agrego por planificación rápida, mostrar:
                ActividadDAO actividadDAO = new ActividadDAO();
                listadoActividadesTemp = actividadDAO.obtenerActividad(Convert.ToInt32(codProy));
            }            

            ViewData["fechIniProy"] = fechIniProy;
            ViewData["fechIniFin"] = fechIniFin;
            ViewData["accion"] = "0";

            return View(listadoActividadesTemp);
        }

        //Ingreso de Actividades - Post
        [HttpPost]
        public ActionResult IngresoActividades(FormCollection formCollection)
        {
            String codProy = formCollection["txtCodPro"].ToString();
            String codPlanProy = formCollection["txtCodPlaPro"].ToString();
            String fechIniProy = formCollection["txtFecIniPro"].ToString();
            String fechIniFin = formCollection["txtFecFinPro"].ToString();
            String accion = formCollection["txtAccion"].ToString();
            String message = "";
            int accionAct = Convert.ToInt32(accion);
            //List<Actividad> listadoActividades = new List<Actividad>();
            ActividadDAO actividadDAO = new ActividadDAO();
            Actividad actividad = new Actividad();

            ViewData["codProy"] = codProy;
            ViewData["codPlanProy"] = codPlanProy;
            ViewData["fechIniProy"] = fechIniProy;
            ViewData["fechIniFin"] = fechIniFin;

            //Solo si hay elementos dentro de las actividades
            //Verificar total de planes de proyecto
            int totReg = actividadDAO.totalRegistros(1, Convert.ToInt32(codPlanProy));

            if (totReg > 0)
            {
                //Si es que ya se agrego por planificación rápida, mostrar:
                listadoActividadesTemp = actividadDAO.obtenerActividad(Convert.ToInt32(codProy));
            }            

            //Segun el tipo de accion, hace algunas cosas:
            if (accionAct == 1)
            {
                //Insertamos nuevo registro pero buscamos actividad ultima correlativa
                int totRegCorr = 0;
                if (totReg > 0) totRegCorr = listadoActividadesTemp.Count();
                totReg = actividadDAO.totalRegistros(0,0);                
                actividad.codAct = (totReg + 1);
                actividad.corAct = (totRegCorr + 1);
                actividad.codEnt = 1;
                actividad.codPlaPro = Convert.ToInt32(codPlanProy);
                actividad.desAct = "";
                actividad.feciniAct = "11/06/2013";
                actividad.fecfinAct = "11/06/2013";
                actividad.preAct = "";
                actividad.tipAct = "0";
                listadoActividadesTemp.Add(actividad);
            }
            if (accionAct == 2)
            {
                //Guardamos cambios dentro de la tabla. Si se quiere cambiar mas tarde, ahí están
                for (int i = 1; i <= totReg; i++)
                {
                    //Obtenemos el valor de cada objeto seleccionado:
                    string descAct = formCollection["txt_nomAct_" + i].ToString();
                    string fecIniAct = formCollection["txt_fecIni" + i].ToString();
                    string fecFinAct = formCollection["txt_fecFin" + i].ToString();
                    string predecAct = formCollection["txt_Pred" + i].ToString();
                    //Adicionamos a un objeto actividad
                    int upd = 0;
                    actividad.corAct = i;
                    actividad.codPlaPro = Convert.ToInt32(codPlanProy);
                    actividad.desAct = descAct;
                    actividad.feciniAct = fecIniAct;
                    actividad.fecfinAct = fecFinAct;
                    actividad.preAct = predecAct;
                    upd = actividadDAO.actualizarActividad(actividad);
                };
                listadoActividadesTemp = null;
                listadoActividadesTemp = actividadDAO.obtenerActividad(Convert.ToInt32(codProy));
                message = "Se modificaron las actividades seleccionadas";
            }
            if (accionAct == 3)
            { 
                //Eliminamos actividades


            }
            if (accionAct == 4)
            { 
                //Se da por finalizada la planificacion. Se graba el proyecto con status "PLA" (Planificado)
                ProyectoDAO proyDAO = new ProyectoDAO();
                int estatusProy = 0;

                estatusProy = proyDAO.actualizarProyecto(Convert.ToInt32(codProy), "SRE");
                
                message = "El Plan de Proyecto ha sido creado satisfactoriamente";
            }

            ViewData["Message"] = message;
            return View(listadoActividadesTemp);
        }

        //Estimado Rapido (Get)
        [HttpGet]
        public ActionResult EstimadoRapido(String txtCodigo)
        {
            ViewData["codProy"] = txtCodigo;

            //Listado Tipos Proyecto 
            List<TipoProyecto> listadoTipoProyectos = null;
            TipoProyectoDAO TipoProyecto = new TipoProyectoDAO();
            listadoTipoProyectos = TipoProyecto.obtenerTipoProyecto();

            //Listado de Proyectos historicos a escoger
            List<ProyectoHist> listadoProyectoHist = null;
            ProyectoHistDAO proyHistDAO = new ProyectoHistDAO();
            listadoProyectoHist = proyHistDAO.obtenerProyectoHistPorFiltro(1,1,"FIN");

            //Adjuntamos listado de ubigeos (Departamento)
            UbigeoDAO ubigeoDAO = new UbigeoDAO();
            List<Ubigeo> listadoUbigeoDep = null;
            listadoUbigeoDep = ubigeoDAO.obtenerUbigeo(0,14,1,0);

            //Adjuntamos listado de ubigeos (Provincia)
            List<Ubigeo> listadoUbigeoProv = null;
            listadoUbigeoProv = ubigeoDAO.obtenerUbigeo(1, 14, 1, 0);

            //Adjuntamos listado de ubigeos (Distrito)
            List<Ubigeo> listadoUbigeoDist = null;
            listadoUbigeoDist = ubigeoDAO.obtenerUbigeo(2,14,1,0);

            //Adjuntamos listados en objeto formulario para ser llamado en la estimacion rapida
            EstimadoRapidoForm parametros = new EstimadoRapidoForm();
            parametros.ListadoTipoProyecto = listadoTipoProyectos;
            parametros.ListadoProyectoHist = listadoProyectoHist;
            parametros.ListadoUbigeoDep = listadoUbigeoDep;
            parametros.ListadoUbigeoProv = listadoUbigeoProv;
            parametros.ListadoUbigeoDist = listadoUbigeoDist;

            ViewData["totReg"] = listadoProyectoHist.Count;
            ViewData["accion"] = "0";

            return View(parametros);
        }

        //Estimado Rapido (Post)
        [HttpPost]
        public ActionResult EstimadoRapido(FormCollection formCollection)
        {
            //Obtenemos valores de formulario anterior para mostrarlos nuevamente en la pantalla
            String codProy = formCollection["txtCodProy"].ToString();
            String accion = formCollection["txtAccion"].ToString();
            int codAccion = Convert.ToInt32(accion);
            int tipoAccion = 0;
            int codDpto = 0;
            int codProv = 0;
            int codDist = 0;

            if (codAccion == 0) 
            { 
                //Busqueda especial (todos los filtros)
                tipoAccion = 4;
            }
            if (codAccion == 1)
            {
                //Muestra provincias + listado generico
                tipoAccion = 1;
            }
            if (codAccion == 2)
            {
                //Muestra distritos + listado generico
            }

            //Listado Tipos Proyecto 
            List<TipoProyecto> listadoTipoProyectos = null;
            TipoProyectoDAO TipoProyecto = new TipoProyectoDAO();
            listadoTipoProyectos = TipoProyecto.obtenerTipoProyecto();

            //Listado de Proyectos historicos a escoger
            List<ProyectoHist> listadoProyectoHist = null;
            ProyectoHistDAO proyHistDAO = new ProyectoHistDAO();
            listadoProyectoHist = proyHistDAO.obtenerProyectoHistPorFiltro(1, 1, "FIN");

            //Adjuntamos listado de ubigeos (Departamento)
            List<Ubigeo> listadoUbigeoDep = null;
            UbigeoDAO ubigeoDAO = new UbigeoDAO();
            listadoUbigeoDep = ubigeoDAO.obtenerUbigeo(0, 0, 0, 0);

            //Adjuntamos listados en objeto formulario para ser llamado en la estimacion rapida
            EstimadoRapidoForm parametros = new EstimadoRapidoForm();
            parametros.ListadoTipoProyecto = listadoTipoProyectos;
            parametros.ListadoProyectoHist = listadoProyectoHist;
            parametros.ListadoUbigeoDep = listadoUbigeoDep;

            ViewData["totReg"] = listadoProyectoHist.Count;

            return View(parametros);
        }

        //Detalle Plan Historico
        [HttpGet]
        public ActionResult DetallePlanHistorico(int codProyAct, int codProyHist)
        {
            //Obtenemos valores de proyecto actual
            string durTotProyAct = "3";
            double presProyAct = 0;
            string monPresProyAct = "";
            string durTotProyHist = "4";
            double presProyHist = 0;
            string monPresProyHis = "";

            //Obtenemos el presupuesto total del proyecto actual
            PresupuestoDAO presupuestoDAO = new PresupuestoDAO();
            List<Presupuesto> listadoPresupuestosAct = null;
            listadoPresupuestosAct = presupuestoDAO.obtenerPresupuestoPorFiltro(0, Convert.ToInt32(codProyAct), "");

            foreach (Presupuesto pres in listadoPresupuestosAct)
            {
                presProyAct = pres.impPre;
            }

            //Obtenemos el presupuesto total del proyecto historico
            List<Presupuesto> listadoPresupuestosHist = null;
            listadoPresupuestosHist = presupuestoDAO.obtenerPresupuestoPorFiltro(0, Convert.ToInt32(codProyHist), "");

            foreach (Presupuesto pres in listadoPresupuestosHist)
            {
                presProyHist = pres.impPre;
            }

            //Obtenemos informacion del proyecto (historico)

            //Obtenemos informacion del proyecto (actual)

            ViewData["codProy"] = codProyAct;               //Codigo de proyecto actual
            ViewData["codProyHist"] = codProyHist;          //Codigo de proyecto historico
            ViewData["durProyAct"] = durTotProyAct;         //durProyAct
            ViewData["presProyAct"] = presProyAct;          //presProyAct
            ViewData["durProyHist"] = durTotProyHist;       //durProyHist
            ViewData["presProyHist"] = presProyHist;        //presProyHist

            //Obtenemos el detalle de las actividades historicas
            ActividadHistDAO actividadHistDAO = new ActividadHistDAO();
            List<ActividadHist> listadoActividadHist = null;
            listadoActividadHist = actividadHistDAO.obtenerActividadHist(0, Convert.ToInt32(codProyHist));

            return View(listadoActividadHist);
        }

        //Detalle Plan Historico (asignacion final)
        [HttpPost]
        public ActionResult DetallePlanHistorico(FormCollection formCollection)
        {
            //Variables para ir trabajando
            String codProyAct = formCollection["txtCodProyAct"].ToString();
            String codProyHist = formCollection["txtCodProyHis"].ToString();

            //Obtenemos valores de proyecto actual
            string durTotProyAct = "3";
            double presProyAct = 0;
            string monPresProyAct = "";
            string durTotProyHist = "4";
            double presProyHist = 0;
            string monPresProyHis = "";

            //Obtenemos el presupuesto total del proyecto actual
            PresupuestoDAO presupuestoDAO = new PresupuestoDAO();
            List<Presupuesto> listadoPresupuestosAct = null;
            listadoPresupuestosAct = presupuestoDAO.obtenerPresupuestoPorFiltro(0, Convert.ToInt32(codProyAct), "");

            foreach (Presupuesto pres in listadoPresupuestosAct)
            {
                presProyAct = pres.impPre;
            }

            //Obtenemos el presupuesto total del proyecto historico
            List<Presupuesto> listadoPresupuestosHist = null;
            listadoPresupuestosHist = presupuestoDAO.obtenerPresupuestoPorFiltro(0, Convert.ToInt32(codProyHist), "");

            foreach (Presupuesto pres in listadoPresupuestosHist)
            {
                presProyHist = pres.impPre;
            }

            //Obtenemos informacion del proyecto (historico)

            //Obtenemos informacion del proyecto (actual)

            ViewData["codProy"] = codProyAct;               //Codigo de proyecto actual
            ViewData["codProyHist"] = codProyHist;          //Codigo de proyecto historico
            ViewData["durProyAct"] = durTotProyAct;         //durProyAct
            ViewData["presProyAct"] = presProyAct;          //presProyAct
            ViewData["durProyHist"] = durTotProyHist;       //durProyHist
            ViewData["presProyHist"] = presProyHist;        //presProyHist

            //Obtenemos el detalle de las actividades historicas
            ActividadHistDAO actividadHistDAO = new ActividadHistDAO();
            List<ActividadHist> listadoActividadHist = null;
            listadoActividadHist = actividadHistDAO.obtenerActividadHist(0, Convert.ToInt32(codProyHist));

            //Insertar plan de proyecto
            PlanProyectoDAO planProyDAO = new PlanProyectoDAO();
            PlanProyecto planProy = new PlanProyecto();
            planProy.codFluCaj = 1;
            planProy.codPlaPro = Convert.ToInt32(codProyAct);
            planProy.desPlaPro = "Plan de Proyecto " + codProyAct;
            planProy.codPro = Convert.ToInt32(codProyAct);
            int codPlanProy = planProyDAO.insertarPlanProyecto(planProy);

            //Luego de insertado el proyecto, insertar las actividades
            ActividadDAO actividadDAO = new ActividadDAO();
            Actividad actividad = null;
            int resultado = 0;

            foreach (ActividadHist actHis in listadoActividadHist)
            {
                actividad = new Actividad();
                actividad.codAct = (actividadDAO.totalRegistros(0, Convert.ToInt32(codProyAct))) + 1;
                actividad.corAct = actHis.corAct;
                actividad.desAct = actHis.desAct;
                actividad.feciniAct = actHis.feciniAct;
                actividad.fecfinAct = actHis.fecfinAct;
                actividad.preAct = actHis.preAct;
                actividad.tipAct = actHis.tipAct;
                actividad.codEnt = actHis.codEnt;
                actividad.codPlaPro = Convert.ToInt32(codProyAct);
                resultado = actividadDAO.insertarActividad(actividad);
            }

            //Si se insertaron todas las actividades al proyecto actual, mostrar mensaje OK
            ViewData["msg"] = "Las actividades asociadas al proyecto histórico " + codProyHist + " fueron asociadas al proyecto actual satisfactoriamente";

            return View(listadoActividadHist);

        }

    }
}
