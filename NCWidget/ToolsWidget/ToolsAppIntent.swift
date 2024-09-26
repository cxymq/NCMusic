//
//  ToolsAppIntent.swift
//  NCWidgetExtension
//
//  Created by nazimai on 2024/9/26.
//

import WidgetKit
import AppIntents

struct ToolsConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "音乐推荐"
    static var description = IntentDescription("自定义精选功能")

    // An example configurable parameter.
    @Parameter(title: "Favorite Emoji", default: "😃")
    var favoriteEmoji: String
}
