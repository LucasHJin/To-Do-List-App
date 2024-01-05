//
//  RegistrationView.swift
//  Todo List
//
//  Created by Lucas Jin on 2024-01-02.
//

import SwiftUI

struct RegistrationView: View {
    
    @StateObject var viewModel = RegistrationViewViewModel()
    
    var body: some View {
        VStack {
            //Header
            HeaderView(title: "Registration", subtitle: "Start organizing todos", angle: -15, background: .orange)
            
            Form {
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(Color.red)
                }
                
                TextField("Full Name", text: $viewModel.name) //$ references the variable so that what is written is copied above
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                TLButtonView(title: "Create Account",
                             background: .green)
                {
                    //Try registering them
                    viewModel.register()
                }
            }
            .offset(y: -50)
            
            
            
            Spacer()
        }
    }
}

#Preview {
    RegistrationView()
}
