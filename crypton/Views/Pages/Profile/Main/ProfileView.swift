//
//  ProfileView.swift
//  crypton
//
//  Created by Meylis on 31.01.2025.
//

import SwiftUI

struct ProfileView: View {
    
    let items: [String] = ["1", "2", "3", "4", "5", "6"]
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 0) {
            // MARK: - header
            HStack(alignment: .center, spacing: 0) {
                HStack(spacing: 0) {
                    NavigationLink(destination: QRcodeView()) {
                        Image("toolbar-settings-qrcode")
                            .resizable()
                            .renderingMode(.template)
                            .padding(4)
                            .frame(width: 32, height: 32)
                            .foregroundColor(Color(red: 161/255, green: 171/255, blue: 190/255)) // Icon color #A1ABBE
                    }
                    Spacer()
                }
                .frame(width: 64)
                
                Spacer()
                
                Text("Settings")
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .foregroundColor(Color(red: 17/255, green: 16/255, blue: 58/255)) // #11103A
                
                Spacer()
                
                HStack(spacing: 0) {
                    NavigationLink(destination: ComingSoonView(text: "Search")) {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .renderingMode(.template)
                            .padding(7)
                            .frame(width: 32, height: 32)
                            .foregroundColor(Color(red: 161/255, green: 171/255, blue: 190/255)) // Icon color #A1ABBE
                    }
                    
                    Menu() {
                        Button(action: {
                            print("Edit Profile")
                        }) {
                            Label {
                                Text("Edit Profile")
                            } icon: {
                                Image("settings-menu-edit")
                                    .renderingMode(.template)
                            }
                        }
                        Button(action: {
                            print("Set Image")
                        }) {
                            Label {
                                Text("Set Image")
                            } icon: {
                                Image("settings-menu-add-image")
                                    .renderingMode(.template)
                            }
                        }
                        Button(role: .destructive, action: {
                            showAlert = true
                        }) {
                            Label {
                                Text("Log Out")
                            } icon: {
                                Image("settings-menu-logout")
                                    .renderingMode(.template)
                            }
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
                .frame(width: 64)
                
            }
            .padding(.horizontal, 16)
            .frame(height: 44)
            // MARK: - header done
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    VStack {
                        AvatarView(userModel: UserModel.exampleNotStoriesOffline, widthHeight: 100)
                            .frame(width: 100, height: 100)
                            .padding(.top, 20)
                        
                        NicknameView(name: UserModel.exampleOnline.name, nickname: UserModel.exampleOnline.name, isVerified: false, font: 18)
                            .padding(.top, 12)
                            .padding(.bottom, 2)
                        
                        Text("+38 092 292 12 53")
                            .font(.system(size: 13, weight: .regular, design: .default))
                            .foregroundColor(Color(red: 107/255, green: 115/255, blue: 130/255)) // #6B7382
                    }
                }
                Spacer(minLength: 15)
                /// 1
                NavigationLink(destination: MyProfileView()) {
                    SettingsItemRowView(item: SettingsModel(id: UUID(), icon: "settings-profile", iconColor: nil, title: "My Profile", value: ""))
                        .padding(.vertical, 12)
                        .background(Color.white)
                        .clipShape(RoundedCorners(radius: 8))
                }
                
                Spacer(minLength: 10)
                
                /// 2
                NavigationLink(destination: ComingSoonView(text: "My Profile")) {
                    SettingsItemRowView(item: SettingsModel(id: UUID(), icon: "settings-saved", iconColor: nil, title: "Saved Messages", value: ""))
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
                NavigationLink(destination: ComingSoonView(text: "My Profile")) {
                    SettingsItemRowView(item: SettingsModel(id: UUID(), icon: "settings-folder", iconColor: nil, title: "Folders", value: "5"))
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
                NavigationLink(destination: ComingSoonView(text: "My Profile")) {
                    SettingsItemRowView(item: SettingsModel(id: UUID(), icon: "settings-accounds", iconColor: nil, title: "Accounts", value: "1"))
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
                NavigationLink(destination: ComingSoonView(text: "My Profile")) {
                    SettingsItemRowView(item: SettingsModel(id: UUID(), icon: "settings-devices", iconColor: nil, title: "Devices", value: "2"))
                        .padding(.vertical, 12)
                        .background(Color.white)
                        .clipShape(RoundedCorners(corners: [.bottomLeft, .bottomRight]))
                }
                
                Spacer(minLength: 10)
                
                /// 3
                NavigationLink(destination: ComingSoonView(text: "My Profile")) {
                    SettingsItemRowView(item: SettingsModel(id: UUID(), icon: "settings-security", iconColor: nil, title: "Security & Privacy", value: ""))
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
                NavigationLink(destination: ComingSoonView(text: "My Profile")) {
                    SettingsItemRowView(item: SettingsModel(id: UUID(), icon: "settings-notification", iconColor: nil, title: "Notifications", value: ""))
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
                NavigationLink(destination: ComingSoonView(text: "My Profile")) {
                    SettingsItemRowView(item: SettingsModel(id: UUID(), icon: "settings-languages", iconColor: nil, title: "Language", value: "English"))
                        .padding(.vertical, 12)
                        .background(Color.white)
                        .clipShape(RoundedCorners(corners: [.bottomLeft, .bottomRight]))
                }
                
                Spacer(minLength: 10)
                
                
                /// 4
                NavigationLink(destination: ComingSoonView(text: "My Profile")) {
                    SettingsItemRowView(item: SettingsModel(id: UUID(), icon: "settings-faq", iconColor: nil, title: "FAQ", value: ""))
                        .padding(.vertical, 12)
                        .background(Color.white)
                        .clipShape(RoundedCorners(radius: 8))
                }
                
                Text("Lorem ipsum dolor sin amet magna consecteur aliqua nici")
                    .font(.system(size: 10, weight: .regular, design: .default))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 107/255, green: 115/255, blue: 130/255)) // #6B7382
                    .padding(.vertical, 20)
                    .padding(.horizontal, 16)
            }
            .padding(.horizontal, 16)
        }
        
        .background(Color(red: 244/255, green: 244/255, blue: 244/255)) // #F4F4F4
        .navigationBarTitleDisplayMode(.inline)
        .alert("Confirmation", isPresented: $showAlert) {
            Button("Yes", role: .destructive) {
                showAlert = false
            }
            
            Button("No", role: .cancel) {
                showAlert = false
            }
        } message: {
            Text("Are you sure logout?")
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView(selectedTab: .settings)
    }
}

