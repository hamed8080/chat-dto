//
// CreateCallThreadRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/16/22

import Foundation

public struct CreateCallThreadRequest: Encodable, UniqueIdProtocol {
    public let title: String?
    public let image: String?
    public let description: String?
    public let metadata: String?
    public let uniqueName: String?
    public let uniqueId: String?

    public init(title: String? = nil, image: String? = nil, description: String? = nil, metadata: String? = nil, uniqueName: String? = nil, uniqueId: String? = nil) {
        self.title = title
        self.image = image
        self.description = description
        self.metadata = metadata
        self.uniqueName = uniqueName
        self.uniqueId = uniqueId
    }

    private enum CodingKeys: String, CodingKey {
        case title
        case image
        case description
        case metadata
        case uniqueName
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(image, forKey: .image)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(metadata, forKey: .metadata)
        try container.encodeIfPresent(uniqueName, forKey: .uniqueName)
    }
}
