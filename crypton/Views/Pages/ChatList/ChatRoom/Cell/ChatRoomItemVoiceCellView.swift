//
//  ChatRoomItemVoiceCellView.swift
//  crypton
//
//  Created by Meylis on 11.02.2025.
//

import SwiftUI

struct ChatRoomItemVoiceCellView: View {
    let isLeft: Bool
    var text: String
    
    var emptyText: String = ""
    
    init(isLeft: Bool, text: String) {
        self.isLeft = isLeft
        self.text = text
        
        emptyText = self.isLeft ? "0" : "0"
    }
    
    var body: some View {
        ChatRoomCellContainerView(isLeft: isLeft) {
            
            HStack(spacing: 0) {
                
                HStack(alignment: .center, spacing: 8) {
                    
                    Image(systemName: "play.fill")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFit()
                        .frame(width: 14, height: 14)
                        .padding(10)
                        .padding(.leading, 2)
                        .foregroundColor(.white)
                        .background(
                            isLeft ?
                            Color(red: 17/255, green: 16/255, blue: 58/255) :
                                Color(red: 1.0, green: 59/255, blue: 48/255)
                        )
                        .cornerRadius(24)
                    
                    HStack(spacing: 5) {
                        Image(!isLeft ? "test-sound-left" : "test-sound-right")
//                            .background(.red)
//                        
//                        Text("00:11")
//                            .font(.system(size: 13, weight: .regular, design: .default))
//                            .foregroundColor(Color(red: 17/255, green: 16/255, blue: 58/255))
//                            .background(.blue)
                    }
                }
                .padding(8)
                .background(.white)
                .cornerRadius(24)
                
                
                Text(emptyText)
                    .font(.system(size: 13, weight: .regular, design: .default))
                    .foregroundColor(Color(red: 244/255, green: 244/255, blue: 244/255))
                
                Text("00:11")
                    .font(.system(size: 13, weight: .regular, design: .default))
//                    .foregroundColor(Color(red: 244/255, green: 244/255, blue: 244/255))
                
            }
        }
    }
}

struct ChatRoomItemVoiceCellView_Previews: PreviewProvider {
    static var previews: some View {
        ChatRoomView(room: RoomModel.exampleUserIsVerifiedTrue)
    }
}

