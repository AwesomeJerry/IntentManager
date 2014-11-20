import Foundation
import CoreLocation

// 開始啟用iphone定位
class StartLocation : CDVPlugin, CLLocationManagerDelegate {

	let locationManager:CLLocationManager = CLLocationManager()

// command: CDVInvokedUrlCommand
	func getMyLocation() {

		if CLLocationManager.locationServicesEnabled() {
			if self.locationManager.responseToSelector("requestAlwaysAuthorization") {
				locationManager.requestAlwaysAuthorization()
			} else {
				locationManager.startUpdatingLocation()
			}
		}

	}

	// is triggered when new location updates are available.
	func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
		println("Updating location success")

		CLGeocoder().reverseGeocodeLocation( manager.location, completionHandler: { (placemarks,error) -> Void in
			if error != nil {
				println( "Reverse geocoder with fail error \n Because of : \(error.localizedDescription)" )
				return
			} else if placemarks.count > 0 {
				let pm:CLPlacemark! = placemarks[0] as CLPlacemark

				self.locationYouAre.text = "Here is \(pm.locality)! \n AND \n ( \( pm.location.coordinate.latitude ), \( pm.location.coordinate.longitude ) )"
			} else {
				println( "Problem with the data received from geocoder" )
			}
		})
	}

	// Tells the delegate that the authorization status for the application changed.
	func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
		switch CLLocationManager.authorizationStatus() {
			case .NotDetermined:
				println("Not Determind")

				locationManager.requestAlwaysAuthorization()
			case .Authorized:
				println("Authorized")

				locationManager.startUpdatingLocation()
			case .AuthorizedWhenInUse, .Restricted, .Denied:
				println("AuthorizedWhenInUse or Restricted or Denied")

				let authAlert = UIAlertController(title: "Location Access Disabled", message: "In order to see local weather data, please open this app's settings and set location access to 'Always'.", preferredStyle: .Alert)
				let launchSetting = UIAlertAction(title: "Setting", style: .Default, handler: { (action) in
					if let url = NSURL(string: UIApplicationOpenSettingsURLString) {
						UIApplication.sharedApplication().openURL(url)
					}
				})
				let cancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
				authAlert.addAction(launchSetting)
				authAlert.addAction(cancel)
				presentViewController(authAlert, animated: true, completion: nil)
		}
	}

	// is called when there is a problem receiving the location updates.
	func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
		println( "Something wrong! \n msg: \(error.localizedDescription)" )
	}

}

