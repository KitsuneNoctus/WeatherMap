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

//api.openweathermap.org/data/2.5/weather?lat=37.7749&lon=-122.4194&appid=fcbf9dba303aeb4bc01fefb2a49b8bb8

class NetworkManager{
    let urlSession = URLSession.shared
    var baseURL = "http://api.openweathermap.org/data/2.5/"
    var apiKey = secretKey
    
    func getWeather(lat: String, lon: String, completion: @escaping (Result<Weather>) -> Void){
        let weatherRequest = makeRequest(for: .weather(lat: lat, lon: lon))
//        print(weatherRequest)
        let task = urlSession.dataTask(with: weatherRequest){ data, response, error in
            if let error = error {
                return completion(Result.failure(error))
            }
            
            guard let data = data else {
                return completion(Result.failure(EndPointError.noData))
            }
            print(data)
            
            guard let result = try? JSONDecoder().decode(Weather.self, from: data) else{
                return completion(Result.failure(EndPointError.couldNotParse))
            }
            
            let weatherResult = result
            
//            let news = result.articles
            
            DispatchQueue.main.async {
                completion(Result.success(weatherResult))
            }
        }
        
        task.resume()
    }
    
    //MARK: End Points
    enum EndPoints{
        case weather(lat: String, lon: String)
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
                "Host": "api.openweathermap.org"
            ]
        }
        
        func getParams() -> [String:String]{
            switch self {
            case .weather(let lat, let lon):
                return[
                    "lat":lat,
                    "lon":lon,
                    "appid":secretKey
                ]
            case .weatherMap:
                return [
                    "i":"i"
                ]
            }
        }
        
        func paramsToString() -> String{
            let parameterArray = getParams().map { key, value in
                return "\(key)=\(value)"
            }
            
            return parameterArray.joined(separator: "&")
        }
    }
    
    //MARK: Make Request
    private func makeRequest(for endPoint: EndPoints) -> URLRequest{
        // grab the parameters from the endpoint and convert them into a string
        let stringParams = endPoint.paramsToString()
        // get the path of the endpoint
        let path = endPoint.getPath()
        // create the full url from the above variables
        let fullURL = URL(string: baseURL.appending("\(path)?\(stringParams)"))!
        
        // build the request
        var request = URLRequest(url: fullURL)
        request.httpMethod = endPoint.getHTTPMethod()
        request.allHTTPHeaderFields = endPoint.getHeaders(token: apiKey)

        return request
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
