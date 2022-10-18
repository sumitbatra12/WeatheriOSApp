//
//  WeatherEntityTests.swift
//  
//
//  Created by Sumit Batra on 16/08/2022.
//

import XCTest
@testable import DomainLayer

final class WeatherEntityTests: XCTestCase {
    
    //MARK: - Setup
    
    override func setUpWithError() throws {
    }
    
    //MARK: - Tests
    
    func testExecute() {
        
        let weatherEntity = WeatherEntity(id: "weather_1", icon: "sunny", location: "seongnam", temperature: 27.5, weatherForecast: "sunny", date: Date())
        
        XCTAssertNotNil(weatherEntity)
        XCTAssertEqual(weatherEntity.id, "weather_1")
    }

    static var allTests = [
        ("testExecute", testExecute),
    ]
}
