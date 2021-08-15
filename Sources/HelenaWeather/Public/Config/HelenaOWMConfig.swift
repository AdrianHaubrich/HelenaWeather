//
//  HelenaOWMConfig.swift
//  HelenaWeather
//
//  Created by Adrian Haubrich on 15.08.21.
//

import Foundation

public struct HelenaOWMConfig {
    
    // API
    var API_KEY = "e765f24372c05bba45f97b71c42b32b4"
    let API_ENDPOINT = "http://api.openweathermap.org/"
    
    let API_UNIT = "metric"
    let API_EXCLUDE = "alerts"
    
    // Forecast times
    let API_DAY_FORECAST: Double = 60 * 60 * 24 * 7 // Forecast for 7 Days
    let API_HOUR_FORECAST: Double = 60 * 60 * 48 // Forecast for 48h
    
    
    // Constructor
    public init(apiKey: String) {
        self.API_KEY = apiKey
    }
    
}
