//
// UserReactionRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public struct UserReactionRequest: Encodable, UniqueIdProtocol {
    public let messageId: Int
    public let conversationId: Int
    public let uniqueId: String

    public init(messageId: Int, conversationId: Int) {
        self.messageId = messageId
        self.conversationId = conversationId
        self.uniqueId = UUID().uuidString
    }

    private enum CodingKeys: String, CodingKey {
        case messageId
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(messageId, forKey: .messageId)
    }
}
