//
//  File.swift
//  
//
//  Created by Sumit Batra on 22/08/22.
//

import Foundation

import SwiftUI

public struct DailyWeatherDetailsView: View {
    
    @ObservedObject public var viewModel: DailyWeatherViewModel
    
    public init(viewModel: DailyWeatherViewModel) {
        self.viewModel = viewModel
    }
    
    
    public var body: some View {
        if #available(macOS 11.0, *) {
            VStack {
                if let icon = viewModel.icon, let weatherForecast = viewModel.weatherForecast {
                    Image(icon, bundle: Bundle.module)
                    Text("\"\(weatherForecast.capitalized)\"")
                }
            }.navigationTitle("Weather Details")
                .padding(50.0)
                .background(Color.orange.opacity(0.2))
                .cornerRadius(25)
        } else {
            // Fallback on earlier versions
        }
        
    }
    
}
