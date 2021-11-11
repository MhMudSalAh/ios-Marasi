//
//  Home+TableView.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import UIKit
import SkeletonView

extension HomeController: UITableViewDelegate, SkeletonTableViewDataSource {
    
    func initTableView() {
        tableView.initialize(cellClass: CollectionViewHorizontalCell.self, delegate: self, dataSource: self, estimatedRowHeight: 100, refreshControl: refreshTable)
        tableView.registerCellNib(cellClass: SearchCell.self)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if refreshTable.isRefreshing && scrollView.contentOffset.y < 0 {
            presenter.getProducts()
        } else {
            endRefresherTable()
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        setupShowHideSearch(scrollView.contentOffset.y)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + banners.count
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        switch indexPath.row {
        case 0:
            return "SearchCell"
        default:
            return "CollectionViewHorizontalCell"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeue(cellClass: SearchCell.self)
            cell.hideSkeleton()
            return cell
        default:
            let cell = tableView.dequeue(cellClass: CollectionViewHorizontalCell.self)
            cell.hideSkeleton()
            if !(banners[indexPath.row-1].content.categories?.isEmpty ?? true) {
                cell.constrainHeightCollection.constant = 170
            } else if !(banners[indexPath.row-1].content.products?.isEmpty ?? true) {
                cell.constrainHeightCollection.constant = 400
            } else {
                cell.constrainHeightCollection.constant = 150
            }
            cell.setupCell(banners[indexPath.row-1])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 80
        default:
            if banners.isEmpty {
                return UITableView.automaticDimension
            }
            if !(banners[indexPath.row-1].content.categories?.isEmpty ?? true) {
                return 370
            } else if !(banners[indexPath.row-1].content.products?.isEmpty ?? true) {
                if !( banners[indexPath.row-1].content.image?.isEmpty ?? true) {
                    return 525
                } else {
                    return 460
                }
            } else {
                return 210
            }
        }
    }
    
    func setupShowHideSearch(_ contentOffset: CGFloat) {
        if contentOffset > 80 {
            viewSearch.isHidden = false
        } else {
            viewSearch.isHidden = true
        }
        UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: { [weak self] in self?.view.layoutIfNeeded() }, completion: nil)
    }
    
}
