//
//  ToDoListItem.swift
//  Todo List
//
//  Created by Lucas Jin on 2024-01-02.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let ddate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    //here to modify model if task is done/not done
    mutating func setDone(_ state: Bool) { //mutating cause Struct is value type
        isDone = state
    }
    
}
