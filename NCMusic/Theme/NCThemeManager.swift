//
//  NCThemeManager.swift
//  NCMusic
//
//  Created by nazimai on 2022/9/20.
//

import SwiftTheme

struct NCThemeManager {
    enum NCThemeType: Int {
        case day = 0
        case night = 1
    }
    
    static func setThemeType(type: NCThemeType) {
        switch type {
        case .day:
            ThemeManager.setThemeWithPlistInMainBundle("day")
        case .night:
            ThemeManager.setThemeWithPlistInMainBundle("night")
        }
        saveThemeType(type: type)
    }
    
    static func saveThemeType(type: NCThemeType) {
        UserDefaults.standard.set(type.rawValue, forKey: "NCThemeType")
    }
    
    static func getThemeType() -> NCThemeType {
        return NCThemeManager.NCThemeType(rawValue: UserDefaults.standard.integer(forKey: "NCThemeType")) ?? .day
    }
}

let globalBgColor = ThemeColorPicker.pickerWithKeyPath("Global.backgroundColor")
let globalTitleColor = ThemeColorPicker.pickerWithKeyPath("Global.titleColor")
let globalSubtitleColor = ThemeColorPicker.pickerWithKeyPath("Global.subtitleColor")
let globalMoreImg = ThemeImagePicker.pickerWithKeyPath("Global.moreImg")
let globalVideoImg = ThemeImagePicker.pickerWithKeyPath("Global.videoImg")

let settingThemeImg = ThemeImagePicker.pickerWithKeyPath("Setting.themeImg")
