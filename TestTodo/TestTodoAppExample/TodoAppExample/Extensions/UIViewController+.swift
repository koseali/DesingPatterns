//
//  UIViewController+.swift
//  TodoAppExample
//
//  Created by Ali Kose on 11.10.2021.
//

import Foundation
import UIKit

extension UIViewController {
    func pushViewController<T: UIViewController>(_ viewController: T.Type) {
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "\(T.self)") as? T else { return }
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func pushDetailViewController(_ item : TodoTasks) {
        
        let DetailViewController = storyboard?.instantiateViewController(
            withIdentifier: "DetailViewController"
        ) as! DetailViewController
        
        DetailViewController.selectedData = item
        navigationController?.pushViewController(DetailViewController, animated: true)
    }

}
