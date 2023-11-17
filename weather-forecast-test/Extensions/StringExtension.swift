//
//  StringExtension.swift
//  weather-forecast-test
//
//  Created by Darvin Segura diaz on 17/11/23.
//

import Foundation

extension String {
    func toIconName() -> String{
        if(self.lowercased().contains("clear")){
         return "sun.max.fill"
        }else if(self.lowercased().contains("cloud")){
            return "cloud.fill"
        }else if(self.lowercased().contains("rain")){
            return "cloud.drizzle.fill"
        }
        return "cloud"
    }
}
