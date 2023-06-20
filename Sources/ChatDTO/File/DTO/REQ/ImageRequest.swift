//
// ImageRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public struct ImageRequest: Encodable, UniqueIdProtocol {
    public let hashCode: String
    public var forceToDownloadFromServer: Bool
    public let quality: Float?
    public let size: ImageSize?
    public let crop: Bool?
    public let checkUserGroupAccess: Bool
    /// Setting this property to true leads to the thumbnail image not save on the disk .
    public let thumbnail: Bool
    public let uniqueId: String

    public init(hashCode: String, checkUserGroupAccess: Bool = true, forceToDownloadFromServer: Bool = false, quality: Float? = nil, size: ImageSize? = nil, crop: Bool? = nil, thumbnail: Bool = false, uniqueId: String = "G-\(UUID().uuidString)") {
        self.hashCode = hashCode
        self.forceToDownloadFromServer = forceToDownloadFromServer
        self.size = size
        self.crop = crop
        self.quality = quality ?? 1
        self.checkUserGroupAccess = checkUserGroupAccess
        self.thumbnail = thumbnail
        self.uniqueId = uniqueId
    }

    private enum CodingKeys: String, CodingKey {
        case size
        case quality
        case crop
        case checkUserGroupAccess
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encodeIfPresent(size, forKey: .size)
        try? container.encodeIfPresent(crop, forKey: .crop)
        try? container.encodeIfPresent(quality, forKey: .quality)
        try? container.encodeIfPresent(checkUserGroupAccess, forKey: .checkUserGroupAccess)
    }
}
