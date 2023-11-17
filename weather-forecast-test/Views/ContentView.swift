//
//  ContentView.swift
//  weather-forecast-test
//
//  Created by Darvin Segura diaz on 17/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    var apiService = ApiManager()
    @State var weather: WeatherResponse?
    @State var forecast: ForecastResponse?
    
    
    var body: some View {
        VStack {
            if let coordinate = locationManager.coordinate {
                if let weather = weather, let  forecast = forecast {
                    WeatherHomeView(weather: weather, forecast: forecast)
                }else{
                    LoadingView()
                        .task {
                            do {
                                weather = try await apiService.getWeatherBaseOnLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)

                                forecast = try await apiService.getFiveDaysForecastBaseOnLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
                            }catch{
                                print("Uuugh i failed :(")
                            }
                        }
                }
            } else {
                if(locationManager.isLoading){
                   LoadingView()
                }else{
                    RequestLocationView()
                            .environmentObject(locationManager)
                }
            }
        }
        .background(Color(red: 0.085, green: 0.07, blue: 0.282))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
