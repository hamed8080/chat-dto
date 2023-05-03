//
// LeaveThreadRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public struct LeaveThreadRequest: Encodable, UniqueIdProtocol {
    public let threadId: Int
    public let clearHistory: Bool?
    public var uniqueId: String

    public init(threadId: Int, clearHistory: Bool? = false, uniqueId: String = UUID().uuidString) {
        self.clearHistory = clearHistory
        self.threadId = threadId
        self.uniqueId = uniqueId
    }

    private enum CodingKeys: String, CodingKey {
        case clearHistory
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(clearHistory, forKey: .clearHistory)
    }
}
