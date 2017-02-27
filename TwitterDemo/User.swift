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
    var dictionary: NSDictionary?
    
    // Constructor
    init(dictionary: NSDictionary) {
        
        self.dictionary = dictionary
        
        // Deserialization Code (from the API)
        name = dictionary["name"] as? String
        screenname = dictionary["screen_name"] as? String
        let profileUrlString = dictionary["profile_image_url_https"] as? String
        if let profileUrlString = profileUrlString {
            profileUrl = URL(string: profileUrlString)
        }
        tagline = dictionary["description"] as? String
        
    }
    
    static let userDidLogoutNotificationName = NSNotification.Name(rawValue: "UserDidLogout")
    
    static var _currentUser: User?
    
    class var currentUser: User? {
        set(user) {
            _currentUser = user
            let defaults = UserDefaults.standard
            
            if let user = user {
                let data = try! JSONSerialization.data(withJSONObject: (user.dictionary)!, options: [])
                defaults.setValue(data, forKey: "currentUserData")

            } else {
                defaults.setValue(nil, forKey: "currentUserData")
            }
            defaults.synchronize()
        }
        
        get {
            if _currentUser == nil {
            let defaults = UserDefaults.standard
            
            let userData = defaults.object(forKey: "currentUserData") as? Data
            if let userData = userData {
                let dictionary = try! JSONSerialization.jsonObject(with: userData, options: []) as! NSDictionary
                _currentUser = User(dictionary: dictionary)
                }
            }
            
        return _currentUser
        }
        
    }
}
