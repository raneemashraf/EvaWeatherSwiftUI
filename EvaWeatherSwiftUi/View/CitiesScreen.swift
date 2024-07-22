//
//  CitiesScreen.swift
//  EvaWeatherSwiftUi
//
//  Created by raneem on 21/07/2024.
//

import Foundation
import SwiftUI

struct CitiesScreen: View {
    @StateObject private var viewModel = CitiesViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {                
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else {
                    List(viewModel.cities, id: \.self) { city in
                        NavigationLink(destination: CityDetailScreen(viewModel: viewModel, city: city)) {
                            HStack {
                                Text(city)
                                    .font(.system(size: 25, design: .monospaced))

                                Spacer()
                                if let temp = viewModel.weathers[city]?.temperature_2m {
                                    Text("\(String(format: "%.2f", temp))°C")
                                        .font(.system(size: 25, design: .monospaced))
                                }
                                
                                if viewModel.favorites[city] ?? false {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                } else {
                                    EmptyView()
                                }
                            }
                        }                        .listRowBackground(Color.clear)

                    }
                    .listStyle(PlainListStyle())
                    .background(Color.clear)
                    .navigationTitle("Cities")
                    
                }
            }
            .foregroundColor(.white)
            .background(
                Image( "morning")
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .blur(radius: 1.0)
            )
            .onAppear {
                viewModel.fetchWeathers()
            }
        }
    .navigationBarBackButtonHidden(true)

    }
}

struct CitiesScreen_Previews: PreviewProvider {
    static var previews: some View {
        CitiesScreen()
    }
}
