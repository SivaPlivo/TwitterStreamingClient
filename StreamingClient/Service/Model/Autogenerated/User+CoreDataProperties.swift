//
//  User+CoreDataProperties.swift
//  StreamingClient
//
//  Created by Siva  on 21/01/18.
//  Copyright © 2018 Siva . All rights reserved.
//

import Foundation
import CoreData

public extension User {

    @NSManaged var identifier: String?
    @NSManaged var name: String?
    @NSManaged var screenName: String?
    @NSManaged var profileImageURL: String?
    @NSManaged var statuses: NSOrderedSet?

}
