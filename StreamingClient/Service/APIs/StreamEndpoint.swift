//
//  StreamEndpoint.swift
//  StreamingClient
//
//  Created by Siva  on 21/01/18.
//  Copyright © 2018 Siva . All rights reserved.
//

import Foundation
import Social

/**
 Different endpoints available in this API
 */
enum StreamEndpoint {
    
    /// Stream of statuses filtered by keyword
    case statuses
    
    /// Path of the endpoint
    var path: String {
        switch self {
        case .statuses:
            return "statuses/filter.json"
        }
    }
    
    /// Method of the endpoint
    var method: SLRequestMethod {
        switch self {
        case .statuses:
            return .POST
        }
    }
    
}
