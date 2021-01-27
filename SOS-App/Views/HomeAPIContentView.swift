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
                Text("SOS App")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.red)
                    .multilineTextAlignment(.center)
                Spacer()
                    .frame(height: 50)
                Text("Street: \(locationViewModel.number) \(locationViewModel.street), \(locationViewModel.locality)")
                    .multilineTextAlignment(.center)
                Text(item.name)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                Spacer()
                    .frame(height: 50)
                HStack {
                    Image("call-ambulance-service")
                        .resizable()
                        .frame(width: 50.0, height: 50.0)
                    Link(item.medical, destination: URL(string: item.medical)!)
                        .foregroundColor(Color.red)
                    Image("call-police-service")
                        .resizable()
                        .frame(width: 50.0, height: 50.0)
                    Link(item.police, destination: URL(string: item.police)!)
                        .foregroundColor(Color.red)
                    Image("call-fire-service")
                        .resizable()
                        .frame(width: 50.0, height: 50.0)
                    Link(item.fire, destination: URL(string: item.fire)!)
                        .foregroundColor(Color.red)
                    Spacer()
                        .frame(height: 50)
                }
            }
            .padding()
        }
        Image("handshake copy")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

