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
  everyone.now.newKitten = function() {
    return everyone.now.newKittenId(Math.ceil(Math.random() * 400, '1'), this.now.name);
  };
}).call(this);
