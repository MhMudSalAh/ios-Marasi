//
//  CategoryContract.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import UIKit

protocol CategoryView: AnyObject {
    var presenter: CategoryPresenterInterface! { get set }
    
    func showLoading()
    func hideLoading()
    
    func presentNetworkErrorScreen()
    func hideNetworkErrorScreen()
}

protocol CategoryPresenterInterface: AnyObject {
    var view: CategoryView? { get set }
    var router: CategoryRouterInterface! { get set }
    var interactor: CategoryInteractorInterface! { get set }
    
}

protocol CategoryInteractorInterface: AnyObject {
    var output: CategoryInteractorOutput? { get set }
    
}

protocol CategoryInteractorOutput: AnyObject {
    
}

protocol CategoryRouterInterface: AnyObject {
    var viewController: UIViewController? { get set }
        
    static func assembleModule() -> UIViewController
}
