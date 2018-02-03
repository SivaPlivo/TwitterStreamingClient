//
//  Service.swift
//  StreamingClient
//
//  Created by Siva  on 21/01/18.
//  Copyright © 2018 Siva . All rights reserved.
//

import Foundation

/**
 Set of tools and APIs needed by the News app
 */
public class Service {
    
    /// Private queue where the mapping takes place
    fileprivate static let mappingQueue = DispatchQueue(label: "com.streaming.background", attributes: [])
    
    /// Base URL of the server the app connects with
    public let baseURL: URL
    
    /// Database tools
    public let dataManager: DataManager
    
    /// Class managing the stream sessions
    let streamSessionManager: StreamSessionManager
    
    /// Utils that authenticate the user and creates the stream connection
    public fileprivate(set) lazy var streamAPI: StreamAPI = {
        let api = StreamAPI(
            baseURL: self.baseURL,
            dataManager: self.dataManager,
            streamSessionManager: self.streamSessionManager
        )
        return api
    }()
    
    public init(baseURL: URL) {
        self.baseURL = baseURL
        self.streamSessionManager = StreamSessionManager(dispatchQueue: Service.mappingQueue)
        self.dataManager = DataManager()
        self.dataManager.loadStack()
    }
    
}
