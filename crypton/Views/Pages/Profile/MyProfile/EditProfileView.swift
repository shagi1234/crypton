//
//  EditProfileView.swift
//  crypton
//
//  Created by Meylis on 07.02.2025.
//

import SwiftUI

struct EditProfileView: View {
    
    let items: [String] = ["1", "2", "3", "4", "5", "6"]
    @State private var showStories = false
    @State private var editText: String = ""
    @State private var textInput: String = ""
    private let characterLimit = 15
    @Environment(\.dismiss) var dismiss
    @State private var showingProgress = false
    var onProfileUpdated: (SnackbarStatus, String) -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            
//            ScrollView(showsIndicators: false) {
                
                VStack(spacing: 0) {
                    
                    VStack(spacing: 0) {
                        VStack {
                            AvatarView(userModel: UserModel.exampleNotStoriesOffline, widthHeight: 64)
                                .frame(width: 64, height: 64)
                                .padding(.top, 20)
                            
                            HStack(spacing: 10) {
                                Image("add_a_photo")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 24, height: 24)
                                
                                Text("Set Image")
                                    .font(.system(size: 13, weight: .regular, design: .default))
                                    .foregroundColor(Color(red: 1.0, green: 59/255, blue: 48/255))
                            }
                            .padding(.top, 12)
                            
                        }
                    }
                    Form {
                        Section(footer:
                            Text("Lorem ipsum dolor sin amet magna consecteur aliqua nici.")
                                .foregroundColor(Color(red: 107/255, green: 115/255, blue: 130/255)) // #6B7382
//                            .padding(.top, 12)
                        ) {
                            TextField("Name", text: $editText)
                            TextField("Last name", text: $editText)
                        }
                        
                        Section(footer:
                                    Text("Lorem ipsum dolor sin amet magna consecteur aliqua nici.")
                                        .foregroundColor(Color(red: 107/255, green: 115/255, blue: 130/255)) // #6B7382
                                        
                        ) {
                            ZStack(alignment: .topLeading) {
                                if textInput.isEmpty {
                                    Text("About me...")
                                        .foregroundColor(Color(uiColor: .placeholderText))
                                        .padding(.top, 8)
                                        .padding(.leading, 5)
                                }
                                
                                TextEditor(text: $textInput)
                                    .frame(height: 60)
                                    .onChange(of: textInput) { newValue in
                                        if newValue.count > characterLimit {
                                            textInput = String(newValue.prefix(characterLimit))
                                        }
                                    }
                            }
                            .overlay(
                                Text("\(textInput.count)/\(characterLimit)")
                                    .font(.footnote)
                                    .foregroundColor(.gray),
                                alignment: .bottomTrailing
                            )
                        }
                    }
                }
//                .padding(.horizontal, 16)
                
//            }
        }
        .background(Color(red: 244/255, green: 244/255, blue: 244/255)) // #F4F4F4
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Edit Profile")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack(spacing: 0) {
                    if showingProgress {
                        ProgressView()
                    } else {
                        Button(action: {
                            showingProgress = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                showingProgress = false
                                
                                onProfileUpdated(.default, "Profile updated successfully!")
                                // onProfileUpdated(.default, "Failed to update profile.")
                                
                                dismiss()
                            }
                        }) {
                            Text("Done")
                                .font(.system(size: 14, weight: .semibold, design: .default))
                                .foregroundStyle(Color(red: 1.0, green: 59/255, blue: 48/255))
//                                .padding(.horizontal, 16)
                        }
                    }
                }
            }
        }
    }
}


struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditProfileView(onProfileUpdated: {_,_ in
                print("Profile updated successfully!")
            })
        }
    }
}

