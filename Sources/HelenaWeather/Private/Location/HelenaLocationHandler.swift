//
//  HelenaLocationHandler.swift
//  HelenaWeather
//
//  Created by Adrian Haubrich on 15.08.21.
//

import Foundation
import CoreLocation
import MapKit

struct HelenaLocationHandler {
    
    
    
}


// MARK: - Placemark
extension HelenaLocationHandler {
    
    
    static func getPlacemark(by coordinate: CLLocationCoordinate2D, completion: @escaping (CLPlacemark?) -> ()) {
        
        // Create CLLocation
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        
        // Geocode
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            if placemarks?.count ?? 0 > 0 {
                completion(placemarks?.first)
            } else {
                completion(nil)
            }
        }
        
    }
    
}


// MARK: - Parsing
extension HelenaLocationHandler {
    
    static func parseCity(of placemark: CLPlacemark) -> String {
        return placemark.locality ?? placemark.thoroughfare ?? "(\(placemark.location?.coordinate.latitude ?? 0)|\(placemark.location?.coordinate.longitude ?? 0))"
    }
    
}
