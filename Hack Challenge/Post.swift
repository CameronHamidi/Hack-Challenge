//
//  Post.swift
//  Hack Challenge
//
//  Created by Pinxuan Huang on 11/23/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import Foundation

// Specifically for Team Request posts
class Post {
    
    var title: String
    var tags: [String]
    var size: Int //group size
    var positions: [String] //e.g backend, designer, etc...
    var descr: String //description
    var status: Bool //open or closed
    
    init(title: String, tags: [String], size: Int, positions: [String], descr: String, status: Bool) {
        self.title = title
        self.tags = tags
        self.size = size
        self.positions = positions
        self.descr = descr
        self.status = status
    }
}
