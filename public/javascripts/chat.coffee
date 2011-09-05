$(document).ready ->
  $('#send-button') .click ->
      now.newKitten()
  message = '''
  what is your name?
  <br />
  <input type="text" id="name" name="name" />
    '''


  $.prompt message, callback: (v,m,f) ->
    now.name = f.name
    now.loginUser()
    now.newKitten()

  now.newKittenId = (kw, kh, person) ->
    $('#kitten img').attr 'src','http://placekitten.com/' + kw + '/' + kh
    $('#kitten h2').text person + ' set the kitten!'

  now.receiveMessage = (person,message) ->
    $('#cat-chat').prepend $('<p>').text(person + ': ' + message)

  $('#text-submit').click ->
    now.dispatchMessage $('#text-input').attr 'value'
    $('#text-input').attr 'value', ''