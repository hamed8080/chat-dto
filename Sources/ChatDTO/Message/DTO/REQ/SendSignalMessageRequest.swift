//
// SendSignalMessageRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation
import ChatModels

public struct SendSignalMessageRequest: Encodable, UniqueIdProtocol {
    public let signalType: SignalMessageType
    public let threadId: Int
    public let uniqueId: String

    public init(signalType: SignalMessageType, threadId: Int) {
        self.signalType = signalType
        self.threadId = threadId
        self.uniqueId = UUID().uuidString
    }

    private enum CodingKeys: String, CodingKey {
        case type
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode("\(signalType.rawValue)", forKey: .type)
    }
}
