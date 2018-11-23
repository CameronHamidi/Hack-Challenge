//
//  Profile.swift
//  Hack Challenge
//
//  Created by Pinxuan Huang on 11/23/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import UIKit
import Foundation

class Profile {
    
    var name: String
    var picture: UIImage
    var major: String
    
    var email: String
    var skills: [String]
    var posts: [Post]
    
//    var projects: [Project]
    
    init(name: String, picture: UIImage, major: String, email: String, skills: [String], posts: [Post]) {
        self.name = name
        self.picture = picture
        self.major = major
        self.email = email
        self.skills = skills
        self.posts = posts
    }
    
//    func updateInfo() {}
    
}
