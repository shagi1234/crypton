//
//  ChatRoomHeaderPlayerView.swift
//  crypton
//
//  Created by Meylis on 12.02.2025.
//

import SwiftUI

struct ChatRoomHeaderPlayerView: View {
    @State private var speed = "1X"
    @State private var play = true
    
    var xmarkCallBack: () -> Void
    
    var body: some View {
        Spacer(minLength: 7)
        HStack(alignment: .center, spacing: 0) {
            
            Button(action: {
                play.toggle()
            }) {
                Image(systemName: play ? "pause.fill" : "play.fill")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 14, height: 14)
                    .foregroundColor(Color(red: 1.0, green: 59/255, blue: 48/255))
                    .padding(.leading, 16)
                    .padding(.trailing, 10)
            }
            
            Text("Genghis Khan")
                .font(.system(size: 13, weight: .semibold, design: .default))
                .foregroundColor(Color(red: 17/255, green: 16/255, blue: 58/255))
                .lineLimit(1)
                .padding(.trailing, 5)
            
            Text("at 18.01.25")
                .font(.system(size: 13, weight: .regular, design: .default))
                .foregroundColor(Color(red: 161/255, green: 171/255, blue: 190/255))
                .lineLimit(1)
                .padding(.trailing, 10)
            
            Spacer()
            
            Text("00:01")
                .font(.system(size: 13, weight: .regular, design: .default))
                .foregroundColor(Color(red: 17/255, green: 16/255, blue: 58/255))
                .lineLimit(1)
                .padding(.trailing, 10)
            
            Button(action: {
                speed = speed == "1X" ? "2X" : "1X"
            }) {
                Text(speed)
                    .font(.system(size: 13, weight: .semibold, design: .default))
                    .foregroundColor(.white)
                    .lineLimit(1)
            }
            .padding(.vertical, 4)
            .padding(.horizontal, 10)
            .background(Color(red: 161/255, green: 171/255, blue: 190/255)) // Icon color #A1ABBE
            .cornerRadius(4)
            
            Button(action: {
                xmarkCallBack()
            }) {
                Image(systemName: "xmark")
                    .resizable()
                    .renderingMode(.template)
                    .padding(2)
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(red: 161/255, green: 171/255, blue: 190/255))
                    .padding(.trailing, 16)
                    .padding(.leading, 10)
            }
            .padding(.vertical, 6)
        }
        Spacer(minLength: 7)
        Rectangle()
            .fill(Color(red: 234 / 255, green: 236 / 255, blue: 239 / 255))
            .frame(height: 1)
            .edgesIgnoringSafeArea(.horizontal)
        
    }
}

struct ChatRoomHeaderPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ChatRoomView(room: RoomModel.exampleMessageText)
        }
    }
}
