//
//  CityDetailScreen.swift
//  EvaWeatherSwiftUi
//
//  Created by raneem on 22/07/2024.
//

import Foundation
import SwiftUI

struct CityDetailScreen: View {
    @ObservedObject var viewModel: CitiesViewModel
    var city: String
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let detail = viewModel.weathers[city] {
                
                VStack {
                    HStack(spacing: 20){
                        Text(city)
                            .bold().font(.system(size: 55))
                        Button(action: {
                            
                            viewModel.setCityFavorite( city: city, isFavorite: true)
                        }) {
                            Image(systemName: viewModel.favorites[city] ?? false ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                        }
                    }
                   // Spacer()
                    VStack(alignment: .center, spacing: 12) {
                        Text("\(String(format: "%.2f", detail.temperature_2m))°C")
                            .bold().font(.system(size: 30))
                        Image("cloud")
                       // Spacer()
                        Text("Rain: \(String(format: "%.1f", detail.rain)) mm")
                            .font(.system(size: 25))
                        
                        Text("Humidity: \(String(format: "%.2f", detail.relative_humidity_2m)) %")
                            .font(.system(size: 25))
                        
                        Text("Visibility: \(String(format: "%.2f", detail.visibility / 1000)) km")
                            .font(.system(size: 25))
                        Spacer()
                    }
                }
            }
        }
        .foregroundColor(.white)
        .background(
            Image( "morning")
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 1.0)
        )
    }
}
struct CityDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        CityDetailScreen(viewModel: CitiesViewModel(), city: "Cairo")
    }
}
