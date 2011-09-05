(function() {
  var app, everyone, express, nowjs, randInt;
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
        title: 'Cat Mat',
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
  randInt = function(min, max) {
    return min + Math.ceil(Math.random() * (max - min), '1');
  };
  everyone.now.newKitten = function() {
    return everyone.now.newKittenId(randInt(200, 300), randInt(200, 300), this.now.name);
  };
  everyone.now.loginUser = function() {
    return everyone.now.receiveMessage(this.now.name, ' wants to cat chat with you!');
  };
  everyone.now.dispatchMessage = function(message) {
    return everyone.now.receiveMessage(this.now.name, message);
  };
}).call(this);
