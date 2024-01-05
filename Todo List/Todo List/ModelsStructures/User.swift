//
//  User.swift
//  Todo List
//
//  Created by Lucas Jin on 2024-01-02.
//

import Foundation

//struct because individual users
struct User: Codable { //encodes or decodes a type
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
