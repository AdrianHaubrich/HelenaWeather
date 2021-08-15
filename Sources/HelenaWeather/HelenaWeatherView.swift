//
//  HelenaWeatherView.swift
//  HelenaWeather
//
//  Created by Adrian Haubrich on 15.08.21.
//

import SwiftUI
import MapKit

public struct HelenaWeatherView: View {
    
    @State var weatherHandler: HelenaWeather
    @State var weatherData: HelenaWeatherData?
    
    public init(apiKey: String) {
        self.weatherHandler = HelenaWeather(apiKey: apiKey)
    }
    
    public var body: some View {
        VStack {
            Text("Hello, World!")
            Text("Weather in: \(weatherData?.city ?? "unknown") is \(weatherData?.degree ?? "unknown")")
            Image(systemName: weatherData?.weather.rawValue ?? "")
        }.onAppear {
            requestWeather()
        }
    }
}

extension HelenaWeatherView {
    
    func requestWeather() {
        let london = CLLocationCoordinate2D(latitude: 51.508530, longitude: -0.076132)
        self.weatherHandler.requestWeather(for: london) { (success, weatherData) in
            if (success) {
                print("Loaded weather: \(String(describing: weatherData))")
                self.weatherData = weatherData
            }
        }
    }
    
}


// MARK: - Preview
public struct HelenaWeatherView_Previews: PreviewProvider {
    public static var previews: some View {
        HelenaWeatherView(apiKey: "###API-KEY###")
    }
}
