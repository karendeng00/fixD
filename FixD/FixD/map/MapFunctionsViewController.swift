//
//  MapFunctionsViewController.swift
//  FixD
//
//  Created by Alejandro Meza on 6/10/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapFunctionsViewController: UIViewController {
    
    let transition = SlideInTransition()
    var topView: UIView?
    private let locationManager = CLLocationManager()
    private var currentCoord: CLLocationCoordinate2D?
    private var myIssues: [Int:IssueClass] = [:]
    
    @IBOutlet weak var myMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getIssueData()
        //creates menu button
        let menuBtn = UIButton(type: .custom)
        menuBtn.frame = CGRect(x: 0.0, y: 0.0, width: 15, height: 15)
        menuBtn.setImage(UIImage(named:"menu"), for: .normal)
        menuBtn.addTarget(self, action: #selector(tapMenu(_:)), for: UIControl.Event.touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: menuBtn)
        let currWidth = menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 23)
        currWidth?.isActive = true
        let currHeight = menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 23)
        currHeight?.isActive = true
        self.navigationItem.leftBarButtonItem = menuBarItem
        
        
    }
    
    @IBAction func tapMenu(_ sender: UIButton) {
        self.openMenu()
    }
    
    func openMenu() {
        guard let menuVC = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuVC else {
            return
        }
        
        //transition to new page
        menuVC.didTapMenuType = {
            menuType in
            self.transitionToNew(menuType)
            
        }
        
        menuVC.modalPresentationStyle = .overCurrentContext
        menuVC.transitioningDelegate = self
        present(menuVC, animated: true)
    }
    
    func transitionToNew(_ menuType: MenuType) {
        
        topView?.removeFromSuperview()
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        guard let nextViewController = storyBoard.instantiateViewController(withIdentifier: "tab") as? UITabBarController else {
            return
        }
        switch menuType {
        case .home:
            nextViewController.selectedIndex = 0
            self.present(nextViewController, animated:false, completion:nil)
        case .account:
            nextViewController.selectedIndex = 2
            self.present(nextViewController, animated:false, completion:nil)
        case .settings:
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            guard let settingsViewController = storyBoard.instantiateViewController(withIdentifier: "settings") as? UITableViewController else {
                return
            }
            self.present(settingsViewController, animated:false, completion:nil)
 
        default:
            break
        }
    }
    
    //Sets up the current location
    
    private func setUpCurrentLocation() {
        locationManager.delegate = self
        let managerStatus = CLLocationManager.authorizationStatus()
        // Check for Location Services
        if managerStatus == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        } else if managerStatus == .authorizedAlways || managerStatus == .authorizedWhenInUse {
            beginLocationUpdate(locationManager: locationManager)
        }
    }
    
    private func beginLocationUpdate(locationManager: CLLocationManager){
        myMapView.showsUserLocation = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    private func zoomToRegion(with coordinate: CLLocationCoordinate2D) {
        //Zoom to user location
        let viewRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        myMapView.setRegion(viewRegion, animated: true)
    }
    
    //Adding Location of issues to Map
    private func setUpIssuesOnMap() {
        for issue in myIssues.values {
            let loc = issue.getLocation()
            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString(loc) { (placemarks, error) -> Void in
                if let pMark = placemarks?.first {
                    let point = MKPointAnnotation()
                    point.title = issue.getTitle()
                    if let coordinate = pMark.location?.coordinate{
                        point.coordinate = coordinate
                        self.myMapView.addAnnotation(point)
                    }
                }
            }
        }
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

extension MapFunctionsViewController: UIViewControllerTransitioningDelegate {
    //put side menu out
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    
    //put side menu back in
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
    
    private func getIssueData() {
        IssueLoader().getData() { issueData in
            self.myIssues = issueData
            self.setUpCurrentLocation()
        }
    }
    
    
}

extension MapFunctionsViewController: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Did Update Location")
        guard let latestLocation = locations.first else {return}
        if currentCoord == nil {
            zoomToRegion(with: latestLocation.coordinate)
            setUpIssuesOnMap()
        }
        currentCoord = latestLocation.coordinate
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("Did Change Authorization")
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            beginLocationUpdate(locationManager: manager)
        }
    }
    
}

