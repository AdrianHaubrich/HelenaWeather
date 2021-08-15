//
//  OWMCallBuilder.swift
//  HelenaWeather
//
//  Created by Adrian Haubrich on 15.08.21.
//

import Foundation

struct OWMCallBuilder {
    
    /// Uses the OneCall-API to build a request for a specific location.
    /// - Parameters:
    ///   - config: The OWM-Config.
    ///   - lat: Latitude of the location.
    ///   - lon: Longitude of the location.
    /// - Returns: The api-request as a String.
    static func buildCall(config: HelenaOWMConfig, lat: String, lon: String) -> String? {
        return "\(config.API_ENDPOINT)/data/2.5/"
            + "onecall?lat=\(lat)&lon=\(lon)"
            + "&exclude=\(config.API_EXCLUDE)"
            + "&appid=\(config.API_KEY)"
            + "&units=\(config.API_UNIT)"
        
    }
    
}
