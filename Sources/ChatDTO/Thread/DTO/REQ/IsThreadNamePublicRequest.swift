//
// IsThreadNamePublicRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public struct IsThreadNamePublicRequest: Encodable, UniqueIdProtocol {
    public let name: String
    public var uniqueId: String

    public init(name: String, uniqueId: String = UUID().uuidString) {
        self.name = name
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
