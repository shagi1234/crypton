//
//  StoriesCell.swift
//  crypton
//
//  Created by Meylis on 09.02.2025.
//

import SwiftUI
import Kingfisher

struct StoriesCell: View {
    var body: some View {
        Button(action: {
            print("All chats tapped")
        }) {
            
            ZStack {
                KFImage(URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_A7oOdwcnUIoAdFRxwD1YCZmitlQ_0NXfhw&s"))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 140)
                    .clipped()
                
                
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.black.opacity(0),
                        Color(red: 255/255, green: 59/255, blue: 48/255, opacity: 0.6)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Spacer()
                        Circle()
                            .fill(Color(red: 228 / 255, green: 30 / 255, blue: 39 / 255))
                            .frame(width: 10, height: 10)
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 1)
                            )
                            .shadow(radius: 10)
                    }
                    .padding(.top, 6)
                    .padding(.trailing, 6)
                    Spacer()
                    
                    HStack(spacing: 5) {
                        KFImage(URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_A7oOdwcnUIoAdFRxwD1YCZmitlQ_0NXfhw&s"))
                            .resizable()
                            .clipShape(Circle())
                            .scaledToFill()
                            .frame(width: 18, height: 18)
                            .clipped()
                            .padding(.vertical, 2)
                        
                        VStack(spacing: 0) {
                            Text("Lord Vader")
                                .font(.system(size: 9, weight: .semibold, design: .default))
                                .foregroundColor(.white)
                                .lineLimit(2)
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal, 6)
                    .padding(.bottom, 6)
                }
            }
                
        }
    }
}

#Preview {
    StoriesCell()
        .frame(width: 100, height: 140)
        .background(Color(red: 70/255, green: 96/255, blue: 135/255, opacity: 10/255))
        .cornerRadius(8)
}
