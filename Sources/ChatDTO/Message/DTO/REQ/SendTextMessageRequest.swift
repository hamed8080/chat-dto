//
// SendTextMessageRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation
import ChatModels

public struct SendTextMessageRequest: Encodable, UniqueIdProtocol {
    public var queueTime: Date = .init()
    public let messageType: MessageType
    public var metadata: String?
    public let repliedTo: Int?
    public let systemMetadata: String?
    public let textMessage: String
    public var threadId: Int
    public let uniqueId: String
    public var typeCode: String?

    public init(threadId: Int,
                textMessage: String,
                messageType: MessageType,
                metadata: String? = nil,
                repliedTo: Int? = nil,
                systemMetadata: String? = nil)
    {
        self.messageType = messageType
        self.metadata = metadata
        self.repliedTo = repliedTo
        self.systemMetadata = systemMetadata
        self.textMessage = textMessage
        self.threadId = threadId
        self.uniqueId = UUID().uuidString
    }

    internal init(threadId: Int,
                textMessage: String,
                messageType: MessageType,
                metadata: String? = nil,
                repliedTo: Int? = nil,
                systemMetadata: String? = nil,
                uniqueId: String)
    {
        self.messageType = messageType
        self.metadata = metadata
        self.repliedTo = repliedTo
        self.systemMetadata = systemMetadata
        self.textMessage = textMessage
        self.threadId = threadId
        self.uniqueId = uniqueId
    }

    private enum CodingKeys: CodingKey {
        case queueTime
        case messageType
        case metadata
        case repliedTo
        case systemMetadata
        case textMessage
        case threadId
        case uniqueId
        case typeCode
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.queueTime, forKey: .queueTime)
        try container.encode(self.messageType, forKey: .messageType)
        try container.encodeIfPresent(self.metadata, forKey: .metadata)
        try container.encodeIfPresent(self.repliedTo, forKey: .repliedTo)
        try container.encodeIfPresent(self.systemMetadata, forKey: .systemMetadata)
        try container.encode(self.textMessage, forKey: .textMessage)
        try container.encode(self.threadId, forKey: .threadId)
        try container.encodeIfPresent(self.uniqueId, forKey: .uniqueId)
        try container.encodeIfPresent(self.typeCode, forKey: .typeCode)
    }
}
