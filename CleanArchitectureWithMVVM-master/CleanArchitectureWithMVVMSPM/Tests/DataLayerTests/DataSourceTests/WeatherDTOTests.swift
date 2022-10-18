//
//  WeatherDTOTests.swift
//  
//
//  Created by Sumit Batra on 16/08/2022.
//

import XCTest
import Combine
@testable import DataLayer

final class WeatherDTOTestsTests: XCTestCase {
    
    let weatherData = [
        "coord": [
            "lon": -0.1257,
            "lat": 51.5085
        ],
        "name": "seongnam",
        "base": "stations",
        "visibility": 10000,
        "timezone": 3600,
        "id": 2643743,
        "dt": 1560350645,
        "cod": 200,
        "sys": [
            "type": 2,
            "id": 2075535,
            "country": "GB",
            "sunrise": 1661144223,
            "sunset": 1661195413
        ],
        "wind": [
            "speed": 1.54,
            "deg": 220
        ],
        "clouds": [
            "all": 77
        ],
        "weather": [[
            "id": 800,
            "main": "Clear",
            "description": "clear sky",
            "icon": "01d"
        ]],
        "main": [
            "temp": 282.55,
            "feels_like": 281.86,
            "temp_min": 280.37,
            "temp_max": 284.26,
            "pressure": 1023,
            "humidity": 100
        ]
    ] as [String : Any]
    
    //MARK: - Setup
    
    override func setUpWithError() throws {
    }
    
    //MARK: - Tests
    
    func testExecute() {
        
        let _ = Just(weatherData)
            .tryMap { try JSONSerialization.data(withJSONObject: $0, options: []) }
            .decode(type: WeatherDTO.self, decoder: JSONDecoder())
            .sink { result in
                switch result {
                case .finished:
                    break
                case .failure(let error):
                    XCTFail(error.localizedDescription)
                }
            } receiveValue: { weatherDTO in
                XCTAssertNotNil(weatherDTO)
                //XCTAssertGreaterThan(weatherDTO.weather.icon.count, 0)
            }
    }

    static var allTests = [
        ("testExecute", testExecute),
    ]
}
