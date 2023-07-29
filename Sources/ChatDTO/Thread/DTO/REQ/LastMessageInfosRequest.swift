//
// LastMessageInfosRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation
import ChatModels

public struct LastMessageInfosRequest: UniqueIdProtocol {
    public var conversationIds: [Int]
    public let uniqueId: String

    public init(conversationIds: [Int]) {
        self.conversationIds = conversationIds
        self.uniqueId = UUID().uuidString
    }
}
