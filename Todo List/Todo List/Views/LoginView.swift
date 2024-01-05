//
//  LoginView.swift
//  Todo List
//
//  Created by Lucas Jin on 2024-01-02.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    //can store ObservableObjects, @State cannot -> for references + variables accross multiple views(outisde local view)
    // we can observe that property changes by firstly conforming that class to ObservableObject Protocol and marking that property as @Published inside our Object.
    
    var body: some View {
        NavigationView { //lets you switch views when needed
            VStack {
                //Header
                HeaderView(title: "To Do List", subtitle: "Get Things Done!!!", angle: 15, background: .pink)
                
                /*
                if let message = viewModel.errorMessage { //if you can let the message(optional) equal the non-optional version of message (viewModel.errorMessage), do the following with it
                    //https://www.hackingwithswift.com/read/0/12/optionals
                    //if the optional variable has a value, then run, else don't
                    Text(message)
                        .foregroundColor(Color.red)
                }
                 */
                
                //if isn't empty then run
                
                //Login Form (Fields + Button)
                Form { //makes a form to fill in?
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email) //makes textboxes to put in info
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    //securefield = not visible when entering info?, textfield is visible
                    
                    TLButtonView(title: "Login",
                                 background: .blue)
                    {
                        //Action
                        viewModel.login()
                    }
                }
                .offset(y: -50)
                
                
                //Registration Button
                VStack {
                    Text("Not yet registered?")
                    NavigationLink("Create an Account", destination: RegistrationView())
                }
                .padding(.bottom, 50)
                
            }
        }
    }
}

#Preview {
    LoginView()
}
