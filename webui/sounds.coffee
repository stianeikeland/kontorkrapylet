fs = require 'fs'
exec = (require 'child_process').exec

class SoundBoard
	constructor: (@urlprefix = '/sounds/') ->

	listSounds: (cb) ->
		fs.readdir 'public/sounds', (err, files) =>
			friendlyName = (file) ->
				(file.replace /\.mp3/g, '').replace /_/g, ' '

			mp3s = files.filter (filename) ->
				(filename.indexOf ".mp3") >= 0

			list = ({
				description: friendlyName mp3
				filename: mp3
				url: @urlprefix + mp3
			} for mp3 in mp3s)

			cb err, list

	playSound: (sound) ->
		isValidFile = (sound, files) ->
			for file in files
				if sound is file.filename
					return true
			return false

		@listSounds (err, files) ->
			if isValidFile sound, files
				console.log "Playing #{sound}"
				exec "mpg123 public/sounds/#{sound}"
				return

exports.SoundBoard = SoundBoard
