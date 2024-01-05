//
//  HeaderView.swift
//  Todo List
//
//  Created by Lucas Jin on 2024-01-02.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String //variables for it to be repurposable
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle)) //rotating the rectangle
            
            VStack {
                Text(title)
                    .font(.system(size: 50)) //manually choose text size
                    .bold()
                    .foregroundColor(Color.white)
                Text(subtitle)
                    .font(.system(size: 25))
                    .foregroundColor(Color.white)
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350) //deciding size of zstack and rectangle
        .offset(y: -150) //moving the rectangle up
        
    }
}

#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, background: .blue)
}
