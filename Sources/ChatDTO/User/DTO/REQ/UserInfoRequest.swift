//
// UserInfoRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public struct UserInfoRequest: Encodable, UniqueIdProtocol {
    public let uniqueId: String

    public init(uniqueId: String = "G-\(UUID().uuidString)") {
        self.uniqueId = uniqueId
    }

    private enum CodingKeys: CodingKey {
        case uniqueId
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.uniqueId, forKey: .uniqueId)
    }
}
