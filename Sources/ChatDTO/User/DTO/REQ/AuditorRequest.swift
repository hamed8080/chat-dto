//
// AuditorRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public struct AuditorRequest: Encodable, UniqueIdProtocol {
    public let userRoles: [UserRoleRequest]
    public let threadId: Int
    public let uniqueId: String

    public init(userRoleRequest: UserRoleRequest, threadId: Int, uniqueId: String = "G-\(UUID().uuidString)") {
        self.userRoles = [userRoleRequest]
        self.threadId =  threadId
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
