//
//  Mention+CoreDataProperties.swift
//  StreamingClient
//
//  Created by Siva  on 21/01/18.
//  Copyright © 2018 Siva . All rights reserved.
//

import Foundation
import CoreData

public extension Mention {

    @NSManaged var screenName: String?
    @NSManaged var identifier: String?
    @NSManaged var startIndex: NSNumber?
    @NSManaged var endIndex: NSNumber?
    @NSManaged var status: Status?

}
