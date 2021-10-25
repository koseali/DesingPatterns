//
//  DetailViewController.swift
//  Tekrar_MVC
//
//  Created by Ali Kose on 19.10.2021.
//

import UIKit

class DetailViewController: UIViewController {
    

    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var authorTitleLabel: UILabel!
    @IBOutlet weak var releaseDateTitleLabel: UILabel!
    var detailViewModel : DetailViewModelProtocol! {
        didSet {
            detailViewModel.delegate = self
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailViewModel.didLoad()
    }
}
extension DetailViewController : DetailViewModelDelegate {
    
    func showBookDetail(_ book: DetailPresentation) {
        print(book)
        bookTitleLabel.text = book.name
        authorTitleLabel.text = book.author
        releaseDateTitleLabel.text = book.date
    }
    
}
