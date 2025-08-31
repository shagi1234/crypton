//
//  ChatRoomItemView.swift
//  crypton
//
//  Created by Meylis on 31.01.2025.
//

import SwiftUI
import Kingfisher

struct ChatRoomItemView: View {
    
    var left: Bool
    var replyText: String
    var text: String
    var type: Int
    
    @State private var isPlaying = false
    @State private var progress: CGFloat = 1.0
    let duration: String = "00:30"
    
    init(left: Bool, type: Int, text: String = "some text", replyText: String = "") {
        self.left = left
        self.type = type
        self.text = text
        self.replyText = replyText
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                
                if (!left) {
                    Spacer(minLength: 0)
                }
                
                switch type {
                case MessageType.Image.rawValue:
                    
                    ZStack() {
                        KFImage(URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_A7oOdwcnUIoAdFRxwD1YCZmitlQ_0NXfhw&s"))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: .infinity)
                            .clipped()
                            .cornerRadius(6)
                            .padding(2)
                            
                        
                        ZStack {
                            Image(systemName: "play.fill")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        }
                        .frame(width: 56, height: 56)
                        .background(.black.opacity(0.5))
                        .cornerRadius(56 / 2)

                        // Center view
//                            Text("Center View")
//                                .font(.headline)
//                                .foregroundColor(.white)
//                                .padding()
//                                .background(Color.black.opacity(0.7))
//                                .cornerRadius(8)
                        
                        // Bottom-right HStack
                        HStack {
                            Text("00:00")
                                .font(.footnote)
                                .foregroundColor(.white)
                            TickMark()
                                .stroke(Color.white, lineWidth: 1.2)
                                .frame(width: 11, height: 11)
                            
                            TickMarkRead()
                                .stroke(Color.white, lineWidth: 1.2)
                                .frame(width: 11, height: 11)
                                .padding(.trailing, 8)
                        }
                        .padding(.vertical, 2)
                        .padding(.horizontal, 4)
                        .background(Color.black.opacity(0.5))
                        .cornerRadius(8)
                        .offset(CGSize(width: -8.0, height: -8.0))
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)

                        // Top-left HStack
                        HStack {
                            Text("00:00")
                                .font(.footnote)
                                .foregroundColor(.white)
                        }
                        .padding(.vertical, 2)
                        .padding(.horizontal, 4)
                        .background(Color.black.opacity(0.5))
                        .cornerRadius(8)
                        .offset(CGSize(width: 8.0, height: 8.0))
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    }
                    .background(Color.blue)
                    .cornerRadius(8)
                    .frame(width: 200, height: .infinity)
                    .padding(.trailing, 5)
                    
                case MessageType.Voice.rawValue:
                    HStack(spacing: 4) {
                        Button(action: {
                            isPlaying.toggle()
                            // Add playback functionality here
                        }) {
                            Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                                .resizable()
                                .frame(width: 32, height: 32)
                                .foregroundColor(.white)
                        }
                        VStack(alignment: .leading, spacing: 0) {
                            Spacer()
                            ZStack(alignment: .leading) {
                                Capsule()
                                    .frame(height: 4)
                                    .foregroundColor(.white.opacity(0.4))
                                Capsule()
                                    .frame(width: progress * 100, height: 4)
                                    .foregroundColor(.white)
                                    .animation(.linear(duration: 0.5), value: progress)
                            }
                            
                            Spacer()
                            HStack(alignment: .bottom) {
                                Text(duration)
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                HStack {
                                    Text(duration)
                                        .font(.footnote)
                                        .foregroundColor(.white)
                                    
                                    TickMark()
                                        .stroke(Color.white, lineWidth: 1.2)
                                        .frame(width: 11, height: 11)
                                    
                                    TickMarkRead()
                                        .stroke(Color.white, lineWidth: 1.2)
                                        .frame(width: 11, height: 11)
                                }
                                
                            }
                        }
                        .padding(.horizontal, 4)
                    }
                    .padding(8)
                    .background(.blue)
                    .cornerRadius(16)
                    .padding(.trailing, 5)
                    
                case MessageType.File.rawValue:
                    HStack(spacing: 4) {
                        Image(systemName: "document.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.white)
                        
                        VStack(alignment: .leading, spacing: 0) {
//                                Spacer()
                            Text("File Name")
                                .font(.headline)
                                .foregroundColor(.white)
                            
//                                Spacer(minLength: 4)
                            HStack(alignment: .center) {
                                Text("16 kb")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                Text(duration)
                                    .font(.footnote)
                                    .foregroundColor(.white)
                                TickMark()
                                    .stroke(Color.white, lineWidth: 1.2)
                                    .frame(width: 11, height: 11)
                                
                                TickMarkRead()
                                    .stroke(Color.white, lineWidth: 1.2)
                                    .frame(width: 11, height: 11)
                            }
                        }
                        .padding(.horizontal, 4)
                    }
                    .padding(8)
                    .background(.blue)
                    .cornerRadius(16)
                    .padding(.trailing, 5)
                            
                case MessageType.Acoount.rawValue:
                    VStack {
                        HStack(spacing: 4) {
                            AvatarView(userModel: UserModel.exampleNotStories, widthHeight: 40)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.white, lineWidth: 1)
                                )
                            
                            VStack(alignment: .leading, spacing: 0) {
//                                Spacer()
                                Text("User Name")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                
//                                Spacer(minLength: 4)
                                HStack(alignment: .bottom) {
                                    Text("nick name")
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                    
//                                        Spacer()
                                }
                            }
                            .padding(.horizontal, 4)
                        }
                        
                        HStack(alignment: .bottom) {
                            
//                                Spacer()
                            
                            Text(duration)
                                .font(.footnote)
                                .foregroundColor(.white)
                            TickMark()
                                .stroke(Color.white, lineWidth: 1.2)
                                .frame(width: 11, height: 11)
                            
                            TickMarkRead()
                                .stroke(Color.white, lineWidth: 1.2)
                                .frame(width: 11, height: 11)
                        }
                    }
                    .padding(8)
                    .background(.blue)
                    .cornerRadius(16)
                    .padding(.trailing, 5)
                    
                    
                default:
                    VStack(alignment: .leading) {
                        
//                            if replyText != "" {
//                                HStack {
//                                    Text(replyText)
//                                        .foregroundColor(.white)
////                                    Spacer()
//                                }
//                            }
                        
                        Text("we are in the second group of power outages.")
                            .font(.system(size: 13, weight: .none, design: .default))
                            .foregroundColor(Color(red: 17/255, green: 16/255, blue: 58/255)) // #11103A
                        
                        HStack(alignment: .center) {
                            Spacer()
                            Text(duration)
                                .font(.system(size: 10, weight: .none, design: .default))
                                .foregroundColor(Color(red: 161/255, green: 171/255, blue: 190/255))//#A1ABBE
                                .padding(.vertical, 3)
                            
                            if !left {
                                TickMark()
                                    .stroke(Color.white, lineWidth: 1.2)
                                    .frame(width: 11, height: 11)
                                
                                TickMarkRead()
                                    .stroke(Color.white, lineWidth: 1.2)
                                    .frame(width: 11, height: 11)
                            }
                            
                        }
                        .background(.red)
                        
                        
                    }
                    .background(!left ? Color(red: 1, green: 235/255, blue: 234/255) : Color(red: 234/255, green: 236/255, blue: 239/255)) // #EAECEF
                    
//                    .padding(8)
//                    .padding(.trailing, 8)
//                        .clipShape(BubbleShape(left: false, borderTopLeft: 10, borderTopRight: 10, borderBottomRight: 10, borderBottomLeft: 10))
                }
            }
//                .padding(1)
                /// if myMessage != true
            if (left) {
                Spacer(minLength: 0)
            }
                 
//            .background(.red)
//            .padding(.leading, 54)
            
        }
//        .padding(.vertical, 5)
    }
}

struct ChatRoomItemView_Previews: PreviewProvider {
    static var previews: some View {
//        ChatRoomItemView()
        NavigationStack {
            ChatRoomView(room: RoomModel.exampleUserIsAccept2)
        }
    }
}

