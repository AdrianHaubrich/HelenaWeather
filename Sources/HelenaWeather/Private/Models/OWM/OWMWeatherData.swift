//
//  OWMWeatherData.swift
//  HelenaWeather
//
//  Created by Adrian Haubrich on 15.08.21.
//

import Foundation

struct OWMWeatherData: Codable {
    let lat: Double
    let lon: Double
    let timezone: String
    let current: OWMCurrent
    var hourly: [OWMHourly]
    var daily: [OWMDaily]
    
    mutating func sortHourlyArray() {
        hourly.sort { (hour1: OWMHourly, hour2: OWMHourly) -> Bool in
            return hour1.dt < hour2.dt
        }
    }
    
    mutating func sortDailyArray() {
        daily.sort { (day1, day2) -> Bool in
            return day1.dt < day2.dt
        }
    }
}
