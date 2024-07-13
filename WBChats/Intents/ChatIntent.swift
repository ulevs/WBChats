//
//  ChatIntent.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 10.07.2024.
//

import Foundation
import AppIntents

final class ChatIntent: AppIntent {
    static var title: LocalizedStringResource = "Open Chat in WBChats"
    static var openAppWhenRun: Bool = true

    func perform() async throws -> some IntentResult {
        NotificationCenter.default.post(name: .openChats, object: nil)
        return .result()
    }
}

extension Notification.Name {
    static let openChats = Notification.Name("openChats")
}
