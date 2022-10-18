//
//  FetchDailyWeatherUseCase.swift
//  
//
//  Created by Sumit Batra on 16/08/2022.
//

import Foundation
import Combine

public protocol FetchDailyWeatherUseCaseInterface {
    func execute() -> AnyPublisher<WeatherEntity, Error>
}

public final class FetchDailyWeatherUseCase: FetchDailyWeatherUseCaseInterface {

    private let repository: WeatherRepositoryInterface

    public init(repository: WeatherRepositoryInterface) {
        self.repository = repository
    }

    public func execute() -> AnyPublisher<WeatherEntity, Error> {
        return repository.fetchDailyWeather()
    }
}
