//
// RemoveContactsRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public struct RemoveContactsRequest: Encodable, UniqueIdProtocol {
    public let contactId: Int
    public var typeCode: String?
    public var uniqueId: String

    public init(contactId: Int, uniqueId: String = UUID().uuidString) {
        self.contactId = contactId
        self.uniqueId = uniqueId
    }

    private enum CodingKeys: String, CodingKey {
        case contactId = "id"
        case typeCode
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encode(contactId, forKey: .contactId)
        try? container.encodeIfPresent(typeCode, forKey: .typeCode)
    }
}
