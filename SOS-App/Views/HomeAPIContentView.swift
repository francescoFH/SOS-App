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
//                Text("Latitude: \(locationViewModel.userLatitude)")
//                Text("Longitude: \(locationViewModel.userLongitude)")
                Text("Street: \(locationViewModel.number) \(locationViewModel.street), \(locationViewModel.locality)")
                Text(item.name)
                    .font(.headline)
                HStack {
                    Image("call-ambulance-service")
                        .resizable()
                        .frame(width: 50.0, height: 50.0)
//                    Text("Medical:")
                    Link(item.medical, destination: URL(string: item.medical)!)
                        .foregroundColor(Color.red)
                    Image("call-police-service")
                        .resizable()
                        .frame(width: 50.0, height: 50.0)
//                    Text("Police:")
                    Link(item.police, destination: URL(string: item.police)!)
                        .foregroundColor(Color.red)
                    Image("call-fire-service")
                        .resizable()
                        .frame(width: 50.0, height: 50.0)
//                    Text("Fire:")
//                    Text(item.fire)
                    Link(item.fire, destination: URL(string: item.fire)!)
                        .foregroundColor(Color.red)
                    
                }
            }
            .padding()
        }
        Image("handshake copy")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }



}

