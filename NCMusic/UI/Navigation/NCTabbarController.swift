//
//  NCTabbarController.swift
//  NCMusic
//
//  Created by nazimai on 2022/9/20.
//

import Foundation
import UIKit

class NCTabbarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.theme_backgroundColor = globalBgColor
        var titleColor = UIColor.black
        switch NCThemeManager.getThemeType() {
        case .day:
            titleColor = .black
        case .night:
            titleColor = .white
        }
        
        let barbuttonFont = UIFont.systemFont(ofSize: 11)
        
        if #available(iOS 13.0, *) {
            let app = UITabBarAppearance()
            app.configureWithDefaultBackground()
            app.theme_backgroundColor = globalBgColor
            app.shadowColor = .clear
            app.shadowImage = UIImage()

            let tabBarItemAppearance = UITabBarItemAppearance()
            tabBarItemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.font: barbuttonFont, NSAttributedString.Key.foregroundColor: titleColor]
            tabBarItemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.font: barbuttonFont, NSAttributedString.Key.foregroundColor: titleColor]
            app.stackedLayoutAppearance = tabBarItemAppearance
            
            self.tabBar.standardAppearance = app
            if #available(iOS 15.0, *) {
                self.tabBar.scrollEdgeAppearance = app
            }
        }

        if #available(iOS 15.0, *) {
            UITableView.appearance().sectionHeaderTopPadding = 0
        }

        let homepageVC = NCNavigationController(rootViewController: NCHomepageViewController(style: .grouped))
        let homepageImg = UIImage(named: "default_tabbar")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        homepageVC.tabBarItem.image = homepageImg;
        let homepageImg_s = UIImage(named: "discover")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        homepageVC.tabBarItem.selectedImage = homepageImg_s;
        homepageVC.tabBarItem.title = "首页";
        //recommendVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: barbuttonFont, NSAttributedString.Key.foregroundColor:titleColor], for: UIControl.State.normal)
        //recommendVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: barbuttonFont, NSAttributedString.Key.foregroundColor:titleColor], for: UIControl.State.selected)
        homepageVC.tabBarItem.accessibilityIdentifier = "homepage";
        
        let recommendVC = NCNavigationController(rootViewController: NCRecommendSongsViewController(style: .plain))
        let discoverImg = UIImage(named: "default_tabbar")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        recommendVC.tabBarItem.image = discoverImg;
        let discoverImg_s = UIImage(named: "discover")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        recommendVC.tabBarItem.selectedImage = discoverImg_s;
        recommendVC.tabBarItem.title = "发现";
        //recommendVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: barbuttonFont, NSAttributedString.Key.foregroundColor:titleColor], for: UIControl.State.normal)
        //recommendVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: barbuttonFont, NSAttributedString.Key.foregroundColor:titleColor], for: UIControl.State.selected)
        recommendVC.tabBarItem.accessibilityIdentifier = "discover";

        setViewControllers([homepageVC, recommendVC], animated: false)
    }
}
