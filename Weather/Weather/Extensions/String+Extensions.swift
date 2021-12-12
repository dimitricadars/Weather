//
//  String+Extensions.swift
//  Weather
//
//  Created by Dimitri CADARS on 12/12/2021.
//

import Foundation

extension String {
    
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
    
}

