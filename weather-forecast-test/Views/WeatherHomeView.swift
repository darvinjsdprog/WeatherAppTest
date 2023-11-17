//
//  WeatherHomeView.swift
//  weather-forecast-test
//
//  Created by Darvin Segura diaz on 17/11/23.
//

import SwiftUI

struct WeatherHomeView: View {
    @StateObject var locationManager = LocationManager()
    var apiService = ApiManager()
    @State var weather: WeatherResponse
    @State var forecast: ForecastResponse
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                HStack {
                    VStack(spacing: 20) {
                        Image(systemName: (weather.weather[0]?.main ?? "").toIconName())
                            .font(.system(size: 35))
                        
                        Text("\(weather.weather[0]?.main ?? "")")
                    }.padding()
                        .frame(width: .infinity, alignment: .leading)
                    
                    
                    Text("\((weather.main?.feelsLike ?? 0).roundDouble())°")
                        .font(.system(size: 100))
                        .fontWeight(.bold)
                        .padding()
                }
                VStack(alignment: .center, spacing: 5) {
                    Text (weather.name ?? "")
                        .bold().font(.title)
                    Text ("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment:
                        .center)
                Spacer()
                HStack {
                    Text("Showing 5 days weather forecast")
                    Spacer()
                }
                .frame(width: .infinity, alignment: .leading)
                .padding()
                ListView(forecastList: forecast.list)
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: .infinity)
                    .listStyle(PlainListStyle())
                    
                    
            }
            .frame (maxWidth: .infinity, alignment:
                    .leading)
        } .edgesIgnoringSafeArea(.bottom)
            .background (Color (hue: 0.656, saturation: 0.787,
                                brightness: 0.354))
            .preferredColorScheme (.dark)
    }
}

#if DEBUG
struct WeatherHomeView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherHomeView(weather: previewWeather, forecast: previewForecast)
    }
}
#endif
