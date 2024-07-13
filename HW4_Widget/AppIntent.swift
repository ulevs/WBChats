//
//  AppIntent.swift
//  HW4_Widget
//
//  Created by Ульяна Евстигнеева on 22.06.2024.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    
    static var description = IntentDescription("Show avatar full screen")

    @Parameter(title: "Image full screen") var fullScreen: Bool
}

struct ChangeContactIntent: AppIntent {
    static var title: LocalizedStringResource = "Change Contact"
    
    @Parameter(title: "Contact index") var index : Int
    
    init() {}
    
    init(index: Int) {
        self.index = index
    }
    
    func perform() async throws -> some IntentResult {
        MockData.shared.index = index

        return .result()
    }
}
