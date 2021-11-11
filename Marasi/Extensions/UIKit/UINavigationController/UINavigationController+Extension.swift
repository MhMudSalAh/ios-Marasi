//
//  UINavigationController+Extension.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import UIKit

extension UINavigationController {
    
    func setup() {
        navigationBar.tintColor = .white
        navigationBar.barTintColor = .primary
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        let font = UIFont.blackFont(ofSize: 18)
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: font]
        navigationBar.isTranslucent = false
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .primary
        appearance.shadowColor = .clear
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: font]
        navigationBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            navigationBar.scrollEdgeAppearance = appearance
         }
    }
}
