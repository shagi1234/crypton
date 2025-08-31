//
//  AvatarView.swift
//  crypton
//
//  Created by Meylis on 31.01.2025.
//

import SwiftUI
import Kingfisher

struct AvatarView: View {
    
    var userModel: UserModel
    let widthHeight: CGFloat
    var isEditable: Bool
    
    private let storyColors: [Color] = [.red, .orange, .blue]
    private let borderGap: CGFloat = 0.02
    private let borderWidth: CGFloat = 2
    private var borderSpace: CGFloat

    
    init(userModel: UserModel, widthHeight: CGFloat, isEditable: Bool = false) {
        self.userModel = userModel
        self.widthHeight = widthHeight
        self.isEditable = isEditable
        self.borderSpace = userModel.storiesCount > 0 ? 5 : 0
    }
    
    var body: some View {
        
        ZStack {
            
            if userModel.storiesCount > 0 && borderSpace > 0 {
                ForEach(0..<userModel.storiesCount, id: \.self) { index in
                    Circle()
                        .trim(from: CGFloat(index) / CGFloat(userModel.storiesCount) + borderGap / 2,
                              to: CGFloat(index + 1) / CGFloat(userModel.storiesCount) - borderGap / 2)
                        .stroke(storyColors[index % storyColors.count], lineWidth: borderWidth)
                        .rotationEffect(.degrees(-90))
                        .frame(width: widthHeight, height: widthHeight)
                }
            }
            
           Circle()
               .fill(Color.red)
               .frame(width: widthHeight - borderSpace, height: widthHeight - borderSpace)
            
            Image("default-avatar")
                .resizable()
                .clipShape(Circle())
                .scaledToFill()
                .frame(width: widthHeight - borderSpace, height: widthHeight - borderSpace)
                .clipped()
            
//            let initials = userModel.name == "" ? userModel.nickname.getInitials() : userModel.name.getInitials()
            
//            Text(initials)
//               .foregroundColor(.white)
//               .font(widthHeight > 99 ? .largeTitle : .caption)
            
            if let avatar = userModel.avatarUpdatedAt {
                KFImage(URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_A7oOdwcnUIoAdFRxwD1YCZmitlQ_0NXfhw&s"))
                    .resizable()
                    .clipShape(Circle())
                    .scaledToFill()
                    .frame(width: widthHeight - borderSpace, height: widthHeight - borderSpace)
                    .clipped()
            }
            
            if isEditable {
                ZStack {
                    Circle()
                        .fill(Color.black.opacity(0.3))
                    
                    Image(systemName: "pencil.circle")
                        .resizable()
                        .foregroundColor(.white)
                        .shadow(radius: 3)
                        .padding(5)
                    
                }
                .frame(width: widthHeight * 0.4, height: widthHeight * 0.4)
                .offset(x: ((widthHeight - borderSpace) / 2) - ((widthHeight - borderSpace) * 0.3 / 2), y: ((widthHeight - borderSpace) / 2) - ((widthHeight - borderSpace) * 0.3 / 2))
            } else {
                if userModel.activeStatus == ActiveStatusEnum.online.rawValue {
                    Circle()
                        .fill(Color(red: 46 / 255, green: 206 / 255, blue: 91 / 255))
                        .frame(width: 10, height: 10)
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 2)
                        )
                        .offset(x: ((widthHeight - borderSpace) / 2) - ((widthHeight - borderSpace) * 0.2 / 2), y: ((widthHeight - borderSpace) / 2) - ((widthHeight - borderSpace) * 0.2 / 2))
                }
            }
            
        }
   }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
//        AvatarView(userModel: UserModel.example, widthHeight: 100)
        TabbarView(selectedTab: .chats)
    }
}

