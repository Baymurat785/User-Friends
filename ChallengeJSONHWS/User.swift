//
//  User.swift
//  ChallengeJSONHWS
//
//  Created by Baymurat Abdumuratov on 11/04/24.
//

import Foundation



struct User: Codable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: String
    var tags: [String]
    var friends: [Friend]
}

struct Friend: Codable {
    var id: String
    var name: String
}
