//
//  FetchDailyWeatherUseCaseTests.swift
//  
//
//  Created by Sumit Batra on 16/08/2022.
//

import XCTest
import Combine
@testable import DomainLayer

class MockWeatherRepository: WeatherRepositoryInterface {
    
    func fetchDailyWeather() -> AnyPublisher<WeatherEntity, Error> {
        
        let dailyWeather =
        WeatherEntity(id: "weather_mon", icon: "01d", location: "l", temperature: 10.1, weatherForecast: "sunny", date: Date())
        
        return Just(dailyWeather)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

final class FetchDailyWeatherUseCaseTests: XCTestCase {
    
    var useCase: FetchDailyWeatherUseCaseInterface?
    private var bag: Set<AnyCancellable> = Set<AnyCancellable>()
    
    //MARK: - Setup
    
    override func setUpWithError() throws {
        
        useCase = FetchDailyWeatherUseCase(repository: MockWeatherRepository())
        
        guard let _ = useCase else {
            XCTFail()
            return
        }
    }
    
    //MARK: - Tests
    
    func testExecute() {
        
        useCase!.execute()
            .sink { receiveCompletion in
                switch receiveCompletion {
                case .failure(let error):
                    XCTFail(error.localizedDescription)
                case .finished:
                    break
                }
            } receiveValue: { weather in
                    XCTAssertNotNil(weather.id)
            }
            .store(in: &bag)
    }

    static var allTests = [
        ("testExecute", testExecute),
    ]
}
