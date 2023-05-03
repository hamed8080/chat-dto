//
// UserRoleRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation
import ChatModels

public struct UserRoleRequest: Encodable {
    private let userId: Int
    private var roles: [Roles] = []

    public init(userId: Int, roles: [Roles]) {
        self.roles = roles
        self.userId = userId
    }

    private enum CodingKeys: String, CodingKey {
        case userId
        case roles
        case checkThreadMembership
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(userId, forKey: .userId)
        try container.encode(roles, forKey: .roles)
        try container.encode(false, forKey: .checkThreadMembership)
    }
}
