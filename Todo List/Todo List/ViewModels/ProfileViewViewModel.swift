//
//  ProfileViewViewModel.swift
//  Todo List
//
//  Created by Lucas Jin on 2024-01-02.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewViewModel: ObservableObject {
    @Published var user: User? = nil //need to fetch the user
    
    init() {}
    
    func getUser() {
        // Check if there is a currently authenticated user
        guard let userId = Auth.auth().currentUser?.uid else {
            // If not, return from the function
            return
        }

        // Get a reference to the Firestore database
        let database = Firestore.firestore()

        // Access the "users" collection and retrieve the document corresponding to the current user ID
        database.collection("users").document(userId).getDocument { [weak self] snapshot, error in //These parameters are part of the closure signature for Firestore's getDocument method.
            // Check if there is any error or if the document snapshot is valid
            guard let data = snapshot?.data(), error == nil else { //need both to be false (the comma)
                // If not, return from the function
                return
            }

            // Use DispatchQueue.main.async to update UI components on the main thread
            DispatchQueue.main.async {
                // Create a User object using the retrieved data
                //data is a dictionary -> access values with strings
                self?.user = User(
                    id: data["id"] as? String ?? "",    // Casting information as the appropriate type
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    joined: data["joined"] as? TimeInterval ?? 0
                )
            }
        }
    }

    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }

    }
}
