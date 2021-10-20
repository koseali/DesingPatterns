//
//  UIViewControllerExtension.swift
//  TodoAppExample
//
//  Created by Ali Kose on 8.10.2021.
//

import Foundation
import UIKit

extension UIViewController {
    
    func presentCustom (_ viewController : UIViewController){
        let transition = CATransition()
        transition.duration = 1.0
        transition.type = .moveIn
        transition.subtype = .fromRight
        self.view.layer.add(transition, forKey: "presentCustom")
        present(viewController, animated: false, completion: nil)
    }
    
    func dismissCustom (){
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = .push
        transition.subtype = .fromLeft
        self.view.layer.add(transition, forKey: "dismissCustom")
        dismiss(animated: false, completion: nil)
    }
}
