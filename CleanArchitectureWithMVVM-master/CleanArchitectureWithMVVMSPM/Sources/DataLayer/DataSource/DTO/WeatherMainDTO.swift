//
//  File.swift
//  
//
//  Created by Sumit Batra on 10/10/22.
//

import Foundation

public struct WeatherMainDTO: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure:Int
    let humidity:Int
}
