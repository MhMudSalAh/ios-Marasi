//
//  HomeController.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import UIKit
import SkeletonView

class HomeController: BaseController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var topConstrainViewContainer: NSLayoutConstraint!
    @IBOutlet weak var viewSearch: UIView!
    @IBOutlet weak var txtFldSearch: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: HomePresenterInterface!
    var group = DispatchGroup()
    var banners: [Banner] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
        
    func setupView(){
        setupViewSearch()
        setupTitles()
        setupTextField()
        initTableView()
        presenter.getProducts()
    }
        
    func setupTitles() {
        lblTitle.text = localizedText("app_name")
    }
    
    func setupTextField(){
        txtFldSearch.delegate = self
        txtFldSearch.attributedPlaceholder = NSAttributedString(string: localizedText("search_for_products"),attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        txtFldSearch.localize()
    }
    
    func setupViewSearch() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(searchTap(_:)))
        tap.numberOfTapsRequired = 1
        viewSearch.addGestureRecognizer(tap)
        viewSearch.isUserInteractionEnabled = true
    }
    
    @objc func searchTap(_ sender: UITapGestureRecognizer) {
        
    }
}

extension HomeController: HomeView {
        
    func reloadData() {
        group.notify(queue: .main) { [self] in
            tableView.reloadData()
            hideNetworkErrorScreen()
            hideLoading()
        }
    }
    
    func showLoading() {
        DispatchQueue.main.async {
            self.view.showAnimatedGradientSkeleton()
        }
    }
    
    func hideLoading() {
        UIView.animate(withDuration: 0.3) { [self] in
            endRefresherTable()
            tableView.contentOffset.y = 0
            tableView.contentInset.top = 0
        }
        view.hideSkeleton()
    }
        
    func presentNetworkErrorScreen() {
        showNetworkErrorScreen(self, nil, self.view)
    }
    
    func hideNetworkErrorScreen() {
        closeNetworkErrorScreen()
    }
}

extension HomeController: NetworkScreenControllerDelegate {
    
    func didClickTypeAgain() {
        
    }
}

extension HomeController: UITextFieldDelegate {
    
}

