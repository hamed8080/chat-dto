//
// AddReactionRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public struct AddReactionRequest: Encodable, UniqueIdProtocol {
    public let messageId: Int
    public let conversationId: Int
    public let reaction: String
    public let uniqueId: String

    public init(messageId: Int, conversationId: Int, reaction: String) {
        self.messageId = messageId
        self.reaction = reaction
        self.conversationId = conversationId
        self.uniqueId = UUID().uuidString
    }

    private enum CodingKeys: String, CodingKey {
        case messageId
        case reaction
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(messageId, forKey: .messageId)
        try container.encode(reaction, forKey: .reaction)
    }
}
