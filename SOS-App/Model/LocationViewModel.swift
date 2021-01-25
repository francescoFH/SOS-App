//
//  LocationViewModel.swift
//  SOS-App
//
//  Created by Joshua Retallick on 25/01/2021.
//

import Foundation
import Combine
import CoreLocation

class LocationViewModel: NSObject, ObservableObject{
  
  @Published var userLatitude: Double = 0
  @Published var userLongitude: Double = 0

  private let locationManager = CLLocationManager()
  private let geoCoder = CLGeocoder()
  
  override init() {
    super.init()
    self.locationManager.delegate = self
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
    self.locationManager.requestWhenInUseAuthorization()
    self.locationManager.startUpdatingLocation()
  }
}

extension LocationViewModel: CLLocationManagerDelegate {
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.last else { return }
    userLatitude = location.coordinate.latitude
    userLongitude = location.coordinate.longitude
    print(location)
    
    
    geoCoder.reverseGeocodeLocation(location) { (placemarks, error) in
        guard let currentLocPlacemark = placemarks?.first else { return }
            print(currentLocPlacemark.country ?? "No country found")
            print(currentLocPlacemark.isoCountryCode ?? "No country code found")
        }
  }
}
