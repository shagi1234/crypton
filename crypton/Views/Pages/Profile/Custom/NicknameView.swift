//
//  NicknameView.swift
//  crypton
//
//  Created by Meylis on 31.01.2025.
//

import SwiftUI

struct NicknameView: View {

    let name: String
    let nickname: String
    let isVerified: Bool
    let font: CGFloat
    let iconFont: Font
    let color: Color
    
    init(name: String, nickname: String, isVerified: Bool = false, font: CGFloat = 15, iconFont: Font = .headline, color: Color = Color(red: 17/255, green: 16/255, blue: 58/255)) {
        self.name = name
        self.nickname = nickname
        self.isVerified = isVerified
        self.font = font
        self.iconFont = iconFont
        self.color = color
    }
    
    var body: some View {
        HStack(alignment: .center) {
            
            let text = name == "" ? nickname : name
            
            Text(text)
                .font(.system(size: font, weight: .bold, design: .default))
                .foregroundColor(color) // #11103A
                .lineLimit(1)
            if isVerified {
                Image("channel-verification")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 16, height: 16)
                    .foregroundColor(Color(red: 71 / 255, green: 166 / 255, blue: 255 / 255)) // #47A6FF
            }
            
//                .padding(.trailing, )
            
//                .background(Color.red)
        }
//        .background(Color.green)
   }
}

struct NicknameView_Previews: PreviewProvider {
    static var previews: some View {
//        NicknameView()
        TabbarView(selectedTab: .chats)
    }
}

