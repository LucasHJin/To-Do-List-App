//
//  ProfileView.swift
//  Todo List
//
//  Created by Lucas Jin on 2024-01-02.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                    
                } else {
                    Text("Loading profile...")
                }
                
            }
            .navigationTitle("Profile")
            
        }
        .onAppear { //when navigation view appears
            viewModel.getUser()
        }
    }
    
    
    
    
    @ViewBuilder //allows functions to use vstack, hstack, etc.
    func profile(user: User) -> some View { //opaque return type, not specified
        //Pfp
        //CHANGE TO ALLOW USER TO GIVE A PROFILE PHOTO
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color(.blue))
            .frame(width: 125, height: 125)
            .padding()
        
        
        //Information
        VStack(alignment: .leading) {
            HStack {
                Text("Name:")
                    .bold()
                Text(user.name)
            }
            .padding()
            HStack {
                Text("Email:")
                    .bold()
                Text(user.email)
            }
            .padding()
            HStack {
                Text("Member Since:")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        .padding()
        
        //Sign out
        TLButtonView(title: "Log Out",
                     background: .red) {
            viewModel.logout()
        }
            .frame(width: 150, height: 80)
        
        Spacer()
    }
    
}

#Preview {
    ProfileView()
}
