//
//  DailyWeatherView.swift
//  
//
//  Created by Sumit Batra on 16/08/2022.
//

import SwiftUI

public struct DailyWeatherView: View {

    @ObservedObject public var viewModel: DailyWeatherViewModel
    
    public init(viewModel: DailyWeatherViewModel) {
        self.viewModel = viewModel
    }
    
    
    public var body: some View {
        NavigationView {
            if let icon = viewModel.icon, let location = viewModel.location, let temperature = viewModel.temperature, let date = viewModel.date{
                if #available(macOS 11.0, *) {
                    NavigationLink(destination: DailyWeatherDetailsView(viewModel: viewModel)) {
                        WeatherView(icon: icon, location: location, temperature: (temperature - 32) * 5/9, date: date)
                            .padding(EdgeInsets(top: 15.0, leading: 15.0, bottom: 300.0, trailing: 15.0))
                    }
                    .navigationTitle("Daily Weather")
                } else {
                    // Fallback on earlier versions
                }
            }
        }
        .onAppear {
            self.viewModel.executeFetch()
        }
    }
}




private struct WeatherView: View {
    
    let icon: String
    let location: String
    let temperature: Float
    let date: Date
    
    private var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy. MM. dd."
        return formatter
    }()
    
    init(icon: String, location: String, temperature: Float, date: Date) {
        self.icon = icon
        self.location = location
        self.temperature = temperature
        self.date = date
    }
    
    var body: some View {
        HStack(spacing: 20) {
            
            Image(icon, bundle: Bundle.module)
            
            VStack(alignment: .leading) {
                Text(formatter.string(from: date))
                    .font(.body)
                    .foregroundColor(.gray)
                Text(location)
                    .font(.title)
                
                Spacer()
                
                Text(String(format: " %.1f °C", temperature))
                    .font(.title)
                    .fontWeight(.bold)
            }
        }
        .padding(50)
        .background(Color.orange.opacity(0.2))
        .cornerRadius(25)
    }
}
