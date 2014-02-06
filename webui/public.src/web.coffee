
$(document).ready ->

	socket = io.connect()

	socket.on 'connect', () ->
		console.log "Socket connected"

	keypress = (key) ->
		console.log "Keypress: #{key}"

		switch key.toUpperCase()
			when "W" then socket.emit "move", "forward"
			when "S" then socket.emit "move", "backward"
			when "A" then socket.emit "move", "left"
			when "D" then socket.emit "move", "right"
			when "SPACE" then socket.emit "move", "stop"
			when " " then socket.emit "move", "stop"

	document.onkeydown = (key) ->
		charCode = key.which or key.keyCode
		keypress String.fromCharCode charCode

	for key in ["w", "s", "a", "d", "space"]
		elem = document.getElementById key
		elem.onclick = ((k) -> (() -> keypress k))(key)

	playSound = (file) ->
		console.log "Playing #{file}"
		socket.emit 'playSound', file if $("input#robotaudio").prop('checked')

		return if not $("input#localaudio").prop('checked')

		element = $("<audio controls autoplay/>").html($("<source/>").attr(
			{
				src: "/sounds/" + file
				type: "audio/mpeg"
			}))

		$(".audioplayer").html(element)


	$.get "/sounds", (sounds) ->
		target = $(".soundbuttons")

		addbutton = (sound) ->
			console.log sound
			filename = sound.filename
			elem = $('<button/>')
				.html(sound.description)
				.click(-> playSound filename)

			target.append elem

		addbutton sound for sound in sounds
