//
//  WeatherResponse.swift
//  Weather
//
//  Created by Dimitri CADARS on 12/12/2021.
//

import Foundation

struct WeatherResponse: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let description: String
    let icon: String
    let main: String
}

