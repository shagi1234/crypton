//
//  CreateProfileView.swift
//  crypton
//
//  Created by Meylis on 25.01.2025.
//

import SwiftUI

struct CreateProfileView: View {
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    
    @Environment(\.dismiss) var dismiss
    @State private var shouldNavigate = false
    
    @State private var timeRemaining = 0
    @State private var showButton = false
    @State private var isLoading = false
    
    @State private var buttonImage = ""
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image("back")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color(red: 161 / 255, green: 171 / 255, blue: 190 / 255)) // #A1ABBE
                    .frame(width: 24, height: 24)
            }
        }
    }
    
    var body: some View {
        VStack {
            CircleButton(
                image: buttonImage,
                backgroundColor: UIColor(red: 1.0, green: 235/255, blue: 234/255, alpha: 1.0)
            ) {
                buttonImage = buttonImage.isEmpty ? "test-avatar" : ""
            }
            .padding(.top, 44)
            .padding(.top, 44)
            .padding(.top, 16)
            .padding(.bottom, 20)
            
            Text("Create a Profile")
                .padding(.bottom, 10)
                .font(.system(size: 18, weight: .bold, design: .default))
                .foregroundColor(Color(red: 17/255, green: 16/255, blue: 58/255)) // #11103A
            
            Text("Lorem ipsum dolor sin amet magna consecteur aliqua nici")
                .font(.system(size: 13, weight: .regular, design: .default))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 107/255, green: 115/255, blue: 130/255)) // #6B7382
                .padding(.horizontal, 24)
                .padding(.bottom, 30)
            
            TextField("Last Name", text: $lastName)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(Color(red: 17/255, green: 16/255, blue: 58/255)) // Text color #11103A
                .padding(.horizontal, 10)
                .padding(.vertical, 8)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal, 16)
            
            TextField("First Name", text: $firstName)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(Color(red: 17/255, green: 16/255, blue: 58/255)) // Text color #11103A
                .padding(.horizontal, 10)
                .padding(.vertical, 8)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal, 16)
                .padding(.top, 4)
            
            VStack {
                Text("Lorem ipsum dolor sin amet magna consecteur aliqua nici consequat Consecteur aliqua nici consequat")
                    .font(.system(size: 9, weight: .regular, design: .default))
                    .foregroundColor(Color(red: 0.4196, green: 0.4471, blue: 0.5098))
                + Text(" Terms of Service")
                    .font(.system(size: 9, weight: .regular, design: .default))
                    .foregroundColor(.red)
            }
            .onTapGesture {
                print("Terms tapped")
            }
            .multilineTextAlignment(.center)
            .padding()
            .padding(.bottom, 5)
            .padding(.horizontal, 16)
            
            CustomButton(
                title: isLoading ? "": "Continue",
                backgroundColor: (lastName == "") ? UIColor(red: 107/255, green: 115/255, blue: 130/255, alpha: 1.0) : UIColor(red: 255/255, green: 59/255, blue: 48/255, alpha: 1.0)) {
                    print("Button tapped!")
                    
                    isLoading = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        isLoading = false
                        shouldNavigate = true
                    }
                }
                .navigationDestination(isPresented: $shouldNavigate) {
                    EnterPasswordView()
                }
                .padding(.horizontal)
            
            Spacer()
            
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
    }
}

struct CircleButton: View {
    let image: String
    let backgroundColor: UIColor
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            
            if image.isEmpty {
                Image("add_a_photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.red)
                    .padding(20)
            } else {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
            }
            
        }
        .frame(width: 100, height: 100)
        .background(
            Color(backgroundColor)
        )
        .clipShape(Circle())
    }
}

#Preview {
    NavigationStack {
        CreateProfileView()
    }
}
