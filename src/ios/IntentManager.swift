import Foundation
import CoreLocation

// 轉跳setting APP
@objc(IntentManager) class IntentManager : CDVPlugin {

	func openSetting(command: CDVInvokedUrlCommand) {

		if let settingURL = NSURL(string: UIApplicationOpenSettingsURLString) {
			UIApplication.sharedApplication().openURL( settingURL )
		}

	}
	
	func openAppStore(command: CDVInvokedUrlCommand) {
	//這邊要想辦法接參數，想說app id可以由js帶過來
	//然後就開啟相對應的App Store頁面
	}

// itms://itunes.apple.com/de/app/x-gift/id839686104?mt=8&uo=4

}

