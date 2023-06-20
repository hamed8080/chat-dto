//
// AddParticipantRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation
import ChatModels

public struct AddParticipantRequest: Encodable, UniqueIdProtocol {
    public var id: String?
    public var idType: InviteeTypes?
    public var threadId: Int
    public var contactIds: [Int]?
    public let uniqueId: String

    public init(userName: String, threadId: Int) {
        idType = .username
        id = userName
        self.threadId = threadId
        self.uniqueId = UUID().uuidString
    }

    public init(coreUserId: Int, threadId: Int) {
        idType = .coreUserId
        id = "\(coreUserId)"
        self.threadId = threadId
        self.uniqueId = UUID().uuidString
    }

    public init(contactIds: [Int], threadId: Int) {
        self.contactIds = contactIds
        self.threadId = threadId
        self.uniqueId = UUID().uuidString
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case idType
    }

    public func encode(to encoder: Encoder) throws {
        if contactIds == nil {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try? container.encode(id, forKey: .id)
            try? container.encode(idType, forKey: .idType)
        } else if let contactIds = contactIds {
            var container = encoder.unkeyedContainer()
            try? container.encode(contentsOf: contactIds)
        }
    }
}
