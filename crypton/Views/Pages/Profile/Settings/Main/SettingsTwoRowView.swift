//
//  SettingsTwoRowView.swift
//  crypton
//
//  Created by Meylis on 10.02.2025.
//

import SwiftUI

struct SettingsTwoRowView : View {
    let item: SettingsModel
    
    var body: some View {
        HStack(spacing: 0) {
            
            VStack(alignment: .leading, spacing: 2) {
                
                Text(item.value)
                    .font(.system(size: 10, weight: .regular, design: .default))
                    .foregroundColor(item.valueColor)
                
                
                Text(item.title)
                    .font(.system(size: 14, weight: .regular, design: .default))
                    .foregroundColor(Color(red: 17/255, green: 16/255, blue: 58/255))
                    .multilineTextAlignment(.leading)
                    .padding(.top, 2)
                
            }
            Spacer()
            
            if !item.icon.isEmpty {
                Image(item.icon)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color(red: 1.0, green: 59/255, blue: 48/255))
                    .frame(width: 24, height: 24)
            }
        }
        .padding(.horizontal, 16)
    }
}

struct SettingsTwoRowView_Previews: PreviewProvider {
    static var previews: some View {
        ContactProfileView()
    }
}
