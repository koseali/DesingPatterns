//
//  MainViewController.swift
//  Tekrar_MVC
//
//  Created by Ali Kose on 19.10.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var mainView: MainView!{
        didSet{
            mainView.delegate = self
        }
    }
    var service: ClientNetworkServiceProtocol!
    var books : [Result] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getBooks()
    }
    func getBooks(){
        service.books { books, error in
            guard let results = books?.feed.results else {return print("DTO Bos Geldi")}
            self.mainView.showBooks(results.map(MainPresentation.init))
            self.books = results
        }
    }
}




extension MainViewController : MainViewDelegate {
    
    func didSelectRow(indexPath: IndexPath) {
        let book = self.books[indexPath.row]
        let detailViewController = DetailBuilder.build(with: book)
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}
