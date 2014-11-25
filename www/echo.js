var echo = {
	echo: function(successCallback, errorCallback) {
		cordova.exec(successCallback, errorCallback, "Echo", "echo", [{}]);
	}
}

module.exports = echo;