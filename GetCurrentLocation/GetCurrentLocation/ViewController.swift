//
//  ViewController.swift
//  GetCurrentLocation
//
//  Created by Miya on 4/4/23.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()

    @IBOutlet weak var lblLatitude: UILabel!
    @IBOutlet weak var lblLongitude: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    }

    @IBAction func getLatLongAction(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        let lat = location.coordinate.latitude
        let lng = location.coordinate.longitude
        
        lblLatitude.text = "Lat: \(lat)"
        lblLongitude.text = "Lng: \(lng)"
        
        getAddressFromLocation(location: location)
    }
    
    func getAddressFromLocation(location: CLLocation) {
        let geoCoder = CLGeocoder()
        
        geoCoder.reverseGeocodeLocation(location) { placemarks, error in
            if error != nil {
                print(error as Any)
                return
            }
            var address = ""
            guard let place = placemarks?.first else {return}
            if place.name != nil {
                address += place.name! + ","
            }
            if place.locality != nil {
                address += place.locality! + ","
            }
            if place.subLocality != nil {
                address += place.subLocality! + ","
            }
            if place.country != nil {
                address += place.country! + ","
            }
            if place.postalCode != nil {
                address += place.postalCode! + ","
            }
            print(address)
        }
    }
}






