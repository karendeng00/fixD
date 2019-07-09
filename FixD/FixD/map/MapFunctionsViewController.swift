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
        myMapView.delegate = self
        myMapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(IssueAnnotation.self))
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
                    if let coordinate = pMark.location?.coordinate{
                        let issueAnnotation = IssueAnnotation(coordinate: coordinate)
                        issueAnnotation.title = issue.getTitle()
                        issueAnnotation.imageName = issue.getIssueImage()
                        issueAnnotation.issueID = issue.getID()
                        self.myMapView.addAnnotation(issueAnnotation)
                    }
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is IssuePageController {
            let viewController = segue.destination as? IssuePageController
            viewController?.issueID = (myMapView.selectedAnnotations[0] as! IssueAnnotation).issueID!
        }
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
    
    //Is Called Whenever Locations is Changed
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.first else {return}
        if currentCoord == nil {
            zoomToRegion(with: latestLocation.coordinate)
            setUpIssuesOnMap()
        }
        currentCoord = latestLocation.coordinate
        
    }
    
    //Checks for when the user gives the app location permission
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            beginLocationUpdate(locationManager: manager)
        }
    }
    
}

extension MapFunctionsViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !annotation.isKind(of: MKUserLocation.self) else {
            return nil
        }
        var annotationView: MKAnnotationView?
        if let newAnnotation = annotation as? IssueAnnotation {
            annotationView = myMapView.dequeueReusableAnnotationView(withIdentifier: NSStringFromClass(IssueAnnotation.self), for: newAnnotation)
        }
        if let markerAnnotationView = annotationView as? MKMarkerAnnotationView{
            markerAnnotationView.animatesWhenAdded = true
            markerAnnotationView.canShowCallout = true
            if let imagePath = (markerAnnotationView.annotation as! IssueAnnotation).imageName, imagePath != ""{
                let image = UIImage(named: imagePath)
                markerAnnotationView.detailCalloutAccessoryView = UIImageView(image: image)
            }else {
                let image = UIImage(named: "NoImage")
                markerAnnotationView.detailCalloutAccessoryView = UIImageView(image: image)
            }
            let rightButton = UIButton(type: .detailDisclosure)
            markerAnnotationView.rightCalloutAccessoryView = rightButton
        }
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if let annotation = view.annotation, annotation.isKind(of: IssueAnnotation.self) {
            performSegue(withIdentifier: "MapToIssuePage", sender: self)
        }
    }
    
}
