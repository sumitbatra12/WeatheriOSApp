//
//  WeatherDTO.swift
//  
//
//  Created by Sumit Batra on 16/08/2022.
//

import Foundation
import DomainLayer

public struct WeatherDTO: Codable {
    let coord : Coordinates
    let weather: [WeatherDataDTO]
    let main: WeatherMainDTO
    let name: String
    let dt: TimeInterval
    let base:String
    let visibility:Int
    let wind:WindDTO
    let clouds:CloudsDTO
    let sys:SysDTO
    let timezone:Int
    let id:Int
    let cod:Int
}











