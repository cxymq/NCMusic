//
//  NCNavigationController.swift
//  NCMusic
//
//  Created by nazimai on 2022/9/21.
//

import Foundation
import UIKit

class NCNavigationController: UINavigationController, UIGestureRecognizerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.theme_backgroundColor = globalBgColor
        interactivePopGestureRecognizer?.delegate = self
        
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

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
            return true
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            let leftBtn = UIBarButtonItem(image: UIImage(named: "back_new")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(back))
            viewController.navigationItem.leftBarButtonItem = leftBtn
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc func back() {
        popViewController(animated: true)
    }
}
