//
// UnBlockRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public struct UnBlockRequest: Encodable, UniqueIdProtocol {
    public let contactId: Int?
    public let threadId: Int?
    public let userId: Int?
    public let uniqueId: String

    public init(contactId: Int? = nil,
                threadId: Int? = nil,
                userId: Int? = nil,
                uniqueId: String = "G-\(UUID().uuidString)")
    {
        self.contactId = contactId
        self.threadId = threadId
        self.userId = userId
        self.uniqueId = uniqueId
    }

    private enum CodingKeys: String, CodingKey {
        case contactId
        case threadId
        case userId
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encodeIfPresent(contactId, forKey: .contactId)
        try? container.encodeIfPresent(threadId, forKey: .threadId)
        try? container.encodeIfPresent(userId, forKey: .userId)
    }
}
