//
// RactionListRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public struct RactionListRequest: Encodable, UniqueIdProtocol {
    public let messageId: Int
    public let offset: Int
    public let count: Int
    public let conversationId: Int
    public let uniqueId: String

    public init(messageId: Int, offset: Int = 0, count: Int = 25, conversationId: Int) {
        self.messageId = messageId
        self.count = count
        self.offset = offset
        self.conversationId = conversationId
        self.uniqueId = UUID().uuidString
    }

    enum CodingKeys: CodingKey {
        case messageId
        case offset
        case count
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.messageId, forKey: .messageId)
        try container.encode(self.offset, forKey: .offset)
        try container.encode(self.count, forKey: .count)
    }
}
