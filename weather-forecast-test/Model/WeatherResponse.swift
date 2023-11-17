//
//  WeatherResponse.swift
//  weather-forecast-test
//
//  Created by Darvin Segura diaz on 17/11/23.
//

import Foundation

struct WeatherResponse: Decodable {
    let coord: WeatherCoord?
    let weather: [WeatherWeather?]
    let base: String?
    let main: WeatherMain?
    let visibility: Int?
    let wind: WeatherWind?
    let rain: WeatherRain?
    let clouds: WeatherClouds?
    let dt: Int?
    let sys: WeatherSys?
    let timezone, id: Int?
    let name: String?
    let cod: Int?
}

struct WeatherClouds: Decodable {
    let all: Int?
}

struct WeatherCoord: Decodable {
    let lon, lat: Double?
}

struct WeatherMain: Decodable {
    let temp, feelsLike, tempMin, tempMax: Double?
    let pressure, humidity, seaLevel, grndLevel: Int?
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

struct WeatherRain: Decodable {
    let the1H: Double?

    enum CodingKeys: String, CodingKey {
        case the1H = "1h"
    }
}

struct WeatherSys: Decodable {
    let type, id: Int?
    let country: String?
    let sunrise, sunset: Int?
}

struct WeatherWeather: Decodable {
    let id: Int?
    let main, description, icon: String?
}

struct WeatherWind: Decodable {
    let speed: Double?
    let deg: Int?
    let gust: Double?
}
