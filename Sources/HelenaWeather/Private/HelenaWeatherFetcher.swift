//
//  HelenaWeatherFetcher.swift
//  HelenaWeather
//
//  Created by Adrian Haubrich on 15.08.21.
//

import Foundation
import MapKit

struct HelenaWeatherFetcher {
    
    private let config: HelenaOWMConfig
    
    init(config: HelenaOWMConfig) {
        self.config = config
    }
    
}

// MARK: - Fetch
extension HelenaWeatherFetcher {
    
    func fetchWeather(coordinates: CLLocationCoordinate2D, completion: @escaping (Bool, OWMWeatherData?) -> ()) {
        fetchWeather(lat: "\(coordinates.latitude)", lon: "\(coordinates.longitude)") { (success, weatherData) in
            completion(success, weatherData)
        }
    }
    
    func fetchWeather(lat: String, lon: String, completion: @escaping (Bool, OWMWeatherData?) -> ()) {
        
        // Build Call
        if let call = OWMCallBuilder.buildCall(config: config,lat: lat, lon: lon) {
            
            // URL
            if let url = URL(string: call) {
                
                // Task
                let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                    
                    // Error Handling
                    if let error = error {
                        print("## Error fetching weather: \(error)")
                        completion(false, nil)
                        return
                    }
                    
                    // HTTP-Response
                    if let httpResponse = response as? HTTPURLResponse {
                        if !((200...299).contains(httpResponse.statusCode)) {
                            
                            // Handle errors
                            if httpResponse.statusCode == 429 {
                                print("## Error 429 - Limit exceeded")
                            } else {
                                print("## Error with the response, unexpected status code: \(String(describing: response))")
                            }
                            
                            completion(false, nil)
                            return
                        }
                    }
                    
                    // Data
                    if let data = data {
                        do {
                            let decoder = JSONDecoder()
                            decoder.dateDecodingStrategy = .secondsSince1970
                            let weatherData = try decoder.decode(OWMWeatherData.self, from: data)
                            completion(true, weatherData)
                            
                        } catch {
                            print("## Error serializing Json: ", error)
                            completion(false, nil)
                        }
                    }
                    
                    
                })
                task.resume()
                
            }
            
        }
    }
    
}
