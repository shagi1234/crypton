//
//  MessageModel.swift
//  crypton
//
//  Created by Meylis on 31.01.2025.
//

import SwiftUI

enum MessageStatus: Int {
    case Error = -1
    case Local = 0
    case Server = 1
    case Seen = 2
    case VoiceListened = 3
}

enum MessageType: Int {
    case Text = 1             /// success
    case Image = 2            /// processing... upload etyar su wagt
    case File = 3             /// processing...
    case Music = 4            /// son gosmaly share music su wagt yok beylekem file gornusinde gityar
    case Voice = 5            /// processing...
    case Post = 6             /// son gosmaly share su wagt yok
    case Acoount = 7          /// processing... dusunisdik kesa bilen
    case Geolocation = 8      /// success
    case Video = 9            /// processing...  dusunismeli
    case RecordedVideo = 10   /// processing...
    case StoryComment = 11    /// son gosmaly
    case AudioCall = 12       /// son gosmaly
    case VideoCall = 13       /// son gosmaly
    case Sticker = 14         /// son gosmaly
    case DraftMessage = 15         /// son gosmaly
}

struct MessageModel: Hashable, Identifiable {
    var id: UUID
    var localId: Int64
    var roomId: Int64
    var messageId: Int64
    var senderId: Int64
    var type: Int
    var content: String
    var repliedMessage: String?
    var status: Int
    var isDeleted: Bool
    var createdAt: Int64
    var updatedAt: Int64
    var unreadMessageCount: Int?
    var draftMessage: String?
    var draftMessageDate: Int64?
    var readDate: Int64?
    
    /// su dine okalmadyk messageleri gorkezmek ucin localny ulanylyar
    var toShowUnreadHeader: Bool?
    
    /// Message types Models
    var mediaContent: MediaContentModel?
    var account: UserModel?
    var fileContent: FileContentModel?
    var voiceContent: VoiceContentModel?
    
//    #if DEBUG
    static let exampleIsDeletedTrue = MessageModel(id: UUID(), localId: 0, roomId: 0, messageId: 0, senderId: 0, type: 0, content: "Последнее сообщение в чате", repliedMessage: nil, status: MessageStatus.VoiceListened.rawValue, isDeleted: true, createdAt: 0, updatedAt: 0)

    static let exampleIsDeletedFalse = MessageModel(id: UUID(), localId: 0, roomId: 0, messageId: 0, senderId: 0, type: 0, content: "Последнее сообщение в чате", repliedMessage: nil, status: MessageStatus.VoiceListened.rawValue, isDeleted: false, createdAt: 0, updatedAt: 0)



    static let exampleStatusError = MessageModel(id: UUID(), localId: 0, roomId: 0, messageId: 0, senderId: 0, type: 0, content: "Последнее сообщение в чате Последнее сообщение в чате Последнее сообщение в чате", repliedMessage: nil, status: MessageStatus.Error.rawValue, isDeleted: false, createdAt: 0, updatedAt: 0)

    

    static let exampleStatusLocal = MessageModel(id: UUID(), localId: 0, roomId: 0, messageId: 0, senderId: 0, type: 0, content: "Последнее сообщение в чате", repliedMessage: nil, status: MessageStatus.Local.rawValue, isDeleted: false, createdAt: 0, updatedAt: 0)



    static let exampleStatusServer = MessageModel(id: UUID(), localId: 0, roomId: 0, messageId: 0, senderId: 0, type: 0, content: "Последнее сообщение в чате", repliedMessage: nil, status: MessageStatus.Server.rawValue, isDeleted: false, createdAt: 0, updatedAt: 0)

    

    static let exampleStatusSeen = MessageModel(id: UUID(), localId: 0, roomId: 0, messageId: 0, senderId: 0, type: 0, content: "Последнее сообщение в чате", repliedMessage: nil, status: MessageStatus.Seen.rawValue, isDeleted: false, createdAt: 0, updatedAt: 0)

    

    static let exampleStatusVoiceListened = MessageModel(id: UUID(), localId: 0, roomId: 0, messageId: 0, senderId: 0, type: 0, content: "Последнее сообщение в чате", repliedMessage: nil, status: MessageStatus.VoiceListened.rawValue, isDeleted: false, createdAt: 0, updatedAt: 0)

    

    static let exampleMessageTypeText = MessageModel(id: UUID(), localId: 0, roomId: 0, messageId: 0, senderId: 0, type: MessageType.Text.rawValue, content: "Последнее сообщение в чате", repliedMessage: nil, status: MessageStatus.VoiceListened.rawValue, isDeleted: false, createdAt: 0, updatedAt: 0)

        

    static let exampleMessageTypeTextTwoRow = MessageModel(id: UUID(), localId: 0, roomId: 0, messageId: 0, senderId: 0, type: MessageType.Text.rawValue, content: "Последнее сообщение в чате Последнее сообщение в чате Последнее сообщение в чате Последнее сообщение в чате", repliedMessage: nil, status: MessageStatus.VoiceListened.rawValue, isDeleted: false, createdAt: 0, updatedAt: 0)

    

    static let exampleMessageTypeImage = MessageModel(id: UUID(), localId: 0, roomId: 0, messageId: 0, senderId: 0, type: MessageType.Image.rawValue, content: "Image", repliedMessage: nil, status: MessageStatus.VoiceListened.rawValue, isDeleted: false, createdAt: 0, updatedAt: 0)

    

    static let exampleMessageTypeFile = MessageModel(id: UUID(), localId: 0, roomId: 0, messageId: 0, senderId: 0, type: MessageType.File.rawValue, content: "File", repliedMessage: nil, status: MessageStatus.VoiceListened.rawValue, isDeleted: false, createdAt: 0, updatedAt: 0)

    

    static let exampleMessageTypeMusic = MessageModel(id: UUID(), localId: 0, roomId: 0, messageId: 0, senderId: 0, type: MessageType.Music.rawValue, content: "Music", repliedMessage: nil, status: MessageStatus.VoiceListened.rawValue, isDeleted: false, createdAt: 0, updatedAt: 0)

    

    static let exampleMessageTypeVoice = MessageModel(id: UUID(), localId: 0, roomId: 0, messageId: 0, senderId: 0, type: MessageType.Voice.rawValue, content: "Voice", repliedMessage: nil, status: MessageStatus.VoiceListened.rawValue, isDeleted: false, createdAt: 0, updatedAt: 0)

    

    static let exampleMessageTypePost = MessageModel(id: UUID(), localId: 0, roomId: 0, messageId: 0, senderId: 0, type: MessageType.Post.rawValue, content: "Последнее сообщение в чате", repliedMessage: nil, status: MessageStatus.VoiceListened.rawValue, isDeleted: false, createdAt: 0, updatedAt: 0)

    

    static let exampleMessageTypeAccount = MessageModel(id: UUID(), localId: 0, roomId: 0, messageId: 0, senderId: 0, type: MessageType.Acoount.rawValue, content: "Account", repliedMessage: nil, status: MessageStatus.VoiceListened.rawValue, isDeleted: false, createdAt: 0, updatedAt: 0)

    

    static let exampleMessageTypeGeolocation = MessageModel(id: UUID(), localId: 0, roomId: 0, messageId: 0, senderId: 0, type: MessageType.Geolocation.rawValue, content: "Geolocation", repliedMessage: nil, status: MessageStatus.VoiceListened.rawValue, isDeleted: false, createdAt: 0, updatedAt: 0)

    

    static let exampleMessageTypeVideo = MessageModel(id: UUID(), localId: 0, roomId: 0, messageId: 0, senderId: 0, type: MessageType.Video.rawValue, content: "Video", repliedMessage: nil, status: MessageStatus.VoiceListened.rawValue, isDeleted: false, createdAt: 0, updatedAt: 0)

    

    static let exampleMessageTypeRecordedVideo = MessageModel(id: UUID(), localId: 0, roomId: 0, messageId: 0, senderId: 0, type: MessageType.RecordedVideo.rawValue, content: "Последнее сообщение в чате", repliedMessage: nil, status: MessageStatus.VoiceListened.rawValue, isDeleted: false, createdAt: 0, updatedAt: 0)

    

    static let exampleMessageTypeStoryComment = MessageModel(id: UUID(), localId: 0, roomId: 0, messageId: 0, senderId: 0, type: MessageType.StoryComment.rawValue, content: "Последнее сообщение в чате", repliedMessage: nil, status: MessageStatus.VoiceListened.rawValue, isDeleted: false, createdAt: 0, updatedAt: 0)

    

    static let exampleMessageTypeAudioCall = MessageModel(id: UUID(), localId: 0, roomId: 0, messageId: 0, senderId: 0, type: MessageType.AudioCall.rawValue, content: "Последнее сообщение в чате", repliedMessage: nil, status: MessageStatus.VoiceListened.rawValue, isDeleted: false, createdAt: 0, updatedAt: 0)

    

    static let exampleMessageTypeVideoCall = MessageModel(id: UUID(), localId: 0, roomId: 0, messageId: 0, senderId: 0, type: MessageType.VideoCall.rawValue, content: "Последнее сообщение в чате", repliedMessage: nil, status: MessageStatus.VoiceListened.rawValue, isDeleted: false, createdAt: 0, updatedAt: 0)

    

    static let exampleMessageTypeSticker = MessageModel(id: UUID(), localId: 0, roomId: 0, messageId: 0, senderId: 0, type: MessageType.Sticker.rawValue, content: "Последнее сообщение в чате", repliedMessage: nil, status: MessageStatus.VoiceListened.rawValue, isDeleted: false, createdAt: 0, updatedAt: 0)

    

    static let exampleMessageTypeDraftMessage = MessageModel(id: UUID(), localId: 0, roomId: 0, messageId: 0, senderId: 0, type: MessageType.DraftMessage.rawValue, content: "Последнее сообщение в чате", repliedMessage: nil, status: MessageStatus.VoiceListened.rawValue, isDeleted: false, createdAt: 0, updatedAt: 0)
    
//    #endif
}

struct MediaContentModel: Hashable {
    var path: String
    var width: Int
    var height: Int
    var duration: Int64?
    var thumbnail: String
    var localPathUrl: String
    var mime: String
}

struct FileContentModel: Hashable {
    var path: String
    var fileName: String
    var size: Int
    var localPathUrl: String
    var mime: String
}

struct VoiceContentModel: Hashable {
    var path: String
    var duration: Int64
    var amplitude: String
    var localPathUrl: String
    var mime: String
}
