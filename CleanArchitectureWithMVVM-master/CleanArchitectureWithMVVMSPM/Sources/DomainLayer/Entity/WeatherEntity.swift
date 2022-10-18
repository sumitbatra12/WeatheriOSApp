//
//  WeatherEntity.swift
//  
//
//  Created by Sumit Batra on 16/08/2022.
//

import Foundation

public struct WeatherEntity: Identifiable {
    public let id: String
    public let icon: String
    public let location: String
    public let temperature: Float
    public let weatherForecast: String
    public let date: Date
    
    public init(id: String, icon: String, location: String, temperature: Float, weatherForecast: String, date: Date)
    {
        self.id = id
        self.icon = icon
        self.location = location
        self.temperature = temperature
        self.weatherForecast = weatherForecast
        self.date = date
    }
}
