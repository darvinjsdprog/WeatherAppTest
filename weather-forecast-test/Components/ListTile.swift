//
//  ListTile.swift
//  weather-forecast-test
//
//  Created by Darvin Segura diaz on 17/11/23.
//


import SwiftUI

struct ListTile: View {
    var dt: Int
    var min: Double
    var max: Double
    var condition: String
    
    func getWeekDay(date: Int) -> String {
        let day = Date().fromUnix(value: Double(date)).formatted(.dateTime.weekday())
        let today = Date().formatted(.dateTime.weekday())
        if(day == today){
            return "Today"
        }
        
        return Date().fromUnix(value: Double(date)).formatted(.dateTime.weekday());
    }
    
    var body: some View {

        HStack(alignment: .center, spacing: 30) {
            Text(getWeekDay(date: dt))
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(.white )
                .frame(width: 70)
                
            Spacer()
            VStack(spacing: 8) {
                Image(systemName: condition.toIconName())
                    .font(.system(size: 20))
                    .foregroundColor(.white )
                
                Text(condition)
                    .foregroundColor(.white )
                    .font(.caption)
            }
            .frame(width: 50, alignment: .center)
                
            Spacer()
            Text("L: \(min.roundDouble())°")
                .foregroundColor(.white )
                .frame(width: 50)
            Text("H: \(max.roundDouble())°")
                .foregroundColor(.white )
                .frame(width: 50)
            
            
            
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color (hue: 0.656, saturation: 0.636,
                           brightness: 0.722, opacity: 0.869))
        .listRowInsets(EdgeInsets())
        .edgesIgnoringSafeArea(.all)
        .cornerRadius(20)
    }
}


struct ListTile_Previews: PreviewProvider {
    static var previews: some View {
        ListTile(dt: 1700244000, min: 7, max: 13, condition: "Clear")
    }
}
