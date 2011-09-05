express = require 'express'
app = express.createServer()

###
config
###

app.set 'views',__dirname + '/views'
app.use express.static __dirname + '/public'
app.set 'view engine', 'ejs'


app.get '/', (req,res) ->
  res.render 'chat', locals:
    title:
      'NowJS + Express Chat'
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

everyone.now.newKitten = ->
  everyone.now.newKittenId Math.ceil(Math.random()*400, '1'), @.now.name