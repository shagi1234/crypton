//
//  SettingsModel.swift
//  crypton
//
//  Created by Meylis on 04.02.2025.
//

import SwiftUI

struct SettingsModel: Hashable, Identifiable {
    let id: UUID
    let icon: String
    let iconColor: Color?
    let title: String
    let value: String
    var rightIcon: Bool = true
    var valueColor: Color = Color(red: 107/255, green: 115/255, blue: 130/255)
    
    #if DEBUG
    static let example = SettingsModel(id: UUID(), icon: "settings-profile", iconColor: .blue, title: "My Profile", value: "5")
    #endif
}
