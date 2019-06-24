//
//  Search.swift
//  FixD
//
//  Created by Karen Deng on 6/21/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit
import MapKit

class Search: UISearchController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let searchRequest = MKLocalSearch.Request()
        
        searchRequest.naturalLanguageQuery = self.searchBar.text
        
        let activeSearch = MKLocalSearch(request: searchRequest)
        
        activeSearch.start { (response, error) in
            if response == nil {
                print("Error")
            }
            
        }
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
