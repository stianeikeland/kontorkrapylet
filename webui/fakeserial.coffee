
class FakeSerial
	constructor: () ->
		console.log "FakeSerial start"

	write: (msg, cb = null) ->
		console.log "FakeSerial: #{msg}"
		cb null, msg if cb?

exports.FakeSerial = FakeSerial
