//
//  ChatRoomCellContainerView.swift
//  crypton
//
//  Created by Meylis on 11.02.2025.
//

import SwiftUI

struct ChatRoomCellContainerView<Content: View>: View {
    let isLeft: Bool
    let content: () -> Content

    init(isLeft: Bool, @ViewBuilder content: @escaping () -> Content) {
        self.isLeft = isLeft
        self.content = content
    }

    var body: some View {
        HStack(spacing: 0) {
            if !isLeft {
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 0) {
                
                ZStack(alignment: .bottomTrailing) {
                    
                    content()
                    
                    HStack(alignment: .bottom, spacing: 0) {
                        ChatRoomItemMessageDate()
                            .padding(.bottom, -2)
                        
                        
                        if !isLeft {
                            Image("double-checkmark")
                                .resizable()
                                .renderingMode(.template)
                                .scaledToFit()
                                .frame(width: 14, height: 14)
                                .foregroundColor(Color(red: 1.0, green: 59/255, blue: 48/255))
                                .padding(.bottom, -2)
                        }
                    }
                }
                .padding(.top, 8)
                .padding(.bottom, 8)
                .padding(.horizontal, 10)
                .background(isLeft ?
                    Color(red: 244/255, green: 244/255, blue: 244/255) :
                    Color(red: 1, green: 235/255, blue: 234/255)
                )
            }
            .cornerRadius(8)
            
            if isLeft {
                Spacer()
            }
        }
        .padding(.leading, isLeft ? 16 : 56)
        .padding(.trailing, isLeft ? 56 : 16)
    }
}

struct ChatRoomCellContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ChatRoomView(room: RoomModel.exampleUserIsVerifiedTrue)
    }
}

