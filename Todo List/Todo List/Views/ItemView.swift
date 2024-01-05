//
//  ItemView.swift
//  Todo List
//
//  Created by Lucas Jin on 2024-01-02.
//

import SwiftUI

struct ItemView: View {
    @StateObject var viewModel = ItemViewViewModel()
    let item: ToDoListItem
    
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .bold()
                Text("\(Date(timeIntervalSince1970: item.ddate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill": "circle")
                //? : is a ternary operator -> conditionally choose which icon based on boolean returned from item.isDone
                    .foregroundColor(Color(.green))
            }
        }
        

    }
}

#Preview {
    ItemView(item: .init(id: "THISID", title: "Go to the gym", ddate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
}
