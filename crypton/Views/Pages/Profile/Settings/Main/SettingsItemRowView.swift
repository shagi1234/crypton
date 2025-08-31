//
//  SettingsItemRowView.swift
//  crypton
//
//  Created by Meylis on 04.02.2025.
//

import SwiftUI

struct SettingsItemRowView : View {
    let item: SettingsModel
    
    var body: some View {
        HStack(spacing: 0) {
            
            if !item.icon.isEmpty {
                Image(item.icon)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(red: 17/255, green: 16/255, blue: 58/255)) // Text color #11103A
                    .padding(.trailing, 10)
            }
            
            Text(item.title)
                .font(.system(size: 14, weight: .regular, design: .default))
                .foregroundColor(Color(red: 17/255, green: 16/255, blue: 58/255)) // Text color #11103A
            
            Spacer()
            
            Text(item.value)
                .font(.system(size: 13, weight: .regular, design: .default))
                .foregroundColor(item.valueColor)
            
            if item.rightIcon {
                Image("settings-chevron-right")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color(red: 107/255, green: 115/255, blue: 130/255)) // #6B7382
                    .frame(width: 20, height: 20)
                    .padding(.leading, 3)
            }
        }
        .padding(.horizontal, 16)
    }
}

struct RoundedCorners: Shape {
    var radius: CGFloat = 8
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct SettingsItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView(selectedTab: .settings)
    }
}
