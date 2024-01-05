//
//  ItemsListView.swift
//  Todo List
//
//  Created by Lucas Jin on 2024-01-02.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    
    
    init(userID: String) {
        self._items = FirestoreQuery( //will be given userID when called -> live updates
            collectionPath: "users/\(userID)/todos")
        //_ is convention for property wrappers
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userID)) //doing this instead of just creating viewModel above because this lets us pass in the viewModel with the associated userID
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ItemView(item: item)
                        .swipeActions { //swipe modifier to be able to swipe the list
                            Button {
                                //Delete the thing
                                viewModel.delete(id: item.id)
                            } label: {
                                Text("Delete")
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar { //top bar
                Button {
                    //Action (show create item view)
                    viewModel.showingCreateItemView = true
                    
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingCreateItemView, content: {
                CreateItemView(createItemPresented: $viewModel.showingCreateItemView) //presents a sheet when true
            })
            
        }
    }
}

#Preview {
    ToDoListView(userID: "vT9xFsiOWDdhMqm2vesBD2zY1152") //testing userID that we created
}
