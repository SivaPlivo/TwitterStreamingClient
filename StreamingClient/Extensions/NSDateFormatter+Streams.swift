//
//  NSDateFormatter+News.swift
//  StreamingClient
//
//  Created by Siva  on 21/01/18.
//  Copyright © 2018 Siva . All rights reserved.
//

import Foundation

/**
 Helper methods
 */
extension DateFormatter {
    
    @nonobjc static let news_statusDataFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
    
}
