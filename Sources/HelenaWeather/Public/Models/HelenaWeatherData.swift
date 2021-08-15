//
//  HelenaWeather.swift
//  HelenaWeather
//
//  Created by Adrian Haubrich on 15.08.21.
//

import Foundation

public struct HelenaWeatherData {
    
    // Data
    var city: String
    var degree: String
    var weather: HelenaWeatherIcon
    
    // MARK: Icon
    static var weatherIconNameDict: [HelenaWeatherIcon: String] = [
        .loading:           "circles.hexagonpath",
        .clearSkyD:         "sun.max.fill",
        .fewCloudsD:        "cloud.sun.fill",
        .scatteredCloudsD:  "cloud.fill",
        .brokenCloudsD:     "cloud.fill",
        .showerRainD:       "cloud.rain.fill",
        .rainD:             "cloud.sun.rain.fill",
        .thunderstormD:     "cloud.bolt.fill",
        .snowD:             "cloud.snow.fill",
        .mistD:             "cloud.fog.fill",
        .clearSkyN:         "moon.fill",
        .fewCloudsN:        "cloud.moon.fill",
        .scatteredCloudsN:  "cloud.fill",
        .brokenCloudsN:     "cloud.fill",
        .showerRainN:       "cloud.rain.fill",
        .rainN:             "cloud.moon.rain.fill",
        .thunderstormN:     "cloud.bolt.fill",
        .snowN:             "cloud.snow.fill",
        .mistN:             "cloud.fog.fill",
        .moon:              "moon.fill",
        .hail:              "cloud.hail.fill",
        .drizzle:           "cloud.drizzle.fill"
    ]
    
}
