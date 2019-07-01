//
//  IssuePasser.swift
//  FixD
//
//  Created by Karen Deng on 6/21/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import Foundation


class IssuePasser {
    func passData() {
        
        let params = ["title":"problem","description":"oh no ","image":"window.png","location":"here","user":"me","user_image":"photo.jpg","date":"01/12/12", "time":"1:39"] as [String : Any]
        
        //create the url with URL
        let url = URL(string: "http://localhost:3000/createIssueMobile")! //change the url
        
        //create the session object
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST" //set http method as POST
        
            request.httpBody = try! JSONSerialization.data(withJSONObject: params, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
        
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            guard error == nil else {
                return
            }
            guard let data = data else {
                return
            }
            
            do {
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    print(json)
                    // handle json...
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
        
        
    }

    //[{"id":2,"title":"problem","description":"oh no ","image":"window.png","location":"here","user":"me","user_image":"photo.jpg","date":"01/12/12","time":"1:39","created_at":"2019-06-21T17:12:09.008Z","updated_at":"2019-06-21T17:17:58.163Z"},{"id":3,"title":"another problem","description":"","image":"printer.png","location":"","user":"","user_image":"duke.png","date":"","time":"","created_at":"2019-06-21T17:15:02.367Z","updated_at":"2019-06-21T17:16:34.561Z"}]


