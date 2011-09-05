(function() {
  $(document).ready(function() {
    return $('#chat').click(function(e) {
      e.preventDefault();
      return $('<iframe width="800px" height="100%" sandbox="allow-same-origin allow-forms allow-scripts" src="http://localhost:4000/chat"></iframe>').appendTo('#floater');
    });
  });
}).call(this);
