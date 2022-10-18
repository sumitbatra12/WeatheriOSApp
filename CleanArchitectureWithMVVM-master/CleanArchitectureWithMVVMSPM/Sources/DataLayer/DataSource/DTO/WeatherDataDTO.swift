//
//  File.swift
//  
//
//  Created by Sumit Batra on 10/10/22.
//

import Foundation

public struct WeatherDataDTO: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
