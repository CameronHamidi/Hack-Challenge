//
//  Post.swift
//  Hack Challenge
//
//  Created by Pinxuan Huang on 11/23/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import Foundation
import UIKit

//protocol Filter {
//    var filterTitle: String { get }
//}
//
//enum Position: Filter {
//    case frontend
//    case backend
//    case designer
//
//    //returns the enum title with first letter uppercased
//    var filterTitle: String {
//        return String(describing: self).localizedUppercase
//    }
//
//    static func allValues() -> [Position] {
//        return [.frontend, .backend, .designer]
//    }
//}

struct Post: Codable {
    var id: Int
    var uid: Int
    var title: String
    var tags: String
    var role: String
    var text: String
    var active: Bool
    var creation_time: Float
    var kind: Int
    var course: String?
    var group_size: String?
    var skills: String?
}

struct PostResponse: Codable {
    var data: Post
    var success: Bool
}
    
    
    
    //    var tags: [String]
    //    var size: Int //group size
    //    var positions: [Position] //e.g backend, designer, etc...
    //    var descr: String //description
    //    var status: Bool //open or closed
    
    //    init(title: String, tags: [String], size: Int, positions: [Position], descr: String, status: Bool) {
    //        self.title = title
    //        self.tags = tags
    //        self.size = size
    //        self.positions = positions
    //        self.descr = descr
    //        self.status = status
    //    }
