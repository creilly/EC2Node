$(document).ready ->
  now.receiveMessage = (name,message) ->
    $('#messages').append '<br>' + name + ": " + message

  $('#send-button') .click ->
      now.distributeMessage $('#text-input').val()
      $ '#text-input' .val ''
      $ '#text-input' .focus()

  message = '''
  what is your name?
  <br />
  <input type="text" id="name" name="name" />
    '''


  $.prompt message, callback: (v,m,f) ->
    now.name = f.name
    now.loginUser()