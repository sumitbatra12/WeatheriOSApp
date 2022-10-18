//
//  WeatherRepository.swift
//  
//
//  Created by Sumit Batra on 16/08/2022.
//

import Foundation
import Combine
import DomainLayer

public final class WeatherRepository: WeatherRepositoryInterface {
    
    private let dataSource: WeatherDataSourceInterface
    private let mapper:WeatherEntityMapperInterface
    
    public init(dataSource: WeatherDataSourceInterface, mapper:WeatherEntityMapperInterface) {
        self.dataSource = dataSource
        self.mapper = mapper
    }
    
    public func fetchDailyWeather() -> AnyPublisher<WeatherEntity, Error> {
        return dataSource.fetchDailyWeather()
            .map({ weather in
                return self.mapper.dataToWeatherEntity(dto: weather)
            })
            .eraseToAnyPublisher()
    }
    
}

