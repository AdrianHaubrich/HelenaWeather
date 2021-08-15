//
//  HelenaWeather.swift
//  HelenaWeather
//
//  Created by Adrian Haubrich on 15.08.21.
//

import Foundation

struct OWMWeather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
