//
//  HomeAPIContentView.swift
//  API-Example
//
//  Created by Joshua Retallick on 24/01/2021.
//

import SwiftUI

struct Response: Decodable {
    var content: [Result]
}

struct Result : Decodable {
    var code: String
    var fire: String
    var name: String
    var police: String
    var medical: String
}

struct HomeAPIContentView: View {
    @State private var content = [Result]()
    @ObservedObject var locationViewModel = LocationViewModel()

    var body: some View {
        List(content, id: \.code) { item in
            VStack(alignment: .center) {
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
        .onAppear(perform: loadData)
    }
    func loadData() {
        
        let url = URL(string: "https://emergency-phone-numbers.herokuapp.com/country/us")!

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error { print(error); return }
            do {
                let decodedResponse = try JSONDecoder().decode(Result.self, from: data!)
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
