//
// RactionCountRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public struct RactionCountRequest: Encodable, UniqueIdProtocol {
    public var messageIds: [Int]
    public let conversationId: Int
    public let uniqueId: String

    public init(messageIds: [Int], conversationId: Int) {
        self.messageIds = messageIds
        self.conversationId = conversationId
        self.uniqueId = UUID().uuidString
    }
}
