//
//  MainViewViewModel.swift
//  Todo List
//
//  Created by Lucas Jin on 2024-01-02.
//

//View Models handles logic of Views -> I.e. when a button is pressed in the view, something happens

import FirebaseAuth
import Foundation

class MainViewViewModel: ObservableObject {
    @Published var currentUserID: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener {[weak self] _, user in
            DispatchQueue.main.async { //since updates main view, want to do it on main queue
                self?.currentUserID = user?.uid ?? "" //whenever the user signs in or out, @Published will be triggered to update view
            }
        } //self optional -> no memory leak
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil //basically -> if this doesn't equal nil -> there is a value -> return true
    }
    
    
    
    
}
