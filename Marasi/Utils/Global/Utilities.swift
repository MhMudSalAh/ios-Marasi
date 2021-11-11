//
//  AppDelegate.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import UIKit

let UTIL = Utilities.sharedUtilities

class Utilities: NSObject {
    
    static var sharedUtilities = Utilities()
    var delegate: UtilitiesDelegate?
    
    override init() {
        super.init()
    }
    
    func getTopViewController() -> UIViewController! {
        if var topController = UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.rootViewController/*UIApplication.shared.keyWindow?.rootViewController*/ {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return nil
    }
    
    func setToolBar() {
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(title: localizedText("done"), style: .plain, target: self, action: #selector(doneToolBarAction))
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        toolbar.barStyle = .default
        toolbar.items = [flexible, done]
        toolbar.sizeToFit()
        UITextField.appearance().inputAccessoryView = toolbar
        UITextView.appearance().inputAccessoryView = toolbar
    }
    
    @objc func doneToolBarAction() {
        UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.endEditing(true)
    }
}

