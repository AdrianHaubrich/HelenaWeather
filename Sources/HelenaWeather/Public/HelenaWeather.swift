//
//  HelenaWeather.swift
//  HelenaWeather
//
//  Created by Adrian Haubrich on 15.08.21.
//

import Foundation
import MapKit

public struct HelenaWeather {
    
    // Config
    var config: HelenaOWMConfig
    
    
    // MARK: Construction
    /// Initialize with default parameters.
    /// - Parameter apiKey: The OpenWeatherMap-Api-Key.
    public init(apiKey: String) {
        let config = HelenaOWMConfig(apiKey: apiKey)
        self.config = config
    }
    
    /// Custom init.
    /// - Parameter config: A custom config.
    public init(config: HelenaOWMConfig) {
        self.config = config
    }
    
}

extension HelenaWeather {
    
    public func requestWeather(for coordinates: CLLocationCoordinate2D, at date: Date? = nil, completion: @escaping (Bool, HelenaWeatherData?) -> ()) {
        
        let fetcher = HelenaWeatherFetcher(config: config)
        fetcher.fetchWeather(coordinates: coordinates) { (success, weatherData) in
            
            if success, let weatherData = weatherData {
                let weatherBuilder = HelenaWeatherBuilder(config: config)
                weatherBuilder.convertToHelenaWeather(from: weatherData, at: date) { weather in
                    completion(true, weather)
                }
            } else {
                completion(false, nil)
            }
            
        }
        
    }
    
}
