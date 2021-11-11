//
//  CategoryPresenter.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import UIKit

class CategoryPresenter: CategoryPresenterInterface {
    
    weak var view: CategoryView?
    var router: CategoryRouterInterface!
    var interactor: CategoryInteractorInterface!
    
}

extension CategoryPresenter: CategoryInteractorOutput {
    
    func checkError(_ error: APIError) {
        switch error.type {
        case .network:
            view?.presentNetworkErrorScreen()
        default:
            view?.presentNetworkErrorScreen()
        }
    }
}
