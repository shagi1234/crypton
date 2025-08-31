//
//  MyProfileView.swift
//  crypton
//
//  Created by Meylis on 05.02.2025.
//

import SwiftUI

struct MyProfileView: View {
    
    let items: [String] = ["1", "2", "3", "4", "5", "6"]
    @State private var showStories = false
    
    @State private var showAlert = false
    @State private var showSnackbar = false
    @State private var snackbarMessage = ""
    @State private var snackbarStatus = SnackbarStatus.success
    
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
                            
                            Text("Online")
                                .font(.system(size: 13, weight: .regular, design: .default))
                                .foregroundColor(Color(red: 46/255, green: 206/255, blue: 91/255)) // #2ECE5B
                        }
                    }
                    Spacer(minLength: 15)
                    /// 1
                    NavigationLink(destination: ComingSoonView(text: "Name")) {
                        SettingsItemRowView(item: SettingsModel(id: UUID(), icon: "", iconColor: nil, title: "Name", value: "Player12", rightIcon: false))
                            .padding(.vertical, 12)
                            .background(Color.white)
                            .clipShape(RoundedCorners(radius: 8, corners: [.topLeft, .topRight]))
                    }
                    
                    Spacer(minLength: 0)
                    Rectangle()
                        .fill(Color(red: 234 / 255, green: 236 / 255, blue: 239 / 255)) // #EAECEF color
                        .frame(height: 1) // Adjust height for the line thickness
                        .edgesIgnoringSafeArea(.horizontal) // Make it span the width of the screen (optional)
                    Spacer(minLength: 0)
                    NavigationLink(destination: EditPhoneNumber(onProfileUpdated: {status, message in
                        snackbarMessage = message
                        showSnackbar = true
                        snackbarStatus = status
                    })) {
                        SettingsItemRowView(item: SettingsModel(id: UUID(), icon: "", iconColor: nil, title: "Phone Number", value: "+38 092 292 12 53", rightIcon: false))
                            .padding(.vertical, 12)
                            .background(Color.white)
                            .clipShape(RoundedCorners(radius: 0))
                    }
                    
                    Spacer(minLength: 0)
                    Rectangle()
                        .fill(Color(red: 234 / 255, green: 236 / 255, blue: 239 / 255)) // #EAECEF color
                        .frame(height: 1) // Adjust height for the line thickness
                        .edgesIgnoringSafeArea(.horizontal) // Make it span the width of the screen (optional)
                    Spacer(minLength: 0)
                    NavigationLink(destination: EditUserTagView(onProfileUpdated: {status, message in
                        snackbarMessage = message
                        showSnackbar = true
                        snackbarStatus = status
                    })) {
                        SettingsItemRowView(item: SettingsModel(id: UUID(), icon: "", iconColor: nil, title: "User Tag", value: "@FirstUser228", rightIcon: false))
                            .padding(.vertical, 12)
                            .background(Color.white)
                            .clipShape(RoundedCorners(radius: 0))
                    }
                    
                    Spacer(minLength: 0)
                    Rectangle()
                        .fill(Color(red: 234 / 255, green: 236 / 255, blue: 239 / 255)) // #EAECEF color
                        .frame(height: 1) // Adjust height for the line thickness
                        .edgesIgnoringSafeArea(.horizontal) // Make it span the width of the screen (optional)
                    Spacer(minLength: 0)
                    NavigationLink(destination: ComingSoonView(text: "About")) {
                        SettingsItemRowView(item: SettingsModel(id: UUID(), icon: "", iconColor: nil, title: "About", value: "...", rightIcon: false))
                            .padding(.vertical, 12)
                            .background(Color.white)
                            .clipShape(RoundedCorners(corners: [.bottomLeft, .bottomRight]))
                    }
                    
                    Spacer(minLength: 10)
                    
                    /// 2
                    NavigationLink(destination: ComingSoonView(text: "Channels")) {
                        SettingsItemRowView(item: SettingsModel(id: UUID(), icon: "", iconColor: nil, title: "Channels", value: "Create", rightIcon: false, valueColor: Color(red: 1.0, green: 59/255, blue: 48/255)))
                            .padding(.vertical, 12)
                            .background(Color.white)
                            .clipShape(RoundedCorners(radius: 8))
                    }
                }
                .padding(.horizontal, 16)
                
                
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Text("Recent Stories")
                            .font(.system(size: 14, weight: .semibold, design: .default))
                            .foregroundColor(Color(red: 17/255, green: 16/255, blue: 58/255)) // Text color #11103A
                            .padding(.horizontal, 16)
                            .padding(.top, 20)
                        
                        Spacer()
                    }
                    
                    if showStories {
                        GridView()
                            .padding(.horizontal, 16)
                    } else {
                        VStack(spacing: 0) {
                            
                            Spacer(minLength: 50)
                            
                            Image("")
                            .frame(width: 42, height: 42)
                            .background(.gray)
                            
                            Text("No Stories")
                                .font(.system(size: 13, weight: .regular, design: .default))
                                .foregroundColor(Color(red: 107/255, green: 115/255, blue: 130/255)) // Text color #11103A
                                .padding(.horizontal, 16)
                                .padding(.top, 20)
                        }
                        .onTapGesture {
                            showStories.toggle()
                        }
                        
                        Spacer(minLength: 100)
                    }
                    
                }
                .padding(.bottom, 20)
                .background(.white)
                .padding(.top, 20)
            }
        }
        .background(Color(red: 244/255, green: 244/255, blue: 244/255)) // #F4F4F4
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("My Profile")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack(spacing: 0) {
                    NavigationLink(destination: EditProfileView(onProfileUpdated: {status, message in
                        snackbarMessage = message
                        showSnackbar = true
                        snackbarStatus = status
                    })) {
                        Text("Edit")
                            .font(.system(size: 14, weight: .semibold, design: .default))
                            .foregroundStyle(Color(red: 1.0, green: 59/255, blue: 48/255))
//                            .padding(.horizontal, 16)
                    }
                }
            }
        }
        .overlay(
            Group {
                if showSnackbar {
                    Snackbar(message: snackbarMessage, status: snackbarStatus, isPresented: $showSnackbar)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                showSnackbar = false
                            }
                        }
                }
            }
        )
    }
}

struct GridView: View {
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
                        .frame(height: 156) // Automatically takes equal width
                        .cornerRadius(8)
                        .clipped()
                }
            }
            .padding(.top, 15)
        }
    }
}


struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MyProfileView()
        }
    }
}

