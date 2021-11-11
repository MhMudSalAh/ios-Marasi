//
//  HomeCategoryCell.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import UIKit

class HomeCategoryCell: UICollectionViewCell {

    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    func setupCell(_ category: Category) {
        img.loadImage(category.image)
        lblTitle.text = category.title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
