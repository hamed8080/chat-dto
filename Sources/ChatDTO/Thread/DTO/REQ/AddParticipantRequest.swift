//
// AddParticipantRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation
import ChatModels

public struct AddParticipantRequest: Encodable, UniqueIdProtocol {
    private var invitees: [Invitee]?
    public var threadId: Int
    public var contactIds: [Int]?
    public var coreUserIds: [Int]?
    public var userNames: [String]?
    public let uniqueId: String

    public init(userNames: [String], threadId: Int) {
        invitees = userNames.map { .init(id: $0, idType : .username) }
        self.threadId = threadId
        self.uniqueId = UUID().uuidString
    }

    public init(coreUserIds: [Int], threadId: Int) {
        invitees = coreUserIds.map { .init(id: "\($0)", idType : .coreUserId) }
        self.threadId = threadId
        self.uniqueId = UUID().uuidString
    }

    public init(contactIds: [Int], threadId: Int) {
        self.contactIds = contactIds
        self.threadId = threadId
        self.uniqueId = UUID().uuidString
    }

    public func encode(to encoder: Encoder) throws {
        if let invitees = invitees {
            var container = encoder.unkeyedContainer()
            try? container.encode(contentsOf: invitees)
        } else if let contactIds = contactIds {
            var container = encoder.unkeyedContainer()
            try? container.encode(contentsOf: contactIds)
        }
    }
}
