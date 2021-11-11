//
//  NetworkScreenController.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import UIKit

enum NetworkScreenType {
    
    case favourites
    case signToAddToFavourites
    case cart
    case search
    case products
    case orders
    case addresses
    case cities
}

let NETWORKSCREEN = NetworkScreenController.shared

protocol NetworkScreenControllerDelegate {
    func didClickTypeAgain()
}

class NetworkScreenController: BaseController {
    
    @IBOutlet weak var lblErrorTitle: UILabel!
    @IBOutlet weak var lblErrorDescription: UILabel!
    @IBOutlet weak var btnNetworkError: LoadingButton!
    @IBOutlet weak var bottomConstrainBtn: NSLayoutConstraint!
    
    static var shared = NetworkScreenController()
    var delegate: NetworkScreenControllerDelegate?
    var isPresented = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupView() {
        setupError()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupView()
    }
    
    func setupError() {
        setup( "no_internet_connection", "error_description", "try_again")
    }
    
    func setup(_ title: String, _ description: String,_ btnTitle: String) {
        lblErrorTitle.text = localizedText(title)
        lblErrorDescription.text = localizedText(description)
        btnNetworkError.btnDefault(cornerRadius: 15, titleKey: btnTitle)
    }
    
    func showAsSubView(_ screenType: NetworkScreenType? = nil, _ view: UIView) {
        isPresented = true
        DispatchQueue.main.async { [self] in
            self.view.frame.size = view.frame.size
            setupScreenType(screenType)
            view.addSubview(self.view)
        }
    }
    
    func setupScreenType(_ screenType: NetworkScreenType? = nil) {
        switch screenType {
        case .cities:
            bottomConstrainBtn.constant = 10
        default:
            break
        }
    }
    
    func close() {
        isPresented = false
        DispatchQueue.main.async {
            self.view.removeFromSuperview()
        }
    }
    
    @IBAction func btnNetworkErrorAction(_ sender: Any) {
        delegate?.didClickTypeAgain()
    }
}
