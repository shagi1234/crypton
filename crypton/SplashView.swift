//
//  SplashView.swift
//  crypton
//
//  Created by Meylis on 23.01.2025.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        
        VStack(spacing: 0) {
            if self.isActive {
                IntroduceView()
            } else {
                Image("logo")
//                    .resizable()
                    .scaledToFit()
                Text("Crypton")
                    .padding()
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
            
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
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
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
        
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
