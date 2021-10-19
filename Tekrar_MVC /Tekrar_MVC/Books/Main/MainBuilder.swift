//
//  MainBuilder.swift
//  Tekrar_MVC
//
//  Created by Ali Kose on 19.10.2021.
//

import Foundation
import UIKit

class MainBuilder {
    
    static func build() -> MainViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        view.service = appContainer.service
        return view
    }
}
