//
//  User.swift
//  TwitterDemo
//
//  Created by Kevin Alfonso on 2/24/17.
//  Copyright © 2017 Kevin Alfonso. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var name: String?
    var screenname: String?
    var profileUrl: URL?
    var tagline: String?
    
    // Constructor
    init(dictionary: NSDictionary) {
        // Deserialization Code (from the API)
        name = dictionary["name"] as? String
        screenname = dictionary["screen_name"] as? String
        let profileUrlString = dictionary["profile_image_url_https"] as? String
        if let profileUrlString = profileUrlString {
            profileUrl = URL(string: profileUrlString)
        }
        tagline = dictionary["description"] as? String
        
    }
}
