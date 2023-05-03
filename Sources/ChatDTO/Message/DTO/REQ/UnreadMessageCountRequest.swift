//
// UnreadMessageCountRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public struct UnreadMessageCountRequest: Encodable, UniqueIdProtocol {
    let countMutedThreads: Bool
    public var uniqueId: String

    public init(countMutedThreads: Bool = false, uniqueId: String = UUID().uuidString) {
        self.countMutedThreads = countMutedThreads
        self.uniqueId = uniqueId
    }

    private enum CodingKeys: String, CodingKey {
        case mute
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(countMutedThreads, forKey: .mute)
    }
}
