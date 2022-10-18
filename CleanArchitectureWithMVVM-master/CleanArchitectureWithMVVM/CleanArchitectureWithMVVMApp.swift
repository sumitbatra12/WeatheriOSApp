//
//  CleanArchitectureWithMVVMApp.swift
//  CleanArchitectureWithMVVM
//
//  Created by Sumit Batra on 16/08/2022.
//

import SwiftUI
import PresentationLayer

@main
struct CleanArchitectureWithMVVMApp: App {
    var body: some Scene {
        WindowGroup {
            DailyWeatherView(viewModel: AppDI.shared.dailyWeatherDependencies())
        }
    }
}
