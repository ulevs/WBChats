//
//  Language.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 10.07.2024.
//

import Foundation

enum Language: String, CaseIterable, Identifiable {
    case english = "en"
    case russian = "ru"
    case german = "de"
    case spanish = "es"
    case japanese = "ja"
    
    var id: String { self.rawValue }
    
    var flag: String {
        switch self {
        case .english: return "🇺🇸"
        case .russian: return "🇷🇺"
        case .german: return "🇩🇪"
        case .spanish: return "🇪🇸"
        case .japanese: return "🇯🇵"
        }
    }
    
    var locale: Locale {
        Locale(identifier: self.rawValue)
    }
    
    var dayDescriptions: [String] {
        switch self {
        case .english: return ["Before yesterday", "Yesterday", "Today", "Tomorrow", "After tomorrow"]
        case .russian: return ["Позавчера", "Вчера", "Сегодня", "Завтра", "Послезавтра"]
        case .german: return ["Vorgestern", "Gestern", "Heute", "Morgen", "Übermorgen"]
        case .spanish: return ["Antes de ayer", "Ayer", "Hoy", "Mañana", "Pasado mañana"]
        case .japanese: return ["一昨日", "昨日", "今日", "明日", "明後日"]
        }
    }
}
