//
//  Profile.swift
//  Hack Challenge
//
//  Created by Pinxuan Huang on 11/23/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import UIKit
import Foundation

enum Skill: String { //wip
    case python
    case java
    case swift
    case html_css
    case javascript
    case design
    case SQL
    case C
}

class Profile: Codable {
    
    var name: String?
    var contact_info: String?
    var major: String?
    var class_year: String?
    var skills: String?
    var role: String?
    var courses_take: String?
    var blurb: String?
    var profile_photo: String?
    
//    var projects: [Project]
    
//    init(name: String, picture: UIImage, major: String, email: String, skills: [Skill], posts: [Post]) {
//        self.name = name
//        self.picture = picture
//        self.major = major
//        self.email = email
//        self.skills = skills
//        self.posts = posts
//    }
    
//    func updateInfo() {}
    
}
