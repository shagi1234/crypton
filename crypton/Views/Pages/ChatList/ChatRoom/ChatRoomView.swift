//
//  ChatRoomView.swift
//  crypton
//
//  Created by Meylis on 31.01.2025.
//

import SwiftUI
import Combine

struct Message: Identifiable {
    let id = UUID()
    let user: String
    let content: String
    let timestamp: String
}

struct ChatRoomView: View {
    @State private var showCallView = false
    @State private var showPlayerView = true
    
    @State private var newMessage: String = ""
    @State private var textViewHeight: CGFloat = 20
    
    @State var room: RoomModel
    @State var messages: [Message]
    
    init(room: RoomModel) {
        self.room = room
        self.messages = [
            Message(user: "User1", content: "Hello!", timestamp: "10:00 AM")
        ]
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer(minLength: 7)
            Rectangle()
                .fill(Color(red: 234 / 255, green: 236 / 255, blue: 239 / 255))
                .frame(height: 1)
                .edgesIgnoringSafeArea(.horizontal)
            
            if showPlayerView {
                ChatRoomHeaderPlayerView(xmarkCallBack: {
                    showPlayerView = false
                })
            }
            
            ChatRoomHeaderPinsView()
            
            Spacer(minLength: 0)
            
            VStack(spacing: 0) {
                List {
                    
                    ForEach(1...1, id: \.self) { index in
                        
                        Section {
                            
                            // MARK: - left TEXT
                            ChatRoomItemTextCellView(isLeft: true, text: "we are in the second group of power outages, from the 7th to the 13th our power will be turned off from 15-00 to 18-00")

                            ChatRoomItemTextCellView(isLeft: true,text: "we are in the")
                            
                            ChatRoomItemTextCellView(isLeft: true, text: "we are in the second group of power outages, from the 7th to the 13th our power will be turned")
                            
                            
                            // MARK: - unread header
                            
                            UnreaderHeader()
                            
                            
                            // MARK: - right TEXT
                            
                            ChatRoomItemTextCellView(isLeft: false, text: "we are in the")
                            
                            ChatRoomItemTextCellView(isLeft: false, text: "we are in the second group of power outages, from the 7th to the 13th our power will be turned off from 15-00 to 18-00")
                            
                            ChatRoomItemTextCellView(isLeft: false, text: "we are in the")
                            
                            ChatRoomItemTextCellView(isLeft: false, text: "we are in the second group of power outages, from the 7th to the 13th our power will be turned")
                            
                            
                            // MARK: - VOICE
                            ChatRoomItemVoiceCellView(isLeft: true, text: "File_303212103120.pdf")
                                .padding(.top, 8)
                            
                            ChatRoomItemVoiceCellView(isLeft: false, text: "File_303212103120.pdf")
                                .padding(.top, 8)
                            
                            
                            // MARK: - FILE
                            ChatRoomItemFileCellView(isLeft: true, text: "File_303212103120.pdf")
                                .padding(.top, 8)
                            
                            ChatRoomItemFileCellView(isLeft: false, text: "File_303212103120.pdf")
                                .padding(.top, 8)
                            
                            
                        } header: {
                            ChatRoomHeaderDateView(title: "00:0\(index)")
                        } footer: {
                            
                        }
                        .listSectionSpacing(.zero)
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color(Color.clear))
                        .listRowInsets(EdgeInsets())
                        .listSectionSeparator(.hidden)
                    }
                }
                .listStyle(.grouped)
                .background(Color.white)
                .scrollContentBackground(.hidden)
                
                VStack(spacing: 0) {
                    Rectangle()
                        .frame(height: 0.5)
                        .foregroundColor(.black.opacity(0.3))
                        .padding(0)
                    
                    HStack(alignment: .bottom, spacing: 0) {
                        Button(action: {
                            //                    sendMessage() // Function to send a new message
                        }) {
                            Image(systemName: "paperclip")
                                .font(.title2)
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .foregroundColor(.gray)
                                .fontWeight(.medium)
                        }
                        //                    .background(Color.red)
                        
                        VStack {
                            TextField(
                                "message", text: $newMessage, axis: .vertical
                            )
                            .lineLimit(4)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 15)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerSize: .init(width: 20, height: 20)))
                        }
                        .padding(.vertical, 4)
                        
                        if newMessage.isEmpty {
                            Button(action: {
                                // microphone
                            }) {
                                Image(systemName: "microphone")
                                    .font(.title2)
                                    .padding(.horizontal)
                                    .padding(.vertical, 8)
                                    .foregroundColor(.gray)
                                    .fontWeight(.medium)
                            }
                        } else {
                            Button(action: {
                                sendMessage()
                            }) {
                                Image(systemName: "arrow.up.circle.fill")
                                    .resizable()
                                    .frame(width: 38, height: 38)
                                    .fontWeight(.medium)
                            }
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                        }
                    }
                }
                .background(Color(UIColor.systemGroupedBackground))
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack {
                    AvatarView(userModel: room.user, widthHeight: 40)
                        .frame(width: 40, height: 40)
                        .padding(.trailing, 4)
                    VStack(alignment: .leading) {
                        HStack {
                            NicknameView(name: room.user.name, nickname: room.user.nickname, isVerified: room.user.isVerified, font: 14, iconFont: .caption)
                            Image(systemName: "bell.slash.fill")
                                .font(.caption2)
                                .foregroundColor(.gray)
                        }
                        
                        let color: Color = room.user.activeStatus == ActiveStatusEnum.online.rawValue ? .blue : .gray
                        Text("online")
                            .font(.caption)
                            .foregroundColor(color)
                            .lineLimit(2)
                    }
//                    .background(Color.black)
                }
//                .background(.red)
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack(spacing: 0) {
                    NavigationLink(destination: ComingSoonView(text: "Call")) {
                        Image("phone-outline")
                            .resizable()
                            .renderingMode(.template)
                            .padding(4)
                            .frame(width: 32, height: 32)
                            .foregroundColor(Color(red: 161/255, green: 171/255, blue: 190/255))
                            .onTapGesture {
                                showCallView = true
                            }
                    }
                    Spacer(minLength: 0) // No space between items
                    NavigationLink(destination: ComingSoonView(text: "Search")) {
                        Image("search")
                            .resizable()
                            .renderingMode(.template)
                            .padding(4)
                            .frame(width: 32, height: 32)
                            .foregroundColor(Color(red: 161/255, green: 171/255, blue: 190/255)) // Icon color #A1ABBE
                    }
                    Spacer(minLength: 0) // No space between items
                    Menu {
                        Button(action: {
                            print("Настройки нажаты")
                        }) {
                            Label("Настройки", systemImage: "gear")
                        }
                        Button(action: {
                            print("Помощь нажата")
                        }) {
                            Label("Помощь", systemImage: "questionmark.circle")
                        }
                        Button(action: {
                            print("Выход нажата")
                        }) {
                            Label("Выход", systemImage: "arrow.right.circle")
                        }
                    } label: {
                        Image("more-vert")
                            .resizable()
                            .renderingMode(.template)
                            .padding(4)
                            .frame(width: 32, height: 32)
                            .foregroundColor(Color(red: 161/255, green: 171/255, blue: 190/255)) // Icon color #A1ABBE
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $showCallView) {
            IncommingCallView(showCallView: $showCallView)
        }
        .toolbar(.hidden, for: .tabBar)
        .toolbarRole(.editor)
        .accentColor(Color(red: 161/255, green: 171/255, blue: 190/255)) // Icon color #A1ABBE
    }
    
    private func sendMessage() {
        // Function to handle sending a message
        let timestamp = getCurrentTimestamp() // Get the current timestamp
        let newMsg = Message(user: room.user.name, content: newMessage, timestamp: timestamp) // Create a new message
        messages.append(newMsg) // Add the new message to the list
        newMessage = "" // Clear the text field
    }
    
    private func getCurrentTimestamp() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a" // Format for the timestamp
        return formatter.string(from: Date()) // Return the current time
    }
}

struct ChatRoomView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ChatRoomView(room: RoomModel.exampleMessageText)
        }
    }
}
