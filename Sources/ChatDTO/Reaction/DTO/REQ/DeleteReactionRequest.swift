//
// DeleteReactionRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public struct DeleteReactionRequest: Encodable, UniqueIdProtocol {
    public let reactionId: Int
    public let uniqueId: String

    public init(reactionId: Int) {
        self.reactionId = reactionId
        self.uniqueId = UUID().uuidString
    }
}
