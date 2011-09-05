(function() {
  $(document).ready(function() {
    var message;
    $('#send-button').click(function() {
      return now.newKitten();
    });
    message = 'what is your name?\n<br />\n<input type="text" id="name" name="name" />';
    $.prompt(message, {
      callback: function(v, m, f) {
        return now.name = f.name;
      }
    });
    return now.newKittenId = function(kId, person) {
      $('#kitten img').attr('src', 'http://placekitten.com/200/' + kId);
      return $('#kitten p').text(person + ' set the kitten!');
    };
  });
}).call(this);
