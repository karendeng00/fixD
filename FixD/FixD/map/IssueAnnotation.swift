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
    
    @objc dynamic var coordinate: CLLocationCoordinate2D
    
    var issueID: String?
    
    var title: String?
    
    var subtitle: String?
    
    var imageName: String?
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        super.init()
    }

}
