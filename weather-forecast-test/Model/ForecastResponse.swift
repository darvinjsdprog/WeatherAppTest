//
//  ForecastResponse.swift
//  weather-forecast-test
//
//  Created by Darvin Segura diaz on 17/11/23.
//

import Foundation


struct ForecastResponse: Decodable {
    let cod: String?
    let message, cnt: Int?
    let list: [ForecastList]
    let city: ForecastCity?
}

struct ForecastCity: Decodable {
    let id: Int?
    let name: String?
    let coord: ForecastCoord?
    let country: String?
    let population, timezone, sunrise, sunset: Int?
}

struct ForecastCoord: Decodable {
    let lat, lon: Double?
}

struct ForecastList: Decodable {
    let dt: Int
    let main: ForecastMain?
    let weather: [ForecastWeather?]
    let clouds: ForecastClouds?
    let wind: ForecastWind?
    let visibility: Int?
    let pop: Double?
    let rain: ForecastRain?
    let sys: ForecastSys?
    let dtTxt: String
    
    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, rain, sys
        case dtTxt = "dt_txt"
    }
    
}

struct ForecastClouds: Decodable {
    let all: Int?
}

struct ForecastMain: Decodable {
    let temp, feelsLike, tempMin, tempMax: Double?
    let pressure, seaLevel, grndLevel, humidity: Int?
    let tempKf: Double?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

struct ForecastRain: Decodable {
    let the3H: Double?

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}

struct ForecastSys: Decodable {
    let pod: String?
}

struct ForecastWeather: Decodable {
    let id: Int?
    let main, description, icon: String?
}

struct ForecastWind: Decodable {
    let speed: Double?
    let deg: Int?
    let gust: Double?
}
