//
//  PlaceMarker.swift
//  SOS-App
//
//  Created by Francesco Facca on 21/01/2021.
//

import UIKit
import GoogleMaps

class PlaceMarker: GMSMarker {
  let place: GooglePlace
  
  init(place: GooglePlace, availableTypes: [String]) {
    self.place = place
    super.init()
    
    position = place.coordinate
    groundAnchor = CGPoint(x: 0.5, y: 1)
    appearAnimation = .pop
    
    var foundType = "hospital"
    let possibleTypes = availableTypes.count > 0 ? availableTypes : ["hospital", "pharmacy"]
    for type in place.types {
      if possibleTypes.contains(type) {
        foundType = type
        break
      }
    }
    icon = UIImage(named: foundType+"_pin")
  }
}
