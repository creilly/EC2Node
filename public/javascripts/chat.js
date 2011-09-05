(function() {
  $(document).ready(function() {
    var message;
    now.receiveMessage = function(name, message) {
      return $('#messages').append('<br>' + name + ": " + message);
    };
    $('#send-button').click(function() {
      now.distributeMessage($('#text-input').val());
      $('#text-input'.val(''));
      return $('#text-input'.focus());
    });
    message = 'what is your name?\n<br />\n<input type="text" id="name" name="name" />';
    return $.prompt(message, {
      callback: function(v, m, f) {
        now.name = f.name;
        return now.loginUser();
      }
    });
  });
}).call(this);
