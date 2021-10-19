//
//  DetailView.swift
//  Tekrar_MVC
//
//  Created by Ali Kose on 19.10.2021.
//

import Foundation
import UIKit

class DetailView : UIView {
    @IBOutlet weak var bookNameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
}

extension DetailView : DetailViewProtocol {
    
    func showBookDetail(_ book: DetailPresentation) {
        bookNameLabel.text = book.name
        authorLabel.text = book.author
        releaseDateLabel.text = book.date
    }
}
