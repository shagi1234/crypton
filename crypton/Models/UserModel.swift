//
//  UserModel.swift
//  crypton
//
//  Created by Meylis on 31.01.2025.
//

import SwiftUI

enum ActiveStatusEnum: Int {
    case offline = 0
    case online = 1
}

struct UserModel: Hashable, Identifiable {
    var id: UUID
    var userId: Int64
    var name: String
    var nickname: String
    var isVerified: Bool
    var avatarUpdatedAt: Int64?
    var colorCode: String
    var lastActiveDate: Int64
    var activeStatus: Int // 1 = online, 2 offline
    var updatedAt: Int64
    
    var storiesCount: Int
    
//    #if DEBUG
    static let exampleOnline = UserModel(id: UUID(), userId: 0, name: "Genghis Khan", nickname: "ayna", isVerified: true, avatarUpdatedAt: nil, colorCode: "", lastActiveDate: 0, activeStatus: ActiveStatusEnum.online.rawValue, updatedAt: 0, storiesCount: 2)



    static let exampleOffline = UserModel(id: UUID(), userId: 0, name: "Genghis Khan", nickname: "ayna", isVerified: true, avatarUpdatedAt: nil, colorCode: "", lastActiveDate: 0, activeStatus: ActiveStatusEnum.offline.rawValue, updatedAt: 0, storiesCount: 0)





    static let exampleIsVerifiedTrue = UserModel(id: UUID(), userId: 0, name: "Genghis Khan", nickname: "ayna", isVerified: true, avatarUpdatedAt: nil, colorCode: "", lastActiveDate: 0, activeStatus: ActiveStatusEnum.offline.rawValue, updatedAt: 0, storiesCount: 0)



    static let exampleIsVerifiedFalse = UserModel(id: UUID(), userId: 0, name: "Genghis Khan", nickname: "ayna", isVerified: false, avatarUpdatedAt: nil, colorCode: "", lastActiveDate: 0, activeStatus: ActiveStatusEnum.offline.rawValue, updatedAt: 0, storiesCount: 0)



    static let exampleNotStories = UserModel(id: UUID(), userId: 0, name: "Genghis Khan", nickname: "ayna", isVerified: false, avatarUpdatedAt: 0, colorCode: "", lastActiveDate: 0, activeStatus: ActiveStatusEnum.online.rawValue, updatedAt: 0, storiesCount: 0)
    

    static let exampleNotStoriesOffline = UserModel(id: UUID(), userId: 0, name: "Genghis Khan", nickname: "ayna", isVerified: false, avatarUpdatedAt: 0, colorCode: "", lastActiveDate: 0, activeStatus: ActiveStatusEnum.offline.rawValue, updatedAt: 0, storiesCount: 0)
    
//    #endif
}


