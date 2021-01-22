//
//  AppDelegate.swift
//  SOS-App
//
//  Created by Francesco Facca on 21/01/2021.
//

import UIKit
import GoogleMaps

let googleApiKey = "AIzaSyCeI5kISbACeRxqZzBP9vHoI6WEtmalBPY"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    GMSServices.provideAPIKey(googleApiKey)
    return true
  }
}
