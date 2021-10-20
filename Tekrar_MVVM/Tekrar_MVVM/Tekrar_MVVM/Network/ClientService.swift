//
//  ClientManager.swift
//  Tekrar_MVC
//
//  Created by Ali Kose on 19.10.2021.
//

import Foundation

protocol ClientNetworkServiceProtocol {
    func books(completion: @escaping (BookDTO?, NetworkError?) -> Void)
}

class ClientNetworkService: ClientNetworkServiceProtocol {

    private let bookssURLString = "https://rss.applemarketingtools.com/api/v2/us/audio-books/top/25/audio-books.json"

    private let networkService = NetworkService.instance
    
    func books(completion: @escaping (BookDTO?, NetworkError?) -> Void) {
        networkService.get(from: bookssURLString, completion: completion)
    }
}
