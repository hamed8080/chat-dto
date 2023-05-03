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
    public var subjectId: Int { threadId }
    public var uniqueId: String

    public init(userName: String, threadId: Int, uniqueId: String = UUID().uuidString) {
        idType = .username
        id = userName
        self.threadId = threadId
        self.uniqueId = uniqueId
    }

    public init(coreUserId: Int, threadId: Int, uniqueId: String = UUID().uuidString) {
        idType = .coreUserId
        id = "\(coreUserId)"
        self.threadId = threadId
        self.uniqueId = uniqueId
    }

    public init(contactIds: [Int], threadId: Int, uniqueId: String = UUID().uuidString) {
        self.contactIds = contactIds
        self.threadId = threadId
        self.uniqueId = uniqueId
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
