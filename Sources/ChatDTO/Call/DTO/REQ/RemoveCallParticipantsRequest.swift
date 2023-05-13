//
// RemoveCallParticipantsRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/16/22

import Foundation
import ChatModels

public struct RemoveCallParticipantsRequest: Encodable, UniqueIdProtocol {
    public let callId: Int
    public var userIds: [Int]
    public var uniqueId: String

    public init(callId: Int, userIds: [Int], uniqueId: String = UUID().uuidString) {
        self.callId = callId
        self.userIds = userIds
        self.uniqueId = uniqueId
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        if userIds.count > 0 {
            try? container.encode(userIds)
        }
    }
}
