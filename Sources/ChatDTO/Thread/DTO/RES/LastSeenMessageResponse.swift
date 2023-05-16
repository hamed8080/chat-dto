//
// LastSeenMessageResponse.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public struct LastSeenMessageResponse: Decodable {
    public let id: Int?
    public let unreadCount: Int?

    private enum CodingKeys: CodingKey {
        case id
        case unreadCount
    }

    public init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        id = try container?.decodeIfPresent(Int.self, forKey: .id)
        unreadCount = try container?.decodeIfPresent(Int.self, forKey: .unreadCount) ?? 0
    }

    public init(id: Int? = nil, unreadCount: Int? = nil) {
        self.id = id
        self.unreadCount = unreadCount
    }
}
