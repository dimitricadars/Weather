//
//  Double+Extensions.swift
//  Weather
//
//  Created by Dimitri CADARS on 12/12/2021.
//

import Foundation

extension Double {
    
    func formatAsDegree() -> String {
        return String(format: "%.0f°",self)
    }
    
}
