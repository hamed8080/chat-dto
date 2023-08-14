//
// DeleteReactionRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public struct DeleteReactionRequest: Encodable, UniqueIdProtocol {
    public let reactionId: Int
    public let conversationId: Int
    public let uniqueId: String

    public init(reactionId: Int, conversationId: Int) {
        self.reactionId = reactionId
        self.conversationId = conversationId
        self.uniqueId = UUID().uuidString
    }

    private enum CodingKeys: CodingKey {
        case reactionId
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.reactionId, forKey: .reactionId)
    }
}
