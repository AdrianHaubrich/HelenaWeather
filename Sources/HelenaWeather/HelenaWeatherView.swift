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
    @State var weatherData = HelenaWeatherData()
    
    var showCredits: Bool
    
    public init(apiKey: String, showCredits: Bool? = nil) {
        self.weatherHandler = HelenaWeather(apiKey: apiKey)
        self.showCredits = showCredits ?? true
    }
    
    public var body: some View {
        VStack {
            HStack(alignment: .lastTextBaseline) {
                VStack(alignment: .leading) {
                    Text(weatherData.city)
                        .font(.headline)
                    Text("\(weatherData.degree)°")
                        .font(.title2)
                    Image(systemName: weatherData.getIcon())
                }
                Spacer()
                VStack {
                    if showCredits {
                        Text("Powered by OpenWeatherMap")
                            .font(.caption2)
                    }
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        .onAppear {
            requestWeather()
        }
    }
}

extension HelenaWeatherView {
    
    func requestWeather() {
        let london = CLLocationCoordinate2D(latitude: 51.508530, longitude: -0.076132)
        self.weatherHandler.requestWeather(for: london) { (success, weatherData) in
            if (success) {
                if let weatherData = weatherData {
                    self.weatherData = weatherData
                }
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
