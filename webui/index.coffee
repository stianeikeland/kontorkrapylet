express = require "express"
socketio = require "socket.io"
jade = require "jade"
coffeescript = require 'connect-coffee-script'

SoundBoard = (require './sounds').SoundBoard
Motor = (require './motor').Motor
FakeSerial = (require './fakeserial').FakeSerial

fakeserial = if process.env.FAKESERIAL then new FakeSerial else null
motor = new Motor fakeserial
soundBoard = new SoundBoard

app = express()
port = process.env.PORT or 8000

app.set 'views', __dirname + '/template'
app.set 'view engine', 'jade'
app.engine 'jade', jade.__express

app.use coffeescript {
	src: __dirname + '/public.src'
	dest: __dirname + '/public'
	bare: true
}

app.use express.static __dirname + '/public'

app.get "/", (req, res) ->
	res.render 'index'

app.get "/sounds", (req, res) ->
	soundBoard.listSounds (err, sounds) ->
		res.send 503, "Unable to list sounds: #{err}" if err
		res.send sounds if not err

io = socketio.listen app.listen port
io.set 'log level', 1

console.log "Listening on port #{port}."

io.sockets.on 'connection', (socket) ->
	console.log "New socket.io connection"
	socket.on "move", (data) -> motor.dispatch data
	socket.on "playSound", (file) -> soundBoard.playSound file

