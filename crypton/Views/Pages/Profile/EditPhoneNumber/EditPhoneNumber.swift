//
//  EditPhoneNumber.swift
//  crypton
//
//  Created by Meylis on 07.02.2025.
//

import SwiftUI

struct EditPhoneNumber: View {
    
    let items: [String] = ["1", "2", "3", "4", "5", "6"]
    @State private var showStories = false
    @State private var editText: String = ""
    @State private var textInput: String = ""
    private let characterLimit = 15
    @Environment(\.dismiss) var dismiss
    @State private var showingProgress = false
    var onProfileUpdated: (SnackbarStatus, String) -> Void
    @State private var shouldNavigate = false
    @State private var isLoading = false
    
    var body: some View {
        VStack(spacing: 0) {
            Image("")
                .frame(width: 180, height: 180)
                .background(.gray)
            
            Text("Change Number")
                .font(.system(size: 22, weight: .bold, design: .default))
                .foregroundColor(Color(red: 17/255, green: 16/255, blue: 58/255)) // #11103A
                .padding(.top, 20)
            
            Text("Lorem ipsum dolor sin amet magna consecteur aliqua nici consequat labore nici.")
                .font(.system(size: 13, weight: .regular, design: .default))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 107/255, green: 115/255, blue: 130/255)) // #6B7382
                .padding(.horizontal, 16)
                .padding(.top, 12)
            
            Text("Save +38 092 292 12 53")
                .font(.system(size: 14, weight: .semibold, design: .default))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 1.0, green: 59/255, blue: 48/255))
                .padding(.horizontal, 16)
                .padding(.top, 35)
            
            NavigationLink(destination: EnterPasswordView()) {
                Spacer()
                Text("Change Number")
                    .font(.system(size: 14, weight: .bold, design: .default))
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(.vertical, 14)
            .background(Color(red: 1.0, green: 59/255, blue: 48/255))
            .cornerRadius(12)
            .padding(.horizontal, 16)
            .padding(.top, 35)
            
            Spacer()
        }
        .padding(.top, 80)
        .background(.white)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("")
    }
}


struct EditPhoneNumber_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditPhoneNumber(onProfileUpdated: {_,_ in
                print("Profile updated successfully!")
            })
        }
    }
}

