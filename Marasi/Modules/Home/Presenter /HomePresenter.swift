//
//  HomePresenter.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import UIKit

class HomePresenter: HomePresenterInterface {
    
    weak var view: HomeView?
    var router: HomeRouterInterface!
    var interactor: HomeInteractorInterface!
    
    func getProducts() {
        view?.showLoading()
        view?.group.enter()
        interactor.getProducts()
        view?.reloadData()
    }
}

extension HomePresenter: HomeInteractorOutput {
        
    func didGetProducts(_ page: Page<[Banner]>) {
        view?.banners = page.data ?? []
        view?.group.leave()
    }
    
    func didFailToGetProducts(_ error: APIError) {
        checkError(error)
        view?.group.leave()
    }
    
    func checkError(_ error: APIError) {
        view?.group.notify(queue: .main) { [self] in
            view?.presentNetworkErrorScreen()
        }
    }
}
