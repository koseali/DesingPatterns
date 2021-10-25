//
//  MainRouter.swift
//  Tekrar_VIPER
//
//  Created by Ali Kose on 20.10.2021.
//

import Foundation
import UIKit

class MainRouter : NSObject, MainViewRouterProtocol {
    var view : UIViewController
    init(view : UIViewController){
        self.view = view
    }
    func navigate(to route: MainViewRoute) {
        switch route {
        case .showBookDetail(let result):
            let detailView = DetailBuilder.build(with: result)
            view.navigationController?.pushViewController(detailView, animated: true)
        }
    }
}
