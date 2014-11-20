import Foundation
import CoreLocation

// 轉跳setting APP
class IntentManager : CDVPlugin {

	func openSetting() {

		if let settingURL = NSURL(string: UIApplicationOpenSettingsURLString) {
			UIApplication.sharedApplication().openURL( settingURL )
		}

	}

// itms://itunes.apple.com/de/app/x-gift/id839686104?mt=8&uo=4

}

