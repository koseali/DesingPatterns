//
//  DetailViewController.swift
//  Tekrar_MVC
//
//  Created by Ali Kose on 19.10.2021.
//

import UIKit

class DetailViewController: UIViewController {
    var book : Result!
    
    @IBOutlet var detailView: DetailView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailView.showBookDetail(DetailPresentation(books: book))
    }


 

}
