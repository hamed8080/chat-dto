//
// AdminRoleRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation
import ChatModels

public struct AdminRoleRequest: Encodable, UniqueIdProtocol {
    public let invitees: [Invitee]
    public let conversationId: Int
    public let uniqueId: String

    public init(participants: [Invitee], conversationId: Int) {
        self.invitees = participants
        self.conversationId = conversationId
        self.uniqueId = UUID().uuidString
    }

    private enum CodingKeys: String, CodingKey {
        case invitees
        case uniqueId
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(invitees, forKey: .invitees)
    }
}
