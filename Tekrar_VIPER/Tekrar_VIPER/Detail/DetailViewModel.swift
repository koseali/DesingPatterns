//
//  File.swift
//  Tekrar_MVVM
//
//  Created by Ali Kose on 20.10.2021.
//

import Foundation

class DetailViewModel : DetailViewModelProtocol {
 
    weak var delegate: DetailViewModelDelegate?
    
    private var  books : Result?
    
    init(books : Result) {
        self.books = books
    }
    
    func didLoad() {
        guard let book = books.map(DetailPresentation.init) else {return print("Data Maplenemedi.")}
        delegate?.showBookDetail(book)
    }
    
    
}
