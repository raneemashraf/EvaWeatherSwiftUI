//
//  WeatherData.swift
//  EvaWeatherSwiftUi
//
//  Created by raneem on 21/07/2024.
//

import Foundation

import Foundation

struct WeatherData: Codable {
    let latitude: Double
    let longitude: Double
    let generationtime_ms: Double
    let utc_offset_seconds: Int
    let timezone: String
    let timezone_abbreviation: String
    let elevation: Double
    let current_units: CurrentUnits
    let current: CurrentWeather
    
    struct CurrentUnits: Codable {
        let time: String
        let interval: String
        let temperature_2m: String
        let relative_humidity_2m: String
        let rain: String
        let visibility: String
    }
    
    struct CurrentWeather: Codable {
        let time: String
        let interval: Int
        let temperature_2m: Double
        let relative_humidity_2m: Double
        let rain: Double
        let visibility: Double
    }
}

