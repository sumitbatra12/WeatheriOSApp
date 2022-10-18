//
//  WeatherRepositoryTests.swift
//  
//
//  Created by Sumit Batra on 16/08/2022.
//

import XCTest
import Combine
@testable import DataLayer
@testable import DomainLayer

final class WeatherRepositoryTests: XCTestCase {
    
    var reposotory: WeatherRepository?
    private var bag: Set<AnyCancellable> = Set<AnyCancellable>()
    
    //MARK: - Setup
    
    override func setUpWithError() throws {
        
        reposotory = WeatherRepository(dataSource: WeatherLocalDataSource(), mapper: WeatherEntityMapper())
        
        guard let _ = reposotory else {
            XCTFail()
            return
        }
    }
    
    //MARK: - Tests
    
    func testExecute() {
        
        reposotory!.fetchDailyWeather()
            .sink { receiveCompletion in
                switch receiveCompletion {
                case .failure(let error):
                    XCTFail(error.localizedDescription)
                case .finished:
                    break
                }
            } receiveValue: { weather in
                    XCTAssertTrue(type(of: weather) == WeatherEntity.self)
                    XCTAssertNotNil(weather.icon)
                
            }
            .store(in: &bag)
    }

    static var allTests = [
        ("testExecute", testExecute),
    ]
}
