//
//  DoubleExtension.swift
//  weather-forecast-test
//
//  Created by Darvin Segura diaz on 17/11/23.
//

import Foundation

// Rounded to 0 decimals
extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}
