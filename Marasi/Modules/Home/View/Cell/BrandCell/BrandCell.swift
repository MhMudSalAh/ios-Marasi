//
//  BrandCell.swift
//  Marasi
//
//  Created by MhMuD SalAh on 11/11/2021.
//

import UIKit

class BrandCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    
    func setupCell(_ brand: Brand) {
        img.loadImage(brand.image)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
}
