//
//  Responses.swift
//  Hack Challenge
//
//  Created by Cameron Hamidi on 12/2/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import Foundation


struct LoginResponse: Codable {
    var success: Bool
    var data: LoginResponseData
}

struct LoginResponseData: Codable {
    var token: Int
    var uid: Int
}

struct SearchResponse: Codable {
    var success: Bool
    var data: [Int]
}

