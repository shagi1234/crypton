//
//  EnterPasswordView.swift
//  crypton
//
//  Created by Meylis on 25.01.2025.
//

import SwiftUI

struct EnterPasswordView: View {
    
    @State private var password: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    @State private var timeRemaining = 0
    @State private var showButton = false
    @State private var isLoading = false
    @State private var isPasswordVisible: Bool = false
    @State private var shouldNavigate = false
    
    @State private var buttonImage = "test-avatar"
    
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
                
            }
            .padding(.top, 44)
            .padding(.top, 44)
            .padding(.top, 16)
            .padding(.bottom, 20)
            
            Text("Enter Password")
                .padding(.bottom, 10)
                .font(.system(size: 18, weight: .bold, design: .default))
                .foregroundColor(Color(red: 17/255, green: 16/255, blue: 58/255)) // #11103A
            
            Text("Lorem ipsum dolor sin amet magna consecteur aliqua nici")
                .font(.system(size: 13, weight: .regular, design: .default))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 107/255, green: 115/255, blue: 130/255)) // #6B7382
                .padding(.horizontal, 24)
                .padding(.bottom, 30)
            
            HStack {
                if isPasswordVisible {
                    TextField("******", text: $password)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(Color(red: 17/255, green: 16/255, blue: 58/255)) // Text color #11103A
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                } else {
                    SecureField("******", text: $password)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(Color(red: 17/255, green: 16/255, blue: 58/255)) // Text color #11103A
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
                
                Button(action: {
                    isPasswordVisible.toggle()
                }) {
                    Text(isPasswordVisible ? "Hide" : "Show")
                        .font(.system(size: 12, weight: .semibold, design: .default))
                        .foregroundColor(Color(red: 17/255, green: 16/255, blue: 58/255)) // Text color #11103A
                        
//                        .textDecoration(.fromFont, skipInk: false)
                        .frame(alignment: .trailing)
                }
            }
            .frame(maxHeight: 20)
            .padding(.horizontal, 10)
            .padding(.vertical, 8)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .padding(.horizontal, 16)
            
            Button(action: {
                print("Resend tapped")
            }) {
                Text("Forgot Password?")
                    .font(.system(size: 14, weight: .semibold)) // Font size 14px, weight 600 (Semibold)
                    .foregroundColor(Color(red: 255/255, green: 59/255, blue: 48/255)) // Text color #FF3B30
                    .multilineTextAlignment(.leading)
            }
            .buttonStyle(BorderlessButtonStyle())
            .padding(.vertical, 28)
            
            CustomButton(
                title: isLoading ? "": "Confirm",
                backgroundColor: (password == "") ? UIColor(red: 107/255, green: 115/255, blue: 130/255, alpha: 1.0) : UIColor(red: 255/255, green: 59/255, blue: 48/255, alpha: 1.0)) {
                    print("Button tapped!")
                    isLoading = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        isLoading = false
                        shouldNavigate = true
                    }
                }
                .navigationDestination(isPresented: $shouldNavigate) {
                    RecoveryEmailView()
                }
                .padding(.horizontal)
            
            Spacer()
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("2FA")
        .edgesIgnoringSafeArea(.all)
//        .navigationBarBackButtonHidden(true)
//        .navigationBarItems(leading: btnBack)
    }
}

#Preview {
    NavigationStack {
        EnterPasswordView()
    }
}

