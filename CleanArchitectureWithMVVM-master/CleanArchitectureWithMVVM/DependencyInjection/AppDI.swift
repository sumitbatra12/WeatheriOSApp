//
//  AppDI.swift
//  CleanArchitectureWithMVVM
//
//  Created by Sumit Batra on 16/08/2022.
//

import Foundation
import DataLayer
import DomainLayer
import PresentationLayer

enum PHASE {
    case DEV, ALPHA, PRODUCTION
}

public class AppEnvironment {
    let phase: PHASE = .DEV
}

public class AppDI: AppDIInterface {
    
    static let shared = AppDI(appEnvironment: AppEnvironment())
    
    private let appEnvironment: AppEnvironment
    
    private init(appEnvironment: AppEnvironment) {
        self.appEnvironment = appEnvironment
    }
    
    
    public func dailyWeatherDependencies() -> DailyWeatherViewModel {
        
        //MARK: Data Layer
        let dataSource: WeatherDataSourceInterface
        let mapper:WeatherEntityMapperInterface
        
        switch appEnvironment.phase {
        case .DEV:
            dataSource = WeatherLocalDataSource()
            mapper = WeatherEntityMapper()
        default:
            dataSource = WeatherLocalDataSource()
            mapper = WeatherEntityMapper()
        }
        
        let repository = WeatherRepository(dataSource: dataSource, mapper: mapper)
        
        //MARK: Domain Layer
        let useCase = FetchDailyWeatherUseCase(repository: repository)
        
        //MARK: Presentation
        let viewModel = DailyWeatherViewModel(useCase: useCase)
        
        return viewModel
    }
}

