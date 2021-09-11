//
//  HelenaWeatherIcon.swift
//  HelenaWeather
//
//  Created by Adrian Haubrich on 15.08.21.
//

import Foundation

public enum HelenaWeatherIcon: String {
    // Loading
    case loading =      "loading"
    
    // Day Icons
    case clearSkyD =        "01d"
    case fewCloudsD =       "02d"
    case scatteredCloudsD = "03d"
    case brokenCloudsD =     "04d"
    case showerRainD =      "09d"
    case rainD =            "10d"
    case thunderstormD =    "11d"
    case snowD =            "13d"
    case mistD =            "50d"
    
    // Night Icons
    case clearSkyN =        "01n"
    case fewCloudsN =       "02n"
    case scatteredCloudsN = "03n"
    case brokenCloudsN =    "04n"
    case showerRainN =      "09n"
    case rainN =            "10n"
    case thunderstormN =    "11n"
    case snowN =            "13n"
    case mistN =            "50n"
    
    // Other
    case hail =         "no hail"
    case moon =         "no moon"
    case drizzle =      "no drizzle"
}
