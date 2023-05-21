//
// ThreadsUnreadCountRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public struct ThreadsUnreadCountRequest: Encodable, UniqueIdProtocol {
    public let threadIds: [Int]
    public let uniqueId: String?

    public init(threadIds: [Int], uniqueId: String? = nil) {
        self.threadIds = threadIds
        self.uniqueId = uniqueId
    }

    public func encode(to _: Encoder) throws {}
}
