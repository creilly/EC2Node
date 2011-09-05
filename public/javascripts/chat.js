(function() {
  $(document).ready(function() {
    var message;
    $('#send-button').click(function() {
      return now.newKitten();
    });
    message = 'what is your name?\n<br />\n<input type="text" id="name" name="name" />';
    $.prompt(message, {
      callback: function(v, m, f) {
        now.name = f.name;
        now.loginUser();
        return now.newKitten();
      }
    });
    now.newKittenId = function(kw, kh, person) {
      $('#kitten img').attr('src', 'http://placekitten.com/' + kw + '/' + kh);
      return $('#kitten h2').text(person + ' set the kitten!');
    };
    now.receiveMessage = function(person, message) {
      return $('#cat-chat').prepend($('<p>').text(person + ': ' + message));
    };
    return $('#text-submit').click(function() {
      return now.dispatchMessage($('#text-input').attr('value'));
    });
  });
}).call(this);
