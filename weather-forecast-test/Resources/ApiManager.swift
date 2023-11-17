//
//  ModelData.swift
//  weather-forecast-test
//
//  Created by Darvin Segura diaz on 17/11/23.
//

import Foundation
import CoreLocation

private var apiKey = "7c29a5c11ac555db85f8dc14a5fd8cda"
private var baseURL = "https://api.openweathermap.org/data/2.5"


class ApiManager {
    private func getRequestUrl(url: String, params: String) -> String{
        return "\(baseURL)/\(url)?appid=\(apiKey)\(params)&units=metric"
    }
    
    
    func getWeatherBaseOnLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> WeatherResponse {
        let url = "weather"
        let params = "&lat=\(latitude)&lon=\(longitude)"
        guard let url = URL(string: getRequestUrl(url: url, params: params)) else {
            fatalError("URL Not Found")
        }
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error Getting Data from OpenWeathermap")}
        
        do {
            let decodeData = try JSONDecoder().decode(WeatherResponse.self, from: data)
            
            return decodeData
        } catch {
            fatalError("Couldn't parse json as WeatherResponse:\n\(error)")
        }
    }
    
    
    func getFiveDaysForecastBaseOnLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ForecastResponse {
        let url = "forecast"
        let params = "&lat=\(latitude)&lon=\(longitude)"
        guard let url = URL(string: getRequestUrl(url: url, params: params)) else {
            fatalError("URL Not Found")
        }
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error Getting Data from OpenWeathermap")}
        
        
            do {
                let decodeData = try JSONDecoder().decode(ForecastResponse.self, from: data)
                
                return decodeData
            } catch {
                fatalError("Couldn't parse json as ForecastResponse:\n\(error)")
            }
    }
}


//var forecasts: [WeatherForecast] = load("weatherforecastData.json")
//
//func load<T: Decodable>(_ filename: String) -> T {
//    let data: Data
//
//
//    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
//    else {
//        fatalError("Couldn't find \(filename) in main bundle.")
//    }
//
//
//    do {
//        data = try Data(contentsOf: file)
//    } catch {
//        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
//    }
//
//
//    do {
//        let decoder = JSONDecoder()
//        return try decoder.decode(T.self, from: data)
//    } catch {
//        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
//    }
//}
