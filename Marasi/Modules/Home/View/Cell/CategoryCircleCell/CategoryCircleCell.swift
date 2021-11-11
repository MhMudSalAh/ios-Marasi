//
//  CategoryCircleCell.swift
//  Marasi
//
//  Created by MhMuD SalAh on 11/11/2021.
//

import UIKit

class CategoryCircleCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    
    func setupCell(_ category: Category) {
        img.loadImage(category.imageCirle)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
}
