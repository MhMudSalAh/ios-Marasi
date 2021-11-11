//
//  CollectionViewCell+Extension.swift
//  Marasi
//
//  Created by MhMuD SalAh on 11/11/2021.
//

import UIKit
import SkeletonView

extension CollectionViewHorizontalCell: UICollectionViewDelegate, SkeletonCollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        if !(banner.content.categories?.isEmpty ?? true) {
            if !(banner.content.focusPoint?.isEmpty ?? true) {
                return "HomeCategoryCell"
            } else {
                return "CategoryCircleCell"
            }
        } else if !(banner.content.products?.isEmpty ?? true) {
            return "ProductCell"
        } else {
            return "BrandCell"
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if !(banner.content.categories?.isEmpty ?? true) {
            return banner.content.categories?.count ?? 0
        } else if !(banner.content.products?.isEmpty ?? true) {
            return banner.content.products?.count ?? 0
        } else {
            return banner.content.brands?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if !(banner.content.categories?.isEmpty ?? true) {
            if !(banner.content.focusPoint?.isEmpty ?? true) {
                let cell = collectionView.dequeue(cellClass: HomeCategoryCell.self, indexPath: indexPath)
                cell.hideSkeleton()
                cell.setupCell(banner.content.categories?[indexPath.row] ?? Category())
                return cell
            } else {
                let cell = collectionView.dequeue(cellClass: CategoryCircleCell.self, indexPath: indexPath)
                cell.hideSkeleton()
                cell.setupCell(banner.content.categories?[indexPath.row] ?? Category())
                return cell
            }
        } else if !(banner.content.products?.isEmpty ?? true) {
            let cell = collectionView.dequeue(cellClass: ProductCell.self, indexPath: indexPath)
            cell.hideSkeleton()
            cell.setupCell(banner.content.products?[indexPath.row] ?? Product())
            return cell
        } else {
            let cell = collectionView.dequeue(cellClass: BrandCell.self, indexPath: indexPath)
            cell.hideSkeleton()
            cell.setupCell(banner.content.brands?[indexPath.row] ?? Brand())
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = collectionView.frame.size
        if !(banner.content.categories?.isEmpty ?? true) {
            if (banner.content.focusPoint?.isEmpty ?? true) {
                size.width = 170
            } else {
                size.width = 170
            }
            return size
        } else if !(banner.content.products?.isEmpty ?? true) {
            size.width = 200
            size.height = collectionView.frame.size.height
            return size
        } else {
            size.width = 200
            return size
        }
    }
}
