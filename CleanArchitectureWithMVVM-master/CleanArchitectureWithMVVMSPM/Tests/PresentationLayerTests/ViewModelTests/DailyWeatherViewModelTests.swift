//
//  DailyWeatherViewModelTests.swift
//  
//
//  Created by Sumit Batra on 16/08/2022.
//

import XCTest
import Combine
@testable import PresentationLayer
@testable import DomainLayer

class MockFetchDailyWeatherUseCase: FetchDailyWeatherUseCaseInterface {
    
    func execute() -> AnyPublisher<WeatherEntity, Error> {
        
        let dailyWeather =
        WeatherEntity(id: "weather_mon", icon: "01d", location: "l", temperature: 10.1, weatherForecast: "sunny", date: Date())
        
        return Just(dailyWeather)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

final class DailyWeatherViewModelTests: XCTestCase {
    
    var viewModel: DailyWeatherViewModel?
    private var bag: Set<AnyCancellable> = Set<AnyCancellable>()
    
    //MARK: - Setup
    
    override func setUpWithError() throws {
        
        viewModel = DailyWeatherViewModel(useCase: MockFetchDailyWeatherUseCase())
        viewModel?.icon = "01d"
        viewModel?.location = "l"
        viewModel?.temperature = 10.1
        viewModel?.weatherForecast = "sunny"
        viewModel?.date = Date()
    
        guard let _ = viewModel else {
            XCTFail()
            return
        }
    }
    
    //MARK: - Tests
    
    func testExecute() {
        
        let expectation = XCTestExpectation(description: self.description)
        
        viewModel!.$icon.sink { result in
            XCTAssertNotNil(result)
            expectation.fulfill()
        }
        .store(in: &bag)
        
        viewModel!.executeFetch()
        
        wait(for: [expectation], timeout: 1)
    }

    static var allTests = [
        ("testExecute", testExecute),
    ]
}
