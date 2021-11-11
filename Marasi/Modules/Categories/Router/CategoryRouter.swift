//
//  CategoryRouter.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import UIKit

class CategoryRouter: CategoryRouterInterface {
    
    weak var viewController: UIViewController?
        
    static func assembleModule() -> UIViewController {
        let view: CategoryController = UIStoryboard(name: "Category", bundle: nil).instantiateViewController(withIdentifier: "CategoryController") as! CategoryController
        
        let presenter = CategoryPresenter()
        let interactor = CategoryInteractor()
        let router = CategoryRouter()
        
        let navigation = NavController(rootViewController: view)
        navigation.setup()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = view
        return navigation
    }
}
