//
//  AppDIInterface.swift
//  
//
//  Created by Sumit Batra on 16/08/2022.
//

import Foundation

public protocol AppDIInterface {
    func dailyWeatherDependencies() -> DailyWeatherViewModel
}
