//
//  ProductRepository.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import UIKit

let PRODUCT = ProductsRepository.shared

class ProductsRepository: Repo {
    
    static let shared = ProductsRepository()
    
    func get(_ completion: @escaping (Response<Page<[Banner]>>) -> ()) {
        provider.request(type: Page<[Banner]>.self, service: Api.Products.all) { response in
            switch response {
            case let .success(page):
                completion(.onSuccess(page))
                break
            case let .failure(error):
                completion(.onFailure(error))
                break
            case .complete:
                completion(.onCompleted)
                break
            }
        }
    }
}

