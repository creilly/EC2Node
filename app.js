(function() {
  var app, everyone, express, nowjs;
  express = require('express');
  app = express.createServer();
  /*
  config
  */
  app.set('views', __dirname + '/views');
  app.use(express.static(__dirname + '/public'));
  app.set('view engine', 'ejs');
  app.get('/', function(req, res) {
    return res.render('chat', {
      locals: {
        title: 'NowJS + Express Chat',
        pagescript: 'chat.js'
      }
    });
  });
  app.listen(80);
  console.log('Express server listening onport %d', app.address().port);
  nowjs = require('now');
  everyone = nowjs.initialize(app);
  nowjs.on('connect', function() {
    return console.log('joined: ' + this.now.name);
  });
  nowjs.on('disconnect', function() {
    return console.log('Left: ' + this.now.name);
  });
  everyone.now.distributeMessage = function(message) {
    return everyone.now.receiveMessage(this.now.name, message);
  };
  everyone.now.loginUser = function() {
    return everyone.now.receiveMessage(this.now.name, 'has logged in!');
  };
}).call(this);
