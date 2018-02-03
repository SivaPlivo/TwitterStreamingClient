//
//  UIFont+News.swift
//  StreamingClient
//
//  Created by Siva  on 21/01/18.
//  Copyright © 2018 Siva . All rights reserved.
//

import UIKit

/**
 Helper methods
 */
extension UIFont {
    
    static func news_primaryFont(withSize size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Heavy", size: size)!
    }
    
    static func news_secondaryFont(withSize size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Medium", size: size)!
    }
    
    static func news_tertiaryFont(withSize size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Book", size: size)!
    }
    
}

