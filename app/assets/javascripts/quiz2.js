
var pontos = 0;
var total = 4;
var ponto = 1;
var maximo = total + ponto;

function init() {
    sessionStorage.setItem('a1',  7);
    sessionStorage.setItem('a2', 28);
    sessionStorage.setItem('a3',  7);
    sessionStorage.setItem('a4',  7);
}

$ (document).ready(function () {
    //ocultar questões
    $('.questionform').hide();

    $('#0').click(function () {
        $('.iniciar').hide();

        // colocar .questionform q1 a -150% de margem da direita

        $('#q1').css({
            'display': 'block',
            'marginLeft': '0',
            'marginRight': '-50%',
            'opacity': 0
        });

        $('#q1').animate({
            'opacity': 1,
            'marginRight': '0',
            'marginLeft': '0',
        }, 400);
        return false;
    });

    $('.questionform #enviar').click(function(){

        var current = $(this).parents('form:first').data('question');
        var next = $(this).parents('form:first').data('question')+1;
        
        // esconde todos 
        // fazer todos irem para a esquerda
        $('#q'+current).animate({
            'opacity': 0, // transparencia 0
            'marginRight': 0,
            'marginLeft': '-50%',
        }, 400, function(){
            $('#q'+current).hide();

            // mostra o procixo animado
            // fazer todos irem da direita para a esquerda
            $('#q'+next+'').css({
                'opacity': 0,
                'display': 'block',
                'marginLeft': '0',
                'marginRight': '-50%',
            });

            $('#q'+next+'').animate({
                'opacity': 1,
                'marginRight': '0',
                'marginLeft': '0',
            }, 400);
        });

        processar(''+current+'');
        return false;
    })

});

function processar(n) {

    var enviar = $('input[name=q'+n+']').val();
    if(enviar == sessionStorage.getItem('a'+n+'')){
        pontos++;
        // alert('Voce acertou!!');
    } else {
        //alert('Voce errou!');
    }

    // faz a div resultado
    $('#resultado').hide();

    if(n == 4) {
        if (pontos < 4) {
            $('#resultado').html('<h3>Você acertou ' + pontos + ' questões de 4!</h3>' +
                '<h4>É necessário acertar todas para seguir adiante</h4>' +
                '<a href="fase2.html">Responder novamente</a>');

        } else {
            $('#resultado').html('<h3>Parabéns você acertou TODAS as questões!!!</h3>' +
                '<h4>Que tal um novo desafio?</h4>' +
                '<a href="fase3.html">Fase 3</a>');

        }
    }

    $('#resultado').animate({
        'background': 'none'
    }, 900, function(){
        $('#resultado').fadeIn(500);
    });

    return false;
}



window.addEventListener('load', init, false)
