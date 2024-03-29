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
    
    let fixd = "https://fixd-test.cloud.duke.edu/graphql"
    let local = "http://localhost:3000/graphql"
    
    func getClient() -> ApolloClient {
        let token = OAuthService.shared.getAccessToken() ?? ""
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Authorization": "Bearer \(token)", "Content-Type": "application/json"]
        let kongURL = "https://issue-reporting-backend.api-test.oit.duke.edu/graphql"
        let url = URL(string: kongURL)!
        return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
    }
    
//    func getClient() -> ApolloClient {
//        return ApolloClient(url: URL(string: local)!)
//    }

}
