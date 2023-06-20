//
// EditTagRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public struct EditTagRequest: Encodable, UniqueIdProtocol {
    public var name: String
    public var id: Int
    public let uniqueId: String

    public init(id: Int, tagName: String) {
        self.id = id
        name = tagName
        self.uniqueId = UUID().uuidString
    }

    private enum CodingKeys: String, CodingKey {
        case name
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encode(name, forKey: .name)
    }
}
