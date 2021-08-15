//
//  OWMCurrent.swift
//  HelenaWeather
//
//  Created by Adrian Haubrich on 15.08.21.
//

import Foundation

struct OWMCurrent: Codable {
    let dt: Int
    let sunrise: Int
    let sunset: Int
    let temp: Double
    let feels_like: Double
    let pressure: Int
    let humidity: Int
    let dew_point: Double
    let uvi: Double
    let clouds: Int
    let wind_speed: Double
    let wind_deg: Int
    let weather: [OWMWeather]
}
