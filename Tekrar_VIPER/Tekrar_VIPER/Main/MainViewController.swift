//
//  MainViewController.swift
//  Tekrar_MVC
//
//  Created by Ali Kose on 19.10.2021.
//

import UIKit

class MainViewController: UIViewController  {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter : MainPresenterProtocol!
    var books : [MainPresentation] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension MainViewController : MainViewProtocol {
    func handleOutput(_ output: MainPresenterOutput){
        switch output {
        case .showBooks(let books):
            self.books = books
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
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
        presenter.didSelectRow(at: indexPath)
    }
}


