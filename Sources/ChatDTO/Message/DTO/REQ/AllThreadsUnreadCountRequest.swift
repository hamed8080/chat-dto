//
// AllThreadsUnreadCountRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public struct AllThreadsUnreadCountRequest: Encodable, UniqueIdProtocol {
    let mute: Bool
    public let uniqueId: String

    public init(mute: Bool = false, uniqueId: String = "G-\(UUID().uuidString)") {
        self.mute = mute
        self.uniqueId = uniqueId
    }

    private enum CodingKeys: String, CodingKey {
        case mute
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(mute, forKey: .mute)
    }
}
