//
//  ProductCell.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var viewOffer: UIView!
    @IBOutlet weak var lblOffer: UILabel!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var btnCart: UIButton!
    @IBOutlet weak var lblBrand: UILabel!
    @IBOutlet weak var stackDiscount: UIStackView!
    @IBOutlet weak var lblOldPrice: UILabel!
    @IBOutlet weak var lblCurrency: UILabel!
    @IBOutlet weak var lblDiscount: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
        
    func setupCell(_ product: Product) {
        imgProduct.loadImage(product.image)
        lblBrand.text = product.brand
        lblTitle.text = product.title
        lblPrice.text = "\(product.attributes?[0].price?.rounded(places: 2) ?? 0) \(product.attributes?[0].currency ?? "")"
        
        setupViewBadge(product)
        setupViewDiscount(product)
    }
        
    func setupViewBadge(_ product: Product) {
        if !(product.attributes?[0].badge?.isEmpty ?? true) {
            viewOffer.isHidden = false
            lblOffer.text = product.attributes?[0].badge ?? ""
            viewOffer.backgroundColor = UIColor.init().hexStringToUIColor(hex: product.attributes?[0].badgeColor ?? "#000000")
            lblOffer.backgroundColor = UIColor.init().hexStringToUIColor(hex: product.attributes?[0].badgeColor ?? "#000000")
            lblOffer.textColor = UIColor.init().hexStringToUIColor(hex: product.attributes?[0].badgeTextColor ?? "#FFFFFF")
        } else {
            viewOffer.isHidden = true
        }
    }
    
    func setupViewDiscount(_ product: Product) {
        if !(product.attributes?[0].discount?.isZero ?? true) {
            stackDiscount.isHidden = false
            lblOldPrice.attributedText = lblOldPrice.createAttributedString("\(product.attributes?[0].oldPrice?.rounded(places: 2) ?? 0)")
            lblCurrency.text = ("\(product.attributes?[0].currency ?? "")")
            lblDiscount.text = "\(product.attributes?[0].discount ?? 0) \(product.getDiscountType()) \(localizedText("discount"))"
        } else {
            stackDiscount.isHidden = true
        }
    }
    
    func setupTitles() {
        btnCart.setTitle("add_to_cart")
    }
    
    @IBAction func cartAction(_ sender: Any) {

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTitles()
    }
}
