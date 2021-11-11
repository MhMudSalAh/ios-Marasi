//
//  CollectionViewHorizontalCell.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import UIKit
import SkeletonView

class CollectionViewHorizontalCell: UITableViewCell {
    
    @IBOutlet weak var stackTitleSection: UIStackView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnSeeAll: UIButton!
    
    @IBOutlet weak var viewCover: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblTitleCover: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var constrainHeightCollection: NSLayoutConstraint!
    
    var banner: Banner = Banner() {
        didSet {
            setupCategories()
            setupProducts()
            setupBrands()
        }
    }
    
    func setupCell(_ banner: Banner) {
        self.banner = banner
        setupCoverView()
        setupCollectionView()
    }
    
    func setupCategories() {
        collectionView.registerCellNib(cellClass: HomeCategoryCell.self)
        collectionView.registerCellNib(cellClass: CategoryCircleCell.self)
        DispatchQueue.main.async {
            self.hideShowCoverTitle()
            self.collectionView.reloadData()
        }
    }
        
    func setupProducts() {
        collectionView.registerCellNib(cellClass: ProductCell.self)
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

    func setupBrands() {
        collectionView.registerCellNib(cellClass: BrandCell.self)
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func setupCoverView() {
        if !(banner.content.image?.isEmpty ?? true) {
            viewCover.isHidden = false
            img.loadImage(banner.content.image)
            lblTitleCover.isHidden = false
            lblTitleCover.text = banner.content.title
            stackTitleSection.isHidden = true
        } else {
            viewCover.isHidden = true
            if !(banner.content.title?.isEmpty ?? true) {
                stackTitleSection.isHidden = false
                lblTitle.text = banner.content.title
            } else {
                stackTitleSection.isHidden = true
            }
        }
    }

    func hideShowCoverTitle() {
        if !(banner.content.categories?.isEmpty ?? true) {
            if !(banner.content.focusPoint?.isEmpty ?? false) {
                lblTitleCover.isHidden = true
            } else {
                lblTitleCover.isHidden = false
            }
        }
    }
    
    func setupCollectionView() {
        collectionView.contentInset.right = 15
        collectionView.contentInset.left = 15
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
