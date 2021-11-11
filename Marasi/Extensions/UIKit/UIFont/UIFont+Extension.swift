//
//  UIFont+Extension.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import UIKit

struct AppFontName {
    static let extraLight = "Cairo-ExtraLight"
    static let light = "Cairo-Light"
    static let regular = "Cairo-Regular"
    static let semiBold = "Cairo-SemiBold"
    static let bold = "Cairo-Bold"
    static let black = "Cairo-Black"
}

extension UIFontDescriptor.AttributeName {
    static let nsctFontUIUsage = UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")
}

extension UIFont {
        
    @objc class func extraLightFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.extraLight, size: size) ??
            UIFont.extraLightFont(ofSize: size)
    }
    
    @objc class func lightFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.light, size: size) ??
            UIFont.lightFont(ofSize: size)
    }
    
    @objc class func regularFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.regular, size: size) ??
            UIFont.regularFont(ofSize: size)
    }
        
    @objc class func semiBoldFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.semiBold, size: size) ?? UIFont.semiBoldFont(ofSize: size)
    }
    
    @objc class func boldFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.bold, size: size) ?? UIFont.boldFont(ofSize: size)
    }
        
    @objc class func blackFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.black, size: size) ?? UIFont.blackFont(ofSize: size)
    }
    
    @objc convenience init?(myCoder aDecoder: NSCoder) {
        guard
            let fontDescriptor = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor,
            let fontAttribute = fontDescriptor.fontAttributes[.nsctFontUIUsage] as? String else {
                self.init(myCoder: aDecoder)
                return
        }
        var fontName = ""
        if fontAttribute.lowercased().range(of: "extraLight") != nil {
            fontName = AppFontName.extraLight
        } else if fontAttribute.lowercased().range(of: "light") != nil {
            fontName = AppFontName.light
        } else if fontAttribute.lowercased().range(of: "regular") != nil {
            fontName = AppFontName.regular
        } else if fontAttribute.lowercased().range(of: "semiBold") != nil {
            fontName = AppFontName.semiBold
        } else if fontAttribute.lowercased().range(of: "bold") != nil {
            fontName = AppFontName.bold
        } else if fontAttribute.lowercased().range(of: "black") != nil {
            fontName = AppFontName.black
        } else  {
            fontName = AppFontName.regular
        }
        self.init(name: fontName, size: fontDescriptor.pointSize)
    }
    
    class func overrideInitialize() {
        guard self == UIFont.self else { return }

        if let systemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:))),
            let mySystemFontMethod = class_getClassMethod(self, #selector(regularFont(ofSize:))) {
            method_exchangeImplementations(systemFontMethod, mySystemFontMethod)
        }

        if let boldSystemFontMethod = class_getClassMethod(self, #selector(boldSystemFont(ofSize:))),
            let myBoldSystemFontMethod = class_getClassMethod(self, #selector(boldFont(ofSize:))) {
            method_exchangeImplementations(boldSystemFontMethod, myBoldSystemFontMethod)
        }

        if let initCoderMethod = class_getInstanceMethod(self, #selector(UIFontDescriptor.init(coder:))),
            let myInitCoderMethod = class_getInstanceMethod(self, #selector(UIFont.init(myCoder:))) {
            method_exchangeImplementations(initCoderMethod, myInitCoderMethod)
        }
    }
}
