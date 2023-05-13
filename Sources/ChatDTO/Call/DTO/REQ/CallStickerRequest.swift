//
// CallStickerRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/16/22

import Foundation
import ChatModels

public struct CallStickerRequest: Encodable, UniqueIdProtocol {
    public let callId: Int
    public let stickers: [CallSticker]
    public var uniqueId: String

    public init(callId: Int, stickers: [CallSticker], uniqueId: String = UUID().uuidString) {
        self.callId = callId
        self.stickers = stickers
        self.uniqueId = uniqueId
    }

    private enum CodingKeys: CodingKey {
        case callId
        case stickers
        case uniqueId
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.callId, forKey: .callId)
        try container.encode(self.stickers, forKey: .stickers)
        try container.encode(self.uniqueId, forKey: .uniqueId)
    }
}
