//
//  ContactListViewItem.swift
//  crypton
//
//  Created by Meylis on 10.02.2025.
//

import SwiftUI
import Kingfisher

struct ContactListViewItem: View {
    
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
            
            if topLine {
                Rectangle()
                    .fill(Color(red: 234 / 255, green: 236 / 255, blue: 239 / 255))
                    .frame(height: 1)
                    .edgesIgnoringSafeArea(.horizontal)
            }
            
            HStack(alignment: .top, spacing: 12) {
                AvatarView(userModel: room.user, widthHeight: 48)
                    .frame(width: 48, height: 48)
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    NicknameView(name: room.user.name, nickname: room.user.nickname, isVerified: room.user.isVerified)
                        .padding(.top, 2)
                    
                    Text(isOnline ? "Online" : "Online: 38 minutes ago")
                        .font(.system(size: 13, weight: .regular, design: .default))
                        .foregroundColor(
                            isOnline ? Color(red: 46/255, green: 206/255, blue: 91/255) :
                            Color(red: 107/255, green: 115/255, blue: 130/255)
                        ) // #6B7382
                        .lineLimit(1)
                        .padding(.top, 2)
                    
                }
                //            .background(Color.green)
                Spacer()
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

struct ContactListViewItem_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView(selectedTab: .contacts)
    }
}


