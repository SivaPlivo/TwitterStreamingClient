//
//  CollectionType+Service.swift
//  StreamingClient
//
//  Created by Siva  on 21/01/18.
//  Copyright © 2018 Siva . All rights reserved.
//

import Foundation

/**
 Helper methods
 */
extension Collection {
    
    /**     
     A safer way of accessing items within an array
     - parameter index: Index of the item to be retrieved
     - returns The item at the index given if it exists
     */
    subscript (safe index: Index) -> Iterator.Element? {
        if self.endIndex > index && self.startIndex <= index {
            return self[index]
        }
        return nil
    }
    
}
