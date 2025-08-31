//
//  OTPView.swift
//  crypton
//
//  Created by Meylis on 24.01.2025.
//

import SwiftUI

struct OTPView: View {
    
    enum FocusPin {
        case  pinOne, pinTwo, pinThree, pinFour, pinFive
    }
    
    @Environment(\.dismiss) var dismiss
    @State private var shouldNavigate = false

    @FocusState private var pinFocusState : FocusPin?
    @State var pinOne: String = ""
    @State var pinTwo: String = ""
    @State var pinThree: String = ""
    @State var pinFour: String = ""
    @State var pinFive: String = ""
    
    @State private var timeRemaining = 0
    @State private var showButton = false
    @State private var isLoading = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image("back")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
            }
        }
    }
    
    var body: some View {
        VStack {
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 84)
                    .padding(.top, 44)
                    .padding(.top, 44)
                
                Text("Crypton")
                    .padding(.top, 12)
                    .padding(.bottom, 10)
                    .font(.system(size: 32, weight: .bold, design: .default))
                    .foregroundStyle(.white)
                
                Text("A messenger with unmatched data protection, built-in crypto capabilities, and optimization for emergency services. Reliability and confidentiality are your ultimate assets.")
                    .font(.system(size: 13, weight: .none, design: .default))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 36)
            }
            .frame(maxWidth: .infinity)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 1.0, green: 59/255, blue: 48/255), // #FF3B30
                        Color(red: 1.0, green: 74/255, blue: 74/255)  // #FF4A4A
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .clipShape(CustomBottomCorners(cornerRadius: 32))
            
            VStack {
                
                Image("49")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 3)
                    )
                    .frame(width: 48, height: 48)
                
                Text("Region:")
                    .font(.system(size: 13, weight: .none, design: .default))
                    .foregroundColor(Color(red: 107/255, green: 115/255, blue: 130/255)) // #6B7382
                    .padding(.bottom, 2)

                Text("Germany")
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .foregroundColor(Color(red: 17/255, green: 16/255, blue: 58/255)) // #11103A
            }
            .padding(.top, -32)
            
            VStack {
                HStack(spacing:12, content: {

                    TextField("", text: $pinOne)
                        .modifier(OtpModifer(pin:$pinOne))
                        .onChange(of:pinOne){newVal in
                            if (newVal.count == 1) {
                                pinFocusState = .pinTwo
                            }
                        }
                        .focused($pinFocusState, equals: .pinOne)

                    TextField("", text:  $pinTwo)
                        .modifier(OtpModifer(pin:$pinTwo))
                        .onChange(of:pinTwo){newVal in
                            if (newVal.count == 1) {
                                pinFocusState = .pinThree
                            }else {
                                if (newVal.count == 0) {
                                    pinFocusState = .pinOne
                                }
                            }
                        }
                        .focused($pinFocusState, equals: .pinTwo)


                    TextField("", text:$pinThree)
                        .modifier(OtpModifer(pin:$pinThree))
                        .onChange(of:pinThree){newVal in
                            if (newVal.count == 1) {
                                pinFocusState = .pinFour
                            }else {
                                if (newVal.count == 0) {
                                    pinFocusState = .pinTwo
                                }
                            }
                        }
                        .focused($pinFocusState, equals: .pinThree)


                    TextField("", text:$pinFour)
                        .modifier(OtpModifer(pin:$pinFour))
                        .onChange(of:pinFour){newVal in
                            if (newVal.count == 1) {
                                pinFocusState = .pinFive
                            }else {
                                if (newVal.count == 0) {
                                    pinFocusState = .pinThree
                                }
                            }
                        }
                        .focused($pinFocusState, equals: .pinFour)


                    TextField("", text:$pinFive)
                        .modifier(OtpModifer(pin:$pinFive))
                        .onChange(of:pinFive){newVal in
                            if (newVal.count == 0) {
                                pinFocusState = .pinFour
                            }
                        }
                        .focused($pinFocusState, equals: .pinFive)

                })
                .padding(.bottom, 24)
                .padding(.top, 24)
                
                if showButton {
                    Button(action: {
                        startTimer()
                        showButton = false
                        print("Resend tapped")
                    }) {
                        Text("Resend")
                            .font(.system(size: 14, weight: .semibold)) // Font size 14px, weight 600 (Semibold)
                            .foregroundColor(Color(red: 255/255, green: 59/255, blue: 48/255)) // Text color #FF3B30
                            .multilineTextAlignment(.leading)
                    }
                    .buttonStyle(BorderlessButtonStyle()) // Optional button styling
                } else {
                    Text("Resend in \(formatTime(timeRemaining))")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(Color(red: 107/255, green: 115/255, blue: 130/255)) // Text color #6B7382
                }

            }
            .padding(.bottom, 24)
            
            CustomButton(
                title: isLoading ? "": "Confirm Code",
                backgroundColor: (pinOne == "" || pinTwo == "" || pinThree == "" || pinFour == "" || pinFive == "") ? UIColor(red: 107/255, green: 115/255, blue: 130/255, alpha: 1.0) : UIColor(red: 255/255, green: 59/255, blue: 48/255, alpha: 1.0)) {
                print("Button tapped!")
                    isLoading = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        isLoading = false
                        shouldNavigate = true
                    }
            }
            .navigationDestination(isPresented: $shouldNavigate) {
                CreateProfileView()
            }
            .padding(.horizontal)
            
            Spacer()
            
            Text("Lorem ipsum dolor sin amet magna consecteur aliqua nici consequat Consecteur aliqua nici consequat laborem sin dolorem.")
                .font(.system(size: 9, weight: .regular, design: .default))
                .lineSpacing(14 - 9)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.4196, green: 0.4471, blue: 0.5098))
                .padding()
                .padding(.bottom, 5)
                .padding(.horizontal, 16)
        }
        .navigationBarTitleDisplayMode(.inline)
        .edgesIgnoringSafeArea(.all)
        .onAppear(perform: startTimer)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
    }
    
    private func startTimer() {
        timeRemaining = 5 // 119 // sec
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                timer.invalidate()
                showButton = true
            }
        }
    }

    private func formatTime(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    NavigationStack {
        OTPView()
    }
}
