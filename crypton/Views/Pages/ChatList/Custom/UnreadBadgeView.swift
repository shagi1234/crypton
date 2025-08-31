//
//  UnreadBadgeView.swift
//  crypton
//
//  Created by Meylis on 31.01.2025.
//

import SwiftUI

struct UnreadBadgeView: View {
    var count: Int
    var backgroundColor: Color = Color(red: 1.0, green: 59/255, blue: 48/255)
    var textColor: Color = .white

    var body: some View {
        if count < 10 {
            Circle()
                .fill(backgroundColor)
                .frame(width: 20, height: 20)
                .overlay(
                    Text("\(count)")
                        .font(.system(size: 12))
                        .foregroundColor(textColor)
                )
        } else {
            Text("\(count)")
                .font(.system(size: 12))
                .foregroundColor(textColor)
                .padding(EdgeInsets(top: 2, leading: 4, bottom: 2, trailing: 4))
                .background(backgroundColor)
                .cornerRadius(9)
                .frame(minWidth: 20, minHeight: 20)
        }
    }
}

struct UnreadBadgeView_Previews: PreviewProvider {
    static var previews: some View {
//        TabbarView(selectedTab: .chat)
//        UnreadBadgeView(count: 500, backgroundColor: .gray)
        UnreadBadgeView(count: 500)
    }
}

