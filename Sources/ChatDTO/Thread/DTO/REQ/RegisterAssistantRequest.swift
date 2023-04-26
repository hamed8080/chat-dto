//
// RegisterAssistantRequest.swift
// Copyright (c) 2022 Chat
//
// Created by Hamed Hosseini on 11/19/22

import Foundation
import ChatCore
import ChatModels

public final class RegisterAssistantRequest: UniqueIdManagerRequest, ChatSendable {
    public let assistants: [Assistant]
    public var content: String? { assistants.jsonString }
    public var chatMessageType: ChatMessageVOTypes = .registerAssistant

    public init(assistants: [Assistant], uniqueId: String? = nil) {
        self.assistants = assistants
        super.init(uniqueId: uniqueId)
    }
}
