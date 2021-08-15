//
//  OWMDaily.swift
//  HelenaWeather
//
//  Created by Adrian Haubrich on 15.08.21.
//

import Foundation

struct OWMDaily: Codable {
    let dt: Int
    let sunrise: Int
    let sunset: Int
    let temp: OWMTemperature
    let feels_like: OWMFeels_Like
    let pressure: Int
    let humidity: Int
    let dew_point: Double
    let wind_speed: Double
    let wind_deg: Int
    let weather: [OWMWeather]
    let clouds: Int
    let uvi: Double
}
