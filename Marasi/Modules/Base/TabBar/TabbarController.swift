//
//  TabbarController.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import UIKit

var TAB = TabBarController.shared

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    var icon1 = UITabBarItem()
    var icon2 = UITabBarItem()
     
    struct Static {
        static var instance: TabBarController?
    }
    
    class var shared: TabBarController {
        if Static.instance == nil {
            Static.instance = TabBarController()
        }
        return Static.instance!
    }
    
    func dispose() {
        TabBarController.Static.instance = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .secondary
        tabBar.unselectedItemTintColor = .gray
        tabBar.barTintColor = .white
        tabBar.isTranslucent = false
        delegate = self
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            tabBar.standardAppearance = appearance
            appearance.stackedLayoutAppearance.normal.iconColor = .gray
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.gray]
            tabBar.scrollEdgeAppearance = appearance
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }
    
    private func setupView() {
        let item1 = HomeRouter.assembleModule()
        let item2 = CategoryRouter.assembleModule()
        
        icon1 = UITabBarItem(title: localizedText("home"), image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
        icon2 = UITabBarItem(title: localizedText("categories"), image: UIImage(named: "categories"), selectedImage: UIImage(named: "categories"))
                
        item1.tabBarItem = icon1
        item2.tabBarItem = icon2
        
        let controllers = [item1, item2]
        self.viewControllers = controllers
        
    }
    
    // SCROLL TO TOP IN HOME CONTROLLER
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard tabBarController.selectedViewController === viewController else { return true }
        guard let navigationController = viewController as? UINavigationController else {
            assertionFailure()
            return true
        }
        guard
            navigationController.viewControllers.count <= 1,
            let destinationViewController = navigationController.viewControllers.first as? TabProtocol
        else {
            return true
        }
        destinationViewController.scrollToTop()
        return false
    }
}
