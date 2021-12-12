//
//  Constants.swift
//  Weather
//
//  Created by Dimitri CADARS on 12/12/2021.
//

import Foundation

struct Constants {
    
    struct Urls {
        
        static func urlForWeatherByCity(city: String) -> URL {
            
            // get the default settings for temperature
            let userDefaults = UserDefaults.standard
            let unit = (userDefaults.value(forKey: "unit") as? String) ?? "imperial"
            
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=dab810ea14c5cbdd84666837f1ba850a&units=\(unit)")!
        }
        
    }
    
}

