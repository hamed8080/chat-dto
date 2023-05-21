//
// RemoveParticipantsRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public struct RemoveParticipantsRequest: Encodable, UniqueIdProtocol {
    public let participantIds: [Int]
    public let threadId: Int
    public let uniqueId: String?

    public init(participantId: Int, threadId: Int, uniqueId: String? = nil) {
        self.threadId = threadId
        participantIds = [participantId]
        self.uniqueId = uniqueId
    }

    public init(participantIds: [Int], threadId: Int, uniqueId: String? = nil) {
        self.threadId = threadId
        self.participantIds = participantIds
        self.uniqueId = uniqueId
    }

    private enum CodingKeys: CodingKey {
        case participantIds
        case threadId
        case uniqueId
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.participantIds, forKey: .participantIds)
        try container.encode(self.threadId, forKey: .threadId)
        try container.encode(self.uniqueId, forKey: .uniqueId)
    }
}
