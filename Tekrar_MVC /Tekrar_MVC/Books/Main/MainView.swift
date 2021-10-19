//
//  MainView.swift
//  Tekrar_MVC
//
//  Created by Ali Kose on 19.10.2021.
//

import Foundation
import UIKit



class MainView : UIView {
    
    @IBOutlet weak var tableView: UITableView!
    
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
