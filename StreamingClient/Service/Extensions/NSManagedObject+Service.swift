//
//  NSManagedObject+Service.swift
//  StreamingClient
//
//  Created by Siva  on 21/01/18.
//  Copyright © 2018 Siva . All rights reserved.
//

import Foundation
import CoreData

/**
 Helper methods
 */
extension NSManagedObject {
    
    /**
     Creates an entity for the class given in order to save some boilerplate code
     - parameter class: Type of the entity to return
     - parameter objectContext: `NSManagedObjectContext` where the entity will be added to
     - returns The created `NSManagedObject` if possible
     */
    static func service_entity<T>(ofClass class: T.Type, objectContext: NSManagedObjectContext) -> T? where T: NSManagedObject {
        let name = NSStringFromClass(T.self).components(separatedBy: ".").last ?? ""
        return NSEntityDescription.insertNewObject(forEntityName: name, into: objectContext) as? T
    }
    
}
