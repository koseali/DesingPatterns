//
//  NetworkError.swift
//  Tekrar_MVC
//
//  Created by Ali Kose on 19.10.2021.
//

import Foundation

enum NetworkError: Error {
    case decoding
    case wrongUrlType
    case error(Error?)
}
