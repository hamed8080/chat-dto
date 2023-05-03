//
// AssistantAction.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation
import ChatModels

public struct AssistantAction: Decodable {
    public var actionName: String?
    public var actionTime: UInt?
    public var actionType: Int?
    public var participant: Participant?

    private enum CodingKeys: String, CodingKey {
        case actionName
        case actionTime
        case actionType
        case participantVO
    }

    public init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        actionName = try container?.decodeIfPresent(String.self, forKey: .actionName)
        actionTime = try container?.decodeIfPresent(UInt.self, forKey: .actionTime)
        actionType = try container?.decodeIfPresent(Int.self, forKey: .actionType)
        participant = try container?.decodeIfPresent(Participant.self, forKey: .participantVO)
    }
}
