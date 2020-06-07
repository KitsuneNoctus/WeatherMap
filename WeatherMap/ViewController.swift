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
                self.locationLabel.text = weather.name
//                self.weatherLabel.text = weather.main
//                self.weatherDescriptionLabel.text = weather.weather!.description!
//                self.tempLabel.text = "Temp: \(String(describing: weather.main.temp))"
//                self.feelsLikeLabel.text = "Feels Like: \(String(describing: weather.main.feels_like))"
//                self.tempMinLabel.text = "Temp Min: \(String(describing: weather.main.temp_min))"
//                self.tempMaxLabel.text = "Temp Max: \(String(describing: weather.main.temp_min))"
//                self.pressureLabel.text = "Pressure: \(String(describing: weather.main.pressure))"
//                self.humidityLabel.text = "Humidity: \(String(describing: weather.main.humidity))"
//                self.windSpeedLabel.text = "Wind Speed: \(String(describing: weather.wind.speed))"
//                self.windAngleLabel.text = "Wind Angle: \(String(describing: weather.wind.deg))"
//                self.cloudsLabel.text = "Clouds: \(String(describing: weather.clouds.all))"
                
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

