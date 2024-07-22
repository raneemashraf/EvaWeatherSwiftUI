//
//  WeatherNetwork.swift
//  EvaWeatherSwiftUi
//
//  Created by raneem on 21/07/2024.
//

import Foundation


func fetchWeatherData(latitude: Double, longitude: Double, completion: @escaping (WeatherData?) -> Void) {
    let urlString = "https://api.open-meteo.com/v1/forecast?latitude=\(latitude)&longitude=\(longitude)&current=temperature_2m,relative_humidity_2m,rain,visibility"
    guard let url = URL(string: urlString) else {
        completion(nil)
        return
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data, error == nil else {
            completion(nil)
            return
        }
        
        let weatherData = try? JSONDecoder().decode(WeatherData.self, from: data)
        completion(weatherData)
    }
    task.resume()
}
