//
//  UIButton+Extension.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import UIKit

extension UIButton {
    
    @IBInspectable var imageViewContentType: Int {
        get {
            return imageView?.contentMode.rawValue ?? 0
        }
        set {
            if let content = UIView.ContentMode(rawValue: newValue), imageView != nil {
                imageView!.contentMode =  content
            }
        }
    }
    
    func btnDefault(cornerRadius: CGFloat? = 6, color: UIColor? = .primary, titleKey: String? = nil) {
        self.backgroundColor = color
        self.layer.shadowColor = UIColor(red: 0/255.0 , green: 0/255.0, blue: 0/255.0, alpha: 0.47).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 1
        self.layer.cornerRadius = cornerRadius ?? 6
        if titleKey != nil {
            setTitle(titleKey!)
        }
    }
    
    func btnDefaultWithBorder(cornerRadius: CGFloat? = 6, color: UIColor? = .primary, titleKey: String? = nil) {
        self.layer.borderColor = color!.cgColor
        self.layer.borderWidth = 1
        self.backgroundColor = .clear
        self.layer.cornerRadius = cornerRadius ?? 6
        if titleKey != nil {
            setTitle(titleKey!)
        }
    }
    
    func setTitle(_ key: String) {
        self.setTitle(localizedText(key), for: .normal)
    }
}
