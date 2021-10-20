//
//  MainViewController.swift
//  Tekrar_MVC
//
//  Created by Ali Kose on 19.10.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    var mainViewModel : MainViewModelProtocol!{
        didSet{
            // Delegate baglantisi ile modelden gelen updateleri alalim diye var.
            mainViewModel.delegate = self
        }
    }
    
    @IBOutlet weak var tableView: UITableView!

    var books : [MainPresentation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Handle output delegati ile veriyi buraya paslamis olucam.
        // 1- delegate fonk yazilan yer isi yapan 2- delegate degisken alan destek alan paslayan :)
        mainViewModel.didLoad()
    }
    
//    func getBooks(){
//        service.books { books, error in
//            guard let results = books?.feed.results else {return print("DTO Bos Geldi")}
//          //  self.mainView.showBooks(results.map(MainPresentation.init))
//            self.books = results
//        }
//    }
}



//
//extension MainViewController : MainViewDelegate {
//    
//    func didSelectRow(indexPath: IndexPath) {
//        let book = self.books[indexPath.row]
//        let detailViewController = DetailBuilder.build(with: book)
//        self.navigationController?.pushViewController(detailViewController, animated: true)
//    }
//}
extension MainViewController : MainViewModelDelegate{
    
    func handleOutput(_ output : MainViewModelOutput) {
        switch output {
        case .showBooks(let books):
            self.books = books
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            print("Burada veriyi books a presentation hali vericem. ")
        }
    }
    
    func navigate(to route: MainViewRoute) {
        switch route {
        case .showDetail(let result):
            let detailViewController = DetailBuilder.build(with: result)
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
    
}


extension MainViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        cell.titleLabel.text = books[indexPath.row].title
        return cell
    }
}

extension MainViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mainViewModel.didSelectRow(at: indexPath)
    }
}

/*
 
 
 
 //
 //  MainView.swift
 //  Tekrar_MVC
 //
 //  Created by Ali Kose on 19.10.2021.
 //

 import Foundation
 import UIKit



 class MainView : UIView {
     
     
     weak var delegate : MainViewDelegate?
     private var books : [MainPresentation] = []
     
     
     
 }

 extension MainView : MainViewProtocol {
     
     func showBooks(_ books: [MainPresentation]) {
         self.books = books
         DispatchQueue.main.async {
             self.tableView.reloadData()
         }
         
     }
 }

 extension MainView : UITableViewDataSource{
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return books.count
        // return 44
     }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
         let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
         cell.titleLabel.text = books[indexPath.row].title
         return cell
     }
     
 }
 extension MainView : UITableViewDelegate {
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         //        Bu View i kontrol eden
         self.delegate?.didSelectRow(indexPath: indexPath)
     }
     
 }

 */
