//
// CreateTagRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public struct CreateTagRequest: Encodable, UniqueIdProtocol {
    public var name: String
    public let uniqueId: String

    public init(tagName: String, uniqueId: String = "G-\(UUID().uuidString)") {
        name = tagName
        self.uniqueId = uniqueId
    }

    private enum CodingKeys: String, CodingKey {
        case name
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encode(name, forKey: .name)
    }
}
