//
//  NCToolsWidget.swift
//  NCWidgetExtension
//
//  Created by nazimai on 2024/9/26.
//

import WidgetKit
import SwiftUI

struct ToolsProvider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> ToolsEntry {
        ToolsEntry(date: Date(), configuration: ToolsConfigurationAppIntent())
    }

    func snapshot(for configuration: ToolsConfigurationAppIntent, in context: Context) async -> ToolsEntry {
        ToolsEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(for configuration: ToolsConfigurationAppIntent, in context: Context) async -> Timeline<ToolsEntry> {
        var entries: [ToolsEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = ToolsEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct ToolsEntry: TimelineEntry {
    let date: Date
    let configuration: ToolsConfigurationAppIntent
}

struct NCToolsWidgetEntryView : View {
    var entry: ToolsProvider.Entry

    var body: some View {
        VStack {
            Text("Time:")
            Text(entry.date, style: .time)

            Text("Favorite Emoji:")
            Text(entry.configuration.favoriteEmoji)
        }
    }
}

struct NCToolsWidget: Widget {
    let kind: String = "NCToolsWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ToolsConfigurationAppIntent.self, provider: ToolsProvider()) { entry in
            NCToolsWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("音乐推荐")
        .description("自定义精选功能")
        .supportedFamilies([.systemMedium, .systemLarge])
    }
}

extension ToolsConfigurationAppIntent {
    fileprivate static var smiley: ToolsConfigurationAppIntent {
        let intent = ToolsConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }
    
    fileprivate static var starEyes: ToolsConfigurationAppIntent {
        let intent = ToolsConfigurationAppIntent()
        intent.favoriteEmoji = "🤩"
        return intent
    }
}

#Preview(as: .systemSmall) {
    NCToolsWidget()
} timeline: {
    ToolsEntry(date: .now, configuration: .smiley)
    ToolsEntry(date: .now, configuration: .starEyes)
}

