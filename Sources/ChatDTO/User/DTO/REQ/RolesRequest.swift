//
// RolesRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation
import ChatModels

public struct RolesRequest: Encodable, UniqueIdProtocol {
    public let userRoles: [UserRoleRequest]
    public let threadId: Int
    public let uniqueId: String?

    public init(userRoles: [UserRoleRequest], threadId: Int, uniqueId: String? = nil) {
        self.userRoles = userRoles
        self.threadId = threadId
        self.uniqueId = uniqueId
    }

    private enum CodingKeys: CodingKey {
        case userRoles
        case threadId
        case uniqueId
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.userRoles, forKey: .userRoles)
        try container.encode(self.threadId, forKey: .threadId)
        try container.encode(self.uniqueId, forKey: .uniqueId)
    }
}
