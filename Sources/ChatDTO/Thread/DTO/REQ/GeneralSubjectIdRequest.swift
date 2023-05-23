//
// GeneralSubjectIdRequest.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public struct GeneralSubjectIdRequest: Encodable, UniqueIdProtocol {
    public var _subjectId: Int
    public let uniqueId: String

    public init(subjectId: Int, uniqueId: String = "G-\(UUID().uuidString)") {
        self._subjectId = subjectId
        self.uniqueId = uniqueId
    }

    private enum CodingKeys: CodingKey {
        case _subjectId
        case uniqueId
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self._subjectId, forKey: ._subjectId)
        try container.encodeIfPresent(self.uniqueId, forKey: .uniqueId)
    }
}
