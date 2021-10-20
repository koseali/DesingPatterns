//
//  ViewController.swift
//  TodoAppExample
//
//  Created by Ali Kose on 7.10.2021.
//

import UIKit
import CoreData


class MainViewController: UIViewController , NSFetchedResultsControllerDelegate {
    
    var selectedData: TodoTasks?
    
    var dataManager : CoreDataManager!
    var data : [TodoTasks]!
    var isChange : Bool!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var emptyResultView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        data = dataManager.fetchData()
      //  let data = TodoTasks()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        print("view Will Appear calisti")
        super.viewWillAppear(animated)
        tableView.isHidden =  data.count <= 0 ? true : false
        if  isChange == true {
            tableView.reloadData()
            isChange = false
        }
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
     self.navigationController?.pushViewController(view, animated: true)
    
    }
    
    @IBAction func sortButtonTapped(_ sender: UIButton) {
      
       // sender.backgroundColor = sender.isSelected ? .black : .white
        print("Secilme durumu \(sender.isSelected)")
            
        if sender.isSelected {
            data = dataManager.sortbyCreatedData()
            sender.isSelected.toggle()
        }
        else {
            data = dataManager.fetchData()
            sender.isSelected.toggle()
        }
        tableView.reloadData()
    }
    
    
}

extension MainViewController :  UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell") as! MainTableViewCell
        let item = data[indexPath.row]
    

        cell.dateLabel.text = item.date
        cell.titleLabel.text = item.title
        cell.detailLabel.text = item.detailTitle
        return cell
    }
}

extension MainViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
         let sendData = self.data[indexPath.row]
        pushDetailViewController(sendData)
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteProcess  = UITableViewRowAction(style: .destructive, title: "Hedef Sil") { rowAction, indexPath in
            self.dataManager.DeleteData(data: self.data[indexPath.row])
            
//
            self.data.remove(at: indexPath.row)
            self.data = self.dataManager.fetchData()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
        }
        deleteProcess.backgroundColor = .red
        return [deleteProcess]
    }
    
}

extension MainViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty{
            self.data = self.dataManager.searchData(with: searchText)
            } else {
            self.data = dataManager.fetchData()
        }
        tableView.reloadData()
    }
}

// KLAVYE KAYMA  stack view height ya da butona container view veriyor.'UITableViewRowAction' was deprecated in iOS 13.0: Use UIContextualAction and related APIs instead.
/* YEMEDIdf
 if self.data == nil {
     tableView.isHidden = false
     emptyResultView.isHidden = true
     
//            TODO ARAMAYA UYGUN HEDEF YOK UYARISI CIKAR
 }

 */
