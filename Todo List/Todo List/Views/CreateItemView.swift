//
//  CreateItemView.swift
//  Todo List
//
//  Created by Lucas Jin on 2024-01-02.
//

import SwiftUI

struct CreateItemView: View {
    
    @StateObject var viewModel = CreateItemViewViewModel()
    @Binding var createItemPresented: Bool  
    //@Binding -> declare one value coming from somewhere else and being shared between views/places
    
    var body: some View {
        VStack {
            Text("Create an Item: ")
                .bold()
                .font(.system(size: 30))
                .padding(.top, 40)
            
            Form {
                //Name of item
                TextField("Title", text: $viewModel.title)
                
                //Due Date
                DatePicker("Due Date", selection: $viewModel.ddate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                //allows to choose a date
                
                //Button to create
                TLButtonView(
                    title: "Create",
                    background: Color.blue) {
                    //Create item action
                        if viewModel.canCreate {
                            viewModel.create()
                            createItemPresented = false
                        } else {
                            viewModel.warning = true
                        }
                }
                
            }
            .alert(isPresented: $viewModel.warning, content: {
                Alert(title: Text("Error"),
                      message: Text("Please fill in all forms and select a valid due date."))
            })
            
        }
    }
}

#Preview {
    CreateItemView(createItemPresented: Binding(get: {return true
    }, set: { _ in
        //do nothing, just to return true
    }))
}
