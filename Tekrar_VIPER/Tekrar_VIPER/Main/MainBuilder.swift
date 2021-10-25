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
        let interactor = MainInteractor(service : appContainer.service)
        let router = MainRouter(view: view)
        let presenter = MainPresenter(interactor: interactor, view: view, router: router)
        interactor.delegate = presenter // Bu olmazsa calismiyor
        view.presenter = presenter
        return view
    }
}
