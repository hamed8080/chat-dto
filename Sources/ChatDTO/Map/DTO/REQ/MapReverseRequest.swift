//
// MapReverseRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public struct MapReverseRequest: Encodable, UniqueIdProtocol {
    public let lat: Double
    public let lng: Double
    public let uniqueId: String?

    public init(lat: Double, lng: Double, uniqueId: String? = nil) {
        self.lat = lat
        self.lng = lng
        self.uniqueId = uniqueId
    }

    private enum CodingKeys: String, CodingKey {
        case lat
        case lng
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encode(lat, forKey: .lat)
        try? container.encode(lng, forKey: .lng)
    }
}
