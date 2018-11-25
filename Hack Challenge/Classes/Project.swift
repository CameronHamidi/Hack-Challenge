//
//  Project.swift
//  Hack Challenge
//
//  Created by Pinxuan Huang on 11/23/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import Foundation

class Project {
    
    var title: String
//    var tags: [String]
    var descr: String //description
    var members: [Profile]
    var site: String //github, website, link to project
    
    init(title: String, descr: String, members: [Profile], site: String) {
        self.title = title
        self.descr = descr
        self.members = members
        self.site = site
    }
}
