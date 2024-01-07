//
// LastActionInConversationRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public struct LastActionInConversationRequest: Encodable, UniqueIdProtocol {
    public var ids: [Int]
    public let uniqueId: String

    public init(ids: [Int]) {
        self.ids = ids
        self.uniqueId = UUID().uuidString
    }
}
