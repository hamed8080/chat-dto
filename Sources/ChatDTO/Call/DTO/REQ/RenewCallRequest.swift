//
// RenewCallRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/16/22

import Foundation
import ChatModels

public struct RenewCallRequest: Encodable, UniqueIdProtocol{
    public let invitess: [Invitee]
    public let callId: Int
    public var uniqueId: String

    public init(invitees: [Invitee], callId: Int, uniqueId: String = UUID().uuidString) {
        invitess = invitees
        self.callId = callId
        self.uniqueId = uniqueId
    }

    private enum CodingKeys: CodingKey {
        case invitess
        case callId
        case uniqueId
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.invitess, forKey: .invitess)
        try container.encode(self.callId, forKey: .callId)
        try container.encode(self.uniqueId, forKey: .uniqueId)
    }
}
