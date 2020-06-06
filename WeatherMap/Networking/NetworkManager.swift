//
//  NetworkManager.swift
//  WeatherMap
//
//  Created by Henry Calderon on 6/6/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import Foundation

//"id": 1689969,
//"name": "San Francisco",
//"state": "",
//"country": "PH",
//"coord": {
//  "lon": 120.436798,
//  "lat": 15.6287

class NetworkManager{
    let urlSession = URLSession.shared
    var baseURL = "api.openweathermap.org/data/2.5/"
    var apiKey = secretKey
    
    func getWeather(){
        
    }
    
    //MARK: End Points
    enum EndPoints{
        case weather
        case weatherMap
        
        func getPath() -> String{
            switch self {
            case .weather:
                return "weather"
            case .weatherMap:
                return "--"
            }
        }
        
        func getHTTPMethod() -> String {
            return "GET"
        }
        
        func getHeaders(token: String) -> [String: String]{
            return [
                "Accept": "application/json",
                "Content-Type": "application/json",
                "Authorization": "X-Api-Key \(secretKey)",
                "Host": "newsapi.org"
            ]
        }
        
        func getParams(){
            
        }
        
        func paramsToString(){
            
        }
    }
    
    //MARK: Make Request
    private func makeRequest(){
        
    }
    
    //MARK: Result ENUM
    enum Result<T> {
     case success(T)
     case failure(Error)
    }
    
    //MARK: Endpoint Error ENUM
    enum EndPointError: Error {
      case couldNotParse
      case noData
    }
}
