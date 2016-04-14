
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

    $('.questionform #enviar').click(function(){

        current = $(this).parents('form:first').data('question');
        next = $(this).parents('form:first').data('question')+1;
        $('.questionform').hide();
        $('#q'+next+'').fadeIn(300);
        processar(''+current+'');
        return false;
    })

});

function processar(n) {

    var enviar = $('input[name=q'+n+']:checked').val();
    if(enviar == sessionStorage.getItem('a'+n+'')){
        pontos++;
    }

    if(n == 4) {
        if (pontos < 4) {
            $('#resultado').html('<h3>Você acertou ' + pontos + ' questões de 4!</h3>' +
                '<h4>É necessário acertar todas para seguir adiante</h4>' +
                '<a href="home.html">Responder novamente</a>');

        } else {
            $('#resultado').html('<h3>Parabéns você acertou TODAS as questões!!!</h3>' +
                '<h4>Que tal aprender mais?</h4>' +
                '<a href="fase2.html">Fase 2</a>');

        }
    }

    return false;
}



window.addEventListener('load', init, false)
