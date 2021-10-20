//
//  DetailBuilder.swift
//  Tekrar_MVC
//
//  Created by Ali Kose on 19.10.2021.
//

import Foundation

class DetailBuilder {
    static func build(with book : Result) -> DetailViewController {
        let viewController = DetailViewController()
        viewController.detailViewModel = DetailViewModel(books: book)
        return viewController
    }
}
