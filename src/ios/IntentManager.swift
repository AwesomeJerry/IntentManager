import Foundation

@objc(IntentManager) class IntentManager : CDVPlugin {

	// 轉跳setting APP
	func openSetting(command: CDVInvokedUrlCommand) {

		if let settingURL = NSURL(string: UIApplicationOpenSettingsURLString) {
			UIApplication.sharedApplication().openURL( settingURL )
		}

	}
	
	// 開啟App Store
	func openAppStore(command: CDVInvokedUrlCommand) {
        var obj: AnyObject = command.arguments[0] as AnyObject!
        let app_id: String = obj["app_id"] as String

        if let appURL = NSURL(string: "itms-apps://itunes.apple.com/app/bars/id\(app_id)") {
            UIApplication.sharedApplication().openURL( appURL )
        }
	}
}

