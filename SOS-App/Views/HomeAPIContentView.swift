//
//  HomeAPIContentView.swift
//  API-Example
//
//  Created by Joshua Retallick on 24/01/2021.
//

import SwiftUI
import AVFoundation  // for ghostbusters

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
    
    // lines 27 to 29 are for ghostbusters
    
//    @State var audioPlayer: AVAudioPlayer?
//
//    var sound = "ghostbusters.mp3"
    
    // end of ghostbusters declaratations
    
    @StateObject var locationViewModel = LocationViewModel()
    
    var body: some View {
        List(locationViewModel.content, id: \.code) { item in
            VStack(alignment: .center) {
                Text("Latitude: \(locationViewModel.userLatitude)")
                Text("Longitude: \(locationViewModel.userLongitude)")
                Text(item.name)
                    .font(.headline)
                HStack {
                    Image("call-ambulance-icon")
                        .resizable()
                        .frame(width: 50.0, height: 50.0)
//                    Text("Medical:")
                    Link(item.medical, destination: URL(string: item.medical)!)
                        .foregroundColor(Color.red)
                    Image("call-police-icon")
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
                    
                    // ghostbusters button code
                
//                    Button(action: {
//                        playSound(sound: "ghostbusters", type: "mp3")
//                    }) {
//                            Image("ghostbusters-icon")
//                                .resizable()
//                                .frame(width: 50.0, height: 50.0)
//                        }
                    
                    // end of ghostbusters button code
                    
//                    Link("CALL", destination: URL(string: "tel:441924457784")!)
                    
                }
            }
        }
    }

    // start playsound function

//    func playSound(sound: String, type: String) {
//        if let path = Bundle.main.path(forResource: sound, ofType: type) {
//            do {
//                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
//                audioPlayer?.play()
//            } catch {
//                print("ERROR")
//            }
//        }
//    }

    // finish playsound functionn

}

