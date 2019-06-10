//
//  MapFunctionsViewController.swift
//  FixD
//
//  Created by Alejandro Meza on 6/10/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit
import MapKit

class MapFunctionsViewController: UIViewController {
    
    @IBOutlet weak var myMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Sets up the Current Location
        setUpCurrentLocation()
    }
    
    private func setUpCurrentLocation() {
        let locationManager = CLLocationManager()
        locationManager.delegate = self as? CLLocationManagerDelegate
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // Check for Location Services
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
        }
        
        //Zoom to user location
        if let userLocation = locationManager.location?.coordinate {
            let viewRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: 2000, longitudinalMeters: 2000)
            myMapView.setRegion(viewRegion, animated: false)
        }
    }
}

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



