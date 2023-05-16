//
// RemoveTagParticipantsRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation
import ChatModels

public struct RemoveTagParticipantsRequest: Encodable, UniqueIdProtocol {
    public var tagId: Int
    public var tagParticipants: [TagParticipant]
    public let uniqueId: String

    public init(tagId: Int, tagParticipants: [TagParticipant], uniqueId: String = UUID().uuidString) {
        self.tagId = tagId
        self.tagParticipants = tagParticipants
        self.uniqueId = uniqueId
    }

    private enum CodingKeys: CodingKey {
        case tagId
        case tagParticipants
        case uniqueId
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.tagId, forKey: .tagId)
        try container.encode(self.tagParticipants, forKey: .tagParticipants)
        try container.encode(self.uniqueId, forKey: .uniqueId)
    }
}
