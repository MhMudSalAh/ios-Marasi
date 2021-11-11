//
//  Home+TabProtocol.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import UIKit

extension HomeController: TabProtocol {
    func scrollToTop() {
        if isViewLoaded {
            if isNetworkScreenPresented == false {
                if tableView.contentOffset.y <= 0 {
                    UIView.animate(withDuration: 0.3) { [self] in
                        tableView.contentOffset.y = -50
                        tableView.contentInset.top = 50
                        addRefresherTable(tableView)
                        presenter.getProducts()
                    }
                } else {
                    tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
                }
            }
        }
    }
}
