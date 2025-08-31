//
//  ChatListItemRowView.swift
//  crypton
//
//  Created by Meylis on 31.01.2025.
//

import SwiftUI
import Kingfisher

struct ChatListItemRowView: View {
    var room: RoomModel
    
    init(room: RoomModel) {
        self.room = room
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top) {
                AvatarView(userModel: room.user, widthHeight: 48)
                    .frame(width: 48, height: 48)
                
                VStack(alignment: .leading, spacing: 5) {
                    HStack(alignment: .center) {
                        NicknameView(name: room.user.name, nickname: room.user.nickname, isVerified: room.user.isVerified)
                        
                        Image("bell-mute")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 14, height: 14)
                            .foregroundColor(Color(red: 161/255, green: 171/255, blue: 190/255)) // Icon color #A1ABBE
                        
                        Spacer()
                        
                        Image(systemName: "clock")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        TickMark()
                            .stroke(Color(red: 1.0, green: 59/255, blue: 48/255), lineWidth: 1.2)
                            .frame(width: 11, height: 11)
                        
                        TickMarkRead()
                            .stroke(Color(red: 1.0, green: 59/255, blue: 48/255), lineWidth: 1.2)
                            .frame(width: 11, height: 11)
                        
                        Text("10:15")
                            .font(.system(size: 13, weight: .none, design: .default))
                            .foregroundColor(Color(red: 107/255, green: 115/255, blue: 130/255)) // #6B7382
                            .lineLimit(1)
                        
                    }
                    
                    HStack {
                        switch room.lastMessage.type {
                        case MessageType.Image.rawValue:
                            KFImage(URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_A7oOdwcnUIoAdFRxwD1YCZmitlQ_0NXfhw&s"))
                                .placeholder {
                                    ProgressView()
                                }
                                .resizable()
                                .scaledToFill()
                                .frame(width: 20, height: 20)
                                .cornerRadius(2)
                                .clipped()
                            
                        case MessageType.Video.rawValue:
                            KFImage(URL(string: "https://1encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_A7oOdwcnUIoAdFRxwD1YCZmitlQ_0NXfhw&s"))
                                .placeholder {
                                    ProgressView()
                                }
                                .resizable()
                                .scaledToFill()
                                .frame(width: 20, height: 20)
                                .cornerRadius(2)
                                .clipped()
                            
                        case MessageType.Voice.rawValue:
                            Image(systemName: "microphone.circle.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.gray)
                                .clipped()
                            
                        case MessageType.Geolocation.rawValue:
                            //                        Image(systemName: "map.circle.fill")
                            Image(systemName: "mappin.and.ellipse.circle.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.gray)
                                .clipped()
                            
                        case MessageType.File.rawValue:
                            Image(systemName: "document.circle.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.gray)
                                .clipped()
                            
                        default:
                            EmptyView()
                        }
                        
                        Text(room.lastMessage.content)
                            .font(.system(size: 13, weight: .regular, design: .default))
                            .foregroundColor(Color(red: 107/255, green: 115/255, blue: 130/255)) // #6B7382
                            .lineLimit(2)
                        //                .background(Color.blue)
                        
                        Spacer()
                        
                        UnreadBadgeView(count: 500, backgroundColor: (room.lastMessage.type == MessageType.Video.rawValue) ? Color(red: 161/255, green: 171/255, blue: 190/255) : Color(red: 1.0, green: 59/255, blue: 48/255))
                        //                    UnreadBadgeView(count: 500)
                    }
                    
                }
                //            .background(Color.green)
                
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            //        .background(Color.red)
            
            Rectangle()
                .fill(Color(red: 234 / 255, green: 236 / 255, blue: 239 / 255)) // #EAECEF color
                .frame(height: 1) // Adjust height for the line thickness
                .edgesIgnoringSafeArea(.horizontal) // Make it span the width of the screen (optional)

        }
    }
}

struct ChatListItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView(selectedTab: .chats)
    }
}

