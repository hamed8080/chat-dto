//
// FileRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public struct FileRequest: Encodable, UniqueIdProtocol {
    public let hashCode: String
    public let checkUserGroupAccess: Bool
    public var forceToDownloadFromServer: Bool
    public var uniqueId: String

    public init(hashCode: String, checkUserGroupAccess: Bool = true, forceToDownloadFromServer: Bool = false, uniqueId: String = UUID().uuidString) {
        self.hashCode = hashCode
        self.forceToDownloadFromServer = forceToDownloadFromServer
        self.checkUserGroupAccess = checkUserGroupAccess
        self.uniqueId = uniqueId
    }

    private enum CodingKeys: String, CodingKey {
        case uniqueId
        case checkUserGroupAccess
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encode(uniqueId, forKey: .uniqueId)
        try? container.encode(checkUserGroupAccess, forKey: .checkUserGroupAccess)
    }
}
