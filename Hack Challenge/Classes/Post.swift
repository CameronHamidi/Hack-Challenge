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

class Post {
    
    var icon: UIImage
    var name: String
    var date: String
    var title: String
    var blurb: String
    
    init(icon: UIImage, name: String, date: String, title: String, blurb: String) {
        self.icon = icon
        self.name = name
        self.date = date
        self.title = title
        self.blurb = blurb
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
}
