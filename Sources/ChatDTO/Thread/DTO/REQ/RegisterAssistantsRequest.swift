//
// RegisterAssistantsRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation
import ChatModels

public struct RegisterAssistantsRequest: Encodable, UniqueIdProtocol {
    public let assistants: [Assistant]
    public let uniqueId: String

    public init(assistants: [Assistant], uniqueId: String = "G-\(UUID().uuidString)") {
        self.assistants = assistants
        self.uniqueId = uniqueId
    }

    private enum CodingKeys: CodingKey {
        case assistants
        case uniqueId
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.assistants, forKey: .assistants)
        try container.encode(self.uniqueId, forKey: .uniqueId)
    }
}
