//
//  HomeAPIContentView.swift
//  API-Example
//
//  Created by Joshua Retallick on 24/01/2021.
//

import SwiftUI

struct Response: Decodable {
    var content: [MyResult]
}
//Result already exists in Swift you will cause issues if you use names that are already used
struct MyResult : Decodable {
    var code: String
    var fire: String
    var name: String
    var police: String
    var medical: String
}

struct HomeAPIContentView: View {
    
    @StateObject var locationViewModel = LocationViewModel()
    
    var body: some View {
        List(locationViewModel.content, id: \.code) { item in
            VStack(alignment: .center) {
                Text("Latitude: \(locationViewModel.userLatitude)")
                Text("Longitude: \(locationViewModel.userLongitude)")
                Text(item.name)
                    .font(.headline)
                HStack {
                    Text("Medical:")
                    Text(item.medical)
                        .foregroundColor(Color.red)
                    Text("Police:")
                    Text(item.police)
                        .foregroundColor(Color.red)
                    Text("Fire:")
                    Text(item.fire)
                        .foregroundColor(Color.red)
                }
            }
        }
        
    }
    
}
