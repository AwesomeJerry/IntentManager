var intentManager = {
    openLocation: function(successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, 'IntentManager', 'openLocation',[{}]);
    },
    openGooglePlay: function(package_name, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, 'IntentManager', 'openGooglePlay',[{
            'package_name': package_name
        }]);
    },
    openSetting: function(successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, 'IntentManager', 'openSetting',[{}]);
    }
}

module.exports = intentManager;