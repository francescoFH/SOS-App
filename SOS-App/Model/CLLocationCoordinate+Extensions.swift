//
//  CLLocationCoordinate+Extensions.swift
//  SOS-App
//
//  Created by Francesco Facca on 21/01/2021.
//

import CoreLocation

extension CLLocationCoordinate2D: CustomStringConvertible {
  public var description: String {
    let lat = String(format: "%.6f", latitude)
    let lng = String(format: "%.6f", longitude)
    return "\(lat),\(lng)"
  }
}
