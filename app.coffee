express = require 'express'
app = express.createServer()


###
config
###

app.set 'views',__dirname + '/views'
app.use express.static __dirname + '/public'
app.set 'view engine', 'coffee'
app.register '.coffee', require('coffeekup').adapters.express

app.get '/', (req,res) ->
  res.render 'chat', locals:
    title:
      'Cat Mat'
    pagescript:
      'chat.js'

app.listen 80
console.log 'Express server listening onport %d', app.address().port

nowjs = require 'now'
everyone = nowjs.initialize app

nowjs.on 'connect', ->
  console.log 'joined: ' + @.now.name

nowjs.on 'disconnect', ->
  console.log 'Left: ' + @.now.name

randInt = (min,max) -> min + Math.ceil(Math.random()*(max - min), '1')

everyone.now.newKitten = ->
  everyone.now.newKittenId randInt(200,300), randInt(200,300), @.now.name

everyone.now.loginUser = ->
  everyone.now.receiveMessage @.now.name, ' wants to cat chat with you!'

everyone.now.dispatchMessage = (message) ->
  everyone.now.receiveMessage @.now.name, message
