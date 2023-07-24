//
// ConversationsPinRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public struct ConversationsPinRequest: Encodable, UniqueIdProtocol {
    public var conversationIds: [Int]
    public let uniqueId: String

    public init(conversationIds: [Int]) {
        self.conversationIds = conversationIds
        uniqueId = UUID().uuidString
    }

    private enum CodingKeys: String, CodingKey {
        case name
    }

    public func encode(to encoder: Encoder) throws {}
}

