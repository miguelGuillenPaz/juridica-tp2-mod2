$(document).ready(function () {

    //Ticker
    $("#webticker").webTicker();


    //ShowMe
    $('.areas-negocios .area a').click(function () {
        try {
            var url = $(this).attr('href');
            if (url != "#") {
                ShowMe(url);
            }
            $(".areas-negocios .area").removeClass('activo');
            $(this).parent().addClass('activo');
        }
        catch (e) {
            alert(e.Message);
        }
        finally {
            return false;
        }
    });


    //Ancla Scroller 
    $('.ancla').click(function (e) {
        e.preventDefault();
        var $target = $(this.hash);
        $target = $target.length && $target || $('[name=' + this.hash.slice(1) + ']');
        if ($target.length) {
            var targetOffset = $target.offset().top;
            $('html,body').animate({ scrollTop: targetOffset }, 1000);
        }
    });

    //Ancla Especial
    $('.ancla_cons').click(function (e) {
        e.preventDefault();
        var $target = $(this.hash);
        $target = $target.length && $target || $('[name=' + this.hash.slice(1) + ']');
        if ($target.length) {
            var targetOffset = $target.offset().top;
            $('html,body').animate({ scrollTop: targetOffset }, 1000);
            setTimeout(function () {
                $target.next().slideDown('slow');
            }, 1000);
        }
    });

    //Acordion
    $('#acordion_quienes #div1').click(function () {
        $('#acordion_quienes #cont1').slideToggle('slow');
        //$('#cont2').slideUp('slow');
        $('#acordion_quienes #cont2').slideUp('slow');
        $('#acordion_quienes #cont3').slideUp('slow');
        $('#acordion_quienes #cont4').slideUp('slow');
        $('#acordion_quienes #cont5').slideUp('slow');
        $('#acordion_quienes #cont6').slideUp('slow');
        $('#acordion_quienes #cont7').slideUp('slow');
        $('#acordion_quienes #cont8').slideUp('slow');
        $('#acordion_quienes #cont9').slideUp('slow');
        $('#acordion_quienes #cont10').slideUp('slow');
        $('#acordion_quienes #cont11').slideUp('slow');
        $('#acordion_quienes #cont12').slideUp('slow');


    });
    $('#acordion_quienes #div2').click(function () {
        //$('#cont2').slideDown('slow');
        $('#acordion_quienes #cont2').slideToggle('slow');
        $('#acordion_quienes #cont1').slideUp('slow');
        $('#acordion_quienes #cont3').slideUp('slow');
        $('#acordion_quienes #cont4').slideUp('slow');
        $('#acordion_quienes #cont5').slideUp('slow');
        $('#acordion_quienes #cont6').slideUp('slow');
        $('#acordion_quienes #cont7').slideUp('slow');
        $('#acordion_quienes #cont8').slideUp('slow');
        $('#acordion_quienes #cont9').slideUp('slow');
        $('#acordion_quienes #cont10').slideUp('slow');
        $('#acordion_quienes #cont11').slideUp('slow');
        $('#acordion_quienes #cont12').slideUp('slow');
    });
    $('#acordion_quienes #div3').click(function () {
        //$('#cont2').slideDown('slow');
        $('#acordion_quienes #cont3').slideToggle('slow');
        $('#acordion_quienes #cont1').slideUp('slow');
        $('#acordion_quienes #cont2').slideUp('slow');
        $('#acordion_quienes #cont4').slideUp('slow');
        $('#acordion_quienes #cont5').slideUp('slow');
        $('#acordion_quienes #cont6').slideUp('slow');
        $('#acordion_quienes #cont7').slideUp('slow');
        $('#acordion_quienes #cont8').slideUp('slow');
        $('#acordion_quienes #cont9').slideUp('slow');
        $('#acordion_quienes #cont10').slideUp('slow');
        $('#acordion_quienes #cont11').slideUp('slow');
        $('#acordion_quienes #cont12').slideUp('slow');
    });
    $('#acordion_quienes #div4').click(function () {
        //$('#cont2').slideDown('slow');
        $('#acordion_quienes #cont4').slideToggle('slow');
        $('#acordion_quienes #cont1').slideUp('slow');
        $('#acordion_quienes #cont3').slideUp('slow');
        $('#acordion_quienes #cont2').slideUp('slow');
        $('#acordion_quienes #cont5').slideUp('slow');
        $('#acordion_quienes #cont6').slideUp('slow');
        $('#acordion_quienes #cont7').slideUp('slow');
        $('#acordion_quienes #cont8').slideUp('slow');
        $('#acordion_quienes #cont9').slideUp('slow');
        $('#acordion_quienes #cont10').slideUp('slow');
        $('#acordion_quienes #cont11').slideUp('slow');
        $('#acordion_quienes #cont12').slideUp('slow');
    });
    $('#acordion_quienes #div5').click(function () {
        //$('#cont2').slideDown('slow');
        $('#acordion_quienes #cont5').slideToggle('slow');
        $('#acordion_quienes #cont1').slideUp('slow');
        $('#acordion_quienes #cont3').slideUp('slow');
        $('#acordion_quienes #cont4').slideUp('slow');
        $('#acordion_quienes #cont2').slideUp('slow');
        $('#acordion_quienes #cont6').slideUp('slow');
        $('#acordion_quienes #cont7').slideUp('slow');
        $('#acordion_quienes #cont8').slideUp('slow');
        $('#acordion_quienes #cont9').slideUp('slow');
        $('#acordion_quienes #cont10').slideUp('slow');
        $('#acordion_quienes #cont11').slideUp('slow');
        $('#acordion_quienes #cont12').slideUp('slow');
    });
    $('#acordion_quienes #div6').click(function () {
        //$('#cont2').slideDown('slow');
        $('#acordion_quienes #cont6').slideToggle('slow');
        $('#acordion_quienes #cont1').slideUp('slow');
        $('#acordion_quienes #cont3').slideUp('slow');
        $('#acordion_quienes #cont4').slideUp('slow');
        $('#acordion_quienes #cont5').slideUp('slow');
        $('#acordion_quienes #cont2').slideUp('slow');
        $('#acordion_quienes #cont7').slideUp('slow');
        $('#acordion_quienes #cont8').slideUp('slow');
        $('#acordion_quienes #cont9').slideUp('slow');
        $('#acordion_quienes #cont10').slideUp('slow');
        $('#acordion_quienes #cont11').slideUp('slow');
        $('#acordion_quienes #cont12').slideUp('slow');
    });
    $('#acordion_quienes #div7').click(function () {
        //$('#cont2').slideDown('slow');
        $('#acordion_quienes #cont7').slideToggle('slow');
        $('#acordion_quienes #cont1').slideUp('slow');
        $('#acordion_quienes #cont3').slideUp('slow');
        $('#acordion_quienes #cont4').slideUp('slow');
        $('#acordion_quienes #cont5').slideUp('slow');
        $('#acordion_quienes #cont6').slideUp('slow');
        $('#acordion_quienes #cont8').slideUp('slow');
        $('#acordion_quienes #cont2').slideUp('slow');
        $('#acordion_quienes #cont9').slideUp('slow');
        $('#acordion_quienes #cont10').slideUp('slow');
        $('#acordion_quienes #cont11').slideUp('slow');
        $('#acordion_quienes #cont12').slideUp('slow');
    });
    $('#acordion_quienes #div8').click(function () {
        //$('#cont2').slideDown('slow');
        $('#acordion_quienes #cont8').slideToggle('slow');
        $('#acordion_quienes #cont1').slideUp('slow');
        $('#acordion_quienes #cont2').slideUp('slow');
        $('#acordion_quienes #cont3').slideUp('slow');
        $('#acordion_quienes #cont4').slideUp('slow');
        $('#acordion_quienes #cont5').slideUp('slow');
        $('#acordion_quienes #cont6').slideUp('slow');
        $('#acordion_quienes #cont7').slideUp('slow');
        $('#acordion_quienes #cont9').slideUp('slow');
        $('#acordion_quienes #cont10').slideUp('slow');
        $('#acordion_quienes #cont11').slideUp('slow');
        $('#acordion_quienes #cont12').slideUp('slow');

    });

    $('#acordion_quienes #div9').click(function () {
        //$('#cont2').slideDown('slow');
        $('#acordion_quienes #cont9').slideToggle('slow');
        $('#acordion_quienes #cont1').slideUp('slow');
        $('#acordion_quienes #cont2').slideUp('slow');
        $('#acordion_quienes #cont3').slideUp('slow');
        $('#acordion_quienes #cont4').slideUp('slow');
        $('#acordion_quienes #cont5').slideUp('slow');
        $('#acordion_quienes #cont6').slideUp('slow');
        $('#acordion_quienes #cont7').slideUp('slow');
        $('#acordion_quienes #cont8').slideUp('slow');
        $('#acordion_quienes #cont10').slideUp('slow');
        $('#acordion_quienes #cont11').slideUp('slow');
        $('#acordion_quienes #cont12').slideUp('slow');

    });

    $('#acordion_quienes #div10').click(function () {
        //$('#cont2').slideDown('slow');
        $('#acordion_quienes #cont10').slideToggle('slow');
        $('#acordion_quienes #cont1').slideUp('slow');
        $('#acordion_quienes #cont2').slideUp('slow');
        $('#acordion_quienes #cont3').slideUp('slow');
        $('#acordion_quienes #cont4').slideUp('slow');
        $('#acordion_quienes #cont5').slideUp('slow');
        $('#acordion_quienes #cont6').slideUp('slow');
        $('#acordion_quienes #cont7').slideUp('slow');
        $('#acordion_quienes #cont9').slideUp('slow');
        $('#acordion_quienes #cont8').slideUp('slow');
        $('#acordion_quienes #cont11').slideUp('slow');
        $('#acordion_quienes #cont12').slideUp('slow');

    });

    $('#acordion_quienes #div11').click(function () {
        //$('#cont2').slideDown('slow');
        $('#acordion_quienes #cont11').slideToggle('slow');
        $('#acordion_quienes #cont12').slideUp('slow');
        $('#acordion_quienes #cont1').slideUp('slow');
        $('#acordion_quienes #cont2').slideUp('slow');
        $('#acordion_quienes #cont3').slideUp('slow');
        $('#acordion_quienes #cont4').slideUp('slow');
        $('#acordion_quienes #cont5').slideUp('slow');
        $('#acordion_quienes #cont6').slideUp('slow');
        $('#acordion_quienes #cont7').slideUp('slow');
        $('#acordion_quienes #cont9').slideUp('slow');
        $('#acordion_quienes #cont10').slideUp('slow');
        $('#acordion_quienes #cont8').slideUp('slow');

    });

    $('#acordion_quienes #div12').click(function () {
        //$('#cont2').slideDown('slow');
        $('#acordion_quienes #cont12').slideToggle('slow');
        $('#acordion_quienes #cont11').slideUp('slow');
        $('#acordion_quienes #cont1').slideUp('slow');
        $('#acordion_quienes #cont2').slideUp('slow');
        $('#acordion_quienes #cont3').slideUp('slow');
        $('#acordion_quienes #cont4').slideUp('slow');
        $('#acordion_quienes #cont5').slideUp('slow');
        $('#acordion_quienes #cont6').slideUp('slow');
        $('#acordion_quienes #cont7').slideUp('slow');
        $('#acordion_quienes #cont9').slideUp('slow');
        $('#acordion_quienes #cont10').slideUp('slow');
        $('#acordion_quienes #cont8').slideUp('slow');

    });




    $('#acordion_info #div1').click(function () {
        $('#acordion_info #cont1').slideToggle('slow');
        //$('#cont2').slideUp('slow');
        $('#acordion_info #cont2').slideUp('slow');
        $('#acordion_info #cont3').slideUp('slow');
        $('#acordion_info #cont4').slideUp('slow');
        $('#acordion_info #cont5').slideUp('slow');
        $('#acordion_info #cont6').slideUp('slow');
        $('#acordion_info #cont7').slideUp('slow');
        $('#acordion_info #cont8').slideUp('slow');
        $('#acordion_info #cont9').slideUp('slow');

    });
    $('#acordion_info #div2').click(function () {
        //$('#cont2').slideDown('slow');
        $('#acordion_info #cont2').slideToggle('slow');
        $('#acordion_info #cont1').slideUp('slow');
        $('#acordion_info #cont3').slideUp('slow');
        $('#acordion_info #cont4').slideUp('slow');
        $('#acordion_info #cont5').slideUp('slow');
        $('#acordion_info #cont6').slideUp('slow');
        $('#acordion_info #cont7').slideUp('slow');
        $('#acordion_info #cont8').slideUp('slow');
        $('#acordion_info #cont9').slideUp('slow');
    });
    $('#acordion_info #div3').click(function () {
        //$('#cont2').slideDown('slow');
        $('#acordion_info #cont3').slideToggle('slow');
        $('#acordion_info #cont1').slideUp('slow');
        $('#acordion_info #cont2').slideUp('slow');
        $('#acordion_info #cont4').slideUp('slow');
        $('#acordion_info #cont5').slideUp('slow');
        $('#acordion_info #cont6').slideUp('slow');
        $('#acordion_info #cont7').slideUp('slow');
        $('#acordion_info #cont8').slideUp('slow');
        $('#acordion_info #cont9').slideUp('slow');
    });
    $('#acordion_info #div4').click(function () {
        //$('#cont2').slideDown('slow');
        $('#acordion_info #cont4').slideToggle('slow');
        $('#acordion_info #cont1').slideUp('slow');
        $('#acordion_info #cont3').slideUp('slow');
        $('#acordion_info #cont2').slideUp('slow');
        $('#acordion_info #cont5').slideUp('slow');
        $('#acordion_info #cont6').slideUp('slow');
        $('#acordion_info #cont7').slideUp('slow');
        $('#acordion_info #cont8').slideUp('slow');
        $('#acordion_info #cont9').slideUp('slow');
    });
    $('#acordion_info #div5').click(function () {
        //$('#cont2').slideDown('slow');
        $('#acordion_info #cont5').slideToggle('slow');
        $('#acordion_info #cont1').slideUp('slow');
        $('#acordion_info #cont3').slideUp('slow');
        $('#acordion_info #cont4').slideUp('slow');
        $('#acordion_info #cont2').slideUp('slow');
        $('#acordion_info #cont6').slideUp('slow');
        $('#acordion_info #cont7').slideUp('slow');
        $('#acordion_info #cont8').slideUp('slow');
        $('#acordion_info #cont9').slideUp('slow');
    });
    $('#acordion_info #div6').click(function () {
        //$('#cont2').slideDown('slow');
        $('#acordion_info #cont6').slideToggle('slow');
        $('#acordion_info #cont1').slideUp('slow');
        $('#acordion_info #cont3').slideUp('slow');
        $('#acordion_info #cont4').slideUp('slow');
        $('#acordion_info #cont5').slideUp('slow');
        $('#acordion_info #cont2').slideUp('slow');
        $('#acordion_info #cont7').slideUp('slow');
        $('#acordion_info #cont8').slideUp('slow');
        $('#acordion_info #cont9').slideUp('slow');
    });
    $('#acordion_info #div7').click(function () {
        //$('#cont2').slideDown('slow');
        $('#acordion_info #cont7').slideToggle('slow');
        $('#acordion_info #cont1').slideUp('slow');
        $('#acordion_info #cont3').slideUp('slow');
        $('#acordion_info #cont4').slideUp('slow');
        $('#acordion_info #cont5').slideUp('slow');
        $('#acordion_info #cont6').slideUp('slow');
        $('#acordion_info #cont2').slideUp('slow');
        $('#acordion_info #cont8').slideUp('slow');
        $('#acordion_info #cont9').slideUp('slow');
    });
    $('#acordion_info #div8').click(function () {
        //$('#cont2').slideDown('slow');
        $('#acordion_info #cont8').slideToggle('slow');
        $('#acordion_info #cont1').slideUp('slow');
        $('#acordion_info #cont3').slideUp('slow');
        $('#acordion_info #cont4').slideUp('slow');
        $('#acordion_info #cont5').slideUp('slow');
        $('#acordion_info #cont6').slideUp('slow');
        $('#acordion_info #cont7').slideUp('slow');
        $('#acordion_info #cont2').slideUp('slow');
        $('#acordion_info #cont9').slideUp('slow');
    });
    $('#acordion_info #div9').click(function () {
        //$('#cont2').slideDown('slow');
        $('#acordion_info #cont9').slideToggle('slow');
        $('#acordion_info #cont1').slideUp('slow');
        $('#acordion_info #cont3').slideUp('slow');
        $('#acordion_info #cont4').slideUp('slow');
        $('#acordion_info #cont5').slideUp('slow');
        $('#acordion_info #cont6').slideUp('slow');
        $('#acordion_info #cont7').slideUp('slow');
        $('#acordion_info #cont8').slideUp('slow');
        $('#acordion_info #cont2').slideUp('slow');
    });


    $('.head-noticia').click(function () {
        var texto_noticia = $(this).next();
        if (texto_noticia.hasClass('texto-noticia')) {
            if (texto_noticia.css('display') == 'none') {

                texto_noticia.slideDown();
            }
            else {
                texto_noticia.slideUp();
            }
        }
    });

    $('.titulo_noticia').click(function () {
        var detalle_noticia = $(this).next();
        if (detalle_noticia.hasClass('detalle_noticia')) {

            if (detalle_noticia.css('display') == 'none') {

                detalle_noticia.slideDown();
            }
            else {
                detalle_noticia.slideUp();
            }
        }

    });


});