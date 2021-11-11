//
//  FooterCollection.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import UIKit

var FOOTER = FooterCollection.shared

class FooterCollection: UICollectionReusableView {
    
    static let shared = FooterCollection()
    
    @IBOutlet weak var refreshControlIndicator: UIActivityIndicatorView!
    @IBOutlet weak var view: UIView!
    
    var isAnimatingFinal:Bool = false
    var currentTransform:CGAffineTransform?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.prepareInitialAnimation()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setTransform(inTransform:CGAffineTransform, scaleFactor:CGFloat) {
        if isAnimatingFinal {
            return
        }
        currentTransform = inTransform
        refreshControlIndicator?.transform = CGAffineTransform.init(scaleX: scaleFactor, y: scaleFactor)
    }
    
    func prepareInitialAnimation() {
        isAnimatingFinal = false
        refreshControlIndicator?.stopAnimating()
    }
    
    func startAnimate() {
        view.isHidden = true
        isAnimatingFinal = true
        refreshControlIndicator?.startAnimating()
    }
    
    func stopAnimate() {
        isAnimatingFinal = false
        refreshControlIndicator?.stopAnimating()
        view.isHidden = false
    }
    
    func animateFinal() {
        if isAnimatingFinal {
            return
        }
        self.isAnimatingFinal = true
        UIView.animate(withDuration: 0.2) {
            self.refreshControlIndicator?.transform = CGAffineTransform.identity
        }
    }
}
