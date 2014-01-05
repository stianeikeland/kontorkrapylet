window.onload = () ->

	socket = io.connect '#{window.location.protocol}://#{window.location.host}'

	socket.on 'connect', () ->
		console.log "Socket connected"

	document.onkeydown = (key) ->
		charCode = key.which or key.keyCode
		charStr = String.fromCharCode charCode

		console.log charStr

		switch charStr
			when "W" then socket.emit "move", "forward"
			when "S" then socket.emit "move", "backward"
			when "A" then socket.emit "move", "left"
			when "D" then socket.emit "move", "right"
			when " " then socket.emit "move", "stop"

