//
//  File.swift
//  
//
//  Created by Sumit Batra on 10/10/22.
//

import Foundation
import DomainLayer

public final class WeatherEntityMapper:WeatherEntityMapperInterface{
    
    public init(){
        
    }
    
    public func dataToWeatherEntity(dto:WeatherDTO) -> WeatherEntity {
        return WeatherEntity(id: UUID().uuidString, icon: dto.weather.first?.icon ?? "", location: dto.name, temperature: Float(dto.main.temp), weatherForecast: dto.weather.first?.description ?? "", date: Date(timeIntervalSince1970: dto.dt))
    }
}

