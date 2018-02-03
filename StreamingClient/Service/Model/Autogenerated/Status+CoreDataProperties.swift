//
//  Status+CoreDataProperties.swift
//  StreamingClient
//
//  Created by Siva  on 21/01/18.
//  Copyright © 2018 Siva . All rights reserved.
//

import Foundation
import CoreData

public extension Status {

    @NSManaged var timestamp: NSNumber?
    @NSManaged var insertDate: Date?
    @NSManaged var identifier: String?
    @NSManaged var text: String?
    @NSManaged var favorited: NSNumber?
    @NSManaged var retweeted: NSNumber?
    @NSManaged var favoriteCount: NSNumber?
    @NSManaged var retweetCount: NSNumber?
    @NSManaged var truncated: NSNumber?
    @NSManaged var user: User?
    @NSManaged var hashtags: NSOrderedSet?
    @NSManaged var urls: NSOrderedSet?
    @NSManaged var mentions: NSOrderedSet?

}
