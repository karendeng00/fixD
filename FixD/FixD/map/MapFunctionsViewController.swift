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
    
    let transition = SlideInTransition()
    var topView: UIView?
    
    
    @IBOutlet weak var myMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        setUpCurrentLocation()
        setUpIssuesOnMap()
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
    
    //Adding Location of issues to Map
    private func setUpIssuesOnMap() {
        let issues = getIssueData()
        for issue in issues.values {
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
    
    private func getIssueData() -> [Int: IssueClass] {
        var list: [Int: IssueClass] = [:]
        IssueBuilder().getData() { issueData in
            list = issueData
        }
        return list
    }
    
    
}

