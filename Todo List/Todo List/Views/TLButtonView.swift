//
//  TLButtonView.swift
//  Todo List
//
//  Created by Lucas Jin on 2024-01-03.
//

import SwiftUI

struct TLButtonView: View {
    
    let title: String
    let background: Color
    let action: () -> Void //This is a closure -> temp so that we can replace it with an action later
    // https://www.linkedin.com/pulse/understanding-closures-swift-mehmet-ali-demir/
    
    var body: some View {
        Button {
            
            //log in logic
            action()
            
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .bold()
                    .foregroundColor(Color.white)
            }
        }
        .padding()
    }
}

#Preview {
    TLButtonView(title: "button",
                 background: .pink)
    {
        //Action
        
    }
}
