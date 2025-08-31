//
//  UnreaderHeader.swift
//  crypton
//
//  Created by Meylis on 31.01.2025.
//

import SwiftUI

struct UnreaderHeader: View {
    var body: some View {
        
        HStack {
            Spacer()
            Text("Unread Messages")
                .font(.system(size: 11, weight: .semibold, design: .default))
                .foregroundColor(Color(red: 1.0, green: 59/255, blue: 48/255))
            Spacer()
        }
        .padding(.vertical, 2)
        .background(Color(red: 1, green: 235/255, blue: 234/255)) // #FFEBEA
        
    }
}

struct UnreaderHeader_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ChatRoomView(room: RoomModel.exampleUserIsAccept2)
        }
    }
}

