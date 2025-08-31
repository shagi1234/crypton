//
//  ChatRoomItemLeftTextCellView.swift
//  crypton
//
//  Created by Meylis on 10.02.2025.
//

import SwiftUI

struct ChatRoomItemLeftTextCellView: View {
    var text: String
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                
                ZStack(alignment: .bottomTrailing) {
                    Text(text)
                        .font(.system(size: 13, weight: .regular, design: .default))
                        .foregroundColor(Color(red: 17/255, green: 16/255, blue: 58/255)) // #11103A
                    + Text(" 00:00")
                        .font(.system(size: 13, weight: .regular, design: .default))
                        .foregroundColor(Color(red: 244/255, green: 244/255, blue: 244/255))
                    
                    ChatRoomItemMessageDate()
                        .padding(.bottom, -2)
                }
                .padding(.top, 8)
                .padding(.bottom, 8)
                .padding(.horizontal, 10)
                .background(Color(red: 244/255, green: 244/255, blue: 244/255))
            }
            .cornerRadius(8)
            
            Spacer()
        }
    }
}

struct ChatRoomItemLeftTextCellView_Previews: PreviewProvider {
    static var previews: some View {
        ChatRoomView(room: RoomModel.exampleUserIsVerifiedTrue)
    }
}
