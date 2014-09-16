var intentManager = {
    openLocation: function(successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, 'IntentManager', 'openLocation',[{}]);
    },
    openGooglePlay: function(successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, 'IntentManager', 'openGooglePlay',[{}]);
    }
}

module.exports = intentManager;