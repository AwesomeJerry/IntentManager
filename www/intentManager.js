var intentManager = {
	openLocation: function (successCallback, errorCallback) {
		cordova.exec(successCallback, errorCallback, 'IntentManager', 'openLocation', [{}]);
	},
	openGooglePlay: function (package_name, successCallback, errorCallback) {
		cordova.exec(successCallback, errorCallback, 'IntentManager', 'openGooglePlay', [{
			'package_name': package_name
        }]);
	},
	openAppStore: function (app_id, successCallback, errorCallback) {
		cordova.exec(successCallback, errorCallback, 'IntentManager', 'openAppStore', [{
			'app_id': app_id
        }]);
	},
	openSetting: function (successCallback, errorCallback) {
		cordova.exec(successCallback, errorCallback, 'IntentManager', 'openSetting', [{}]);
	}
}

module.exports = intentManager;