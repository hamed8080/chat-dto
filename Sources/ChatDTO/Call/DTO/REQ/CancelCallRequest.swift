//
// CancelCallRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/16/22

import Foundation
import ChatModels

public struct CancelCallRequest: Encodable, UniqueIdProtocol {
    public let call: Call
    public let uniqueId: String

    public init(call: Call, uniqueId: String = "G-\(UUID().uuidString)") {
        self.call = call
        self.uniqueId = uniqueId
    }

    private enum CodingKeys: CodingKey {
        case call
        case uniqueId
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.call, forKey: .call)
        try container.encode(self.uniqueId, forKey: .uniqueId)
    }
}
