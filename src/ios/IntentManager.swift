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
	//這邊要想辦法接參數，想說app id可以由js帶過來
	//然後就開啟相對應的App Store頁面
	}
}

