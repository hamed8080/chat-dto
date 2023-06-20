//
// DeleteMessageRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public struct DeleteMessageRequest: Encodable, UniqueIdProtocol {
    public let deleteForAll: Bool
    public let messageId: Int
    public let uniqueId: String

    public init(deleteForAll: Bool? = false, messageId: Int) {
        self.deleteForAll = deleteForAll ?? false
        self.messageId = messageId
        self.uniqueId = UUID().uuidString
    }

    private enum CodingKeys: String, CodingKey {
        case deleteForAll
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(deleteForAll, forKey: .deleteForAll)
    }
}
