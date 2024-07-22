//
//  CitiesViewModel.swift
//  EvaWeatherSwiftUi
//
//  Created by raneem on 21/07/2024.
//

import Foundation
import Combine

class CitiesViewModel: ObservableObject, FavoriteDelegate {
    @Published var cities = ["Cairo", "Tokyo", "Madrid", "Lagos", "Moscow"]
    @Published var favorites: [String:Bool] = [:]
    @Published var isLoading = false
    @Published var weathers: [String: WeatherData.CurrentWeather] = [:]


    init() {
        fetchWeathers()
       }
    func fetchWeather(for city: String, latitude: Double, longitude: Double) {
        isLoading = true
        fetchWeatherData(latitude: latitude, longitude: longitude) { [weak self] weatherData in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let weatherData = weatherData {
                    self?.weathers[city] = weatherData.current
                }
            }
        }
    }
    
    func fetchWeathers() {
        for city in cities {
            switch city {
            case "Cairo":
                fetchWeather(for: city, latitude: 30.0444, longitude: 31.2357)
            case "Tokyo":
                fetchWeather(for: city, latitude: 35.6895, longitude: 139.6917)
            case "Madrid":
                fetchWeather(for: city, latitude: 40.4168, longitude: -3.7038)
            case "Lagos":
                fetchWeather(for: city, latitude: 6.5244, longitude: 3.3792)
            case "Moscow":
                fetchWeather(for: city, latitude: 55.7558, longitude: 37.6173)
            default:
                break
            }
        }
    }
    func setCityFavorite(city: String, isFavorite: Bool) {
        favorites[city] = isFavorite
    }
}
