//
//  Response.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

enum Response<T> {

    case onSuccess(T)
    case onFailure(APIError)
    case onCompleted
}
