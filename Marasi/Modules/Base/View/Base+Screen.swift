//
//  Base+Screen.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import UIKit

// MARK:- Network Screen

extension BaseController {
    
    func showNetworkErrorScreen(_ delegate: NetworkScreenControllerDelegate?, _ type: NetworkScreenType? = nil, _ view: UIView) {
        isNetworkScreenPresented = true
        NETWORKSCREEN.delegate = delegate
        NETWORKSCREEN.showAsSubView(type, view)
    }
    
    func closeNetworkErrorScreen() {
        isNetworkScreenPresented = false
        if NETWORKSCREEN.isPresented {
            NETWORKSCREEN.close()
        }
    }
}
