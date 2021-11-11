//
//  Base+Refresher.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import UIKit

extension BaseController {
    
    func addRefresherTable(_ tableView: UITableView, _ color: UIColor? = .primary) {
        tableView.refreshControl = refreshTable
        refreshTable.tintColor = color
        refreshTable.beginRefreshing()
    }
    
    func endRefresherTable() {
        if refreshTable.isRefreshing {
            refreshTable.endRefreshing()
        }
    }
    
    func addRefresherCollection(_ collection: UICollectionView, _ color: UIColor? = .primary) {
        collection.refreshControl = refreshCollection
        refreshCollection.tintColor = color
        refreshCollection.beginRefreshing()
    }
    
    func endRefresherCollection() {
        if refreshCollection.isRefreshing {
            refreshCollection.endRefreshing()
        }
    }
}
