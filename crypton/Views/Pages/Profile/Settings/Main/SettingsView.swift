//
//  SettingsView.swift
//  crypton
//
//  Created by Meylis on 04.02.2025.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var showAlert = false
    @State private var showSnackbar = false
    @State private var snackbarMessage = ""
    @State private var snackbarStatus = SnackbarStatus.success
    
    var body: some View {
        List {
            
//            Section {
//                NavigationLink(destination: UpdateProfileView(onProfileUpdated: {status, message in
//                    snackbarMessage = message
//                    showSnackbar = true
//                    snackbarStatus = status
//                })) {
//                    SettingsItemRowView(item: SettingsModel(id: UUID(), icon: "", iconColor: nil, title: "Update profile", value: ""))
//                }
//            }
//            
//            Section {
//                NavigationLink(destination: UpdateThemeView()) {
//                    SettingsItemRowView(item: SettingsModel(id: UUID(), icon: "", iconColor: nil, title: "Update theme", value: ""))
//                }
//            }
//            Section {
//                NavigationLink(destination: UpdateUserNameView()) {
//                    SettingsItemRowView(item: SettingsModel(id: UUID(), icon: "at.circle.fill", iconColor: .indigo, title: "User name", value: "maksat.01"))
//                }
//                NavigationLink(destination: UpdatePhoneNumberView()) {
//                    SettingsItemRowView(item: SettingsModel(id: UUID(), icon: "phone.circle.fill", iconColor: .green, title: "Phone number", value: "+993 64844835"))
//                }
//                Button(action: {
//                    showAlert = true
//                }) {
//                    SettingsItemRowView(item: SettingsModel(id: UUID(), icon: "icloud.circle.fill", iconColor: .blue, title: "Clear cache", value: "25.5 MB"))
//                }
//            }
//            
//            Section {
//                NavigationLink(destination: UpdateSequreView()) {
//                    SettingsItemRowView(item: SettingsModel(id: UUID(), icon: "lock.circle.fill", iconColor: .red, title: "Sequre", value: ""))
//                }
//                NavigationLink(destination: DevicesView()) {
//                    SettingsItemRowView(item: SettingsModel(id: UUID(), icon: "tv.circle.fill", iconColor: .blue, title: "Devices", value: ""))
//                }
//                NavigationLink(destination: LanguageView()) {
//                    SettingsItemRowView(item: SettingsModel(id: UUID(), icon: "a.circle.fill", iconColor: .black.opacity(0.6), title: "Language", value: ""))
//                }
//            }
//            
//            Section {
//                
//                NavigationLink(destination: UpdateNotificationView()) {
//                    SettingsItemRowView(item: SettingsModel(id: UUID(), icon: "bell.circle.fill", iconColor: .red, title: "Notification", value: ""))
//                }
//                NavigationLink(destination: ConfidentialityView()) {
//                    SettingsItemRowView(item: SettingsModel(id: UUID(), icon: "eye.circle.fill", iconColor: .black.opacity(0.6), title: "Confidentiality", value: ""))
//                }
//                
//            }
//            
//            Section {
//                NavigationLink(destination: UpdateNotificationView()) {
//                    SettingsItemRowView(item: SettingsModel(id: UUID(), icon: "person.crop.circle.dashed.circle.fill", iconColor: .red, title: "Black list", value: ""))
//                }
//            }
//            
//            Section {
//                NavigationLink(destination: UpdateNotificationView()) {
//                    SettingsItemRowView(item: SettingsModel(id: UUID(), icon: "square.and.pencil.circle.fill", iconColor: .indigo, title: "Salam technical support", value: ""))
//                }
//                NavigationLink(destination: UpdateNotificationView()) {
//                    SettingsItemRowView(item: SettingsModel(id: UUID(), icon: "hand.raised.circle.fill", iconColor: .green, title: "Privacy policy", value: ""))
//                }
//                NavigationLink(destination: UpdateNotificationView()) {
//                    SettingsItemRowView(item: SettingsModel(id: UUID(), icon: "info.circle.fill", iconColor: .green, title: "Terms of use", value: ""))
//                }
//                
//                NavigationLink(destination: ConfidentialityView()) {
//                    SettingsItemRowView(item: SettingsModel(id: UUID(), icon: "info.circle.fill", iconColor: .blue, title: "About us", value: ""))
//                }
//            }
            
            Section {
                Button(action: {
                    showAlert = true
                }) {
                    SettingsItemRowView(item: SettingsModel(id: UUID(), icon: "square.and.arrow.up.circle.fill", iconColor: .red, title: "Exit", value: ""))
                }
            }
            
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
        .listStyle(.automatic)
        .alert("Confirmation", isPresented: $showAlert) {
            Button("Yes", role: .destructive) {
                showAlert = false
            }
            
            Button("No", role: .cancel) {
                showAlert = false
            }
        } message: {
            Text("alertMessage")
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


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
