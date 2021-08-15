//
//  HelenaWeatherBuilder.swift
//  HelenaWeather
//
//  Created by Adrian Haubrich on 15.08.21.
//

import Foundation
import MapKit

struct HelenaWeatherBuilder {
    
    let config: HelenaOWMConfig
    
    init(config: HelenaOWMConfig) {
        self.config = config
    }
    
}

// MARK: - OWMWeather -> HelenaWeatherData
extension HelenaWeatherBuilder {
    
    /// - WARNING: Completion is called multiple times. Only call it idempotently.
    func convertToHelenaWeather(from weatherData: OWMWeatherData, at date: Date? = nil, completion: @escaping (HelenaWeatherData) -> ()) {
        
        // Date
        let currentDate = Date()
        let date = date ?? Date()
        
        // Temp - Data -> Find nearest forecast
        //   Sort
        var weatherData = weatherData
        weatherData.sortHourlyArray()
        weatherData.sortDailyArray()
        
        //   Init with current temp (without decimal)
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = .decimal
        
        var tempData = formatter.string(from: weatherData.current.temp.rounded() as NSNumber) ?? "n/a"
        
        // Find the nearest forecast in case the date is not right now
        if currentDate != date {
            //   In hourly forecast?
            if currentDate.addingTimeInterval(config.API_HOUR_FORECAST) >= date {
                for forecast in weatherData.hourly {
                    if forecast.dt > Int(date.timeIntervalSince1970) {
                        tempData = formatter.string(from: forecast.temp.rounded() as NSNumber) ?? "n/a"
                        break
                    }
                }
            }
            
            //   In daily forecast?
            else if currentDate.addingTimeInterval(config.API_DAY_FORECAST) >= date {
                for forecast in weatherData.daily {
                    if forecast.dt > Int(date.timeIntervalSince1970) {
                        
                        let hour = Calendar.current.component(.hour, from: date)
                        switch hour {
                            case 6..<12: tempData = formatter.string(from: forecast.temp.morn.rounded() as NSNumber) ?? "n/a"
                            case 12..<17: tempData = formatter.string(from: forecast.temp.day.rounded() as NSNumber) ?? "n/a"
                            case 17..<22: tempData = formatter.string(from: forecast.temp.eve.rounded() as NSNumber) ?? "n/a"
                            default: tempData = formatter.string(from: forecast.temp.night.rounded() as NSNumber) ?? "n/a"
                        }
                        break
                        
                    }
                }
            }
        }
        
        
        // Weather Type
        let weatherType = HelenaWeatherIcon.init(rawValue: weatherData.current.weather.first?.icon ?? "") ?? .loading
        
        // UWeather
        let weather = HelenaWeatherData(city: "---", degree: tempData, weather: weatherType)
        completion(weather)
        
        // City
        let coordinate = CLLocationCoordinate2D(latitude: weatherData.lat, longitude: weatherData.lon)
        HelenaLocationHandler.getPlacemark(by: coordinate) { placemark in
            if let placemark = placemark {
                let city = HelenaLocationHandler.parseCity(of: placemark)
                let weather = HelenaWeatherData(city: city, degree: tempData, weather: weatherType)
                completion(weather)
            }
        }
        
    }
    
}
