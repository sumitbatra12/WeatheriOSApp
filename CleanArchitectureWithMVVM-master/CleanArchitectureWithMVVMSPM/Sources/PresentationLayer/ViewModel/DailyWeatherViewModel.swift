//
//  DailyWeatherViewModel.swift
//  
//
//  Created by Sumit Batra on 16/08/2022.
//

import Foundation
import Combine
import DomainLayer

public protocol DailyWeatherViewModelInput {
    func executeFetch()
}

public protocol DailyWeatherViewModelOutput {
     var icon: String? { get }
     var location: String? { get }
     var temperature: Float? { get }
     var date: Date? { get }
    var weatherForecast:String? { get }
}

public final class DailyWeatherViewModel: ObservableObject, DailyWeatherViewModelInput, DailyWeatherViewModelOutput {
    
    private let useCase: FetchDailyWeatherUseCaseInterface
    private var bag: Set<AnyCancellable> = Set<AnyCancellable>()
    
    @Published public var icon: String?
    @Published public var location: String?
    @Published public var temperature: Float?
    @Published public var date: Date?
    @Published public var weatherForecast:String?
    
    public init(useCase: FetchDailyWeatherUseCaseInterface) {
        self.useCase = useCase
    }
    
    public func executeFetch() {
        
        useCase.execute()
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(_):
                    break
                }
            } receiveValue: { weatherList in
                DispatchQueue.main.async {
                    self.icon = weatherList.icon
                    self.location = weatherList.location
                    self.temperature = weatherList.temperature
                    self.date = weatherList.date
                    self.weatherForecast = weatherList.weatherForecast
                }                
            }
            .store(in: &bag)
    }
}
