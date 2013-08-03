function ShowMe(destino) {
    $("#contenedor-areas").fadeOut('fast');
    setTimeout(function () {
        $("#loading").fadeIn('slow');
        setTimeout(function () {
            $("#contenedor-areas").load(destino, function (responseText, textStatus, req) {
                if (textStatus == "error") {
                    $('#contenedor-areas').html("<p class='error'><strong>No se pudo cargar el contenido"
															+ "<br />Inténtelo nuevamente</strong></p>");
                }
                $("#loading").fadeOut('fast');
                $("#contenedor-areas").fadeIn('slow');
            });

        }, 1000);
    }, 200);
}