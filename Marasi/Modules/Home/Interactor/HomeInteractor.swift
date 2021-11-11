//
//  HomeInteractor.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import UIKit

class HomeInteractor: HomeInteractorInterface {
    
    var output: HomeInteractorOutput!
    
    func getProducts() {
        PRODUCT.get() { (response) in
            switch response {
            case let .onSuccess(page):
                self.output?.didGetProducts(page)
                break
            case let .onFailure(error):
                self.output?.didFailToGetProducts(error)
                break
            case .onCompleted:
                break
            }
        }
    }
}
