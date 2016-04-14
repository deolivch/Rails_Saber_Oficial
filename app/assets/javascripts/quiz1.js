
var pontos = 0;
var total = 4;
var ponto = 1;
var maximo = total + ponto;

function init() {

    sessionStorage.setItem('a1','d');
    sessionStorage.setItem('a2','d');
    sessionStorage.setItem('a3','d');
    sessionStorage.setItem('a4','d');
}

$ (document).ready(function () {
    //ocultar questões
    $('.questionform').hide();

    $('#0').click(function () {
        $('.iniciar').hide();
        $('#q1').fadeIn(300);
        return false;
    })

    $('#q1 #enviar').click(function () {
        $('.questionform').hide();
        processar('q1');
        $('#q2').fadeIn(300);
        return false;
    })

    $('#q2 #enviar').click(function () {
        $('.questionform').hide();
        processar('q2');
        $('#q3').fadeIn(300);
        return false;
    })

    $('#q3 #enviar').click(function () {
        $('.questionform').hide();
        processar('q3');
        $('#q4').fadeIn(300);
        return false;
    })

    $('#q4 #enviar').click(function () {
        $('.questionform').hide();
        processar('q4');
        $('#resultado').fadeIn(300);
        return false;
    })


});

function processar(q) {
    if(q == "q1"){
        var enviar = $('input[name=q1]:checked').val()
        if(enviar == sessionStorage.a1){
            pontos++;
        }
    }

    if(q == "q2"){
        var enviar = $('input[name=q2]:checked').val()
        if(enviar == sessionStorage.a2){
            pontos++;
        }
    }

    if(q == "q3"){
        var enviar = $('input[name=q3]:checked').val()
        if(enviar == sessionStorage.a3){
            pontos++;
        }
    }

    if(q == "q4"){
        var enviar = $('input[name=q4]:checked').val()
        if(enviar == sessionStorage.a4){
            pontos++;
        }

        if(pontos < 4){
            $('#resultado').html('<h3>Você acertou '+pontos+' questões de 4!</h3>' +
                '<h4>É necessário acertar todas para seguir adiante</h4>' +
                '<a href="home.html">Responder novamente</a>');

        } else {
            $('#resultado').html('<h3>Parabéns você acertou TODAS as questões!!!</h3>' +
                    '<h4>Que tal aprender mais?</h4>'+
                '<button id="continuar" type="button" class="btn btn-sm btn-primary">Continuar</button>');
        }
    }
    return false;
}

window.addEventListener('load', init, false)
