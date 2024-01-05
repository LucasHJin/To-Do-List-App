//
//  Todo_ListApp.swift
//  Todo List
//
//  Created by Lucas Jin on 2024-01-01.
//

import SwiftUI
import FirebaseCore


@main
struct Todo_ListApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
