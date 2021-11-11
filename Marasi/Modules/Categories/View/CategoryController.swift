//
//  CategoryView.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import UIKit
import SkeletonView

class CategoryController: BaseController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: CategoryPresenterInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = localizedText("categories")
    }
}

extension CategoryController: CategoryView {
    
    func showLoading() {
        view.showAnimatedGradientSkeleton()
    }
    
    func hideLoading() {
        endRefresherTable()
        view.hideSkeleton()
    }
        
    func presentNetworkErrorScreen() {
        showNetworkErrorScreen(self, nil, self.view)
    }
    
    func hideNetworkErrorScreen() {
        closeNetworkErrorScreen()
    }
}

extension CategoryController: NetworkScreenControllerDelegate {
    
    func didClickTypeAgain() {
        
    }
}
