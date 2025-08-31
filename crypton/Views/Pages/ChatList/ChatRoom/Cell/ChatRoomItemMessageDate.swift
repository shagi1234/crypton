//
//  ChatRoomItemMessageDate.swift
//  crypton
//
//  Created by Meylis on 10.02.2025.
//

import SwiftUI

struct ChatRoomItemMessageDate: View {
    
    let duration: String = "00:30"
    
    var body: some View {
        Text(duration)
            .font(.system(size: 10, weight: .regular, design: .default))
            .foregroundColor(Color(red: 161/255, green: 171/255, blue: 190/255))
    }
}

struct ChatRoomItemMessageDate_Previews: PreviewProvider {
    static var previews: some View {
        ChatRoomItemMessageDate()
    }
}
