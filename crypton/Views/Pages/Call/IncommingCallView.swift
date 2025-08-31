//
//  IncommingCallView.swift
//  crypton
//
//  Created by Meylis on 08.02.2025.
//

import SwiftUI
import Kingfisher

struct IncommingCallView: View {
    @Binding var showCallView: Bool
    
    @State private var callAccept = false
    
    @State private var soundOn = true
    @State private var micOn = true
    @State private var camOn = false
    
    var body: some View {
        ZStack {
            KFImage(URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_A7oOdwcnUIoAdFRxwD1YCZmitlQ_0NXfhw&s"))
                .resizable()
                .scaledToFill()
            
            Color.black.opacity(0.2)
                .ignoresSafeArea()
            
            BlurView(style: .systemUltraThinMaterial)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                Spacer()
                AvatarView(userModel: UserModel.exampleNotStoriesOffline, widthHeight: 100)
                    .frame(width: 100, height: 100)
                
                Text("User123")
                    .font(.system(size: 22, weight: .bold, design: .default))
                    .foregroundStyle(.white)
                    .padding(.top, 15)
                
                Text("Incoming call")
                    .font(.system(size: 13, weight: .regular, design: .default))
                    .foregroundStyle(.white)
                    .padding(.top, 10)
                
                Spacer()
                Spacer()
                
                HStack(spacing: 20) {
                    Spacer()
                    
                    if callAccept {
                        
                        Button(action: {
                            soundOn.toggle()
                        }) {
                            Image("call-sound-max-fill")
                                .resizable()
                                .renderingMode(.template)
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .foregroundColor(soundOn ? .white : Color(red: 19/255, green: 19/255, blue: 19/255))
                                .padding(11)
                                .background(soundOn ? Color(red: 19/255, green: 19/255, blue: 19/255) : .white)
                                .cornerRadius(23)
                                .padding(.vertical, 10)
                        }
                        
                        Button(action: {
                            micOn.toggle()
                        }) {
                            Image("call-mic-fill")
                                .resizable()
                                .renderingMode(.template)
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .foregroundColor(micOn ? .white : Color(red: 19/255, green: 19/255, blue: 19/255))
                                .padding(11)
                                .background(micOn ? Color(red: 19/255, green: 19/255, blue: 19/255) : .white)
                                .cornerRadius(23)
                                .padding(.vertical, 10)
                        }
                        
                        Button(action: {
                            camOn.toggle()
                        }) {
                            Image("call-videocam-off")
                                .resizable()
                                .renderingMode(.template)
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .foregroundColor(camOn ? .white : Color(red: 19/255, green: 19/255, blue: 19/255))
                                .padding(11)
                                .background(camOn ? Color(red: 19/255, green: 19/255, blue: 19/255) : .white)
                                .cornerRadius(23)
                                .padding(.vertical, 10)
                        }
                        
                    } else {
                        
                        Button(action: {
                            callAccept = true
                        }) {
                            Image("call-accept")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .padding(11)
                                .background(Color(red: 46/255, green: 206/255, blue: 91/255)) // #2ECE5B
                                .cornerRadius(23)
                                .padding(.vertical, 10)
                        }
                    }
                    
                    
                    Button(action: {
                        showCallView = false
                    }) {
                        Image("call-cancel")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .padding(11)
                            .background(Color(red: 1.0, green: 59/255, blue: 48/255))
                            .cornerRadius(23)
                            .padding(.vertical, 10)
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity) // Ensures full-width
                .background(
                    ZStack {
                        BlurView(style: .systemUltraThinMaterial) // Blur effect
                        Color.white.opacity(0.1) // #F4F4F41A ~10% opacity
                    }
                )
                .cornerRadius(20)
                .padding(.bottom, 30)
                .padding(.horizontal, 125)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

// UIKit-based Blur Effect (for iOS 15+)
struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemUltraThinMaterial
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

struct IncommingCallView_Previews: PreviewProvider {
    static var previews: some View {
        IncommingCallView(showCallView: .constant(true))
            .previewLayout(.sizeThatFits)
    }
}


