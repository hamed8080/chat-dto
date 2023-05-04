//
// GetUserBotsRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

/// The request to fetch the list of user bots.
public struct GetUserBotsRequest: Encodable, UniqueIdProtocol {
    public var uniqueId: String

    public init(uniqueId: String = UUID().uuidString) {
        self.uniqueId = uniqueId
    }

    private enum CodingKeys: CodingKey {
        case uniqueId
    }

    public func encode(to encoder: Encoder) throws {}
}
