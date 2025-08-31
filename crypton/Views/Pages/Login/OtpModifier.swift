//
//  OtpModifier.swift
//  crypton
//
//  Created by Meylis on 24.01.2025.
//

import SwiftUI
import Combine

struct OtpModifer: ViewModifier {

    @Binding var pin : String

    var textLimt = 1

    func limitText(_ upper : Int) {
        if pin.count > upper {
            self.pin = String(pin.prefix(upper))
        }
    }


    //MARK -> BODY
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
            .onReceive(Just(pin)) {_ in limitText(textLimt)}
            .frame(width: 40, height: 40)
            .background(
                pin.isEmpty
                    ? Color(red: 244/255, green: 244/255, blue: 244/255) // #F4F4F4
                    : Color(red: 1, green: 235/255, blue: 234/255) // #FFEBEA
            )
            .cornerRadius(5)
            .font(
                .system(
                    size: 18,            // Font size
                    weight: .bold,       // Font weight (Bold)
                    design: .default     // Default design
                )
            )
            .foregroundColor(
                Color(red: 17/255, green: 16/255, blue: 58/255) // #11103A
            )
            .accentColor(
                Color(red: 17/255, green: 16/255, blue: 58/255) // Cursor color #11103A
            )
    }
}

#Preview {
    OTPView()
}
