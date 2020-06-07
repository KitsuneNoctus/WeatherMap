//
//  ViewController.swift
//  WeatherMap
//
//  Created by Henry Calderon on 6/4/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    var locationManager = CLLocationManager()
    var networkManager = NetworkManager()
    
    //Mood Input
    @IBOutlet weak var moodInput: UITextField!
    //Weather
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    //MAIN
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    //Wind & Clouds
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var windAngleLabel: UILabel!
    @IBOutlet weak var cloudsLabel: UILabel!
    
    //MARK: Mood
    @IBOutlet weak var moodLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getWeather()
        self.moodInput.delegate = self
        //https://www.tutorialspoint.com/how-to-get-the-current-location-latitude-and-longitude-in-ios
//        locationManager.requestWhenInUseAuthorization()
//        var currentLoc: CLLocation!
//        if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
//        CLLocationManager.authorizationStatus() == .authorizedAlways) {
//           currentLoc = locationManager.location
//            print(currentLoc.coordinate.latitude)
//           print(currentLoc.coordinate.longitude)
//        }
    }
    
    func getWeather(){
        //lat=37.7749&lon=-122.4194
        networkManager.getWeather(lat: "37.7749", lon: "-122.4194"){ result in
            switch result{
            case let .success(weather):
                guard let weatherr = weather.name else {
                    print("No Weather Data")
                    return
                }
                self.locationLabel.text = "Weather: \(weatherr)"
                guard let desc = weather.weather[0].main else{
                    print("")
                    return
                }
                self.weatherLabel.text = "Weather: \(desc)"
                guard let desc2 = weather.weather[0].description else{
                    print("")
                    return
                }
                self.weatherDescriptionLabel.text = "Description: \(desc2)"
                
                guard let temp = weather.main?.temp else{
                    print("")
                    return
                }
                self.tempLabel.text = "Temp: \(temp)"
                
                guard let tempfl = weather.main?.feels_like else{
                    print("")
                    return
                }
                self.feelsLikeLabel.text = "Feels Like: \(tempfl)"
                
                guard let tempMin = weather.main?.temp_min else{
                    print("")
                    return
                }
                self.tempMinLabel.text = "Temp Min: \(tempMin)"
                
                guard let tempMax = weather.main?.temp_max else{
                    print("")
                    return
                }
                self.tempMaxLabel.text = "Temp Max: \(tempMax)"
                
                guard let pressure = weather.main?.pressure else{
                    print("")
                    return
                }
                self.pressureLabel.text = "Pressure: \(pressure)"
                
                guard let humid = weather.main?.humidity else{
                    print("")
                    return
                }
                self.humidityLabel.text = "Humidity: \(humid)"
                
                guard let winds = weather.wind?.speed else{
                    print("")
                    return
                }
                self.windSpeedLabel.text = "Wind Speed: \(winds)"
                
                guard let windd = weather.wind?.deg else{
                    print("")
                    return
                }
                self.windAngleLabel.text = "Wind Angle: \(windd)"
                
                guard let clouds = weather.clouds else{
                    print("")
                    return
                }
                self.cloudsLabel.text = "Clouds: \(clouds)"
                
            case let .failure(error):
                print(error)
            }
        }
    }
    
    @IBAction func moodEntered(_ sender: UITextField) {
        self.view.endEditing(true)
        self.moodLabel.text = "Mood: \(self.moodInput.text!)"
    }

}

extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

