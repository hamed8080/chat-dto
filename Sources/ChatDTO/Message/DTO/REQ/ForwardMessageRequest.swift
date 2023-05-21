//
// ForwardMessageRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public struct ForwardMessageRequest: Encodable, UniqueIdProtocol {
    public var queueTime: Date = .init()
    public let messageIds: [Int]
    public let fromThreadId: Int
    public let threadId: Int
    public var uniqueIds: [String]
    public var typeCode: String?
    public let uniqueId: String?

    public init(fromThreadId: Int,
                threadId: Int,
                messageIds: [Int],
                uniqueIds: [String] = [])
    {
        self.fromThreadId = fromThreadId
        self.threadId = threadId
        self.messageIds = messageIds
        self.uniqueIds = uniqueIds
        if self.uniqueIds.count == 0 {
            var uniqueIds: [String] = []
            for _ in messageIds {
                uniqueIds.append(UUID().uuidString)
            }
            self.uniqueIds = uniqueIds
        }
        self.uniqueId = "\(self.uniqueIds)"
    }

    private enum CodingKeys: CodingKey {
        case queueTime
        case messageIds
        case fromThreadId
        case threadId
        case uniqueIds
        case typeCode
        case uniqueId
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.queueTime, forKey: .queueTime)
        try container.encode(self.messageIds, forKey: .messageIds)
        try container.encode(self.fromThreadId, forKey: .fromThreadId)
        try container.encode(self.threadId, forKey: .threadId)
        try container.encode(self.uniqueIds, forKey: .uniqueIds)
        try container.encodeIfPresent(self.typeCode, forKey: .typeCode)
        try container.encode(self.uniqueId, forKey: .uniqueId)
    }
}
