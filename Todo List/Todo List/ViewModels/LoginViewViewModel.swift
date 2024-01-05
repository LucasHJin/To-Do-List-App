//
//  LoginViewViewModel.swift
//  Todo List
//
//  Created by Lucas Jin on 2024-01-02.
//


import FirebaseAuth //gives functionality to try and login user with provided email and password
import Foundation


//Make class and not struct because we want it so that when one instance of the class is changed, all instances are changed
class LoginViewViewModel: ObservableObject {
    @Published var email: String = "" //@Published and ObservableObject work together -> when it changes, view will recompute immediately to show new values
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    
    init() { //needed for classes but not structures -> intializes the values, normally "self.a = a" with parameter of "a: Int/String"
        
        
    }
    
    func login() {
        guard validate() else {
            return
        }
        
        //Try to login
        Auth.auth().signIn(withEmail: email, password: password) //reference to firebase authentication
        //all you need for the sign in itself -> use in combination with user 
        
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            errorMessage = "Please ensure that you have filled out all fields."
            return false
        }
        //guard runs when condition isn't met(evaluates if false)
        //runs if isempty is true for either -> they become false because of !
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email."
            return false
        }
        
        return true
    }
}
