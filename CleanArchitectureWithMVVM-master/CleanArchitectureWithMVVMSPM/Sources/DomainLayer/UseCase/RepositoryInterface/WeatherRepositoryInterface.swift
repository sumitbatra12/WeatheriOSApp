//
//  WeatherRepositoryInterface.swift
//  
//
//  Created by Sumit Batra on 16/08/2022.
//

import Foundation
import Combine

public protocol WeatherRepositoryInterface {
    func fetchDailyWeather() -> AnyPublisher<WeatherEntity, Error>
}
