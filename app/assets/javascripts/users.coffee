# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

pontos = 0
total = 4
ponto = 1
maximo = total + ponto

init = ->
  sessionStorage.setItem 'a1', 'd'
  sessionStorage.setItem 'a2', 'd'
  sessionStorage.setItem 'a3', 'd'
  sessionStorage.setItem 'a4', 'd'
  return

processar = (q) ->
  `var enviar`
  `var enviar`
  `var enviar`
  if q == 'q1'
    enviar = $('input[name=q1]:checked').val()
    if enviar == sessionStorage.a1
      pontos++
  if q == 'q2'
    enviar = $('input[name=q2]:checked').val()
    if enviar == sessionStorage.a2
      pontos++
  if q == 'q3'
    enviar = $('input[name=q3]:checked').val()
    if enviar == sessionStorage.a3
      pontos++
  if q == 'q4'
    enviar = $('input[name=q4]:checked').val()
    if enviar == sessionStorage.a4
      pontos++
    if pontos < 4
      $('#resultado').html '<h3>Você acertou ' + pontos + ' questões de 4!</h3>' + '<h4>É necessário acertar todas para seguir adiante</h4>' + '<a href="home.html">Responder novamente</a>'
    else
      $('#resultado').html '<h3>Parabéns você acertou TODAS as questões!!!</h3>' + '<h4>Que tal aprender mais?</h4>' + '<button id="continuar" type="button" class="btn btn-sm btn-primary">Continuar</button>'
  false

$(document).ready ->
  #ocultar questões
  $('.questionform').hide()
  $('#0').click ->
    $('.iniciar').hide()
    $('#q1').fadeIn 300
    false
  $('#q1 #enviar').click ->
    $('.questionform').hide()
    processar 'q1'
    $('#q2').fadeIn 300
    false
  $('#q2 #enviar').click ->
    $('.questionform').hide()
    processar 'q2'
    $('#q3').fadeIn 300
    false
  $('#q3 #enviar').click ->
    $('.questionform').hide()
    processar 'q3'
    $('#q4').fadeIn 300
    false
  $('#q4 #enviar').click ->
    $('.questionform').hide()
    processar 'q4'
    $('#resultado').fadeIn 300
    false
  return
window.addEventListener 'load', init, false



#------------------------------Fase2

pontos = 0
total = 0
ponto = 1
maximo = total + ponto

init = ->
  console.log 'pegando perguntas'
  $.get 'http://localhost:3000/level/2/questions', (data) ->
    total = data.length
    i = 0
    while i < total
      id = data[i].id
      answer = data[i].answer
      sessionStorage.setItem 'a' + id, answer
      # adiciona o template ao arquivo
      template = '<form class="questionform" id="q' + id + '" data-question="' + id + '">'
      template += '<h3>' + data[i].question + '</h3>'
      template += '<input type="text" name="q' + id + '"/>'
      template += '<button id="enviar">Enviar</button>'
      template += '</form>'
      $('#question-list').append template
      i++
    #ocultar questões
    $('.questionform').hide()
    $('#0').click ->
      $('.iniciar').hide()
      $('[data-question]:first').fadeIn 300
      false
    $('.questionform #enviar').click ->
      current = $(this).parents('form:first').data('question')
      next = $(this).parents('form:first').data('question') + 1
      $('.questionform').hide()
      $('#q' + next + '').fadeIn 300
      $('#q' + next + '').focus()
      processar current
      false
    # ---------------------------------------------------------
    return
  return

processar = (n) ->
  last_question = $('form[data-question]:last').data('question')
  enviar = $('input[name=q' + n + ']').val()
  if enviar == sessionStorage.getItem('a' + n + '')
    pontos++
  if last_question == n
    if pontos < total
      $('#resultado').html '<h3>Você acertou ' + pontos + ' questões de ' + total + '!</h3>' + '<h4>É necessário acertar todas para seguir adiante</h4>' + '<a href="fase2.html">Responder novamente</a>'
    else
      $('#resultado').html '<h3>Parabéns você acertou TODAS as questões!!!</h3>' + '<h4>Que tal aprender mais?</h4>' + '<a href="fase3.html">Fase 3</a>'
  false

window.addEventListener 'load', init, false


#--------------------------------FASE 3

pontos = 0
total = 0
ponto = 1
maximo = total + ponto

init = ->
  console.log 'pegando perguntas'
  $.get 'http://localhost:3000/level/3/questions', (data) ->
    total = data.length
    i = 0
    while i < total
      id = data[i].id
      answer = data[i].answer
      sessionStorage.setItem 'a' + id, answer
      # adiciona o template ao arquivo
      template = '<form class="questionform" id="q' + id + '" data-question="' + id + '">'
      template += '<h3>' + data[i].question + '</h3>'
      template += '<input type="text" name="q' + id + '"/>'
      template += '<button id="enviar">Enviar</button>'
      template += '</form>'
      $('#question-list').append template
      i++
    #ocultar questões
    $('.questionform').hide()
    $('#0').click ->
      $('.iniciar').hide()
      $('[data-question]:first').fadeIn 300
      false
    $('.questionform #enviar').click ->
      current = $(this).parents('form:first').data('question')
      next = $(this).parents('form:first').data('question') + 1
      $('.questionform').hide()
      $('#q' + next + '').fadeIn 300
      $('#q' + next + '').focus()
      processar current
      false
    # ---------------------------------------------------------
    return
  return

processar = (n) ->
  last_question = $('form[data-question]:last').data('question')
  enviar = $('input[name=q' + n + ']').val()
  if enviar == sessionStorage.getItem('a' + n + '')
    pontos++
  if last_question == n
    if pontos < total
      $('#resultado').html '<h3>Você acertou ' + pontos + ' questões de ' + total + '!</h3>' + '<h4>É necessário acertar todas para seguir adiante</h4>' + '<a href="fase3.html">Responder novamente</a>'
    else
      $('#resultado').html '<h3>Parabéns você acertou TODAS as questões!!!</h3>' + '<h4>@@@@ TEXTO PARA FINAL DO TESTE @@@@</h4>'
  false

window.addEventListener 'load', init, false

#------------------------------------ FASE4


pontos = 0
total = 4
ponto = 1
maximo = total + ponto

init = ->
  sessionStorage.setItem 'a1', 'd'
  sessionStorage.setItem 'a2', 'd'
  sessionStorage.setItem 'a3', 'd'
  sessionStorage.setItem 'a4', 'd'
  return

processar = (n) ->
  enviar = $('input[name=q' + n + ']:checked').val()
  if enviar == sessionStorage.getItem('a' + n + '')
    pontos++
  if n == 4
    if pontos < 4
      $('#resultado').html '<h3>Você acertou ' + pontos + ' questões de 4!</h3>' + '<h4>É necessário acertar todas para seguir adiante</h4>' + '<a href="fase2.html">Responder novamente</a>'
    else
      $('#resultado').html '<h3>Parabéns você acertou TODAS as questões!!!</h3>' + '<h4>Seu raciocínio é ótimo!!!</h4>'
  false

$(document).ready ->
  #ocultar questões
  $('.questionform').hide()
  $('#0').click ->
    $('.iniciar').hide()
    $('#q1').fadeIn 300
    false
  $('.questionform #enviar').click ->
    current = $(this).parents('form:first').data('question')
    next = $(this).parents('form:first').data('question') + 1
    $('.questionform').hide()
    $('#q' + next + '').fadeIn 300
    processar '' + current + ''
    false
  return
window.addEventListener 'load', init, false
