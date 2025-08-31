//
//  RoomModel.swift
//  crypton
//
//  Created by Meylis on 31.01.2025.
//

import SwiftUI

enum RoomAccept: Int {
    case waiting = 1
    case accepted = 2
    case rejected = 3
}

enum RoomStatus: Int {
    case Single = 0
    case Group = 1
    case DeletedAccount = 2
}

enum NotificationStatusType: Int {
    case off = 1
    case on = 2
}

struct RoomModel: Hashable, Identifiable {
    var id: UUID
    var localId: Int64
    var roomId: Int64
    var friendId: Int64
    var notification: Int
    var isDeleted: Bool
    var isBlocked: Bool
    var isAccept: Int
    var deletedAt: Int64
    var cleanedAt: Int64
    var updatedAt: Int64
    
    var user: UserModel
    var lastMessage: MessageModel
    
//    #if DEBUG
    static let list = [
        RoomModel.exampleUserIsVerifiedTrue,
        RoomModel.exampleMessageText,
        
        RoomModel.exampleMessageTextTwoRow,

        RoomModel.exampleMessageImage,

        RoomModel.exampleMessageVideo,

        RoomModel.exampleMessageVoice,
        
        RoomModel.exampleMessageGeolocation,
        RoomModel.exampleMessageFile,
        
        RoomModel.exampleMessageStoryComment,

        RoomModel.exampleMessageRecordedVideo,

        RoomModel.exampleMessagePost,

        RoomModel.exampleUserIsVerifiedTrue,

        RoomModel.exampleUserIsVerifiedFalse,

        RoomModel.exampleUserNotificationOn,

        RoomModel.exampleUserNotificationOff,

        RoomModel.exampleUserIsDeletedTrue,

        RoomModel.exampleUserIsDeletedFalse,

        RoomModel.exampleUserIsBlockedTrue,

        RoomModel.exampleUserIsBlockedFalse,

        RoomModel.exampleUserIsAccept1,

        RoomModel.exampleUserIsAccept2,

        RoomModel.exampleUserIsAccept3,

        RoomModel.exampleUserOnline,

        RoomModel.exampleUserOffline,

        RoomModel.exampleMessageIsDeletedTrue,

        RoomModel.exampleMessageIsDeletedFalse,

        RoomModel.exampleMessageStatusError,

        RoomModel.exampleMessageStatusSeen,

        RoomModel.exampleMessageStatusLocal,

        RoomModel.exampleMessageStatusServer,

        RoomModel.exampleMessageStatusVoiceListened,

        RoomModel.exampleMessageAccount,

        RoomModel.exampleMessageSticker,

        RoomModel.exampleMessageAudioCall,

        RoomModel.exampleMessageVideoCall,

        RoomModel.exampleMessageDraftMessage,


        

    ]

    
    

    static let exampleMessageText = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: NotificationStatusType.on.rawValue, isDeleted: false, isBlocked: false, isAccept: RoomAccept.rejected.rawValue, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleNotStories, lastMessage: MessageModel.exampleMessageTypeText)

    static let exampleMessageImage = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: NotificationStatusType.on.rawValue, isDeleted: false, isBlocked: false, isAccept: RoomAccept.rejected.rawValue, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleNotStories, lastMessage: MessageModel.exampleMessageTypeImage)

    static let exampleMessageVoice = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: NotificationStatusType.on.rawValue, isDeleted: false, isBlocked: false, isAccept: RoomAccept.rejected.rawValue, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleNotStories, lastMessage: MessageModel.exampleMessageTypeVoice)

    
    
    
    static let exampleMessageGeolocation = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: NotificationStatusType.on.rawValue, isDeleted: false, isBlocked: false, isAccept: RoomAccept.rejected.rawValue, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleNotStories, lastMessage: MessageModel.exampleMessageTypeGeolocation)

    
    static let exampleMessageFile = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: NotificationStatusType.on.rawValue, isDeleted: false, isBlocked: false, isAccept: RoomAccept.rejected.rawValue, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleNotStories, lastMessage: MessageModel.exampleMessageTypeFile)

    

    static let exampleMessagePost = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: NotificationStatusType.on.rawValue, isDeleted: false, isBlocked: false, isAccept: RoomAccept.rejected.rawValue, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleNotStories, lastMessage: MessageModel.exampleMessageTypePost)

    

    static let exampleMessageAccount = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: NotificationStatusType.on.rawValue, isDeleted: false, isBlocked: false, isAccept: RoomAccept.rejected.rawValue, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleNotStories, lastMessage: MessageModel.exampleMessageTypeAccount)


    static let exampleMessageVideo = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: NotificationStatusType.on.rawValue, isDeleted: false, isBlocked: false, isAccept: RoomAccept.rejected.rawValue, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleNotStories, lastMessage: MessageModel.exampleMessageTypeVideo)

    

    static let exampleMessageRecordedVideo = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: NotificationStatusType.on.rawValue, isDeleted: false, isBlocked: false, isAccept: RoomAccept.rejected.rawValue, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleNotStories, lastMessage: MessageModel.exampleMessageTypeRecordedVideo)

    

    static let exampleMessageStoryComment = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: NotificationStatusType.on.rawValue, isDeleted: false, isBlocked: false, isAccept: RoomAccept.rejected.rawValue, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleNotStories, lastMessage: MessageModel.exampleMessageTypeStoryComment)

    

    static let exampleMessageAudioCall = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: NotificationStatusType.on.rawValue, isDeleted: false, isBlocked: false, isAccept: RoomAccept.rejected.rawValue, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleNotStories, lastMessage: MessageModel.exampleMessageTypeAudioCall)

    

    static let exampleMessageVideoCall = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: NotificationStatusType.on.rawValue, isDeleted: false, isBlocked: false, isAccept: RoomAccept.rejected.rawValue, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleNotStories, lastMessage: MessageModel.exampleMessageTypeVideoCall)

    

    static let exampleMessageSticker = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: NotificationStatusType.on.rawValue, isDeleted: false, isBlocked: false, isAccept: RoomAccept.rejected.rawValue, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleNotStories, lastMessage: MessageModel.exampleMessageTypeSticker)

    

    static let exampleMessageDraftMessage = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: NotificationStatusType.on.rawValue, isDeleted: false, isBlocked: false, isAccept: RoomAccept.rejected.rawValue, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleNotStories, lastMessage: MessageModel.exampleMessageTypeDraftMessage)

    

    static let exampleMessageTextTwoRow = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: NotificationStatusType.on.rawValue, isDeleted: false, isBlocked: false, isAccept: RoomAccept.rejected.rawValue, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleNotStories, lastMessage: MessageModel.exampleMessageTypeTextTwoRow)

    


    static let exampleUserIsVerifiedTrue = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: 0, isDeleted: false, isBlocked: false, isAccept: 0, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleIsVerifiedTrue, lastMessage: MessageModel.exampleStatusError)



    static let exampleUserIsVerifiedFalse = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: 0, isDeleted: false, isBlocked: false, isAccept: 0, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleIsVerifiedFalse, lastMessage: MessageModel.exampleStatusError)

    

    static let exampleUserNotificationOff = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: NotificationStatusType.off.rawValue, isDeleted: false, isBlocked: false, isAccept: 0, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleIsVerifiedFalse, lastMessage: MessageModel.exampleStatusError)

    

    static let exampleUserNotificationOn = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: NotificationStatusType.on.rawValue, isDeleted: false, isBlocked: false, isAccept: 0, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleIsVerifiedFalse, lastMessage: MessageModel.exampleStatusError)

    

    static let exampleUserIsDeletedTrue = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: NotificationStatusType.on.rawValue, isDeleted: true, isBlocked: false, isAccept: 0, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleIsVerifiedFalse, lastMessage: MessageModel.exampleStatusError)

    

    static let exampleUserIsDeletedFalse = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: NotificationStatusType.on.rawValue, isDeleted: false, isBlocked: false, isAccept: 0, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleIsVerifiedFalse, lastMessage: MessageModel.exampleStatusError)



    static let exampleUserIsBlockedTrue = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: NotificationStatusType.on.rawValue, isDeleted: false, isBlocked: true, isAccept: 0, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleIsVerifiedFalse, lastMessage: MessageModel.exampleStatusError)

    

    static let exampleUserIsBlockedFalse = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: NotificationStatusType.on.rawValue, isDeleted: false, isBlocked: false, isAccept: 0, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleIsVerifiedFalse, lastMessage: MessageModel.exampleStatusError)

    

    static let exampleUserIsAccept1 = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: NotificationStatusType.on.rawValue, isDeleted: false, isBlocked: false, isAccept: RoomAccept.waiting.rawValue, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleIsVerifiedFalse, lastMessage: MessageModel.exampleStatusError)

    

    static let exampleUserIsAccept2 = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: NotificationStatusType.on.rawValue, isDeleted: false, isBlocked: false, isAccept: RoomAccept.accepted.rawValue, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleIsVerifiedFalse, lastMessage: MessageModel.exampleStatusError)

    

    static let exampleUserIsAccept3 = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: NotificationStatusType.on.rawValue, isDeleted: false, isBlocked: false, isAccept: RoomAccept.rejected.rawValue, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleIsVerifiedFalse, lastMessage: MessageModel.exampleStatusError)

    

    static let exampleUserOnline = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: NotificationStatusType.on.rawValue, isDeleted: false, isBlocked: false, isAccept: RoomAccept.rejected.rawValue, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleOnline, lastMessage: MessageModel.exampleStatusError)

    

    static let exampleUserOffline = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: NotificationStatusType.on.rawValue, isDeleted: false, isBlocked: false, isAccept: RoomAccept.rejected.rawValue, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleOffline, lastMessage: MessageModel.exampleStatusError)

    

    static let exampleUserNotStories = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: NotificationStatusType.on.rawValue, isDeleted: false, isBlocked: false, isAccept: RoomAccept.rejected.rawValue, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleNotStories, lastMessage: MessageModel.exampleStatusError)

    

    static let exampleMessageIsDeletedTrue = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: NotificationStatusType.on.rawValue, isDeleted: false, isBlocked: false, isAccept: RoomAccept.rejected.rawValue, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleNotStories, lastMessage: MessageModel.exampleIsDeletedTrue)

    

    static let exampleMessageIsDeletedFalse = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: NotificationStatusType.on.rawValue, isDeleted: false, isBlocked: false, isAccept: RoomAccept.rejected.rawValue, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleNotStories, lastMessage: MessageModel.exampleIsDeletedTrue)

    

    static let exampleMessageStatusError = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: NotificationStatusType.on.rawValue, isDeleted: false, isBlocked: false, isAccept: RoomAccept.rejected.rawValue, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleNotStories, lastMessage: MessageModel.exampleStatusError)

    

    static let exampleMessageStatusLocal = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: NotificationStatusType.on.rawValue, isDeleted: false, isBlocked: false, isAccept: RoomAccept.rejected.rawValue, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleNotStories, lastMessage: MessageModel.exampleStatusLocal)

    

    static let exampleMessageStatusServer = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: NotificationStatusType.on.rawValue, isDeleted: false, isBlocked: false, isAccept: RoomAccept.rejected.rawValue, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleNotStories, lastMessage: MessageModel.exampleStatusServer)

    

    static let exampleMessageStatusSeen = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: NotificationStatusType.on.rawValue, isDeleted: false, isBlocked: false, isAccept: RoomAccept.rejected.rawValue, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleNotStories, lastMessage: MessageModel.exampleStatusSeen)

    

    static let exampleMessageStatusVoiceListened = RoomModel(id: UUID(), localId: 0, roomId: 0, friendId: 0, notification: NotificationStatusType.on.rawValue, isDeleted: false, isBlocked: false, isAccept: RoomAccept.rejected.rawValue, deletedAt: 0, cleanedAt: 0, updatedAt: 0, user: UserModel.exampleNotStories, lastMessage: MessageModel.exampleStatusVoiceListened)

//    #endif
}

