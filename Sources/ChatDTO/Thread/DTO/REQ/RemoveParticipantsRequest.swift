//
// RemoveParticipantsRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation
import ChatModels

public struct RemoveParticipantsRequest: Encodable, UniqueIdProtocol {
    public let participantIds: [Int]?
    public let invitees: [Invitee]?
    public let threadId: Int
    public let uniqueId: String

    public init(participantId: Int, threadId: Int) {
        self.threadId = threadId
        participantIds = [participantId]
        self.uniqueId = UUID().uuidString
        invitees = nil
    }

    public init(participantIds: [Int], threadId: Int) {
        self.threadId = threadId
        self.participantIds = participantIds
        self.uniqueId = UUID().uuidString
        invitees = nil
    }

    public init(invitess: [Invitee], threadId: Int) {
        self.threadId = threadId
        self.invitees = invitess
        self.uniqueId = UUID().uuidString
        participantIds = nil
    }

    private enum CodingKeys: CodingKey {
        case participantIds
        case invitees
        case threadId
        case uniqueId
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(participantIds, forKey: .participantIds)
        try container.encodeIfPresent(invitees, forKey: .invitees)
        try container.encode(threadId, forKey: .threadId)
        try container.encode(uniqueId, forKey: .uniqueId)
    }
}
