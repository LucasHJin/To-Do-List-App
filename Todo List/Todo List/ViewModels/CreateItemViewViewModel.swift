//
//  CreateItemViewViewModel.swift
//  Todo List
//
//  Created by Lucas Jin on 2024-01-02.
//

import FirebaseAuth
import FirebaseFirestore //this is the database
import Foundation

class CreateItemViewViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var ddate = Date()
    @Published var warning = false
    
    
    init() {}
    
    func create() {
        guard canCreate else {
            return //make sure able to create
        }
        //obtain current user ID
        guard let uID = Auth.auth().currentUser?.uid else { //get user ID from firebaseauth
            return
        }
        
        //create model of item
        let newID = UUID().uuidString //new identifier for newItem's ID -> so it isn't the same as already existing ID
        let newItem = ToDoListItem(id: newID,
                                   title: title,
                                   ddate: ddate.timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                   isDone: false)
        
        //save model of item to database (subcollection of current user)
        let database = Firestore.firestore() //getting database from firestore
        
        database.collection("users") //creating own database
            .document(uID)
            .collection("todos")
            .document(newID)
            .setData(newItem.asDictionary())
        
    }
     
    var canCreate: Bool { //computed property -> yes or no (t/f)
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else { //guard faster than if so better
            return false
        }
        guard ddate >= Date().addingTimeInterval(-86400) else {
            return false
        } //want to do just >= today (this date)
        //BUT date is initialized to current date, hour and seconds -> time zone problems
        //86400 is amount of seconds in a day -> allows to pick today as a due date and not have any issues due to time zones
        
        return true
    }
    
}
