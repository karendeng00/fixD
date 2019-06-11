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
        setUpIssuesOnMap()
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
            let viewRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: 10000000, longitudinalMeters: 10000000)
            myMapView.setRegion(viewRegion, animated: false)
        }
    }
    
    private func setUpIssuesOnMap() {
        let issues = IssueBuilder().getIssues()
        for issue in issues {
            let loc = issue.getLocation()
            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString(loc) { (placemarks, error) in
                if let placemark = placemarks?.first,
                    let lat = placemark.location?.coordinate.latitude,
                    let long = placemark.location?.coordinate.longitude {
                        let point = MKPointAnnotation()
                        point.title = issue.getTitle()
                    point.coordinate = CLLocationCoordinate2D(latitude:lat, longitude: long)
                        self.myMapView.addAnnotation(point)
                }
                
            }
        }
    
//        let point = MKPointAnnotation()
//        point.title = "Test"
//        point.coordinate = CLLocationCoordinate2D(latitude: 37, longitude: -122)
//        myMapView.addAnnotation(point)
    }
    
    //Allow Points to be added to map
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }
        
        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }
        return annotationView
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



