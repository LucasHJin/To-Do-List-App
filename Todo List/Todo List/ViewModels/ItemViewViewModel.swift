//
//  ItemViewViewModel.swift
//  Todo List
//
//  Created by Lucas Jin on 2024-01-02.
//


import Foundation
import FirebaseAuth
import FirebaseFirestore

///view model for singular item

class ItemViewViewModel: ObservableObject {
    
    
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item //make itemCopy because can't do it on only one item -> item is a constant, immutable (value type)
        itemCopy.setDone(!item.isDone) //set opposite of whatever it was before
        
        guard let uID = Auth.auth().currentUser?.uid else {
            return
        }
        
        //changing in database
        let database = Firestore.firestore()
        database.collection("users") //collection container for documents -> documents individual records
            .document(uID)
            .collection("todos") //this isn't a specific name from Firebase, just consistently use the same one to access the same collection
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
 
