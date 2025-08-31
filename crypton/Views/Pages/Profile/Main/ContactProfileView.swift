//
//  ContactProfileView.swift
//  crypton
//
//  Created by Meylis on 10.02.2025.
//

import SwiftUI


struct ContactProfileView: View {
    var body: some View {
        VStack(spacing: 0) {
            
            ScrollView(showsIndicators: false) {
                
                VStack(spacing: 0) {
                    
                    VStack(spacing: 0) {
                        VStack {
                            AvatarView(userModel: UserModel.exampleNotStoriesOffline, widthHeight: 100)
                                .frame(width: 100, height: 100)
                                .padding(.top, 20)
                            
                            NicknameView(name: UserModel.exampleOnline.name, nickname: UserModel.exampleOnline.name, isVerified: false, font: 18)
                                .padding(.top, 12)
                                .padding(.bottom, 2)
                            
                            Text("Online: 38 minutes ago")
                                .font(.system(size: 13, weight: .regular, design: .default))
                                .foregroundColor(Color(red: 107/255, green: 115/255, blue: 130/255)) // #6B7382
                        }
                    }
                    Spacer(minLength: 15)
                    
                    ContactProfileButtons()
                    
                    Spacer(minLength: 15)
                    
                    /// 1
                    NavigationLink(destination: ComingSoonView(text: "+38 092 292 12 53")) {
                        SettingsTwoRowView(item: SettingsModel(id: UUID(), icon: "", iconColor: nil, title: "+38 092 292 12 53", value: "Phone Number", rightIcon: false))
                            .padding(.vertical, 12)
                            .background(Color.white)
                            .clipShape(RoundedCorners(radius: 8, corners: [.topLeft, .topRight]))
                    }
                    Spacer(minLength: 0)
                    Rectangle()
                        .fill(Color(red: 234 / 255, green: 236 / 255, blue: 239 / 255))
                        .frame(height: 1)
                        .edgesIgnoringSafeArea(.horizontal)
                    /// 1
                    NavigationLink(destination: ComingSoonView(text: "User Tag")) {
                        SettingsTwoRowView(item: SettingsModel(id: UUID(), icon: "u_qrcode-scan", iconColor: nil, title: "@FirstUser228", value: "User Tag", rightIcon: false))
                            .padding(.vertical, 12)
                            .background(Color.white)
                            .clipShape(RoundedCorners(radius: 0))
                    }
                    Spacer(minLength: 0)
                    Rectangle()
                        .fill(Color(red: 234 / 255, green: 236 / 255, blue: 239 / 255))
                        .frame(height: 1)
                        .edgesIgnoringSafeArea(.horizontal)
                    /// 1
                    NavigationLink(destination: ComingSoonView(text: "About")) {
                        SettingsTwoRowView(item: SettingsModel(id: UUID(), icon: "", iconColor: nil, title: "Lorem ipsum dolor sin amet magna consecteur aliqua nici", value: "About", rightIcon: false))
                            .padding(.vertical, 12)
                            .background(Color.white)
                            .clipShape(RoundedCorners(radius: 8, corners: [.bottomLeft, .bottomRight]))
                    }
                }
                .padding(.horizontal, 16)
                
                
                VStack(spacing: 0) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 7) {
                            
                            Button(action: {
                                print("Media")
                            }) {
                                Text("Media")
                                    .font(.system(size: 13, weight: .regular, design: .default))
                                    .frame(height: 26)
                                
                                    .padding(.horizontal, 8)
                                    .background(Color(red: 1.0, green: 59/255, blue: 48/255))
                                    .foregroundColor(.white)
                                    .cornerRadius(4)
                                    .padding(.leading, 16)
                            }
                            
                            ForEach(1..<10) { i in
                                Button(action: {
                                    print("Links")
                                }) {
                                    Text("Links")
                                        .font(.system(size: 13, weight: .regular, design: .default))
                                        .frame(height: 26)
                                    
                                        .padding(.horizontal, 8)
                                        .background(Color(red: 70/255, green: 96/255, blue: 135/255, opacity: 10/255))
                                        .foregroundColor(Color(red: 161/255, green: 171/255, blue: 190/255))
                                        .cornerRadius(4)
                                }
                            }
                            Button(action: {
                                print("Links")
                            }) {
                                Text("Links")
                                    .font(.system(size: 13, weight: .regular, design: .default))
                                    .frame(height: 26)
                                
                                    .padding(.horizontal, 8)
                                    .background(Color(red: 70/255, green: 96/255, blue: 135/255, opacity: 10/255))
                                    .foregroundColor(Color(red: 161/255, green: 171/255, blue: 190/255))
                                    .cornerRadius(4)
                                    .padding(.trailing, 16)
                            }
                        }
                    }
                    .padding(.top, 20)
                    
                    GridViewContactStories()
                        .padding(.horizontal, 16)
                    
                }
                .padding(.bottom, 20)
                .background(.white)
                .padding(.top, 20)
            }
        }
        .background(Color(red: 244/255, green: 244/255, blue: 244/255)) // #F4F4F4
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("")
    }
}


struct GridViewContactStories: View {
    let images = Array(repeating: "test-story", count: 9) // Replace with actual image names
    
    let columns = [
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 5) {
                ForEach(images.indices, id: \.self) { index in
                    Image(images[index])
                        .resizable()
                        .scaledToFill()
                        .frame(height: 115) // Automatically takes equal width
                        .cornerRadius(8)
                        .clipped()
                }
            }
            .padding(.top, 15)
        }
    }
}

struct ContactProfileButtons: View {
    let columns = [
        GridItem(.flexible(), spacing: 7),
        GridItem(.flexible(), spacing: 7),
        GridItem(.flexible(), spacing: 7),
        GridItem(.flexible(), spacing: 7),
        GridItem(.flexible(), spacing: 7),
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 5) {
            
            Button(action: {
                
            }, label: {
                
                HStack(spacing: 0) {
                    Spacer()
                    VStack(spacing: 0) {
                        Image("contact-profile-chat")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(Color(red: 1.0, green: 59/255, blue: 48/255))
                            .frame(width: 24, height: 24)
                        
                        Text("Message")
                            .font(.system(size: 10, weight: .regular, design: .default))
                            .foregroundColor(Color(red: 1.0, green: 59/255, blue: 48/255))
                    }
                    Spacer()
                }
                .frame(height: 56)
                .background(.white)
                .cornerRadius(8)
            })
            
            
            Button(action: {
                
            }, label: {
                
                HStack(spacing: 0) {
                    Spacer()
                    VStack(spacing: 0) {
                        Image("contact-profile-call")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(Color(red: 1.0, green: 59/255, blue: 48/255))
                            .frame(width: 24, height: 24)
                        
                        Text("Message")
                            .font(.system(size: 10, weight: .regular, design: .default))
                            .foregroundColor(Color(red: 1.0, green: 59/255, blue: 48/255))
                    }
                    Spacer()
                }
                .frame(height: 56)
                .background(.white)
                .cornerRadius(8)
            })
            
            
            Button(action: {
                
            }, label: {
                
                HStack(spacing: 0) {
                    Spacer()
                    VStack(spacing: 0) {
                        Image("contact-profile-video")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(Color(red: 1.0, green: 59/255, blue: 48/255))
                            .frame(width: 24, height: 24)
                        
                        Text("Message")
                            .font(.system(size: 10, weight: .regular, design: .default))
                            .foregroundColor(Color(red: 1.0, green: 59/255, blue: 48/255))
                    }
                    Spacer()
                }
                .frame(height: 56)
                .background(.white)
                .cornerRadius(8)
            })
            
            
            Button(action: {
                
            }, label: {
                
                HStack(spacing: 0) {
                    Spacer()
                    VStack(spacing: 0) {
                        Image("contact-profile-mute")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(Color(red: 1.0, green: 59/255, blue: 48/255))
                            .frame(width: 24, height: 24)
                        
                        Text("Message")
                            .font(.system(size: 10, weight: .regular, design: .default))
                            .foregroundColor(Color(red: 1.0, green: 59/255, blue: 48/255))
                    }
                    Spacer()
                }
                .frame(height: 56)
                .background(.white)
                .cornerRadius(8)
            })
            
            
            Button(action: {
                
            }, label: {
                
                HStack(spacing: 0) {
                    Spacer()
                    VStack(spacing: 0) {
                        Image("more-hor")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(Color(red: 1.0, green: 59/255, blue: 48/255))
                            .frame(width: 24, height: 24)
                        
                        Text("Message")
                            .font(.system(size: 10, weight: .regular, design: .default))
                            .foregroundColor(Color(red: 1.0, green: 59/255, blue: 48/255))
                    }
                    Spacer()
                }
                .frame(height: 56)
                .background(.white)
                .cornerRadius(8)
            })
            
        }
    }
}


struct ContactProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ContactProfileView()
    }
}

