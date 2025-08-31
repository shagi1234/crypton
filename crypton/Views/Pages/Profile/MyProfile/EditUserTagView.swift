//
//  EditUserTagView.swift
//  crypton
//
//  Created by Meylis on 07.02.2025.
//

import SwiftUI

struct EditUserTagView: View {
    
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
                    
                    Form {
                        Section(footer:
                            VStack {
                                Text("Lorem ipsum dolor sin amet magna consecteur consequat laborem sin dolorem magna.")
                                    .font(.system(size: 12, weight: .regular, design: .default))
                                    .foregroundColor(Color(red: 0.4196, green: 0.4471, blue: 0.5098))
                                + Text("  Read more")
                                    .font(.system(size: 12, weight: .bold, design: .default))
                                    .foregroundColor(Color(red: 0.4196, green: 0.4471, blue: 0.5098))
                            }
                            .onTapGesture {
                                print("Terms tapped")
                            }
                     
//                            .padding(.top, 12)
                        ) {
                            HStack {
                                Text("@")
                                    .foregroundColor(.gray)

                                TextField("username", text: $editText)
                                    .textInputAutocapitalization(.never)
                                    .disableAutocorrection(true)
                                    .onChange(of: editText) { newValue in
                                        if newValue.contains("@") {
                                            editText = newValue.replacingOccurrences(of: "@", with: "")
                                        }
                                    }
                            }
                        }
                    }
                }
//                .padding(.horizontal, 16)
                
//            }
        }
        .background(Color(red: 244/255, green: 244/255, blue: 244/255)) // #F4F4F4
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("User Tag")
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
                                
                                onProfileUpdated(.default, "UserTag updated successfully!")
                                // onProfileUpdated(.default, "Failed to update profile.")
                                
                                dismiss()
                            }
                        }) {
                            Text("Done")
                                .font(.system(size: 14, weight: .semibold, design: .default))
                                .foregroundStyle(Color(red: 1.0, green: 59/255, blue: 48/255))
                        }
                    }
                }
            }
        }
    }
}


struct EditUserTagView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditUserTagView(onProfileUpdated: {_,_ in
                print("Profile updated successfully!")
            })
        }
    }
}


