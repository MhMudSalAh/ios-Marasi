//
//  APIResponse.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

enum APIResponse<T> {
    
    case success(T)
    case failure(APIError)
    case complete
}
