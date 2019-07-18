//  Apollo.swift
//  FixD
//
//  Created by Alejandro Meza on 7/18/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import Foundation
import Apollo
import UIKit

class Apollo {
    
    //    let apollo = ApolloClient(url: URL(string: "https://fixd-test.cloud.duke.edu/graphql")!)
    //    let apollo = ApolloClient(url: URL(string: "http://localhost:3000/graphql")!)
    
    static let client: ApolloClient = {
        var token = OAuthService.shared.getAccessToken() ?? ""
        print(token)
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Authorization": "Bearer \(token)", "Content-Type": "application/json"]
        let kongURL = "https://events-attendance-backend.api-test.oit.duke.edu/graphql"
        let url = URL(string: kongURL)!
        return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
    }()
    
}
