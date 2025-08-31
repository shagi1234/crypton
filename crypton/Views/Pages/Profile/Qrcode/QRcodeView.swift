//
//  QRcodeView.swift
//  crypton
//
//  Created by Meylis on 04.02.2025.
//

import SwiftUI
import Kingfisher

struct QRcodeView: View {
    @Environment(\.dismiss) var dismiss
    @State private var shouldNavigate = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image("back")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .padding(4)
                    .frame(width: 32, height: 32)
                    .foregroundColor(Color(red: 161/255, green: 171/255, blue: 190/255))
            }
        }
    }
    
    let qrCodeURL = "https://images.all-free-download.com/images/graphiclarge/qr_code_198897.jpg"
    
    var body: some View {
        VStack(spacing: 0) {
            LinearGradient(gradient: Gradient(colors: [Color.white, Color(red: 255/255, green: 216/255, blue: 214/255)]), startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea() // Makes the gradient cover the entire screen
                        .overlay(
                            VStack(spacing: 0) {
                                
                                VStack(spacing: 0) {
                                    ZStack {
                                        Image("settings-qrcode-background")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 286, height: 356)
                                            .padding(.horizontal, 5)
                                            .padding(.top, 5)
                                
                                        VStack(spacing: 0) {
                                            AvatarView(userModel: UserModel.exampleNotStoriesOffline, widthHeight: 64)
                                                .frame(width: 64, height: 64)
                                                .padding(.top, 25)
                                                .padding(.bottom, 30)
                                            
                                            KFImage(URL(string: qrCodeURL))
                                                .placeholder {
                                                    ProgressView().tint(.white)
                                                }
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 140, height: 140)
                                                .cornerRadius(2)
                                            
                                            NicknameView(name: UserModel.exampleOnline.name, nickname: UserModel.exampleOnline.name, isVerified: false, font: 22, color: .white)
                                                .padding(.vertical, 30)
                                            Spacer()
                                        }
                                        .frame(width: 286, height: 356)
                                    }
                                    
                                    HStack(spacing: 16) {
                                        Image("logo")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 28)
                                        
                                        Text("Link Up with Crypton!")
                                            .font(.system(size: 13, weight: .semibold, design: .default))
                                            .foregroundColor(.white) // #6B7382
                                    }
                                    .padding(.vertical, 16)
                                }
                                .background(.red)
                                .cornerRadius(24)
                                .padding(.top, 80)
                                .padding(.horizontal, 38)
                                
                                Spacer()
                                CustomButton(
                                    title: "Share QR-code",
                                    backgroundColor: UIColor(red: 255/255, green: 59/255, blue: 48/255, alpha: 1.0)) {
                                        print("Button tapped!")
                                    }
                                    .navigationDestination(isPresented: $shouldNavigate) {
                                        CreateNewPasswordView()
                                    }
                                    .padding(.horizontal, 16)
                                    .padding(.bottom, 5)
                            }
                        )
            
        }
        .navigationBarTitleDisplayMode(.inline)
//        .toolbar(.hidden)
//        .navigationBarHidden(true)
//        .navigationBarBackButtonHidden(true)
//        .navigationBarItems(leading: btnBack)
    }
}

struct QRcodeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            QRcodeView()
        }
    }
}
