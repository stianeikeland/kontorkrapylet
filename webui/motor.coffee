{SerialPort} = require "serialport"

class Motor
	constructor: (@serial = new SerialPort "/dev/ttyAMA0", { baudrate: 57600 }) ->

	stop: -> @serial.write "S"
	forward: -> @serial.write "F"
	backward: -> @serial.write "B"
	left: -> @serial.write "L"
	right: -> @serial.write "R"

	dispatch: (data) ->
		switch data
			when "forward" then @forward()
			when "backward" then @backward()
			when "left" then @left()
			when "right" then @right()
			when "stop" then @stop()

exports.Motor = Motor
