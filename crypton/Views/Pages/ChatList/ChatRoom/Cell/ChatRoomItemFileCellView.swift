//
//  ChatRoomItemFileCellView.swift
//  crypton
//
//  Created by Meylis on 11.02.2025.
//

import SwiftUI

struct ChatRoomItemFileCellView: View {
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
            
            HStack(alignment: .center, spacing: 8) {
                
                Image("message-file")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 18, height: 18)
                    .padding(7)
                    .foregroundColor(
                        isLeft ?
                        Color(red: 17/255, green: 16/255, blue: 58/255) :
                        Color(red: 1.0, green: 59/255, blue: 48/255)
                    )
                    .background(.white)
                    .cornerRadius(16)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(text)
                        .font(.system(size: 13, weight: .semibold, design: .default))
                        .foregroundColor(Color(red: 17/255, green: 16/255, blue: 58/255))
                    
                    Text("1.2 MB")
                        .font(.system(size: 13, weight: .regular, design: .default))
                        .foregroundColor(Color(red: 161/255, green: 171/255, blue: 190/255))
                    + Text(emptyText)
                        .font(.system(size: 13, weight: .regular, design: .default))
                        .foregroundColor(Color(red: 244/255, green: 244/255, blue: 244/255))
                }
            }
        }
    }
}

struct ChatRoomItemFileCellView_Previews: PreviewProvider {
    static var previews: some View {
        ChatRoomView(room: RoomModel.exampleUserIsVerifiedTrue)
    }
}
