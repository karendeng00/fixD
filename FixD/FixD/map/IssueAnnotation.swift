//
//  IssueAnnotation.swift
//  FixD
//
//  Created by Duc Tran on 7/3/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit
import MapKit

class IssueAnnotation: NSObject, MKAnnotation {
    
    //This class contains values from an IssueClass so that the issue's data can be displayed when making the annotation.
    @objc dynamic var coordinate: CLLocationCoordinate2D
    
    var issueID: Int?
    
    var title: String?
    
    var subtitle: String?
    
    var imageName: String?
    
    var type: String?
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        super.init()
    }

}
