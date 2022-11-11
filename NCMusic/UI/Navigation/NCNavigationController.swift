//
//  NCNavigationController.swift
//  NCMusic
//
//  Created by nazimai on 2022/9/21.
//

import Foundation
import UIKit

class NCNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.theme_backgroundColor = globalBgColor
        
        var titleColor = UIColor.black
        switch NCThemeManager.getThemeType() {
        case .day:
            titleColor = .black
        case .night:
            titleColor = .white
        }
        
        let navbarFont = UIFont.boldSystemFont(ofSize: 17)
        navigationBar.titleTextAttributes = [NSAttributedString.Key.font: navbarFont, NSAttributedString.Key.foregroundColor:titleColor]
        
        if #available(iOS 13.0, *) {
            let app = UINavigationBarAppearance()
            app.configureWithDefaultBackground()
            app.theme_backgroundColor = globalBgColor
            app.titleTextAttributes = [NSAttributedString.Key.font: navbarFont, NSAttributedString.Key.foregroundColor:titleColor]
            app.shadowColor = .clear
            app.shadowImage = UIImage()
            navigationBar.standardAppearance = app
            navigationBar.scrollEdgeAppearance = app
        }
    }
}
