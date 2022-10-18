//
//  WeatherDataSource.swift
//  
//
//  Created by Sumit Batra on 16/08/2022.
//

import Foundation
import Combine
import DomainLayer

enum APIError: LocalizedError {
  case invalidRequestError(String)
}

public protocol WeatherDataSourceInterface {
    func fetchDailyWeather() -> AnyPublisher<WeatherDTO, Error>
}

public final class WeatherLocalDataSource: WeatherDataSourceInterface {
    
    let dataSourceURL = "https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=128d515c1665ba6ccf5f92e9905cf2d7"
    
    public init() {}
    
    public func fetchDailyWeather() -> AnyPublisher<WeatherDTO, Error> {
        
        guard let url = URL(string: dataSourceURL) else {
            return Fail(error: APIError.invalidRequestError("URL invalid"))
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap() { element -> Data in
                    guard let httpResponse = element.response as? HTTPURLResponse,
                        httpResponse.statusCode == 200 else {
                            throw URLError(.badServerResponse)
                        }
                    return element.data
                    }
            .decode(type: WeatherDTO.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    
    
}
