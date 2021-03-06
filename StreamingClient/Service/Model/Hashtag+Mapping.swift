//
//  Hashtag+Mapping.swift
//  StreamingClient
//
//  Created by Siva  on 21/01/18.
//  Copyright © 2018 Siva . All rights reserved.
//

import Foundation
import CoreData

extension Hashtag {
    
    /**
     Maps the dictionary given to an entity of the current class stored in the
     `NSManagedObjectContext` provided
     - parameter dictionary: Dictionary with the info to be mapped
     - parameter objectContext: Context where the entity will be created on
     - returns The entity if it has been created
     */
    static func entity(withDictionary dictionary: [AnyHashable: Any], objectContext: NSManagedObjectContext) -> Hashtag? {
        guard let entity = NSManagedObject.service_entity(ofClass: Hashtag.self, objectContext: objectContext) else {
            return nil
        }
        
        entity.text = dictionary["text"] as? String
        if let startIndex =  (dictionary["indices"] as? [NSNumber])?[safe: 0] {
            entity.startIndex = startIndex
        }
        if let endIndex =  (dictionary["indices"] as? [NSNumber])?[safe: 1] {
            entity.endIndex = endIndex
        }
        
        return entity
    }
    
}
