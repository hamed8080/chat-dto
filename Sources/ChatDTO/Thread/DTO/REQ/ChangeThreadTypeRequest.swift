//
// ChangeThreadTypeRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation
import ChatModels

public struct ChangeThreadTypeRequest: Encodable, UniqueIdProtocol {
    public let uniqueName: String?
    public var threadId: Int
    public var type: ThreadTypes
    public let uniqueId: String

    public init(threadId: Int, type: ThreadTypes, uniqueName: String? = nil, uniqueId: String = "G-\(UUID().uuidString)") {
        self.type = type
        self.threadId = threadId
        self.uniqueName = uniqueName
        self.uniqueId = uniqueId
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case uniqueName
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encode(type, forKey: .type)
        try? container.encodeIfPresent(uniqueName, forKey: .uniqueName)
    }
}
