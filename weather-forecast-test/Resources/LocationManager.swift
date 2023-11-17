//
//  LocationManager.swift
//  weather-forecast-test
//
//  Created by Darvin Segura diaz on 17/11/23.
//

import Foundation
import CoreLocation


class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()

    @Published var coordinate: CLLocationCoordinate2D?
    @Published var isLoading = false
    @Published var location: CLLocation?
    
    override init() {
        super.init()
        manager.delegate = self
    }

    func requestLocation() {
        isLoading = true
        manager.requestLocation()
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first
        coordinate = location?.coordinate
        isLoading = false
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location", error)
        isLoading = false
    }
}


