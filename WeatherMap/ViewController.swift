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
    

    override func viewDidLoad() {
        super.viewDidLoad()
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


}

