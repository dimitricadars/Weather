//
//  WeatherCell.swift
//  Weather
//
//  Created by Dimitri CADARS on 12/12/2021.
//

import Foundation
import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    
    
    func configure(_ vm: WeatherViewModel) {
        self.cityNameLabel.text = vm.city
        self.temperatureLabel.text = "\(vm.temperature.formatAsDegree())"
        
        let icon = vm.icon
        URLSession.shared.dataTask(with: URL(string: "http://openweathermap.org/img/w/\(icon).png")!) { iconData, _ , _ in
            if let data = iconData {
                DispatchQueue.main.async {
                    self.iconImage.image = UIImage(data: data)
                }
            }
        }.resume()
    }
}
