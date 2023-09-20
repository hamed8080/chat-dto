//
// ReplaceReactionRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation
import ChatModels

public struct ReplaceReactionRequest: Encodable, UniqueIdProtocol {
    public let messageId: Int
    public let conversationId: Int
    public let reactionId: Int
    public let reaction: Sticker
    public let uniqueId: String

    public init(messageId: Int, conversationId: Int, reactionId: Int, reaction: Sticker) {
        self.messageId = messageId
        self.reactionId = reactionId
        self.reaction = reaction
        self.conversationId = conversationId
        self.uniqueId = UUID().uuidString
    }

    private enum CodingKeys: String, CodingKey {
        case messageId
        case reactionId
        case reaction
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(messageId, forKey: .messageId)
        try container.encode(reactionId, forKey: .reactionId)
        try container.encode(reaction, forKey: .reaction)
    }
}
