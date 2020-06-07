//
//  Weather.swift
//  WeatherMap
//
//  Created by Henry Calderon on 6/6/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import Foundation
//MARK: Main Struct
struct Weather: Decodable{
    var name: String?
    var weather: theWeather?
    var main: Main?
    var wind: Wind?
    var clouds: Clouds?
}

//MARK: Sub Structs
//weather
struct theWeather: Decodable{
    var main: String?
    var description: String?
}

struct Main: Decodable{
    var temp: Double?
    var feels_like: Double?
    var temp_min: Double?
    var temp_max: Double?
    var pressure: Double?
    var humidity: Double?
}

struct Wind: Decodable{
    var speed: Double?
    var deg: Double?
}

struct Clouds: Decodable{
    var all: Double?
}
