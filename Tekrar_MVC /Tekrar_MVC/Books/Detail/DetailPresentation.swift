//
//  DetailPresentation.swift
//  Tekrar_MVC
//
//  Created by Ali Kose on 19.10.2021.
//

import Foundation

struct DetailPresentation {
    let name : String
    let author : String
    let date : String
    
    init(name : String , author : String , date : String) {
        self.name = name
        self.author = author
        self.date = date
    }
//    Cast Etme Islemi
    init(books : Result){
        self.name = books.name
        self.author = books.artistName
        self.date = books.releaseDate
    }
    
    
}
