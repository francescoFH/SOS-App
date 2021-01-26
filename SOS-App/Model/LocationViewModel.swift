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

    //MARK: Properties
    @Published var content = [MyResult]()
    @Published var userLatitude: Double = 0
    @Published var userLongitude: Double = 0
    @Published var isoCountryCode = ""{
        didSet{
            //load the data once you have a countrycode
            loadData()
        }
    }
    
    private let locationManager = CLLocationManager()
    //MARK: init
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.requestLocation()
    }
    //MARK: Functions
    func loadData() {
        
        let url = URL(string: "https://emergency-phone-numbers.herokuapp.com/country/\(isoCountryCode)")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error { print(error); return }
            do {
                let decodedResponse = try JSONDecoder().decode(MyResult.self, from: data!)
                // we have good data – go back to the main thread
                DispatchQueue.main.async {
                    // update our UI
                    self.content = [decodedResponse]
                }
                
            } catch {
                print(error)
            }
        }.resume()
        
    }
}

extension LocationViewModel: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        userLatitude = location.coordinate.latitude
        userLongitude = location.coordinate.longitude
        print(location)
        
        CLGeocoder().reverseGeocodeLocation(location) { (placemark, error) in
            if error != nil
            {
                print("there is an error \(String(describing: error))")
            }
            else
            {
                if let place = placemark?[0]
                {
                    self.isoCountryCode = place.isoCountryCode ?? ""
                }
            }
        }
        
    }
    //You have to respond to errors
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    //You have to respond to changes in autorization too
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
    }

}

