//
// UNMuteCallRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/16/22

import Foundation

public struct UNMuteCallRequest: Encodable, UniqueIdProtocol {
    public let callId: Int
    public let userIds: [Int]
    public let uniqueId: String

    public init(callId: Int, userIds: [Int], uniqueId: String = "G-\(UUID().uuidString)") {
        self.callId = callId
        self.userIds = userIds
        self.uniqueId = uniqueId
    }

    private enum CodingKeys: CodingKey {
        case callId
        case userIds
        case uniqueId
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.callId, forKey: .callId)
        try container.encode(self.userIds, forKey: .userIds)
        try container.encode(self.uniqueId, forKey: .uniqueId)
    }
}
