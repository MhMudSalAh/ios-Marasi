//
//  SearchCell.swift
//  Marasi
//
//  Created by MhMuD SalAh on 11/11/2021.
//

import UIKit

class SearchCell: UITableViewCell {

    @IBOutlet weak var txtFldSearch: UITextField!
    
    func setupTextField() {
        txtFldSearch.delegate = self
        txtFldSearch.attributedPlaceholder = NSAttributedString(string: localizedText("search_for_products"),attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        txtFldSearch.localize()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTextField()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}

extension SearchCell: UITextFieldDelegate {
    
}
