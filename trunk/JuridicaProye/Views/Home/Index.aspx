<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- <h2><%= ViewData["Message"] %></h2> -->
    <div class="contenido-top">
        <div>
            <h1>
                Unidades de Negocio:
            </h1>
            <div class="areas-negocios">
                <div id="mineria" class="area activo mineria">
                    <a href="javascript:(0)">
                        <h2>
                            Minería</h2>
                        <img alt="" src="../../Images/mineria.jpg" />
                    </a>
                </div>
                <div id="gasypetroleo" class="area gasypetroleo">
                    <a href="javascript:(0)">
                        <h2>
                            Gas y Petróleo</h2>
                        <img alt="" src="../../Images/gasypetroleo.jpg" />
                    </a>
                </div>
                <div id="infraestructura" class="area infraestructura">
                    <a href="javascript:(0)">
                        <h2>
                            Infraestructura</h2>
                        <img alt="" src="../../Images/infraestructura.jpg" />
                    </a>
                </div>
                <div id="industria" class="area energia">
                    <a href="javascript:(0)">
                        <h2>
                            Industria</h2>
                        <img alt="" src="../../Images/industria.jpg" />
                    </a>
                </div>
                <div id="energia" class="area energia">
                    <a href="javascript:(0)">
                        <h2>
                            Energía</h2>
                        <img alt="" src="../../Images/energia.jpg" />
                    </a>
                </div>
                <div id="edificaciones" class="area edificaciones">
                    <a href="javascript:(0)">
                        <h2>
                            Edificaciones</h2>
                        <img alt="" src="../../Images/edificaciones.jpg" />
                    </a>
                </div>
            </div>
        </div>
        <div class="contenido-izquierda">
            <div id="contenedor-areas">
                <div class="contenido">
                    <div class="texto-contenido">
                        <p>
                            <span class="nombre-area-mineria"><a href="/">Minería:</a></span>
                            Hemos participado en los principales proyectos mineros desarrollados en el Perú
                            tales como Cuajone, Yanacocha, Antamina, Pierina, Alto Chicama, Cerro Verde, Cerro
                            Corona, Antapaccay, Las Bambas, entre otros. Realizamos trabajos de movimientos
                            de tierra, operación de minas a tajo abierto, plantas concentradoras, plantas de
                            ácido, refinerías, tanques industriales. Asimismo, hemos participados en importantes
                            proyectos en el extranjero como el proyecto minero San Cristóbal en Bolivia y Pueblo
                            Viejo en Republica Dominicana. <a href="/">
                                <img src="../../Images/arrow2.png" style="height: 14px; width: 16px" alt=""/></a></p>
                    </div>
                    <div>
                        <div id="slider_container_1">
                            <div id="SliderName">
                                <img src="../../Images/galeria/mineria/las_bambas_intro.jpg" title="" alt=""/>
                                <div class="SliderNameDescription">
                                    Las Bambas
                                </div>
                                <img src="../../Images/galeria/mineria/antapaccay_intro.jpg" title="" alt=""/>
                                <div class="SliderNameDescription">
                                    Antapaccay
                                </div>
                                <img src="../../Images/galeria/mineria/bayovar_intro.jpg" title="" alt=""/>
                                <div class="SliderNameDescription">
                                    Bayóvar
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clear">
                </div>
                <script type="text/javascript">
                    var demoSlider = Sliderman.slider({ container: 'SliderName', width: 600, height: 268, effects: 'fade',
                        display: {
                            pause: true,
                            autoplay: 3000,
                            always_show_loading: 200,
                            description: { background: '#333333', opacity: 1, height: 30, position: 'bottom' },
                            buttons: { opacity: 1, prev: { className: 'SliderNamePrevMain', label: '' }, next: { className: 'SliderNameNextMain', label: ''} }
                        }
                    });
                </script>
                <div class="clear">
                </div>
            </div>
            <div id="loading" style="display: none;">
                <img alt="" src="../../Images/loading_gym.gif" />
            </div>
        </div>
        <div class="contenido-derecha">
            <br />
            <h1>
                Novedades</h1>
            <div class="contenedor-noticias">
                <div class="noticia">
                    <div class="head-noticia">
                        <span class="titulo-noticia">26.06.13 Grupo Graña y Montero, celebrando 80 años de historia</span>
                    </div>
                    <div class="texto-noticia">
                        En 1933 nuestros fundadores decidieron “aunar sus conocimientos para constituir
                        una sociedad técnica” y marcaron la trayectoria profesional que nos inspira e identifica
                        hasta hoy... <a class="leer-mas" href="/">leer más</a>
                    </div>
                </div>
                <div class="noticia">
                    <div class="head-noticia">
                        <span class="titulo-noticia">Abril 2013 – Segundo Reporte de Sostenibilidad del Grupo
                            Graña y Montero – GRI 2012</span>
                    </div>
                    <div class="texto-noticia">
                        El Grupo Graña y Montero publicó su segundo "Reporte de Sostenibilidad: Nuevos Horizontes,
                        Nuevos Retos" 2012, desarrollado bajo los estándares internacionales de la Global
                        Reporting Initiative (GRI) y verificado (Third Party Checked) por la Asociación
                        Perú 2021. <a class="leer-mas" href="/">leer más</a>
                    </div>
                </div>
                <div class="noticia">
                    <div class="head-noticia">
                        <span class="titulo-noticia">Octubre 2012 – Lanzamiento de la 4ta Edición del Premio
                            Graña y Montero</span>
                    </div>
                    <div class="texto-noticia">
                        Acorde a nuestra Política de Responsabilidad Social, el grupo Graña y Montero reafirma
                        su compromiso con la educación y la gestión del conocimiento al organizar la cuarta
                        edición del "Premio Graña y Montero a la Investigación en Ingeniería Peruana" <a
                            class="leer-mas" href="/">leer más</a>
                    </div>
                </div>
                <div class="noticia">
                    <div class="head-noticia">
                        <span class="titulo-noticia">Octubre 2012 - GyM recibe el Premio Latinoamericano de
                            Responsabilidad Social Empresarial 2012</span>
                    </div>
                    <div class="texto-noticia">
                        El jueves 4 de octubre, GyM, empresa constructora del Grupo Graña y Montero recibió
                        el "Premio Latinoamericano a la Responsabilidad Social Empresarial", otorgado por
                        la Federación Interamericana de la Industria de la Construcción (FIIC) con... <a
                            class="leer-mas" href="/">leer más</a>
                    </div>
                </div>
                <div class="noticia">
                    <div class="head-noticia">
                        <span class="titulo-noticia">Octubre 2012 - Grupo Graña y Montero reconocido como una
                            de "Las Empresas más Admiradas del Perú"</span>
                    </div>
                    <div class="texto-noticia">
                        El pasado 3 de octubre, el Grupo Graña y Montero fue reconocido como una de las
                        10 Empresas más Admiradas del Perú 2012,premio otorgado por Price WaterhouseCoopers
                        y la revista especializada G de Gestión, luego de haber realizado.... <a class="leer-mas"
                            href="/">leer más</a>
                    </div>
                </div>
                <div class="noticia">
                    <div class="head-noticia">
                        <span class="titulo-noticia">2011 - Certificación ISO</span>
                    </div>
                    <div class="texto-noticia">
                        El proceso certificado corresponde al Control del Sistema de Gestión de Proyectos,
                        mediante el cual controlamos que todos los proyectos sean ejecutados siguiendo el
                        modelo de gestión diseñado por GyM... <a class="leer-mas" href="/">
                            leer más</a>
                    </div>
                </div>
                <div class="noticia">
                    <div class="head-noticia">
                        <span class="titulo-noticia">2011 - IGLC Lima 2011 </span>
                    </div>
                    <div class="texto-noticia">
                        El Grupo Internacional de Lean Construction (IGLC) ha sido por más de 20 años uno
                        de los grupos más importantes en la construcción y el 2011 será una gran oportunidad
                        para demostrarlo... <a class="leer-mas" href="/">leer más</a>
                    </div>
                </div>
                <div class="noticia">
                    <div class="head-noticia">
                        <span class="titulo-noticia">Julio 2011 - Gran Teatro Nacional</span>
                    </div>
                    <div class="texto-noticia">
                        El 23 de julio del 2011, el distinguido auditorio del Gran Teatro Nacional construido
                        por GyM fue testigo de una velada memorable en la que destacados tenores y sopranos
                        extranjeros cantaron bajo la dirección del peruano Miguel Harth-Bedoya.. <a class="leer-mas"
                            href="/">leer más</a>
                    </div>
                </div>
                <div class="noticia">
                    <div class="head-noticia">
                        <span class="titulo-noticia">Abril 2011 - Proyecto Punta de Lobos</span>
                    </div>
                    <div class="texto-noticia">
                        GyM asumió tres contratos con la minera Sociedad Punta de Lobos, que se encuentra
                        en el Salar Grande de Tarapacá, a aproximadamente 90 km al sur este de la ciudad
                        de Iquique, en Chile...<a class="leer-mas" href="/">leer más</a>
                    </div>
                </div>
                <div class="noticia">
                    <div class="head-noticia">
                        <span class="titulo-noticia">Diciembre 2009 - Tren Eléctrico</span>
                    </div>
                    <div class="texto-noticia">
                        El 20 de diciembre de 2009 el gobierno peruano lanzó un reto que implicaba un nivel
                        de sofisticación y experiencia en ingeniería altamente competitivo: culminar la
                        construcción del tren eléctrico...<a class="leer-mas" href="/">leer
                            más</a>
                    </div>
                </div>
                <div class="noticia">
                    <div class="head-noticia">
                        <span class="titulo-noticia">Junio 2009 - Tajo Norte Brocal</span>
                    </div>
                    <div class="texto-noticia">
                        Buena Pro - Proyecto "Tercerización de Operaciones del Tajo Norte Brocal, 2010-2015"
                        <br />
                        Sociedad Minera El Brocal S.A.A., otorgó, el día 25 de Junio de 2009, la Buena Pro
                        al Consorcio Pasco (GyM-Stracon) del Proyecto "Tercerización de Operaciones del
                        Tajo Norte – Proyecto La Llave 2015"...<a class="leer-mas" href="/">leer
                            más</a>
                    </div>
                </div>
                <div class="noticia">
                    <div class="head-noticia">
                        <span class="titulo-noticia">Abril 2009 - Central Hidroeléctrica Machu Picchu</span>
                    </div>
                    <div class="texto-noticia">
                        Empresa de Generación Eléctrica Machu Picchu S.A. (EGEMSA) otorga a GyM la Buena
                        Pro del Proyecto de Rehabilitación de la II Fase de la Central Hidroeléctrica de
                        Machu Picchu...<a class="leer-mas" href="/">leer más</a>
                    </div>
                </div>
                <div class="noticia">
                    <div class="head-noticia">
                        <span class="titulo-noticia">Marzo 2009 - Concentradora Bayóvar</span>
                    </div>
                    <div class="texto-noticia">
                        La Compañía Minera Miski Mayo S.A.C. otorga a GyM la Buena Pro de la Planta Concentradora
                        de Fosfatos de Bayóvar...<a class="leer-mas" href="/">leer más</a>
                    </div>
                </div>
                <div class="noticia">
                    <div class="head-noticia">
                        <span class="titulo-noticia">Octubre 2008 - CADE 2008</span>
                    </div>
                    <div class="texto-noticia">
                        Graña y Montero recibió el Premio Luis Hochschild Plaut por su trabajo a favor de
                        la EDUCACIÓN..<a class="leer-mas" href="/">leer más</a>
                    </div>
                </div>
                <div class="noticia">
                    <div class="head-noticia">
                        <span class="titulo-noticia">Setiembre 2008 - Premio Perú 2021</span>
                    </div>
                    <div class="texto-noticia">
                        En el marco de la 46° Conferencia Anual de Ejecutivos – CADE 2008, realizada durante
                        los días 30 y 31 de octubre, nuestra organización Graña y Montero recibió el Premio
                        Luis Hochschild Plaut 2008 en reconocimiento a su valioso aporte a la educación
                        en nuestro país...<a class="leer-mas" href="/">leer más</a>
                    </div>
                </div>
                <div class="noticia">
                    <div class="head-noticia">
                        <span class="titulo-noticia">Enero 2008 - Westin Lima Hotel & Convention Center</span>
                    </div>
                    <div class="texto-noticia">
                        El 14 de enero del 2008 iniciamos la ejecución de lo que es hoy el edificio más
                        alto del Perú...<a class="leer-mas" href="/">leer más</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
    <div class="contenido-bottom">
        <div class="secciones-bottom">
            <h1>
                Principales Proyectos</h1>
            <div class="filosofia-bottom">
                Conoce nuestros principales proyectos en nuestras unidades de negocio:
            </div>
            <ul class="valores">
                <li>Minería</li>
                <li>Gas y Petróleo</li>
                <li>Infraestructura</li>
                <li>Industria</li>
                <li>Energía</li>
                <li>Edificaciones</li>
            </ul>
            <br />
            <div class="leer-mas-bottom">
                <a href="/">Conozca más aquí<img alt="" src="../../Images/arrow2.png" /></a>
            </div>
        </div>
        <div class="secciones-bottom">
            <h1>
                Valores</h1>
            <div class="filosofia-bottom">
                El exito de GyM se debe al respeto por nuestros cuatro valores fundamentales corporativos
                que son:
            </div>
            <ul class="valores">
                <li>Cumplimiento</li>
                <li>Calidad</li>
                <li>Seriedad</li>
                <li>Eficiencia</li>
            </ul>
            <div class="leer-mas-bottom">
                <a href="/">Aprenda nuestros valores<img alt="" src="../../Images/arrow2.png" /></a>
            </div>
        </div>
        <div class="secciones-bottom">
            <h1>
                Responsabilidad Social</h1>
            <div class="filosofia-bottom">
                La Responsabilidad Social es una pieza importante para el desarrollo de nuestras
                operaciones.
            </div>
            <ul class="valores">
                <li>Recursos Humanos</li>
                <li>Prevención de Riesgos</li>
                <li>Gestión de Conocimiento</li>
                <li>Relaciones con la Comunidad</li></ul>
            <br />
            <div class="leer-mas-bottom">
                <a href="/">Conozca más aquí<img alt="" src="../../Images/arrow2.png" /></a>
            </div>
        </div>
        <div class="clear">
        </div>
        <script type="text/javascript">
            var demoSlider = Sliderman.slider({ container: 'SliderName', width: 600, height: 268, effects: 'fade',
                display: {
                    pause: true,
                    autoplay: 3000,
                    always_show_loading: 200,
                    description: { background: '#333333', opacity: 1, height: 30, position: 'bottom' },
                    buttons: { opacity: 1, prev: { className: 'SliderNamePrevMain', label: '' }, next: { className: 'SliderNameNextMain', label: ''} }
                }
            });
        </script>
        <div class="clear">
        </div>
    </div>
</asp:Content>
