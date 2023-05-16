//
// PinUnpinMessageRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public struct PinUnpinMessageRequest: Encodable, UniqueIdProtocol {
    public let messageId: Int
    public let notifyAll: Bool
    public let uniqueId: String

    public init(messageId: Int, notifyAll: Bool = false, uniqueId: String = UUID().uuidString) {
        self.messageId = messageId
        self.notifyAll = notifyAll
        self.uniqueId = uniqueId
    }

    private enum CodingKeys: String, CodingKey {
        case notifyAll
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encode(notifyAll, forKey: .notifyAll)
    }
}
