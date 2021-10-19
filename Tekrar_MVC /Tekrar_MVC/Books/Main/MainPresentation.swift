//
//  MainPresentation.swift
//  Tekrar_MVC
//
//  Created by Ali Kose on 19.10.2021.
//

import Foundation

struct MainPresentation {
    let title: String
    
    init(title: String) {
        self.title = title
    }
    // Result Modelden geliyor Coredata da TodoTask derim
    init(book: Result) {
        self.init(title: book.name)
    }
}
