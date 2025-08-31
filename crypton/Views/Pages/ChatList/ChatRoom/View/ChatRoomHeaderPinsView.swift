//
//  ChatRoomHeaderPinsView.swift
//  crypton
//
//  Created by Meylis on 10.02.2025.
//

import SwiftUI

struct ChatRoomHeaderPinsView: View {
    var body: some View {
        Spacer(minLength: 7)
        HStack(alignment: .center, spacing: 0) {
            VStack(spacing: 2) {
                RoundedRectangle(cornerRadius: 3)
                    .frame(width: 2, height: 9.33)
                    .foregroundColor(Color(red: 161/255, green: 171/255, blue: 190/255)) // Icon color #A1ABBE
                
                RoundedRectangle(cornerRadius: 3)
                    .frame(width: 2, height: 9.33)
                    .foregroundColor(Color(red: 161/255, green: 171/255, blue: 190/255)) // Icon color #A1ABBE
                
                RoundedRectangle(cornerRadius: 3)
                    .frame(width: 2, height: 9.33)
                    .foregroundColor(Color(red: 1.0, green: 59/255, blue: 48/255)) // #FF3B30
            }
            .padding(.leading, 16)
            .padding(.trailing, 10)
            //            .padding(.vertical, 8)
            //            .background(.blue)
            
            VStack(alignment: .leading, spacing: 0) {
                
                HStack (spacing: 5) {
                    Text("Some text")
                        .font(.system(size: 13, weight: .semibold, design: .default))
                        .foregroundColor(Color(red: 255/255, green: 59/255, blue: 48/255)) // Text color #FF3B30
                        .lineLimit(1)
                    Image("pin")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 14, height: 14)
                        .foregroundColor(Color(red: 255/255, green: 59/255, blue: 48/255)) // Text color #FF3B30
                }
                //                .background(.red)
                
                Text("We are in the second group of power")
                    .font(.system(size: 13, weight: .none, design: .default))
                    .foregroundColor(Color(red: 17/255, green: 16/255, blue: 58/255)) // Text color #11103A
                    .lineLimit(1)
            }
            //            .padding(.vertical, 3)
            //            .background(.red)
            
            Spacer()
            NavigationLink(destination: ComingSoonView(text: "Pins")) {
                Image("pins")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(red: 161/255, green: 171/255, blue: 190/255)) // Icon color #A1ABBE
                    .padding(.trailing, 16)
                    .padding(.leading, 10)
            }
        }
        Spacer(minLength: 7)
        Rectangle()
            .fill(Color(red: 234 / 255, green: 236 / 255, blue: 239 / 255)) // #EAECEF color
            .frame(height: 1) // Adjust height for the line thickness
            .edgesIgnoringSafeArea(.horizontal) // Make it span the width of the screen (optional)
        
    }
}

struct ChatRoomHeaderPinsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ChatRoomHeaderPinsView()
        }
    }
}
