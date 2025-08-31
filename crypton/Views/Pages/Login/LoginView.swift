//
//  LoginView.swift
//  crypton
//
//  Created by Meylis on 23.01.2025.
//

import SwiftUI

struct LoginView: View {
    
    @State private var showModalCountryCodeView = false
    @State private var showNextView = false
    
    @State private var countryCode: String = "993"
    @State private var phoneNumber: String = ""
    @State private var countryName: String = "Turkmenistan"
    
    @State private var placeholderText: String = "Phone Number"

    
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
            
            HStack(alignment: .center) {
                HStack {
                    Text("+49")
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color(red: 17/255, green: 16/255, blue: 58/255)) // Text color #11103A
                        .padding(.vertical, 10)
                        .padding(.leading, 10)
                    
                    Image("down")
                }
                .onTapGesture {
                    showModalCountryCodeView = true
                }
                .padding(.trailing, 8)
                
                
                TextField("0000000000", text: $phoneNumber)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(Color(red: 17/255, green: 16/255, blue: 58/255)) // Text color #11103A
            }
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .keyboardType(.phonePad)
            .padding(.bottom, 24)
            .padding(.top, 24)
            .padding(.horizontal, 16)
            
            CustomButton(title: "Start Messaging", backgroundColor: UIColor(red: 255/255, green: 59/255, blue: 48/255, alpha: 1.0)) {
                showNextView = true
            }
            .padding(.horizontal)
            .navigationDestination(isPresented: $showNextView) {
                OTPView()
            }
            
            Spacer()
            
            Text("Lorem ipsum dolor sin amet magna consecteur aliqua nici consequat Consecteur aliqua nici consequat laborem sin dolorem.")
                .font(.system(size: 9, weight: .regular, design: .default))
                .lineSpacing(14 - 9)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.4196, green: 0.4471, blue: 0.5098))
                .padding()
                .padding(.bottom, 5)
                .padding(.horizontal, 16)

//            Spacer()
        }
        .sheet(isPresented: $showModalCountryCodeView) {
            CountryCodeView(onSelectCountry: { _ in
                print("CountryCodeView tapped")
            })
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
    }
}

struct CustomBottomCorners: Shape {
    var cornerRadius: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))

        path.addQuadCurve(
            to: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY),
            control: CGPoint(x: rect.maxX, y: rect.maxY)
        )

        path.addLine(to: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY))

        path.addQuadCurve(
            to: CGPoint(x: rect.minX, y: rect.maxY - cornerRadius),
            control: CGPoint(x: rect.minX, y: rect.maxY)
        )

        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))

        return path
    }
}

#Preview {
    LoginView()
}
