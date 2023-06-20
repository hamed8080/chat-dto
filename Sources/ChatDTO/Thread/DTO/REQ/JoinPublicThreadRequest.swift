//
// JoinPublicThreadRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation
import ChatModels

public struct JoinPublicThreadRequest: Encodable, UniqueIdProtocol {
    public var threadName: String
    public let uniqueId: String

    public init(threadName: String) {
        self.threadName = threadName
        self.uniqueId = UUID().uuidString
    }

    private enum CodingKeys: CodingKey {
        case threadName
        case uniqueId
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.threadName, forKey: .threadName)
        try container.encode(self.uniqueId, forKey: .uniqueId)
    }
}
