//
//  AppDelegate.swift
//  SOS-App
//
//  Created by Francesco Facca on 21/01/2021.
//

import UIKit
import GoogleMaps

let googleApiKey = "AIzaSyByQAfQhKs_OhdMv_PQGSEY68_p41829PY"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    GMSServices.provideAPIKey(googleApiKey)
    return true
  }
}
