//
//  DateExtension.swift
//  weather-forecast-test
//
//  Created by Darvin Segura diaz on 17/11/23.
//

import Foundation

// Get the Most frequent date format for the app
extension Date {
    func formattedDate() -> String {
        return self.formatted(.dateTime.weekday().month().day().hour().minute())
    }
    
    func fromUnix(value: Double) -> Date {
        return Date(timeIntervalSince1970: value)
    }
}
