//
//  MainRouter.swift
//  TodoAppExample
//
//  Created by Ali Kose on 18.10.2021.
//

import Foundation
import UIKit
// Mainden Roout edilicekler

class AppRouter {
    
    let window : UIWindow
    
    init(){
        self.window = UIWindow(frame: UIScreen.main.bounds)
    }
    func start(scene: UIWindowScene) -> UIWindow{
        
        let navigationController = UINavigationController(rootViewController: MainViewBuilder.build())
        navigationController.navigationBar.isHidden = true
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        window.windowScene = scene
        return window
    }
    
}
