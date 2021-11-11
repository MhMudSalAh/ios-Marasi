//
//  BaseController.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import UIKit

class BaseController: UIViewController {
    
    var refreshTable = UIRefreshControl()
    var refreshCollection = UIRefreshControl()
    var isNetworkScreenPresented: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshTable.tintColor = .primary
        refreshCollection.tintColor = .primary
        isNetworkScreenPresented = false
        setupNavigation()
    }
}
