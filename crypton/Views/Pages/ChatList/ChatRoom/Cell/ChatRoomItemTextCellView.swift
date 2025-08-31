//
//  ChatRoomItemTextCellView.swift
//  crypton
//
//  Created by Meylis on 11.02.2025.
//

import SwiftUI

struct ChatRoomItemTextCellView: View {
    let isLeft: Bool
    var text: String
    
    var emptyText: String = ""
    
    init(isLeft: Bool, text: String) {
        self.isLeft = isLeft
        self.text = text
        
        emptyText = self.isLeft ? " 00:00" : " 00:00 0"
    }
    
    var body: some View {
        ChatRoomCellContainerView(isLeft: isLeft) {
            Text(text)
                .font(.system(size: 13, weight: .regular, design: .default))
                .foregroundColor(Color(red: 17/255, green: 16/255, blue: 58/255))
            + Text(emptyText)
                .font(.system(size: 13, weight: .regular, design: .default))
                .foregroundColor(Color(red: 244/255, green: 244/255, blue: 244/255))
        }
    }
}

struct ChatRoomItemTextCellView_Previews: PreviewProvider {
    static var previews: some View {
        ChatRoomView(room: RoomModel.exampleUserIsVerifiedTrue)
    }
}
