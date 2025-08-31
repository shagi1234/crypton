//
//  CallListViewItem.swift
//  crypton
//
//  Created by Meylis on 11.02.2025.
//

import SwiftUI
import Kingfisher

struct CallListViewItem: View {
    
    @State private var searchText = ""
    
    var room: RoomModel
    var isOnline: Bool = false
    var topLine: Bool = false
    
    init(room: RoomModel, isOnline: Bool = false, topLine: Bool = false) {
        self.room = room
        self.isOnline = isOnline
        self.topLine = topLine
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center, spacing: 12) {
                AvatarView(userModel: room.user, widthHeight: 48)
                    .frame(width: 48, height: 48)
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    NicknameView(name: room.user.name, nickname: room.user.nickname, isVerified: room.user.isVerified)
                        .padding(.top, 2)
                    
                    HStack(alignment: .center, spacing: 5) {
                        Image("call-list-incomming-call")
                            .renderingMode(.template)
                            .foregroundColor(isOnline ? Color(red: 1.0, green: 59/255, blue: 48/255) :
                                                Color(red: 107/255, green: 115/255, blue: 130/255))
                            .padding(.top, 2)
                        
                        Text("Incoming Call")
                            .font(.system(size: 13, weight: .regular, design: .default))
                            .foregroundColor(
                                isOnline ? Color(red: 1.0, green: 59/255, blue: 48/255) :
                                    Color(red: 107/255, green: 115/255, blue: 130/255)
                            )
                            .lineLimit(1)
                            .padding(.top, 2)
                    }
                }
                Spacer()
                
                Text("11.02")
                    .font(.system(size: 13, weight: .regular, design: .default))
                    .foregroundColor(
                            Color(red: 107/255, green: 115/255, blue: 130/255)
                    ) // #6B7382
                    .lineLimit(1)
                
                Image("info")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(Color(red: 1.0, green: 59/255, blue: 48/255))
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            
            Rectangle()
                .fill(Color(red: 234 / 255, green: 236 / 255, blue: 239 / 255))
                .frame(height: 1)
                .edgesIgnoringSafeArea(.horizontal)

        }
    }
    
}

struct CallListViewItem_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView(selectedTab: .calls)
    }
}

