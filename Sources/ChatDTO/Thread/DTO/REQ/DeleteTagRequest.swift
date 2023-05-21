//
// DeleteTagRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public struct DeleteTagRequest: Encodable, UniqueIdProtocol {
    public var id: Int
    public let uniqueId: String?

    public init(id: Int, uniqueId: String? = nil) {
        self.id = id
        self.uniqueId = uniqueId
    }

    private enum CodingKeys: CodingKey {
        case id
        case uniqueId
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.uniqueId, forKey: .uniqueId)
    }
}
