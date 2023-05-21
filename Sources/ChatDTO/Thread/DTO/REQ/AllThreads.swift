//
// AllThreads.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public struct AllThreads: Encodable, UniqueIdProtocol {
    /// - summary: If it set to true the result only contains the ids of threads not other properties.
    private let summary: Bool = true
    public let uniqueId: String?

    /// Init the request.
    /// - Parameters:
    ///   - uniqueId: The optional uniqueId.
    public init(uniqueId: String? = nil) {
       self.uniqueId = uniqueId
    }

    private enum CodingKeys: String, CodingKey {
        case summary
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encode(summary, forKey: .summary)
    }
}
