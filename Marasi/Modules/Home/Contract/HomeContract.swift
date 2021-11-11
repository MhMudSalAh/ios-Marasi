//
//  HomeContract.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import UIKit

protocol HomeView: AnyObject {
    var presenter: HomePresenterInterface! { get set }
    var group: DispatchGroup { get set }
    var banners: [Banner] { get set }
    
    func showLoading()
    func hideLoading()
    func reloadData()
    
    func presentNetworkErrorScreen()
    func hideNetworkErrorScreen()
}

protocol HomePresenterInterface: AnyObject {
    var view: HomeView? { get set }
    var router: HomeRouterInterface! { get set }
    var interactor: HomeInteractorInterface! { get set }
    
    func getProducts()
}

protocol HomeInteractorInterface: AnyObject {
    var output: HomeInteractorOutput! { get set }
    
    func getProducts()
}

protocol HomeInteractorOutput: AnyObject {
    
    func didGetProducts(_ page: Page<[Banner]>)
    func didFailToGetProducts(_ error: APIError)
}

protocol HomeRouterInterface: AnyObject {
    var viewController: UIViewController? { get set }
        
    static func assembleModule() -> UIViewController
}
