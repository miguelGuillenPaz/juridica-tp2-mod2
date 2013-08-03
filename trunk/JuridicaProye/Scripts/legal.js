//Variable global (dentro del document ready function)
var arrPersonas = [];
/*var arrPersonas = {
    vecino: []
};*/

$("document").ready(function () {

    //-----------------------------------------------------------------------------------------------
    //Cargas iniciales
    $("input[name='optTipoEdif']").removeAttr('checked');
    estadoNomCond(0);
    $('#personas').hide();
    $('.btnEliminarVecino').hide();

    //-----------------------------------------------------------------------------------------------
    //Validaciones campos
    $("#txtDNIVecino").keypress(function (e) {
        if (!/[0-9]/.test(String.fromCharCode(e.which)))
            return false;
    });

    //-----------------------------------------------------------------------------------------------
    //Eventos de links (botones)

    $("input[name='optTipoEdif']").change(function () {
        if ($(this).val() === 'CON') {
            estadoNomCond(1);
        }
        if ($(this).val() === 'CAS') {
            estadoNomCond(0);
        }
    });

    //Agregar persona a la grilla
    $('.btnAgregarVecino').click(function (e) {
        e.preventDefault();
        var tipoEdif = ($("input[name='optTipoEdif']:checked").val() != undefined) ? $("input[name='optTipoEdif']:checked").val() : '';
        var nomCond = $('#txtNombreCondominio').val();
        var nom = $('#txtNombreVecino').val();
        var ape = $('#txtApellidoVecino').val();
        var dir = $('#txtDireccionVecino').val();
        var dis = $('#cboDistrito').val();
        var nomDis = $('#cboDistrito option:selected').html();
        var dni = $('#txtDNIVecino').val();

        if (tipoEdif != '' && nom != '' && ape != '' && dir != '' && dis > 0 && dni != '') {
            if (tipoEdif == 'CON' && nomCond == '') {
                alert('Debe ingresar el nombre del condominio.');
                $('#txtNombreCondominio').focus();
            }
            else if (dni.length < 8) {
                alert('El número de DNI ingresado es inválido.');
                $('#txtDNIVecino').focus();
            }
            else {
                addPersona(tipoEdif, nom, ape, nomCond, dir, dis, nomDis, dni);
                $("input[name='optTipoEdif']").removeAttr('checked');
                $('#datosPersonas input[type=text]').val('');
                $("#cboDistrito").val($("#cboDistrito option:first").val());
                estadoNomCond(0);
            }
        }
        else {
            //alert('tipoEdif:' + tipoEdif + ', nomCond: ' + nomCond + ', dis: ' + dis);
            alert('Todos los campos son requeridos.');
        }
    });

    //Eliminar persona(s) de la grilla
    $('.btnEliminarVecino').click(function (e) {
        e.preventDefault();

        if (confirm("¿Desea eliminar a la(s) persona(s) seleccionada(s) del listado?")) {

            var arrChecked = new Array();
            $('#personas input:checked').each(function () {
                arrChecked.push($(this).attr('value'));
            });
            if (arrChecked.length > 0) {
                for (var i = 0; i < arrChecked.length; i++) {
                    var val = arrChecked[i];
                    //arrPersonas.splice(val, 1);
                    for (var j = 0; j < arrPersonas.length; j++) {
                        if (arrPersonas[j].p.dni === val) {
                            arrPersonas.splice(j, 1);
                        }
                    }

                }

                /*arrPersonas.splice($.inArray(0,arrPersonas), 1);*/
                /*$('#personas .colEliminar').each(function() {
                //alert($(this).find('input:checked').length);
                if($(this).find('input:checked').length) {
                //var val = $(this).find("span").html();
                var val = $(this).find("input:checked").val();
                alert(val);
                arrPersonas.splice($.inArray(val,arrPersonas), 1);
                //var index = $.inArray(val, arrPersonas);
                //if (index >= 0) {
                //arrPersonas.splice(index, 1);
                //}
                }
                });*/

                buildGrilla(arrPersonas);
            }
            else {
                alert('Debe seleccionar una persona por lo menos.');
            }

        }
    });

    //Grabar Requerimiento Legal
    /*$('.btnGrabarReqLegal').click(function (e) {
        e.preventDefault();

        if (arrPersonas.length > 0) {
            var arrVecinos = [];
            for (var i = 0; i < arrPersonas.length; i++) {
                arrVecinos.push({
                    'cNombres': arrPersonas[i].p.nom,
                    'cApellidos': arrPersonas[i].p.ape,
                    'cDireccion': arrPersonas[i].p.dir,
                    'codUbiDist': arrPersonas[i].p.dis,
                    'codUbiDep': 1,
                    'codUbiProv': 1,
                    'cTipoEdificacion': arrPersonas[i].p.tipoEdif,
                    'cNombreCondominio': arrPersonas[i].p.nomCond,
                    'cDni': arrPersonas[i].p.dni
                });
            }

            var datos = { arrVecinos: arrVecinos };

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/Legal/Confirmacion",
                data: JSON.stringify(datos),
                datatype: "json",
                success: function (result) {
                }
            });
        }

    });*/

    //----------------------------------------------------------------------------
    //Funciones

    function addPersona(tipoEdif, nom, ape, nomCond, dir, dis, nomDis, dni) {
        var nomTipoEdif = "";
        switch (tipoEdif) {
            case 'CAS':
                nomTipoEdif = "Casa";
                break;
            case 'CON':
                nomTipoEdif = "Condominio";
                break;
        }

        nomCond = (nomCond != "") ? nomCond : "-";

        /*arrPersonas.vecino.push({
        'nom': nom + ' ' + ape,
        'dir': dir,
        'nomDis': nomDis,
        'nomTipoEdif': nomTipoEdif,
        'nomCond': nomCond,
        'dni': dni
        });*/

        //arrPersonas.push(nom + ' ' + ape, dir, dis, nomTipoEdif, nomCond);

        //var p = arrPersonas.length;
        arrPersonas.push({
            'p':
                            {
                                'nom': nom,
                                'ape': ape,
                                'dir': dir,
                                'dis': dis,
                                'nomDis': nomDis,
                                'tipoEdif': tipoEdif,
                                'nomTipoEdif': nomTipoEdif,
                                'nomCond': nomCond,
                                'dni': dni
                            }
        });
        buildGrilla(arrPersonas);
    }

});

//-------------------------------------------------------------------------------------------------------------------------------------
//Funciones útiles

function buildGrilla(arrPersonas) {
    if (arrPersonas.length > 0) {
        var cad = '';
        for (var i = 0; i < arrPersonas.length; i++) {
            cad += '<div class="fila">';
            cad += '	<div class="colNombre"><label name="nomPer_' + (i + 1) + '">' + arrPersonas[i].p.nom  + ' ' + arrPersonas[i].p.ape + '</label></div>';
            cad += '	<div class="colDireccion">' + arrPersonas[i].p.dir + '</div>';
            cad += '	<div class="colDistrito">' + arrPersonas[i].p.nomDis + '</div>';
            cad += '	<div class="colTipoEdif">' + arrPersonas[i].p.nomTipoEdif + '</div>';
            cad += '	<div class="colNomCond">' + arrPersonas[i].p.nomCond + '</div>';
            cad += '	<div class="colEliminar final"><input name="" type="checkbox" value="' + arrPersonas[i].p.dni + '" /></div>';
            cad += '</div>';
        }
        $('label#grillaVacia').hide();
        $('#personas').html(cad);
        $('#personas').show();
        $('.btnEliminarVecino').show();
    }
    else {
        $('#personas').html('');
        $('#personas').hide();
        $('.btnEliminarVecino').hide();
        $('label#grillaVacia').show();
    }
}

function estadoNomCond(estado) {
    switch (estado) {
        case 1:
            $('#txtNombreCondominio').attr('disabled', false);
            $('#txtNombreCondominio').removeClass('disabled');
            $('#txtNombreCondominio').focus();
            break;

        case 0:
            $('#txtNombreCondominio').val('');
            $('#txtNombreCondominio').attr('disabled', 'disabled');
            $('#txtNombreCondominio').addClass('disabled');
            break;
    }
}

//Lo llama el botón Grabar
function validarForm() {
    var codPro = $('#cboProyecto');
    var desc = $('#txtDescripcion');

    if (codPro.val() <= 0) {
        alert('Debe seleccionar el proyecto asociado al requerimiento legal a solicitar.');
        codPro.focus();
        return false;
    }
    else if (desc.val() == '') {
        alert('Debe ingresar una descripción del requerimiento legal a solicitar.');
        desc.focus();
        return false;
    }
    else if (arrPersonas.length <= 0) {
        if (!confirm("No ha ingresado ni un vecino, ¿desea registrar su solicitud de requerimiento legal?")) {
            alert("asd");
            return false;
        }
    }
    return true;
}