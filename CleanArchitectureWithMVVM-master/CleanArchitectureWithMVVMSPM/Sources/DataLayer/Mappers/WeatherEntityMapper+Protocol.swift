//
//  File.swift
//  
//
//  Created by Sumit Batra on 10/10/22.
//

import Foundation
import DomainLayer

public protocol WeatherEntityMapperInterface{
    func dataToWeatherEntity(dto:WeatherDTO) -> WeatherEntity
}
