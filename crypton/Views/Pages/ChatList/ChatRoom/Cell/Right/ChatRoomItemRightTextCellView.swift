//
//  ChatRoomItemRightTextCellView.swift
//  crypton
//
//  Created by Meylis on 10.02.2025.
//

import SwiftUI

struct ChatRoomItemRightTextCellView: View {
    var text: String
    
    var body: some View {
        
        HStack(spacing: 0) {
            Spacer()
            VStack(alignment: .trailing, spacing: 0) {
                
                ZStack(alignment: .bottomTrailing) {
                    Text(text)
                        .font(.system(size: 13, weight: .regular, design: .default))
                        .foregroundColor(Color(red: 17/255, green: 16/255, blue: 58/255)) // #11103A
                    + Text(" 00:00 0")
                        .font(.system(size: 13, weight: .regular, design: .default))
                        .foregroundColor(Color(red: 244/255, green: 244/255, blue: 244/255))
                    
                    HStack(alignment: .bottom, spacing: 0) {
                        ChatRoomItemMessageDate()
                            .padding(.bottom, -2)
                        
                        Image("double-checkmark")
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFit()
                            .frame(width: 14, height: 14)
                            .foregroundColor(Color(red: 1.0, green: 59/255, blue: 48/255))
                            .padding(.bottom, -3)
                    }
                }
                .padding(.top, 8)
                .padding(.bottom, 8)
                .padding(.horizontal, 10)
                .background(Color(red: 1, green: 235/255, blue: 234/255))
            }
            .cornerRadius(8)
        }
    }
}

struct ChatRoomItemRightTextCellView_Previews: PreviewProvider {
    static var previews: some View {
        ChatRoomView(room: RoomModel.exampleUserIsVerifiedTrue)
    }
}
