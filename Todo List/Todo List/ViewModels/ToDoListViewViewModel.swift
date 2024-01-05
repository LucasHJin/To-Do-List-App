//
//  ToDoListViewViewModel.swift
//  Todo List
//
//  Created by Lucas Jin on 2024-01-02.
//

import FirebaseFirestore
import Foundation

///view model for entire list of items

class ToDoListViewViewModel: ObservableObject {
    @Published var showingCreateItemView = false
    
    private let userId: String
    
    //use init when u want to pass a value in for one of the properties
    init(userId: String) { //instantiating view model for stateobject in the constructor
        self.userId = userId //self.userId refers to the instance variable, userId refers to the parameter
        //assigning the value of the parameter to the property of the instance
    }
    
    /// Function to delete tasks/items from the to do lsit
    /// - Parameter id: the id of the item we want to delete
    func delete(id: String) {
        let database = Firestore.firestore()
        
        database.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete() //checking into database and deleting
    }
}
