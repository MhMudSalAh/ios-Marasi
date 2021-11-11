//
//  SplashController.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import UIKit

class SplashController: BaseController {
    
    @IBOutlet weak var lblTitle: UILabel!
    
    var presenter: SplashPresenterInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = localizedText("app_name")
        presenter.viewDidLoad()
    }
}

extension SplashController: SplashView {
    
}
