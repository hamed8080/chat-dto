//
// BlockedListRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public struct BlockedListRequest: Encodable, UniqueIdProtocol {
    public let count: Int
    public let offset: Int
    public let uniqueId: String

    public init(count: Int = 25, offset: Int = 0) {
        self.count = count
        self.offset = offset
        self.uniqueId = UUID().uuidString
    }

    private enum CodingKeys: String, CodingKey {
        case count
        case offset
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encodeIfPresent(count, forKey: .count)
        try? container.encodeIfPresent(offset, forKey: .offset)
    }
}
