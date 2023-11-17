//
//  ListView.swift
//  weather-forecast-test
//
//  Created by Darvin Segura diaz on 17/11/23.
//

import SwiftUI

struct ListView: View {
    var forecastList: [ForecastList]
    
    func groupByDay(_ items: [ForecastList]) -> [(String, [ForecastList])] {
           let grouped = Dictionary(grouping: items, by: {
               Date().fromUnix(value: Double($0.dt)).formatted(date: .numeric, time: .omitted)
           })
        return grouped.sorted(by: { $0.key < $1.key })
       }
    
    var body: some View {
        List {
            ForEach(groupByDay(forecastList), id: \.0) { pair in
                ListTile(dt: pair.1[0].dt, min: pair.1[0].main?.tempMin ?? 0, max: pair.1[0].main?.tempMax ?? 0, condition: pair.1[0].weather[0]?.main ?? "")
                    .frame( maxWidth: .infinity)
                    .padding(.vertical, 2.0)
            }.frame( maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
                .listStyle(PlainListStyle())
                        .background (Color (hue: 0.656, saturation: 0.787,
                                            brightness: 0.354))
        }.frame(maxWidth: .infinity)
//            .background (Color (hue: 0.656, saturation: 0.787,
//                                brightness: 0.354))
            .edgesIgnoringSafeArea(.all)
            
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(forecastList: previewForecast.list)
    }
}
