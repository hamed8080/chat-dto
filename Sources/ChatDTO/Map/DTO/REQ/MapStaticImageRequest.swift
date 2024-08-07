//
// MapStaticImageRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public struct MapStaticImageRequest: Encodable, UniqueIdProtocol, TypeCodeIndexProtocol {
    public var key: String?
    public var center: String
    public var height: Int = 500
    public var type: String = "standard-night"
    public var width: Int = 800
    public var zoom: Int = 15
    public let uniqueId: String
    public var typeCodeIndex: Index

    public init(center: Coordinate,
                key: String? = nil,
                height: Int = 500,
                width: Int = 800,
                zoom: Int = 15,
                type: String = "standard-night",
                typeCodeIndex: TypeCodeIndexProtocol.Index = 0
    )
    {
        self.center = "\(center.lat),\(center.lng)"
        self.type = type
        self.height = height
        self.width = width
        self.zoom = zoom
        self.key = key
        self.uniqueId = UUID().uuidString
        self.typeCodeIndex = typeCodeIndex
    }

    public init(request: MapStaticImageRequest, key: String?) {
        self = request
        self.key = key
    }

    private enum CodingKeys: String, CodingKey {
        case key
        case center
        case height
        case type
        case width
        case zoom
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(key, forKey: .key)
        try container.encodeIfPresent(center, forKey: .center)
        try container.encodeIfPresent(height, forKey: .height)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(width, forKey: .width)
        try container.encodeIfPresent(zoom, forKey: .zoom)
    }
}
