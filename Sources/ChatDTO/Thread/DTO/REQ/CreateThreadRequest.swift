//
// CreateThreadRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation
import ChatModels

public struct CreateThreadRequest: Encodable, UniqueIdProtocol {
    public let description: String?
    public let image: String?
    public let invitees: [Invitee]?
    public let metadata: String?
    public let title: String
    public let type: ThreadTypes?
    public let uniqueName: String? // only for public thread
    public let uniqueId: String

    public init(description: String? = nil,
                image: String? = nil,
                invitees: [Invitee]? = nil,
                metadata: String? = nil,
                title: String,
                type: ThreadTypes? = nil,
                uniqueName: String? = nil)
    {
        self.description = description
        self.image = image
        self.invitees = invitees
        self.metadata = metadata
        self.title = title
        self.type = type
        self.uniqueName = uniqueName
        self.uniqueId = UUID().uuidString
    }

    private enum CodingKeys: String, CodingKey {
        case title
        case image
        case description
        case metadata
        case uniqueName
        case type
        case invitees
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(image, forKey: .image)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(metadata, forKey: .metadata)
        try container.encodeIfPresent(uniqueName, forKey: .uniqueName)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(invitees, forKey: .invitees)
    }
}
