IntentManager
============

Phonegap IntentManager Plugin

Install
===========
Assuming the PhoneGap CLI is installed, from the command line run:

phonegap local plugin add https://github.com/BonerChick/IntentManager.git



or Apache Cordova CLI is installed, run:

cordova plugin add https://github.com/BonerChick/IntentManager.git

Usage
==========
OpenLocation:
intentManager.openLocation(SuccessCallback, ErrorCallback);

OpenSetting:
intentManager.openSetting(SuccessCallback, ErrorCallback);

OpenGooglePlay:
intentManager.openGooglePlay(PackageName, SuccessCallback, ErrorCallback);