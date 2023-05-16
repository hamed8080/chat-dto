//
// NotSeenDurationRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public struct NotSeenDurationRequest: Encodable, UniqueIdProtocol {
    public let userIds: [Int]
    public let uniqueId: String

    public init(userIds: [Int], uniqueId: String = UUID().uuidString) {
        self.userIds = userIds
        self.uniqueId = uniqueId
    }

    private enum CodingKeys: String, CodingKey {
        case userIds
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encode(userIds, forKey: .userIds)
    }
}
