//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Dimitri CADARS on 12/12/2021.
//

import Foundation

class WeatherViewModel {
    
    let weather: WeatherResponse
    var temperature: Double
    var icon: String
    
    init(weather: WeatherResponse) {
        self.weather = weather
        temperature = weather.main.temp
        icon = weather.weather[0].icon
    }
    
    var city: String {
        return weather.name
    }
    
}

