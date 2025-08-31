//
//  ChatRoomHeaderDateView.swift
//  crypton
//
//  Created by Meylis on 10.02.2025.
//

import SwiftUI

struct ChatRoomHeaderDateView: View {
    var title: String
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Text(title)
                .font(.system(size: 13, weight: .regular, design: .default))
                .foregroundColor(Color(red: 161/255, green: 171/255, blue: 190/255)) // Icon color #A1ABBE
//                .cornerRadius(30)
                .padding(15)
            
            Spacer()
        }
    }
}

struct ChatRoomHeaderDateView_Previews: PreviewProvider {
    static var previews: some View {
        ChatRoomHeaderDateView(title: "00:00")
            .background(.blue)
    }
}
