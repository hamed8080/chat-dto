//
// StatusPingType.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public enum StatusPingType: Int, Encodable, Identifiable, CaseIterable {
    public var id: Self { self }
    case chat
    case thread
    case contacts
    case threadId
    case contactId
}

public struct SendStatusPingRequest: Encodable, UniqueIdProtocol {
    public let statusType: StatusPingType
    public let id: Int?
    public var uniqueId: String

    public init(statusType: StatusPingType, uniqueId: String = UUID().uuidString) {
        id = nil
        self.statusType = statusType
        self.uniqueId = uniqueId
    }

    public init(statusType: StatusPingType, contactId: Int, uniqueId: String = UUID().uuidString) {
        id = contactId
        self.statusType = statusType
        self.uniqueId = uniqueId
    }

    public init(statusType: StatusPingType, threadId: Int, uniqueId: String = UUID().uuidString) {
        id = threadId
        self.statusType = statusType
        self.uniqueId = uniqueId
    }

    private enum CodingKeys: String, CodingKey {
        case location
        case locationId
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        if statusType == .chat {
            try container.encode(1, forKey: .location)
        } else if statusType == .contacts || statusType == .contactId {
            try container.encode(3, forKey: .location)
        } else if statusType == .thread || statusType == .threadId {
            try container.encode(2, forKey: .location)
        }
        try container.encodeIfPresent(id, forKey: .locationId)
    }
}
