//
//  ContentView.swift
//  Todo List
//
//  Created by Lucas Jin on 2024-01-01.
//

//cmd Q to quit compiler

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserID.isEmpty { //if signed in and the currentUserID is actually assigned to something 
            //actual app view
            accountView
            
        } else {
            LoginView()
        }
    }
    
    
    @ViewBuilder
    var accountView: some View { //computed property rather than a function
        //https://www.swiftyplace.com/blog/tabview-in-swiftui-styling-navigation-and-more#:~:text=SwiftUI%20TabView%20is%20a%20main,bar%20items%20at%20the%20bottom.
        TabView { //shows a tab view/icon for each of the views inside of it
            ToDoListView(userID: viewModel.currentUserID)
                .tabItem{
                    Label("Home", systemImage: "house") //sf symbols
                }
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
