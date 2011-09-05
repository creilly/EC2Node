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

  now.newKittenId = (kId, person) ->
    $('#kitten img').attr 'src','http://placekitten.com/200/' + kId
    $('#kitten p').text = person