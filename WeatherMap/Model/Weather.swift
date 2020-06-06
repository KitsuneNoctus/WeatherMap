//
//  Weather.swift
//  WeatherMap
//
//  Created by Henry Calderon on 6/6/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import Foundation
//MARK: Main Struct
struct Weather{
    var name: String?
    var weather: theWeather
    var main: Main
    var wind: Wind
    var clouds: Clouds
}

//MARK: Sub Structs
//weather
struct theWeather{
    var main: String?
    var description: String?
}

struct Main{
    var temp: Double?
    var feels_like: Double?
    var temp_min: Double?
    var temp_max: Double?
    var pressure: Double?
    var humidity: Double?
}

struct Wind{
    var speed: Int?
    var deg: Int?
}

struct Clouds {
    var all: Int?
}
